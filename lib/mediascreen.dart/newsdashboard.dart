import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/AutoResizeWebView.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/mediascreen.dart/Detailpage.dart';
import 'package:merckfoundation22dec/model/viewmorehomeceoResponse.dart';
import 'dart:convert';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class NewsPageDashboard extends StatefulWidget {
  final dynamic apiurl;

  const NewsPageDashboard({Key? key, this.apiurl}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return NewsState();
  }
}

class NewsState extends State<NewsPageDashboard> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  // List<ListElement> list = [];
  ScrollController _sc = new ScrollController();
  late  Viewmorehomeceo resp;
  int totalcount = 10;
  int page = 10;
  int offset = 0;
  bool _isLoading = true;
  List _productsAvailable = [
    "assets/newImages/img3.jpg",
    "assets/newImages/img4.jpg",
    "assets/newImages/leader1.png",
    "assets/newImages/leader2.png",
    "assets/newImages/img3.jpg",
    "assets/newImages/leader1.png",
    "assets/newImages/leader2.png",
  ];
  int pagenoforceo = 1;
  int? totallengthofceo;
  @override
  void initState() {
    print('Details Art');
    GlobalLists.homeceoList.clear();
    getNewsLetteranArticles(pagenoforceo);
    
    _sc = new ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_sc.position.extentAfter < 50) {
      if (!_isLoading) {
        setState(() {
          pagenoforceo = pagenoforceo + 1;
        });
        if (GlobalLists.homeceoList.length < totallengthofceo!) {
          getNewsLetteranArticles(pagenoforceo);
        }
      }
//     
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Customcolor.background,
        appBar: InnerCustomAppBar(
          onTapval: () {
            // Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Dashboard(
                          index: 0,
                        )));
          },
          index: 2,
          sharelink: Constantstring.sharenewsletter,
          title: "Articles",
          titleImg: "assets/newImages/news_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        body: ListView(
          shrinkWrap: true,
          controller: _sc,
          physics: ScrollPhysics(),
          children: [
            SizedBox(
              height: 10,
            ),
            (GlobalLists.homeceoList.length == 0 && _isLoading)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : (GlobalLists.homeceoList.length == 0 && _isLoading == false)
                    ? Center(
                        child: Container(
                          child: Center(child: Text(Constantstring.emptyData)),
                        ),
                      )
                    : ListView.builder(
                        itemCount:
                            GlobalLists.homeceoList.length == totallengthofceo
                                ? GlobalLists.homeceoList.length
                                : GlobalLists.homeceoList.length + 1,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          if (index == GlobalLists.homeceoList.length) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, bottom: 6),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Detailpage(
                                        indexIs: index,
                                        callfrom: 3,
                                      ),
                                    ),
                                  );
                                },
                                child: Card(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        ClipRRect(
  borderRadius: BorderRadius.circular(8),
  child: SizedBox(
    height: 80,
    width: 80,
    child: Image.network(
      Constantstring.baseUrl + GlobalLists.homeceoList[index].image!,
      fit: BoxFit.cover,

      // Load image efficiently and avoid overflow
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;

        return Image.asset(
          'assets/placeholder.jpg',
          fit: BoxFit.cover,
        );
      },

      // Crucial: Prevent layout collapse when HTTP fails
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          'assets/placeholder.jpg',
          fit: BoxFit.cover,
        );
      },
    ),
  ),
)
,
                                        // ClipRRect(
                                        //   borderRadius:
                                        //       BorderRadius.circular(8),
                                        //   child: FadeInImage.assetNetwork(
                                        //     placeholder:
                                        //         'assets/placeholder.jpg',
                                        //     image: Constantstring.baseUrl +
                                        //         GlobalLists
                                        //             .homeceoList[index].image!,
                                        //     fit: BoxFit.cover,
                                        //     height: 80,
                                        //     width: 80,
                                        //   ),
                                        // ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              HtmlWidget(
                                                GlobalLists
                                                    .homeceoList[index].title!,
                                                     customWidgetBuilder: (element) {
              if (element.localName == 'video') {
                final src = element.children.firstWhere((e) => e.localName == 'source').attributes['src'];
                if (src != null && src.contains('youtube.com')) {
                  return SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: WebView(
                      initialUrl: src,
                      javascriptMode: JavascriptMode.unrestricted,
                    ),
                  );
                }
              }else  if (element.localName == 'iframe') {
      final iframeSrc = element.attributes['src'];

      if (iframeSrc != null && iframeSrc.contains("youtube.com")) {
        final videoId = YoutubePlayer.convertUrlToId(iframeSrc);

        if (videoId != null) {
          return YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: videoId,
              flags: YoutubePlayerFlags(
                autoPlay: false,
                disableDragSeek: false,
                loop: false,
                enableCaption: true,
              ),
            ),
            showVideoProgressIndicator: true,
          );
        }
      }
    }
              // if (element.localName == 'iframe') {
              //   final iframeSrc = element.attributes['src'];

              //   // If the iframe is a YouTube video, handle it
              //   if (iframeSrc != null && iframeSrc.contains("youtube.com")) {
              //     return SizedBox(
              //       height: 300,
              //       width: double.infinity,
              //       child: WebView(
              //         initialUrl: iframeSrc,
              //         javascriptMode: JavascriptMode.unrestricted,
              //       ),
              //     );
              //   }
              // }
              else if (element.localName == 'table') {
     
        return  AutoResizeWebView(htmlContent: element.outerHtml,);
       
      }
              return null;
            },
                                              ),
                                              // Additional text or widgets here
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 0, left: 0),
              child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  "assets/newImages/flowers_footer.png",
                  height: 170,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Bottomcardlink(),
            // Padding(
            //   padding: const EdgeInsets.only(
            //       left: 60, right: 60, top: 20, bottom: 10),
            //   child: Image.asset(
            //     "assets/newImages/flowers_footer.png",
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 0, left: 0),
            //   child: Align(
            //     alignment: Alignment.topRight,
            //     child: Image.asset(
            //       "assets/newImages/flowers_footer.png",
            //       height: 170,
            //     ),
            //   ),
            // ),
          ],
        ));
  }

  Future getNewsLetteranArticles(int pageno) async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
//ShowDialogs.showLoadingDialog(context, _keyLoader);
      setState(() {
        _isLoading = true;
      });
      print("hi");
      var response = await APIManager.fetchget(
        encoding: APIManager.mediaarticle + "/${pageno.toString()}",
      );
      print(APIManager.mediaarticle + "/${pageno.toString()}");
      print(response);
      // APIManager().apiRequest(
      //   context,
      //   api,
      //   (response) async {
      var res = json.decode(response!.body);
      resp = Viewmorehomeceo.fromJson(res);
      print(resp.data!.list!.length);
      // print(resp);
      // print(resp.data.list.length); //48

      // //        Navigator.of(_keyLoader.currentContext).pop();
      setState(() {
        _isLoading = false;
      });
      if (resp.success == "True") {
        Constantstring.baseUrl = resp.baseUrl!;
        setState(() {
          totallengthofceo = resp.objectCount;
        });
        for (int i = 0; i < resp.data!.list!.length; i++) {
          ListElement element = resp.data!.list![i];
          setState(() {
            GlobalLists.homeceoList.add(element);
            print(GlobalLists.homeceoList[0].details);
          });
        }
      } else {
        ShowDialogs.showToast("Server Not Responding");
      }
     
    } else {
      setState(() {
        _isLoading = false;
      });
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

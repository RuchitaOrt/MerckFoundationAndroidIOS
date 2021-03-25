import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/model/getNewsRelease.dart';
import 'package:merckfoundation22dec/model/merckFoundationMediaResp.dart';
import 'package:merckfoundation22dec/model/viewmoreMediaResponse.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';

import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';

import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videoplayer.dart';

import 'package:merckfoundation22dec/model/viewmoreMediaResponse.dart'
    as viewmmtmedia;

class ViewmoreMedia extends StatefulWidget {
  final dynamic apiurl;

  const ViewmoreMedia({Key key, this.apiurl}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ViewMediaState();
  }
}

class ViewMediaState extends State<ViewmoreMedia> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  ScrollController _sc = new ScrollController();
  ViewmoremediaResponse resp;
  int totalcount = 10;
  int page = 10;
  int offset = 0;
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    GlobalLists.viewmoremedialist.clear();
    getmerckfoundationmediaData(widget.apiurl);
    _sc = new ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_sc.position.extentAfter < 50) {
      if (!_isLoading && totalcount > GlobalLists.viewmoremedialist.length) {
        // getNewsLetteranArticles();
        setState(() {
          _isLoading = true;
        });
        Future.delayed(const Duration(seconds: 2), () {
// Here you can write your code

          setState(() {
            // Here you can write your code for open new view
            _isLoading = false;
            if (resp.success == "True") {
              setState(() {
                print("here");
                // list = new List();
                // list = resp.data.list;
                //totalcount 10

                for (int i = offset; i < resp.list.length; i++) {
                  setState(() {
                    GlobalLists.viewmoremedialist.add(viewmmtmedia.ListElement(
                        title: resp.list[i].title,
                        id: resp.list[i].id,
                        description: resp.list[i].description,
                        mediaUrl: resp.list[i].mediaUrl,
                        image: resp.list[i].image));
                  });

                  // GlobalLists.newsLettersList.add(resp.data.list);

                }

                offset = totalcount;
                int remem = resp.list.length - totalcount;
                print("remem");
                print(remem);
                if (remem < 10) {
                  totalcount = totalcount + remem;
                } else {
                  totalcount = totalcount + 10;
                }
                // // GlobalLists.newsLettersList = resp.data.list;
                Constantstring.baseUrl = resp.baseUrl;
                print("-----------------------------------");
                print(totalcount);
              });

              setState(() {
                _isLoading = false;
              });
            } else {
              ShowDialogs.showToast(resp.msg);
              setState(() {
                _isLoading = false;
              });
            }
          });
        });
      }
    }
  }

  _launchURL(String urlIs) async {
    var url = urlIs;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: InnerMsgfromleadershipCustomAppBar(
        onTapval: () {
          Navigator.pop(context);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (BuildContext context) => Dashboard(
          //               index: 0,
          //             )));
        },
        index: 1,
        title: "Merck Foundation \nin Media",
        titleImg: "assets/newImages/newsarticle_logo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        controller: _sc,
        children: [
          (GlobalLists.viewmoremedialist.length == 0 && _isLoading)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : (GlobalLists.viewmoremedialist.length == 0 &&
                      _isLoading == false)
                  ? Center(
                      child: Container(
                        child: Center(child: Text(Constantstring.emptyData)),
                      ),
                    )
                  : ListView.builder(
                      itemCount: GlobalLists.viewmoremedialist.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        if (GlobalLists.viewmoremedialist.length - 1 == index &&
                            _isLoading) {
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
                                            VideoPlayer(
                                              videoUrl: GlobalLists
                                                  .viewmoremedialist[index]
                                                  .mediaUrl,
                                            )));
                                // _launchURL(
                                //     GlobalLists.merckinMediaList[index].mediaUrl);
                              },
                              child: Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 8, bottom: 8),
                                  child: Column(
                                    children: [
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        //crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ClipRect(
                                            child: FadeInImage.assetNetwork(
                                              placeholder:
                                                  'assets/newImages/placeholder_3.jpg',
                                              image: Constantstring.baseUrl +
                                                  GlobalLists
                                                      .viewmoremedialist[index]
                                                      .image,
                                              fit: BoxFit.cover,
                                              height: 80,
                                              width: 80,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              GlobalLists
                                                  .viewmoremedialist[index]
                                                  .title,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                      ResponsiveFlutter.of(
                                                              context)
                                                          .fontSize(1.8),
                                                  fontWeight: FontWeight.w500),
                                              maxLines: 4,
                                            ),
                                          ),
                                        ],
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
      ),
    );
  }

  getmerckfoundationmediaData(dynamic api) async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      // ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        api,
        (response) async {
          resp = response;
          print(resp);

          // Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              // GlobalLists.merckinMediaList = resp.data.list;
              Constantstring.baseUrl = resp.baseUrl;
              if (resp.list.length < 10) {
                for (int i = offset; i < resp.list.length; i++) {
                  setState(() {
                    GlobalLists.viewmoremedialist.add(viewmmtmedia.ListElement(
                        title: resp.list[i].title,
                        id: resp.list[i].id,
                        description: resp.list[i].description,
                        mediaUrl: resp.list[i].mediaUrl,
                        image: resp.list[i].image));
                  });

                  // GlobalLists.newsLettersList.add(resp.data.list);

                }
              } else {
                for (int i = offset; i < totalcount; i++) {
                  setState(() {
                    GlobalLists.viewmoremedialist.add(viewmmtmedia.ListElement(
                        title: resp.list[i].title,
                        id: resp.list[i].id,
                        description: resp.list[i].description,
                        mediaUrl: resp.list[i].mediaUrl,
                        image: resp.list[i].image));
                  });

                  // GlobalLists.newsLettersList.add(resp.data.list);

                }
              }

              offset = totalcount;
              int remem = resp.list.length - totalcount;
              print("remem");
              print(remem);
              if (remem < 10) {
                totalcount = totalcount + remem;
              } else {
                totalcount = totalcount + 10;
              }
              // // GlobalLists.newsLettersList = resp.data.list;
              Constantstring.baseUrl = resp.baseUrl;
              print("-----------------------------------");
              print(totalcount);
              // print(GlobalLists.merckinMediaList.length);
            });

            setState(() {
              _isLoading = false;
            });
          } else {
            setState(() {
              _isLoading = false;
            });
            ShowDialogs.showToast(resp.msg);
          }
        },
        (error) {
          print('ERR msg is $error');
          setState(() {
            _isLoading = false;
          });
          //  Navigator.of(_keyLoader.currentContext).pop();
        },
      );
    } else {
      setState(() {
        _isLoading = false;
      });
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

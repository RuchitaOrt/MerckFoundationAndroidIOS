import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:merckfoundation22dec/model/GetLocalSongsContentResp.dart';
import 'package:merckfoundation22dec/model/GetLocalSongsDigitalResp.dart';
import 'package:merckfoundation22dec/model/GetLocalSongsVideosResp.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/customHorizontalCard.dart';

import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';

class LocalSongsandChildrenStories extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LocalSongsandChildrenStoriesState();
  }
}

class LocalSongsandChildrenStoriesState
    extends State<LocalSongsandChildrenStories> {
  List images = [
    "assets/newImages/img1.png",
    "assets/newImages/m3.png",
    "assets/newImages/cfa1.png"
  ];
  List paravalue = [
    "Breaking the Stigma around infertile couples in general and infertile women in particular.",
    "Empowering Girls and Women in Education in general and in STEM in particular.",
    "Improving access to quality & equitable healthcare solutions.",
  ];

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  void initState() {
    // TODO: implement initState
    getLocalSongsContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: InnerCustomAppBar(
        onTapval: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Dashboard(
                        index: 1,
                      )));
        },
        index: 2,
        title: "Our Programs",
        titleImg: "assets/newImages/our_programsLogo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
        child: ListView(
          shrinkWrap: true,
          //  crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            GlobalLists.localSongsContent.length <= 0
                ? Container(
                    child: Center(child: Text(Constantstring.emptyData)),
                  )
                : Html(
                    data: """${GlobalLists.localSongsContent[0].title} """,
                    onLinkTap: (url) {
                      print("Opening $url...");
                    },
                  ),
            GlobalLists.localSongsContent.length <= 0
                ? Container(
                    child: Center(child: Text(Constantstring.emptyData)),
                  )
                : Html(
                    data:
                        """${GlobalLists.localSongsContent[0].pageContent} """,
                    onLinkTap: (url) {
                      print("Opening $url...");
                    },
                  ),
            GlobalLists.localSongsVideosList.length <= 0
                ? Container(
                    child: Center(child: Text(Constantstring.emptyData)),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CustomHorizontalCard(
                      index: 1,
                      cardImage: "assets/newImages/gallery.png",
                      cardTitle: "Our Videos  ",
                      btnTitle: "Watch More",
                      titleColor: Customcolor.pink_col,
                      titleImg: "assets/newImages/flowers-3.png",
                      list: ListView.builder(
                        itemCount: GlobalLists.localSongsVideosList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8, left: 10),
                            child: Stack(
                              children: [
                                Container(
                                  width: SizeConfig.blockSizeHorizontal * 86,
                                  child: FadeInImage.assetNetwork(
                                    placeholder:
                                        'assets/newImages/placeholder_3.jpg',
                                    image:
                                        "https://img.youtube.com/vi/${GlobalLists.localSongsVideosList[index].videoLink.substring(GlobalLists.localSongsVideosList[index].videoLink.length - 11)}/mqdefault.jpg",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, bottom: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  80,
                                              child: Text(
                                                GlobalLists
                                                    .localSongsVideosList[index]
                                                    .videoDesc,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w700),
                                                maxLines: 3,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
            SizedBox(
              height: 10,
            ),
            GlobalLists.localSongsContent.length <= 0
                ? Container(
                    child: Center(child: Text(Constantstring.emptyData)),
                  )
                : Html(
                    data: """${GlobalLists.localSongsContent[1].title} """,
                    onLinkTap: (url) {
                      print("Opening $url...");
                    },
                  ),
            GlobalLists.localSongsContent.length <= 0
                ? Container(
                    child: Center(child: Text(Constantstring.emptyData)),
                  )
                : Html(
                    data:
                        """${GlobalLists.localSongsContent[1].pageContent} """,
                    onLinkTap: (url) {
                      print("Opening $url...");
                    },
                  ),
            Container(
              height: 340,
              // color: Colors.grey.shade800,
              //  padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: Swiper(
                      fade: 0.0,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Expanded(
                              child: Card(
                                elevation: 5,
                                color: Colors.white,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(6),
                                      width:
                                          SizeConfig.blockSizeHorizontal * 60,
                                      child: Text(
                                        GlobalLists
                                            .localSongsDigitalList[index].title,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                        maxLines: 3,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        // height: SizeConfig.blockSizeVertical * 40,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: FadeInImage.assetNetwork(
                                          placeholder:
                                              'assets/newImages/placeholder_3.jpg',
                                          image:
                                              "${Constantstring.baseUrl + GlobalLists.localSongsDigitalList[index].image}",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: GlobalLists.localSongsDigitalList.length,
                      viewportFraction: 0.7,
                      layout: SwiperLayout.DEFAULT,

                      scale: 0.9,
                      //outer: true,
                      //  itemWidth: 300.0,
                      //itemHeight: 400,
                      //itemHeight: 300,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: 120,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    "Watch More",
                    style: TextStyle(
                        color: Customcolor.colorBlue,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 60, left: 60, top: 20),
            //   child: Image.asset(
            //     "assets/newImages/flowers_footer.png",
            //   ),
            // ),
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
            )
          ],
        ),
      ),
    );
  }

  getLocalSongsContent() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);
      APIManager().apiRequest(
        context,
        API.merckLocalSongsContent,
        (response) async {
          GetLocalSongsContentResp resp = response;
          print(response);
          print('Resp : $resp');

          if (resp.success == "True") {
            setState(() {
              GlobalLists.localSongsContent = resp.data.list;
              getLocalSongsVideos();
            });
          } else {
            ShowDialogs.showToast(resp.msg);
            Navigator.of(_keyLoader.currentContext).pop();
          }
        },
        (error) {
          print('ERR msg is $error');
          Navigator.of(_keyLoader.currentContext).pop();
        },
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }

  getLocalSongsVideos() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      APIManager().apiRequest(
        context,
        API.merckLocalSongsVideos,
        (response) async {
          GetLocalSongsVidoesResp resp = response;
          print(response);
          print('Resp : $resp');

          if (resp.success == "True") {
            setState(() {
              GlobalLists.localSongsVideosList = resp.data.list;
              getLocalSongsDigitalLib();
            });
          } else {
            ShowDialogs.showToast(resp.msg);
            Navigator.of(_keyLoader.currentContext).pop();
          }
        },
        (error) {
          print('ERR msg is $error');
          Navigator.of(_keyLoader.currentContext).pop();
        },
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }

  getLocalSongsDigitalLib() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      APIManager().apiRequest(
        context,
        API.merckLocalDigital,
        (response) async {
          GetLocalSongsDigitalLibResp resp = response;
          print(response);
          print('Resp : $resp');

          if (resp.success == "True") {
            setState(() {
              GlobalLists.localSongsDigitalList = resp.data.list;
              Constantstring.baseUrl = resp.baseUrl;
              Navigator.of(_keyLoader.currentContext).pop();
            });
          } else {
            ShowDialogs.showToast(resp.msg);
            Navigator.of(_keyLoader.currentContext).pop();
          }
        },
        (error) {
          print('ERR msg is $error');
          Navigator.of(_keyLoader.currentContext).pop();
        },
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

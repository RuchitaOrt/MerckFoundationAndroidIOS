import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videoplayer.dart';
import 'package:merckfoundation22dec/model/GetAboutMerckContentResp.dart';
import 'package:merckfoundation22dec/model/GetAboutMerckVideosResp.dart';
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

class AboutMerckMother extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AboutMerckMotherState();
  }
}

class AboutMerckMotherState extends State<AboutMerckMother> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  void initState() {
    // TODO: implement initState
    getMerckAboutContent();
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
            GlobalLists.merckAboutcontent.length <= 0
                ? Container(
                    child: Center(child: Text(Constantstring.emptyData)),
                  )
                : Html(
                    data: """${GlobalLists.merckAboutcontent[0].title} """,
                    onLinkTap: (url) {
                      print("Opening $url...");
                    },
                  ),
            GlobalLists.merckAboutcontent.length <= 0
                ? Container(
                    child: Center(child: Text(Constantstring.emptyData)),
                  )
                : Html(
                    data:
                        """${GlobalLists.merckAboutcontent[0].pageContent} """,
                    onLinkTap: (url) {
                      print("Opening $url...");
                    },
                  ),
            SizedBox(
              height: 15,
            ),
            GlobalLists.merckAboutVideos.length <= 0
                ? Container(
                    child: Center(child: Text(Constantstring.emptyData)),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CustomHorizontalCard(
                      index: 1,
                      cardImage: "assets/newImages/gallery.png",
                      cardTitle:
                          "Watch Below videos of Merck More Than a Mother Launch in African Countries  ",
                       btnTitle: "Watch More",    
                      titleColor: Customcolor.pink_col,
                      titleImg: "assets/newImages/flowers-3.png",
                      list: ListView.builder(
                        itemCount: GlobalLists.merckAboutVideos.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){
                                Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                VideoPlayer(
                                                  videoUrl: GlobalLists.merckAboutVideos[index]
                                                      .videoLink,
                                                )));
                            },
                                                      child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 8, left: 10, bottom: 10),
                              child: Stack(
                                children: [
                                  Container(
                                    width: SizeConfig.blockSizeHorizontal * 86,
                                    child: FadeInImage.assetNetwork(
                                      placeholder:
                                          'assets/newImages/placeholder_3.jpg',
                                      image:
                                          "https://img.youtube.com/vi/${GlobalLists.merckAboutVideos[index].videoLink.substring(GlobalLists.merckAboutVideos[index].videoLink.length - 11)}/mqdefault.jpg",
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
                                                      .merckAboutVideos[index]
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

                                   Padding(
                                          padding: EdgeInsets.only(left: 120),
                                          child: Center(
                                              child: Image.asset(
                                                  "assets/newImages/pause.png")),
                                        )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 60, left: 60, top: 20),
              child: Image.asset(
                "assets/newImages/flowers_footer.png",
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

  getMerckAboutContent() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);
      APIManager().apiRequest(
        context,
        API.merckAboutContent,
        (response) async {
          GetAboutMerckContentResp resp = response;
          print(response);
          print('Resp : $resp');

          if (resp.success == "True") {
            setState(() {
              GlobalLists.merckAboutcontent = resp.data.list;
              getMerckAboutVidoes();
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

  getMerckAboutVidoes() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      APIManager().apiRequest(
        context,
        API.merckAboutVideos,
        (response) async {
          GetAboutMerckVideosResp resp = response;
          print(response);
          print('Resp : $resp');

          if (resp.success == "True") {
            setState(() {
              GlobalLists.merckAboutVideos = resp.data.list;
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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:merckfoundation22dec/mediascreen.dart/Detailpage.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videolibray.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videoplayer.dart';
import 'package:merckfoundation22dec/model/GetFertilityContentResp.dart';
import 'package:merckfoundation22dec/model/GetFertilityTestimonialResp.dart';
import 'package:merckfoundation22dec/model/GetFertilityVideosResp.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/customHorizontalCard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:merckfoundation22dec/model/Fertilityembrology.dart'
    as fertility;

class MerckFertility extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MerckFertilityState();
  }
}

class MerckFertilityState extends State<MerckFertility> {
  bool isMiddleSectionLoaded = false;

  List<Widget> listofwiget = [];
  List typewidet = [];
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  void initState() {
    getmmtmapi();
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
          physics: ScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                //  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: isMiddleSectionLoaded,
                    replacement: Center(child: CircularProgressIndicator()),
                    child: ListView(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        // scrollDirection: Axis.horizontal,
                        children: list()),
                  ),
                ],
              ),
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
            )
          ],
        ),
      ),
    );
  }

  Future<http.Response> getmmtmapi() async {
    print("mmtm api");
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      var response = await APIManager.fetchget(
        encoding: APIManager.fertilityprogram,
      );
      print("response");
      print(response);
      if (response.statusCode == 200) {
        var res = json.decode(response.body);
        print("ff");
        print(res);
        fertility.FertilityembrologyResponse homepageres =
            fertility.FertilityembrologyResponse.fromJson(res);

        Map<String, dynamic> section1 = homepageres.middleArea;

        print(section1);
        print(section1['1']);

        dynamic contentsection = res['middle_area']['1'];
        dynamic videossection = res['middle_area']['3'];

        var middlevideoname1 = videossection;
        var middlecontentname1 = contentsection;

        var middlevideoname = middlevideoname1.keys.first;
        var middlecontentname = middlecontentname1.keys.first;
        print(middlevideoname1);
        print(middlecontentname1);
        setState(() {
          typewidet.add('content');
          typewidet.add('videos');
          print(typewidet);
        });
        GlobalLists.homevideolist.clear();
        GlobalLists.homecontentlist.clear();
        print("hi");
        if (middlevideoname.toString().toLowerCase() ==
            "videos".toLowerCase()) {
          print("hill");
          GlobalLists.homevideolist = homepageres.middleArea['3'].videos.list;
          print(GlobalLists.homevideolist.length);
        }
        if (middlecontentname.toString().toLowerCase() ==
            "content".toLowerCase()) {
          print("hi");
          GlobalLists.homecontentlist =
              homepageres.middleArea['1'].content.list;
          print(GlobalLists.homecontentlist.length);
        }

        setState(() {
          isMiddleSectionLoaded = true;
        });

        return response;
      } else {
        setState(() {
          isMiddleSectionLoaded = true;
        });

        ShowDialogs.showToast(GlobalLists.serverresp);
      }
    } else {
      setState(() {
        isMiddleSectionLoaded = true;
      });

      ShowDialogs.showToast("Please check internet connection");
    }
  }

  List<Widget> list() {
    print("list");
    listofwiget.clear();
    for (int i = 0; i < typewidet.length; i++) {
      if (typewidet[i] == "gallery") {
        listofwiget.add(
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: CustomHorizontalCard(
              index: 1,
              cardImage: "assets/newImages/ourvison.png",
              cardTitle: "Our Gallery  ",
              btnTitle: "View More",
              titleColor: Customcolor.pink_col,
              titleImg: "assets/newImages/flowers-3.png",
              onbtnTap: () {
                // getprogramgallery();
              },
              list: ListView.builder(
                itemCount: GlobalLists.homegallerylist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      ShowDialogs.showImageDialog(
                        context: context,
                        image: GlobalLists.homegallerybaseurl +
                            GlobalLists.homegallerylist[index].photo,
                        description:
                            GlobalLists.homegallerylist[index].photoDescription,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8, left: 10),
                      child: Stack(
                        children: [
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 86,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/newImages/placeholder_3.jpg',
                              image:
                                  "${GlobalLists.homegallerybaseurl + GlobalLists.homegallerylist[index].photo}",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Container(
                                      //   width:
                                      //       SizeConfig.blockSizeHorizontal * 80,
                                      //   child: Text(
                                      //     GlobalLists.homegallerylist[index].title,
                                      //     overflow: TextOverflow.ellipsis,
                                      //     style: TextStyle(
                                      //         color: Colors.white,
                                      //         fontSize: 14,
                                      //         fontWeight: FontWeight.w700),
                                      //     maxLines: 3,
                                      //   ),
                                      // ),
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
                    ),
                  );
                },
              ),
            ),
          ),
        );
      }
      if (typewidet[i] == "videos") {
        listofwiget.add(
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: CustomHorizontalCard(
              index: 1,
              cardImage: "assets/newImages/gallery.png",
              cardTitle: "Our Videos  ",
              btnTitle: "Watch More",
              onbtnTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Videolibrary()));
              },
              titleColor: Customcolor.pink_col,
              titleImg: "assets/newImages/flowers-3.png",
              list: ListView.builder(
                itemCount: GlobalLists.homevideolist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) => VideoPlayer(
                      //               videoUrl: GlobalLists
                      //                   .homevideolist[index].videoLink,
                      //             )));
                      var storykey = GlobalLists.homevideolist[index].videoLink
                          .substring(GlobalLists
                                  .homevideolist[index].videoLink.length -
                              11);
                      _launchInWebViewWithJavaScript(
                          "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8, left: 10),
                      child: Stack(
                        children: [
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 86,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/newImages/placeholder_3.jpg',
                              image:
                                  "https://img.youtube.com/vi/${GlobalLists.homevideolist[index].videoLink.substring(GlobalLists.homevideolist[index].videoLink.length - 11)}/mqdefault.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 80,
                                        child: Text(
                                          GlobalLists
                                              .homevideolist[index].videoDesc,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                          maxLines: 3,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25,
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
                                child:
                                    Image.asset("assets/newImages/pause.png")),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      }
      if (typewidet[i] == "content") {
        listofwiget.add(
          Html(
            data: """${GlobalLists.homecontentlist[0].pageContent} """,
            onLinkTap: (url) {
              print("Opening $url...");
            },
          ),
        );
      }
      if (typewidet[i] == "latest_updates") {
        listofwiget.add(
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: CustomHorizontalCard(
              index: 1,
              cardImage: "assets/newImages/ourvison.png",
              cardTitle: "Latest Updates  ",
              btnTitle: "View More",
              titleColor: Customcolor.pink_col,
              onbtnTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Dashboard(index: 3)));
              },
              titleImg: "assets/newImages/flowers-3.png",
              list: ListView.builder(
                itemCount: GlobalLists.homeceomsglist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Detailpage(
                                    indexIs: index,
                                    callfrom: 2,
                                  )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8, left: 10),
                      child: Stack(
                        children: [
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 86,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/newImages/placeholder_3.jpg',
                              image:
                                  "${GlobalLists.homeceomsgbaseurl + GlobalLists.homeceomsglist[index].image}",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 80,
                                        child: Text(
                                          GlobalLists
                                              .homeceomsglist[index].title,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
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
                    ),
                  );
                },
              ),
            ),
          ),
        );
      }
    }
    return listofwiget;
  }

  Future<void> _launchInWebViewWithJavaScript(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}

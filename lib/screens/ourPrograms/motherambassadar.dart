import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/customHorizontalCard.dart';

import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';

import 'package:http/http.dart' as http;
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/model/subprogrammmtmambassadar.dart';
import 'dart:convert';
import 'package:merckfoundation22dec/mediascreen.dart/Detailpage.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videolibray.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:http/io_client.dart';
import 'dart:io';
import 'package:merckfoundation22dec/model/AmbassadarImageViewall.dart';

import 'package:merckfoundation22dec/Ambassadarmmtmimage.dart';
import 'package:merckfoundation22dec/watchmorevideoambaassadar.dart';

class MotherAmbassadarDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MotherAmbassadarState();
  }
}

class MotherAmbassadarState extends State<MotherAmbassadarDetails> {
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

  List typewidet = [];
  bool isMiddleSectionLoaded = false;
  List<Widget> listofwiget = [];
  @override
  void initState() {
    // TODO: implement initState
    getmmtmapi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: InnerCustomAppBar(
        onTapval: () {
            Navigator.pop(context);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (BuildContext context) => Dashboard(
          //               index: 1,
          //             )));
        },
        index: 2,
        title: "Merck Foundation More Than A Mother Ambassadors",
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
    );
  }

  Future<http.Response> getmmtmapi() async {
    print("mmtm api");
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      var response = await APIManager.fetchget(
        encoding: APIManager.subprogrammmtmambasadar,
      );
      print("response");
      print(response);
      if (response.statusCode == 200) {
        var res = json.decode(response.body);
        print("ff");
        print(res);
        SubprommtmambassadarResponse homepageres =
            SubprommtmambassadarResponse.fromJson(res);

        Map<String, dynamic> section1 = homepageres.middleArea;

        // print(section1);
        // print(section1['1']);
        List<String> middleareakey = [];
        section1.keys.forEach((element) {
          middleareakey.add(element.toString());
        });
        for (int i = 0; i < section1.length; i++) {
          //  MiddleArea categoryKeys = section1[(i + 1).toString()];
          //  print(categoryKeys.videos.type);
          dynamic section = res['middle_area'][middleareakey[i]];
          print("TKey: ${section.keys.first}");
          var middlecategoryname = section.keys.first;

          // setState(() {
          typewidet.add(middlecategoryname);

          print(typewidet);
          //  });
          if (middlecategoryname.toString().toLowerCase() ==
              "Videos".toLowerCase()) {
            GlobalLists.homevideolist =
                homepageres.middleArea[middleareakey[i]].videos.list;
            print(GlobalLists.homevideolist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "content".toLowerCase()) {
            GlobalLists.homecontentlist =
                homepageres.middleArea[middleareakey[i]].content.list;
            print(GlobalLists.homecontentlist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "gallery".toLowerCase()) {
            GlobalLists.homegallerybaseurl =
                homepageres.middleArea[middleareakey[i]].gallery.baseUrl;
            GlobalLists.homegallerylist =
                homepageres.middleArea[middleareakey[i]].gallery.list;
            print(GlobalLists.homegallerylist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "mmtm".toLowerCase()) {
            //  if (homepageres.middleArea['${i + 1}'].ambasdars != null) {
            GlobalLists.ambasdarsbaseurl =
                homepageres.middleArea[middleareakey[i]].mmtm.baseUrl;
            GlobalLists.ambasdarslist =
                homepageres.middleArea[middleareakey[i]].mmtm.list;
            //}
            print(GlobalLists.ambasdarslist.length);
          }
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
    listofwiget.clear();
    for (int i = 0; i < typewidet.length; i++) {
      if (typewidet[i] == "gallery") {
        listofwiget.add(
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: CustomHorizontalCard(
              index: 1,
              cardImage: "assets/newImages/ourvison.png",
              cardTitle:
                  "Acknowledging the efforts of First Ladies as Ambassador of Merck More Than a Mother",
              showviewmore: 1,
              btnTitle: "View More",
              titleColor: Customcolor.pink_col,
              titleImg: "assets/newImages/flowers-3.png",
              onbtnTap: () {
                //  getprogramgallery();
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
              cardTitle:
                  "Watch below some of the latest videos of Dr. Rasha Kelej and the the First Ladies of Africa, Ambassadors of Merck More Than a Mother",
              btnTitle: "Watch More",
              showviewmore: 1,
              onbtnTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) => Videolibrary()));
              },
              titleColor: Customcolor.pink_col,
              titleImg: "assets/newImages/flowers-3.png",
              heigthoflist: SizeConfig.blockSizeVertical * 30,
              list: ListView.builder(
                itemCount: GlobalLists.homevideolist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    //  mainAxisAlignment: Ma.end,
                    //    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          var storykey = GlobalLists
                              .homevideolist[index].videoLink
                              .substring(GlobalLists
                                      .homevideolist[index].videoLink.length -
                                  11);
                          ShowDialogs.youtubevideolink(
                              "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
                          // _launchInWebViewWithJavaScript(
                          //     "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
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
                                      "https://img.youtube.com/vi/${GlobalLists.homevideolist[index].videoLink.substring(GlobalLists.homevideolist[index].videoLink.length - 11)}/mqdefault.jpg",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                top: SizeConfig.blockSizeVertical * 18,
                                // alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, bottom: 20),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width:
                                                SizeConfig.blockSizeHorizontal *
                                                    80,
                                            child: Text(
                                              GlobalLists.homevideolist[index]
                                                  .videoDesc,
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
                                padding: EdgeInsets.only(top: 70, left: 120),
                                child: Center(
                                    child: Image.asset(
                                        "assets/newImages/pause.png")),
                              )
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        WatchmoreVideoambassdar(
                                          categoryid: GlobalLists
                                              .homevideolist[index].categoryId,
                                          api: APIManager.ambasadarvideoapi,
                                          type: "ambassadar",
                                          headertitle: "Videos",
                                        )));
                            // ambasssadarvideoviewmore(
                            //     GlobalLists.homevideolist[index].categoryId);
                          },
                          child: Container(
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Text(
                                "View All",
                                style: TextStyle(
                                    color: Customcolor.colorBlue,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
      if (typewidet[i] == "mmtm") {
        listofwiget.add(Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: CustomHorizontalCard(
            index: 1,
            cardImage: "assets/newImages/ourvison.png",
            cardTitle: "",
            btnTitle: "View More",
            showviewmore: 1,
            titleColor: Customcolor.pink_col,
            onbtnTap: () {},
            heigthoflist: SizeConfig.blockSizeVertical * 40,
            titleImg: "assets/newImages/flowers-3.png",
            list: ListView.builder(
              itemCount: GlobalLists.ambasdarslist.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (BuildContext context) => Detailpage(
                    //               indexIs: index,
                    //               callfrom: 2,
                    //             )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8, left: 10),
                    child: Column(
                      children: [
                        Container(
                          width: SizeConfig.blockSizeHorizontal * 50,
                          height: 240,
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/newImages/placeholder_3.jpg',
                            image:
                                "${GlobalLists.ambasdarsbaseurl + GlobalLists.ambasdarslist[index].photo}",
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              print(
                                  GlobalLists.ambasdarslist[index].albumNameId);
                              ambasssadarimageviewmore(
                                  GlobalLists.ambasdarslist[index].albumNameId);
                            },
                            child: Container(
                              width: 120,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  "View All",
                                  style: TextStyle(
                                      color: Customcolor.colorBlue,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Align(
                        //   alignment: Alignment.bottomCenter,
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(
                        //         left: 10, right: 10, bottom: 10),
                        //     child: Row(
                        //       crossAxisAlignment: CrossAxisAlignment.end,
                        //       //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Column(
                        //           mainAxisAlignment: MainAxisAlignment.end,
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             Container(
                        //               width:
                        //                   SizeConfig.blockSizeHorizontal * 80,
                        //               child: Text(
                        //                 GlobalLists.homeceomsglist[index].title,
                        //                 overflow: TextOverflow.ellipsis,
                        //                 style: TextStyle(
                        //                     color: Colors.white,
                        //                     fontSize: 14,
                        //                     fontWeight: FontWeight.w700),
                        //                 maxLines: 3,
                        //               ),
                        //             ),
                        //             SizedBox(
                        //               height: 8,
                        //             )
                        //           ],
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ));
      }
    }
    return listofwiget;
  }

  // ambasssadarvideoviewmore(String categoryid) async {
  //   var status = await ConnectionDetector.checkInternetConnection();

  //   if (status) {
  //     dynamic bodyData = {
  //       'category_id': categoryid,
  //     };

  //     // String body = json.encode(bodyData);
  //     print(bodyData);
  //     var response = await fetchPostWithBodyResponse(
  //       APIManager.ambasadarvideoapi,
  //       bodyData,
  //     );

  //     var res = json.decode(response.body);
  //     print("res");
  //     print(res);
  //     AmbassdarvideoResponse resp =
  //         ambassdarvideoResponseFromJson(response.body);
  //     if (response.statusCode == 200) {
  //       if (res['success'] == true) {
  //         GlobalLists.videoviewmoreambasdarslist = resp.list;
  //       } else {
  //         setState(() {
  //           ShowDialogs.showToast(res['msg']);
  //         });
  //       }
  //     } else {
  //       ShowDialogs.showToast("Server Not Responding");
  //     }
  //   } else {
  //     setState(() {
  //       ShowDialogs.showToast("Please check Internet Connection.");
  //     });
  //   }
  // }

  ambasssadarimageviewmore(String albumid) async {
    var status = await ConnectionDetector.checkInternetConnection();

    if (status) {
      dynamic bodyData = {
        'album_id': albumid,
      };

      // String body = json.encode(bodyData);
      print(bodyData);
      var response = await fetchPostWithBodyResponse(
        APIManager.ambasadarimageapi,
        bodyData,
      );

      var res = json.decode(response.body);
      print("res");
      print(res);
      AmbassdarImageResponse resp =
          ambassdarImageResponseFromJson(response.body);
      if (response.statusCode == 200) {
        GlobalLists.viewmoreambasdarslist = resp.list;
        GlobalLists.viewmoreambasdarsbaseurl = resp.baseUrl;
        if (res['success'] == true) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AmbassadarmmtmImagePage(
                        baseURL: GlobalLists.viewmoreambasdarsbaseurl,
                        index: 0,
                        photosList: GlobalLists.viewmoreambasdarslist,
                      )));
        } else {
          setState(() {
            ShowDialogs.showToast(res['msg']);
          });
        }
      } else {
        ShowDialogs.showToast("Server Not Responding");
      }
    } else {
      setState(() {
        ShowDialogs.showToast("Please check Internet Connection.");
      });
    }
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

  Future<http.Response> fetchPostWithBodyResponse(
      String url, dynamic body) async {
    IOClient ioClient = new IOClient();

    HttpClient client = new HttpClient();

    ioClient = new IOClient(client);
    final response = await ioClient.post(url, body: body);
    print('pit stop');
    return response;
  }
}

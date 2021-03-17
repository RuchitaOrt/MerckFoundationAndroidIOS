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
            // FormLabel(
            //   text: "Merck More Than a Mother",
            //   labelColor: Customcolor.colorPink,
            //   fontweight: FontWeight.w700,
            //   fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // FormLabel(
            //   text: "Merck More Than a Mother Ambassadors",
            //   labelColor: Customcolor.text_blue,
            //   fontweight: FontWeight.w700,
            //   fontSize: ResponsiveFlutter.of(context).fontSize(1.9),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // FormLabel(
            //   text:
            //       "Merck Foundation works together with African First Ladies, who are the Ambassadors of Merck More Than a Mother, through Merck Foundation First Ladies Initiative (MFFLI). Through this platform, Merck Foundation together with First Ladies, ensures continuous improvement and exchange of variable aspects of different cultures in order to localize and/or standardize specific messages that can raise awareness and create a culture shift across Africa with regards to the below objectives:",
            //   labelColor: Customcolor.text_darkgrey,
            //   //fontweight: FontWeight.w500,
            //   fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
            // ),
            // SizedBox(
            //   height: 9,
            // ),
            // ListView.builder(
            //   shrinkWrap: true,
            //   physics: ScrollPhysics(),
            //   scrollDirection: Axis.vertical,
            //   itemCount: paravalue.length,
            //   itemBuilder: (context, index) {
            //     return Padding(
            //       padding: const EdgeInsets.only(top: 20),
            //       child: Row(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: <Widget>[
            //           Padding(
            //             padding: const EdgeInsets.only(top: 5),
            //             child: Icon(
            //               Icons.circle,
            //               size: 8,
            //             ),
            //           ),
            //           SizedBox(
            //             width: 5,
            //           ),
            //           Expanded(
            //             child: Text(
            //               paravalue[index],
            //               style: TextStyle(
            //                 color: Customcolor.text_darkgrey,
            //                 fontSize:
            //                     ResponsiveFlutter.of(context).fontSize(1.8),
            //                 //             fontWeight: FontWeight.w500,
            //               ),
            //             ),
            //           )
            //         ],
            //       ),
            //     );
            //   },
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // FormLabel(
            //   text:
            //       "So far, First Ladies of more than 18 Countries have partnered with Merck Foundation to lead and execute the initiatives in their respective countries as Merck More Than a Mother Ambassadors.",
            //   labelColor: Customcolor.text_darkgrey,
            //   //   fontweight: FontWeight.w500,
            //   fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // FormLabel(
            //   text:
            //       "The Ambassadors of Merck More Than a Mother have their own social media campaign for their respective countries.",
            //   labelColor: Customcolor.text_darkgrey,
            //   // fontweight: FontWeight.w500,
            //   fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   height: 340,
            //   // color: Colors.grey.shade800,
            //   //  padding: EdgeInsets.all(16.0),
            //   child: Column(
            //     children: [
            //       Expanded(
            //         child: Swiper(
            //           fade: 0.0,
            //           itemBuilder: (BuildContext context, int index) {
            //             return Column(
            //               children: [
            //                 Expanded(
            //                   child: Card(
            //                     elevation: 5,
            //                     color: Colors.transparent,
            //                     child: Column(
            //                       children: <Widget>[
            //                         Expanded(
            //                           child: Container(
            //                             // height: SizeConfig.blockSizeVertical * 40,
            //                             width: double.infinity,
            //                             decoration: BoxDecoration(
            //                                 borderRadius:
            //                                     BorderRadius.circular(10),
            //                                 image: DecorationImage(
            //                                     image: AssetImage(
            //                                       images[index],
            //                                     ),
            //                                     fit: BoxFit.fill)),
            //                           ),
            //                         ),
            //                         // Container(
            //                         //     padding: EdgeInsets.only(bottom: 20),
            //                         //     decoration: BoxDecoration(
            //                         //         color: Colors.white,
            //                         //         borderRadius: BorderRadius.only(
            //                         //             bottomLeft: Radius.circular(10.0),
            //                         //             bottomRight: Radius.circular(10.0))),
            //                         //     child: )
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             );
            //           },
            //           itemCount: images.length,
            //           viewportFraction: 0.7,
            //           layout: SwiperLayout.DEFAULT,

            //           scale: 0.9,
            //           //outer: true,
            //           //  itemWidth: 300.0,
            //           //itemHeight: 400,
            //           //itemHeight: 300,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Center(
            //   child: Container(
            //     width: 120,
            //     height: 40,
            //     decoration: BoxDecoration(
            //         color: Colors.amber,
            //         borderRadius: BorderRadius.circular(5)),
            //     child: Center(
            //       child: Text(
            //         "Watch More",
            //         style: TextStyle(
            //             color: Customcolor.colorBlue,
            //             fontSize: 15,
            //             fontWeight: FontWeight.w500),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 30,
            // ),
            // CustomHorizontalCard(
            //     index: 1,
            //     cardImage: "assets/newImages/mqdefault1.png",
            //     cardTitle:
            //         "Watch below some of the latest videos of Dr. Rasha kelej and first ladies of Africa. Ambassadars of Merck More than a Mother.  ",
            //     titleColor: Customcolor.pink_col,
            //     btnTitle: "Read All",
            //     titleImg: "assets/newImages/flowers-2.png",
            //     subTitle:
            //         "Message Form Dr.Rasha Kelej, on the inauguration..."),
            // Padding(
            //   padding: const EdgeInsets.only(top: 20),
            //   child: CustomHorizontalCard(
            //       index: 1,
            //       cardImage: "assets/newImages/award1.png",
            //       cardTitle:
            //           "Acknowledging the efforts of first ladies as Ambassadars of Merck More than a Mother.  ",
            //       btnTitle: "Read More",
            //       titleColor: Customcolor.pink_col,
            //       titleImg: "assets/newImages/flowers-1.png",
            //       subTitle:
            //           "Message Form Dr.Rasha Kelej, on the inauguration..."),
            // ),
            // // Padding(
            // //   padding: const EdgeInsets.only(right: 60, left: 60, top: 20),
            // //   child: Image.asset(
            // //     "assets/newImages/flowers_footer.png",
            // //   ),
            // // ),
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
            // SizedBox(
            //   height: 10,
            // )
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

        print(section1);
        print(section1['1']);

        for (int i = 0; i < section1.length; i++) {
          //  MiddleArea categoryKeys = section1[(i + 1).toString()];
          //  print(categoryKeys.videos.type);
          dynamic section = res['middle_area']['${i + 1}'];
          print("TKey: ${section.keys.first}");
          var middlecategoryname = section.keys.first;

          setState(() {
            typewidet.add(middlecategoryname);

            print(typewidet);
          });
          if (middlecategoryname.toString().toLowerCase() ==
              "Videos".toLowerCase()) {
            GlobalLists.homevideolist =
                homepageres.middleArea['${i + 1}'].videos.list;
            print(GlobalLists.homevideolist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "content".toLowerCase()) {
            GlobalLists.homecontentlist =
                homepageres.middleArea['${i + 1}'].content.list;
            print(GlobalLists.homecontentlist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "gallery".toLowerCase()) {
            GlobalLists.homegallerybaseurl =
                homepageres.middleArea['${i + 1}'].gallery.baseUrl;
            GlobalLists.homegallerylist =
                homepageres.middleArea['${i + 1}'].gallery.list;
            print(GlobalLists.homegallerylist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "ambasdars".toLowerCase()) {
            GlobalLists.ambasdarsbaseurl =
                homepageres.middleArea['${i + 1}'].ambasdars.baseUrl;
            GlobalLists.ambasdarslist =
                homepageres.middleArea['${i + 1}'].ambasdars.list;
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
      if (typewidet[i] == "ambasdars") {
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
                            onTap: () {},
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

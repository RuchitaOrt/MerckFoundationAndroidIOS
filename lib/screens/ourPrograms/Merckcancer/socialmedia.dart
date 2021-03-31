import 'dart:io';

import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:social_share_plugin/social_share_plugin.dart';

class SocialMedia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SocialMediaState();
  }
}

class SocialMediaState extends State<SocialMedia> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  double imgHeight = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Customcolor.background,
      appBar: InnerCustomAppBar(
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
        title: "Social Media",
        titleImg: "assets/newImages/contactus_logo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      body: Stack(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15, bottom: 10),
                    child: FormLabel(
                      text: "Follow us on Merck Cancer Control Program",
                      fontSize: 18,
                      labelColor: Customcolor.pink_col,
                      fontweight: FontWeight.w500,
                      textAlignment: TextAlign.start,
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          Platform.isAndroid
                              ? await FlutterShareMe().openinsta(
                                  url: 'https://twitter.com/merck_mccp/',
                                  msg: "Share")
                              : ShowDialogs.launchTwitter(
                                  "https://twitter.com/merck_mccp/");
                        },
                        child: Image.asset(
                          "assets/newImages/twitter.png",
                          height: imgHeight,
                          width: imgHeight,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      GestureDetector(
                        onTap: () async {
                          Platform.isAndroid
                              ? await FlutterShareMe().openinsta(
                                  url:
                                      'https://www.facebook.com/MerckCancerControlProgram/',
                                  msg: "Share")
                              : ShowDialogs.launchFacebook(
                                  "https://www.facebook.com/MerckCancerControlProgram/",
                                  "1595566227361051");
                        },
                        child: Image.asset(
                          "assets/newImages/facebook.png",
                          height: imgHeight,
                          width: imgHeight,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      GestureDetector(
                        onTap: () async {
                          Platform.isAndroid
                              ? await FlutterShareMe().openinsta(
                                  url:
                                      'https://www.youtube.com/channel/UCokfpTgsO86UV4YzUXXqDAw',
                                  msg: "Share")
                              : ShowDialogs.youtubevideolink(
                                  "https://www.youtube.com/channel/UCokfpTgsO86UV4YzUXXqDAw");
                        },
                        child: Image.asset(
                          "assets/newImages/youtube.png",
                          height: imgHeight,
                          width: imgHeight,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, bottom: 10),
                    child: FormLabel(
                      text: "Follow us on Merck More Than a Patient",
                      fontSize: 18,
                      labelColor: Customcolor.pink_col,
                      fontweight: FontWeight.w500,
                      textAlignment: TextAlign.start,
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          Platform.isAndroid
                              ? await FlutterShareMe().openinsta(
                                  url:
                                      'https://www.facebook.com/Merckmorethanapatient/',
                                  msg: "Share")
                              : ShowDialogs.launchFacebook(
                                  "https://www.facebook.com/Merckmorethanapatient/",
                                  "1503172516365806");
                        },
                        child: Image.asset(
                          "assets/newImages/facebook.png",
                          height: imgHeight,
                          width: imgHeight,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      GestureDetector(
                        onTap: () async {
                          Platform.isAndroid
                              ? await FlutterShareMe().openinsta(
                                  url: 'https://twitter.com/merck4patients',
                                  msg: "Share")
                              : ShowDialogs.launchTwitter(
                                  "https://twitter.com/merck4patients");
                        },
                        child: Image.asset(
                          "assets/newImages/twitter.png",
                          height: imgHeight,
                          width: imgHeight,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      GestureDetector(
                        onTap: () async {
                          Platform.isAndroid
                              ? await FlutterShareMe().openinsta(
                                  url:
                                      'https://www.facebook.com/Merckmorethanapatient/',
                                  msg: "Share")
                              : ShowDialogs.launchInstagram(
                                  "https://www.facebook.com/Merckmorethanapatient/",
                                  "Merckmorethanapatient");
                        },
                        child: Image.asset(
                          "assets/newImages/instagram.png",
                          height: imgHeight,
                          width: imgHeight,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Bottomcardlink(),
          // ),
        ],
      ),
    );
  }
}

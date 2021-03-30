import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactusState();
  }
}

class ContactusState extends State<ContactUs> {
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
        title: "Contact Us",
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
                    padding: const EdgeInsets.only(right: 15),
                    child: FormLabel(
                      text:
                          "Contact Us on our dedicated mail address and contact number.",
                      fontSize: 18,
                      labelColor: Customcolor.pink_col,
                      fontweight: FontWeight.w500,
                      textAlignment: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(Icons.mail_outline_outlined),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // _launchmail();
                                  },
                                  child: Text(
                                    "info@merck-foundation.com",
                                    style: TextStyle(
                                        color: Customcolor.text_darkgrey),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Icon(Icons.call),
                                SizedBox(
                                  width: 8,
                                ),
                                // Text("+91 22 6210 1916 /+254 20 271 4617",
                                //     style: TextStyle(
                                //         color: Customcolor.text_darkgrey))
                                RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "+91 22 6210 1916",
                                        style: TextStyle(
                                          color: Customcolor.text_darkgrey,
                                        ),
                                        recognizer: new TapGestureRecognizer()
                                          ..onTap = () {
                                            _launchCaller();
                                          },
                                      ),
                                      TextSpan(
                                        text: " / ",
                                        style: TextStyle(
                                          color: Customcolor.text_darkgrey,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "+254 20 271 4617",
                                        style: TextStyle(
                                          color: Customcolor.text_darkgrey,
                                        ),
                                        recognizer: new TapGestureRecognizer()
                                          ..onTap = () {
                                            _launchCaller1();
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ]),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, bottom: 10),
                    child: FormLabel(
                      text:
                          "Join the conversation on our Social Media platforms below and let your voice be heard.",
                      fontSize: 18,
                      labelColor: Customcolor.pink_col,
                      fontweight: FontWeight.w500,
                      textAlignment: TextAlign.start,
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Platform.isAndroid
                              ? ShowDialogs.followuslink(
                                  Constantstring.followinsta,
                                  Constantstring.followmsg)
                              : ShowDialogs.launchInstagram(
                                  Constantstring.followinsta,
                                  "merckfoundation");
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
                      GestureDetector(
                        onTap: () {
                          Platform.isAndroid
                              ? ShowDialogs.followuslink(
                                  Constantstring.followfacebook,
                                  Constantstring.followmsg)
                              : ShowDialogs.launchFacebook(
                                  Constantstring.followfacebook,
                                  "1053979038068008");
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
                        onTap: () {
                          Platform.isAndroid
                              ? ShowDialogs.followuslink(
                                  Constantstring.followtwitter,
                                  Constantstring.followmsg)
                              : ShowDialogs.launchTwitter(
                                  Constantstring.followtwitter);
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
                        onTap: () {
                          Platform.isAndroid
                              ? ShowDialogs.followuslink(
                                  Constantstring.followyoutube,
                                  Constantstring.followmsg)
                              : ShowDialogs.youtubevideolink(
                                  Constantstring.followyoutube);
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
                      GestureDetector(
                        onTap: () {
                          Platform.isAndroid
                              ? ShowDialogs.followuslink(
                                  Constantstring.followflicker,
                                  Constantstring.followmsg)
                              : ShowDialogs.launchURL(
                                  Constantstring.followflicker);
                        },
                        child: Image.asset(
                          "assets/newImages/flickr.png",
                          height: imgHeight,
                          width: imgHeight,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      // Image.asset(
                      //   "assets/newImages/instagram.png",
                      //   height: imgHeight,
                      //   width: imgHeight,
                      // ),
                      // SizedBox(
                      //   width: 7,
                      // ),
                      // Image.asset(
                      //   "assets/newImages/facebook.png",
                      //   height: imgHeight,
                      //   width: imgHeight,
                      // ),
                      // SizedBox(
                      //   width: 7,
                      // ),
                      // Image.asset(
                      //   "assets/newImages/twitter.png",
                      //   height: imgHeight,
                      //   width: imgHeight,
                      // ),
                      // SizedBox(
                      //   width: 7,
                      // ),
                      // Image.asset(
                      //   "assets/newImages/youtube.png",
                      //   height: imgHeight,
                      //   width: imgHeight,
                      // ),
                      // SizedBox(
                      //   width: 7,
                      // ),
                      // Image.asset(
                      //   "assets/newImages/flickr.png",
                      //   height: imgHeight,
                      //   width: imgHeight,
                      // ),
                      // SizedBox(
                      //   width: 7,
                      // ),
                    ],
                  )
                ],
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: Image.asset(
          //     "assets/newImages/flowers_footer.png",
          //     height: 170,
          //   ),
          // ),
        ],
      ),
    );
  }

  _launchCaller() async {
    print("on launch");
    const url = "tel:+912262101916";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchCaller1() async {
    const url = "tel:+254202714617";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'info@merck-foundation.com',
      queryParameters: {'subject': 'MerckFoundation'});

  _launchmail() async {
    const url = "mail:info@merck-foundation.com ";
    if (await canLaunch(url)) {
      var emailLaunchUri = _emailLaunchUri;
    } else {
      throw 'Could not launch $url';
    }
  }
}

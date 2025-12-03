import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:merckfoundation22dec/utility/ResponsiveFlutter.dart';
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
          // Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Dashboard(
                        index: 0,
                      )));
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
          ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: FormLabel(
                  text: "Contact Us",
                
                  fontSize: 18,
                  labelColor: Customcolor.prog5,
                  fontweight: FontWeight.w700,
                  textAlignment: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 3),
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
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
                            height: 20,
                          ),
                          FormLabel(
                            text: "Media Enquiries",
                            // "Contact Us on our dedicated mail address and contact number.",
                            fontSize: 18,
                            labelColor: Customcolor.prog5,
                            fontweight: FontWeight.w700,
                            textAlignment: TextAlign.start,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Ms. Mehak Handa",
                                  style: TextStyle(
                                    color: Customcolor.text_darkgrey,
                                  ),
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Icon(Icons.call),
                              SizedBox(
                                width: 8,
                              ),
                              RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "+91 9319606669",
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
                          ),
                          SizedBox(
                            height: 3,
                          ),
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
                                  "mehak.handa@external.merckgroup.com",
                                  style: TextStyle(
                                      color: Customcolor.text_darkgrey),
                                ),
                              )
                            ],
                          ),

                          //second enquiries
                          Divider(),
                          SizedBox(
                            height: 15,
                          ),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Mr. Harsh Sharma",
                                  style: TextStyle(
                                    color: Customcolor.text_darkgrey,
                                  ),
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Icon(Icons.call),
                              SizedBox(
                                width: 8,
                              ),
                              RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "+91 9540932090",
                                      style: TextStyle(
                                        color: Customcolor.text_darkgrey,
                                      ),
                                      recognizer: new TapGestureRecognizer()
                                        ..onTap = () {
                                          _launchCaller();
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
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
                                  "harsh.sharma@external.merckgroup.com",
                                  style: TextStyle(
                                      color: Customcolor.text_darkgrey),
                                ),
                              )
                            ],
                          ),
                        ]),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
               Padding(
                padding: const EdgeInsets.only(left: 12),
                child: followUs(),
              ),
             
              //  newSlider(context),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: SizeConfig.blockSizeHorizontal * 90,
                            child: Text("Follow Senator, Dr. Rasha Kelej",
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(2.2),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: AppFonts.normal,
                                    color: Customcolor.text_blue)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            Platform.isAndroid
                                ? ShowDialogs.followuslink(
                                    Constantstring.followrashainsta,
                                    Constantstring.followmsg)
                                : ShowDialogs.launchInstagram(
                                    Constantstring.followrashainsta,
                                    "merckfoundation");
                          },
                          child: Image.asset(
                            "assets/newImages/instagram.png",
                            height: imgHeight,
                            width: imgHeight,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () async {
                            print(Constantstring.followrashafacebook);

                            ShowDialogs.launchFacebook(
                                Constantstring.followrashafacebook,
                                "550280998481446");
                          },
                          child: Image.asset(
                            "assets/newImages/facebooknew.png",
                            height: imgHeight,
                            width: imgHeight,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () async {
                            Platform.isAndroid
                                ? ShowDialogs.followuslink(
                                    Constantstring.followrashatwitter,
                                    Constantstring.followmsg)
                                : ShowDialogs.launchTwitter(
                                    Constantstring.followrashatwitter);
                          },
                          child: Image.asset(
                            "assets/newImages/twitternew.png",
                            height: imgHeight,
                            width: imgHeight,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () async {
                            print("youtube");
                            Platform.isAndroid
                                ? ShowDialogs.followuslink(
                                    Constantstring.followerashayoutube,
                                    Constantstring.followmsg)
                                : ShowDialogs.youtubevideolink(
                                    Constantstring.followerashayoutube);
                          },
                          child: Image.asset(
                            "assets/newImages/youtube.png",
                            height: imgHeight,
                            width: imgHeight,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () async {
                            Platform.isAndroid
                                ? ShowDialogs.followuslink(
                                    Constantstring.followrashaflicker,
                                    Constantstring.followmsg)
                                : ShowDialogs.launchURL(
                                    Constantstring.followrashaflicker);
                          },
                          child: Image.asset(
                            "assets/newImages/flickr.png",
                            height: imgHeight,
                            width: imgHeight,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () async {
                            ShowDialogs.openThreadsApp(
                                Constantstring.followthreasrasha);
                          },
                          child: Image.asset(
                            "assets/newImages/threads.png",
                            height: imgHeight,
                            width: imgHeight,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
    Align(
                     alignment: Alignment.bottomCenter,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
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
                       ],
                     ))
         
            ],
          ),
             
        ],
      ),
    );
  }

  Widget followUs() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 15),
      child: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text("Follow Us",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.2),
                            fontWeight: FontWeight.w700,
                            fontFamily: AppFonts.normal,
                            color: Customcolor.text_blue)),
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      Platform.isAndroid
                          ? ShowDialogs.followuslink(Constantstring.followinsta,
                              Constantstring.followmsg)
                          : ShowDialogs.launchInstagram(
                              Constantstring.followinsta, "merckfoundation");
                    },
                    child: Image.asset(
                      "assets/newImages/instagram.png",
                      height: imgHeight,
                      width: imgHeight,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      // Platform.isAndroid
                      //     ? ShowDialogs.followuslink(
                      //         Constantstring.followfacebook,
                      //         Constantstring.followmsg):
                      ShowDialogs.launchFacebook(
                          Constantstring.followfacebook, "1053979038068008");
                    },
                    child: Image.asset(
                      "assets/newImages/facebooknew.png",
                      height: imgHeight,
                      width: imgHeight,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      Platform.isAndroid
                          ? ShowDialogs.followuslink(
                              Constantstring.followtwitter,
                              Constantstring.followmsg)
                          : ShowDialogs.launchTwitter(
                              Constantstring.followtwitter);
                    },
                    child: Image.asset(
                      "assets/newImages/twitternew.png",
                      height: imgHeight,
                      width: imgHeight,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
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
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      Platform.isAndroid
                          ? ShowDialogs.followuslink(
                              Constantstring.followflicker,
                              Constantstring.followmsg)
                          : ShowDialogs.launchURL(Constantstring.followflicker);
                    },
                    child: Image.asset(
                      "assets/newImages/flickr.png",
                      height: imgHeight,
                      width: imgHeight,
                    ),
                  ),
                  // SizedBox(
                  //   width: 7,
                  // ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      ShowDialogs.openThreadsApp(Constantstring.followthreas);
                    },
                    child: Image.asset(
                      "assets/newImages/threads.png",
                      height: imgHeight,
                      width: imgHeight,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
            ],
          ),
        ],
      )),
    );
  }

  // _launchCaller() async {
  //   print("on launch");
  //   const url = "tel:+91 9540932090"; //+912262101916";
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  // _launchCaller1() async {
  //   const url = "tel:+91 9319606669";
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
Future<void> _launchCaller() async {
  print("on launch");
  final Uri uri = Uri(scheme: 'tel', path: '+91 9540932090');

  if (!await launchUrl(uri)) {
    throw 'Could not launch $uri';
  }
}

Future<void> _launchCaller1() async {
  final Uri uri = Uri(scheme: 'tel', path: '+91 9319606669');

  if (!await launchUrl(uri)) {
    throw 'Could not launch $uri';
  }
}
  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'info@merck-foundation.com',
      queryParameters: {'subject': 'MerckFoundation'});

 
}

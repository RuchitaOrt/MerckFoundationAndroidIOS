import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:merckfoundation22dec/model/visionResponse.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:screenshot/screenshot.dart';

class OurVision extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OurVisionState();
  }
}

class OurVisionState extends State<OurVision> with TickerProviderStateMixin {
  AnimationController _controller;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  double imgHeight = 50;
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    getvision();
    super.initState();
    initPlatformState();

    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  Future<void> initPlatformState() async {
    String platformVersion;

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Customcolor.background,
        appBar: InnerCustomAppBar(
          onTapvalfilter: () {
            print("hi");
            // showModalBottomSheet<void>(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
            //   ),
            //   context: context,
            //   builder: (BuildContext context) {
            //     return Screenshot(
            //       controller: screenshotController,
            //       child: Padding(
            //         padding: const EdgeInsets.all(10.0),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             //
            //             GestureDetector(
            //               onTap: () async {
            //                 FlutterShareMe().shareToFacebook(
            //                     url: 'https://github.com/lizhuoyuan',
            //                     msg: "msg");
            //               },
            //               // await screenshotController
            //               //     .capture()
            //               //     .then((image) async {
            //               //   //facebook appId is mandatory for andorid or else share won't work

            //               // });
            //               // Platform.isAndroid
            //               //     ? SocialShare.shareFacebookStory("#ffffff",
            //               //             "#000000", "https://google.com",
            //               //             appId: "870993726807583")
            //               //         .then((data) {
            //               //         print(data);
            //               //       })
            //               //     : SocialShare.shareFacebookStory("#ffffff",
            //               //             "#000000", "https://google.com")
            //               //         .then((data) {
            //               //         print(data);
            //               //       });

            //               child: Image.asset(
            //                 "assets/newImages/facebook.png",
            //                 height: imgHeight,
            //                 width: imgHeight,
            //               ),
            //             ),
            //             // RaisedButton(
            //             //   onPressed: () async {
            //             //     await screenshotController
            //             //         .capture()
            //             //         .then((image) async {
            //             //       //facebook appId is mandatory for andorid or else share won't work
            //             //       Platform.isAndroid
            //             //           ? SocialShare.shareFacebookStory(
            //             //                   image.path,
            //             //                   "#ffffff",
            //             //                   "#000000",
            //             //                   "https://google.com",
            //             //                   appId: "870993726807583")
            //             //               .then((data) {
            //             //               print(data);
            //             //             })
            //             //           : SocialShare.shareFacebookStory(
            //             //                   image.path,
            //             //                   "#ffffff",
            //             //                   "#000000",
            //             //                   "https://google.com")
            //             //               .then((data) {
            //             //               print(data);
            //             //             });
            //             //     });
            //             //   },
            //             //   child: Text("Share On Facebook Story"),
            //             // ),
            //             SizedBox(
            //               width: 7,
            //             ),
            //             GestureDetector(
            //               onTap: ()
            //                   // SocialShare.shareTwitter(
            //                   //         "This is Social Share twitter example",
            //                   //         hashtags: ["hello", "world", "foo", "bar"],
            //                   //         url: "https://google.com/#/hello",
            //                   //         trailingText: "\nhello")
            //                   //     .then((data) {
            //                   //   print(data);
            //                   // });
            //                   async {
            //                 var response = await FlutterShareMe()
            //                     .shareToTwitter(
            //                         url: 'https://github.com/lizhuoyuan',
            //                         msg: "Share");
            //                 if (response == 'success') {
            //                   print('navigate success');
            //                 }
            //               },
            //               child: Image.asset(
            //                 "assets/newImages/twitter.png",
            //                 height: imgHeight,
            //                 width: imgHeight,
            //               ),
            //             ),
            //             SizedBox(
            //               width: 7,
            //             ),
            //             GestureDetector(
            //               onTap: () async {
            //                 // SocialShare.shareLinkedin(
            //                 //         "Hello World \n https://google.com")
            //                 //     .then((data) {
            //                 //   print(data);
            //                 // });
            //                 var response = await FlutterShareMe()
            //                     .shareToLinkedin(
            //                         url: 'https://github.com/lizhuoyuan',
            //                         msg: "Share");
            //               },
            //               child: Image.asset(
            //                 "assets/newImages/linkedin.png",
            //                 height: imgHeight,
            //                 width: imgHeight,
            //               ),
            //             ),
            //             GestureDetector(
            //               onTap: () {
            //                 FlutterShareMe().shareToWhatsApp(
            //                     base64Image: "",
            //                     msg: "msg \n https://google.com");
            //               },
            //               child: Image.asset(
            //                 "assets/newImages/linkedin.png",
            //                 height: imgHeight,
            //                 width: imgHeight,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     );
            //   },
            // ).whenComplete(() {
            //   setState(() {});
            // });
          },
          onTapval: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Dashboard(
                          index: 0,
                        )));
          },
          index: 2,
          title: "Our Vision",
          titleImg: "assets/newImages/vision_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: GlobalLists.vision.length <= 0
                  ? Container(
                      child: Center(child: Text(Constantstring.emptyData)),
                    )
                  : ListView(
                      shrinkWrap: true,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GlobalLists.vision[0].image == ""
                            ? Container()
                            : Padding(
                                padding: const EdgeInsets.only(
                                    right: 10, left: 10, top: 10),
                                child: FadeInImage.assetNetwork(
                                  placeholder:
                                      'assets/newImages/placeholder_3.jpg',
                                  image: GlobalLists.vision[0].image,
                                  fit: BoxFit.fill,
                                  height: 150,
                                ),
                              ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 8, top: 8, bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text(
                              //   GlobalLists.vision[0].title,
                              //   style: TextStyle(
                              //       color: Customcolor.pink_col,
                              //       fontFamily: AppFonts.normal,
                              //       fontSize:
                              //           ResponsiveFlutter.of(context).fontSize(2.2),
                              //       fontWeight: FontWeight.w600),
                              // ),
                              Html(
                                data: """${GlobalLists.vision[0].title} """,
                                onLinkTap: (url) {
                                  print("Opening $url...");
                                },
                                // style: {
                                //   "body": Style(
                                //     fontSize: FontSize(
                                //         ResponsiveFlutter.of(context).fontSize(2.2)),
                                //     fontWeight: FontWeight.w600,
                                //     color: Customcolor.pink_col,
                                //   ),
                                // },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Html(
                                data:
                                    """${GlobalLists.vision[0].pageContent} """,
                                onLinkTap: (url) {
                                  print("Opening $url...");
                                },
                                // style: {
                                //   "body": Style(
                                //     fontSize: FontSize(
                                //         ResponsiveFlutter.of(context).fontSize(2)),
                                //     fontWeight: FontWeight.w300,
                                //   ),
                                // },
                              ),
                              // Text(
                              //     "The Merck Foundation is the philanthropic arm of Merck KGaA Germany that aims to improve the health and wellbeing of people and advance their lives through science and technology.\n\nOur efforts are primarily focused on improving access to quality & equitable healthcare solutions, building healthcare, scientiﬁc research & media capacity and empowering people in STEM* with a special focus on women and youth in under-served communities.\n\n*STEM: Science, Technology, Engineering and Mathematics",
                              //     style: TextStyle(
                              //       color: Customcolor.text_darkgrey,
                              //       fontSize:
                              //           ResponsiveFlutter.of(context).fontSize(2),
                              //     )
                              //     //fontWeight: FontWeight.w300),
                              //     ),
                              // SizedBox(
                              //   height: 15,
                              // ),
                              // Text(
                              //   "Merck Foundation Strives to",
                              //   style: TextStyle(
                              //       color: Customcolor.pink_col,
                              //       fontFamily: AppFonts.normal,
                              //       fontSize:
                              //           ResponsiveFlutter.of(context).fontSize(2.2),
                              //       fontWeight: FontWeight.w600),
                              // ),
                              // SizedBox(height: 15),
                              // Text(
                              //     "Work closely with partners that are African First Ladies, Ministries of Health, Education, Information & Communication, Gender, Academia, Research Institutions, Media and Art in building healthcare capacity and addressing health, social & economic challenges in developing countries and under-served communities.",
                              //     style: TextStyle(
                              //       color: Customcolor.text_darkgrey,
                              //       fontSize:
                              //           ResponsiveFlutter.of(context).fontSize(2),
                              //     )
                              //     //fontWeight: FontWeight.w300),
                              //     ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 60, left: 60, top: 20),
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
                      ],
                    ),
            ),

            // TextSpan(

            // ),
          ],
        ));
  }

  getvision() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.vision,
        (response) async {
          VisionResponse resp = response;
          print(response);
          print('Resp : $resp');
          GlobalLists.vision.clear();
          Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.vision = resp.data.list;
            });
          } else {
            ShowDialogs.showToast(resp.msg);
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

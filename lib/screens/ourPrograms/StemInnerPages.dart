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
import 'package:flutter_html/style.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';

class StemInnerPages extends StatefulWidget {
  final String title;
  final String details;

  const StemInnerPages({Key key, this.title, this.details}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return StemInnerPagesState();
  }
}

class StemInnerPagesState extends State<StemInnerPages>
    with TickerProviderStateMixin {
  AnimationController _controller;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  double imgHeight = 50;
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    // getvision();
    super.initState();

    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Customcolor.background,
        appBar: InnerCustomAppBar(
          onTapvalfilter: () {},
          onTapval: () {
            Navigator.pop(context);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => Dashboard(
            //               index: 0,
            //             )));
          },
          index: 2,
          // facebooklink: "http://merckfoundation.org/mfindia/web/public/vision",
          // linkedinlink: "http://merckfoundation.org/mfindia/web/public/vision",
          // whatsuplink: "http://merckfoundation.org/mfindia/web/public/vision",
          // twitterlink: "http://merckfoundation.org/mfindia/web/public/vision",
          title: widget.title,
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
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 8, top: 8, bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Center(
                              //   child: Html(
                              //     data: """${widget.title} """,
                              //     onLinkTap: (url) {
                              //       print("Opening $url...");
                              //     },
                              //     style: {
                              //       "body": Style(
                              //           textAlign: TextAlign.start,
                              //           color: Customcolor.colorVoilet,
                              //           fontSize: FontSize.larger,
                              //           alignment: Alignment.center,
                              //           fontWeight: FontWeight.w600),
                              //     },
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 15,
                              // ),
                              Html(
                                data: """${widget.details} """,
                                onLinkTap: (url) {
                                  print("Opening $url...");
                                },
                              ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.only(right: 0, left: 0),
                              //   child: Align(
                              //     alignment: Alignment.topRight,
                              //     child: Image.asset(
                              //       "assets/newImages/flowers_footer.png",
                              //       height: 170,
                              //     ),
                              //   ),
                              // ),
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

  // getvision() async {
  //   var status1 = await ConnectionDetector.checkInternetConnection();

  //   if (status1) {
  //     ShowDialogs.showLoadingDialog(context, _keyLoader);

  //     APIManager().apiRequest(
  //       context,
  //       API.vision,
  //       (response) async {
  //         VisionResponse resp = response;
  //         print(response);
  //         print('Resp : $resp');
  //         GlobalLists.vision.clear();
  //         Navigator.of(_keyLoader.currentContext).pop();

  //         if (resp.success == "True") {
  //           setState(() {
  //             GlobalLists.vision = resp.data.list;
  //           });
  //         } else {
  //           ShowDialogs.showToast(resp.msg);
  //         }
  //       },
  //       (error) {
  //         print('ERR msg is $error');
  //         Navigator.of(_keyLoader.currentContext).pop();
  //       },
  //     );
  //   } else {
  //     ShowDialogs.showToast("Please check internet connection");
  //   }
  // }
}

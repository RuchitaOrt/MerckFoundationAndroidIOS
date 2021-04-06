import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:screenshot/screenshot.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:flutter_html/style.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';

class Homeceomessage extends StatefulWidget {
  final String detail;
  final String title;
  final String detailpageurl;

  const Homeceomessage({Key key, this.detail, this.title, this.detailpageurl})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return OurVisionState();
  }
}

class OurVisionState extends State<Homeceomessage>
    with TickerProviderStateMixin {
  AnimationController _controller;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  double imgHeight = 50;
  String _platformVersion = 'Unknown';

  @override
  void initState() {
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
          onTapvalfilter: () {},
          onTapval: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => Dashboard(
            //               index: 0,
            //             )));
            Navigator.pop(context);
          },
          index: 2,
          titleshowingindex: "1",
          sharelink:
              Constantstring.shareceohomeeodetailpage + widget.detailpageurl,
          title: "Ceo Message",
          titleImg: "assets/newImages/vision_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 80,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: ListView(
                shrinkWrap: true,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 8, top: 8, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Html(
                          data: """${widget.title} """,
                          onLinkTap: (url) {
                            print("Opening $url...");
                            ShowDialogs.launchURL(url);
                          },
                          style: {
                            "body": Style(
                              fontSize: FontSize(
                                  ResponsiveFlutter.of(context).fontSize(2)),
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.start,
                              color: Customcolor.colorVoilet,
                            ),
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Html(
                          data: """${widget.detail} """,
                          onLinkTap: (url) {
                            print("Opening $url...");
                            ShowDialogs.launchURL(url);
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
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
}

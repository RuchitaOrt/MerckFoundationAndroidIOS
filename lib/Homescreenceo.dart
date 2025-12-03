import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/AutoResizeWebView.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:screenshot/screenshot.dart';
import 'package:merckfoundation22dec/utility/ResponsiveFlutter.dart';

import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Homeceomessage extends StatefulWidget {
  final String? detail;
  final String? title;
  final String? detailpageurl;

  const Homeceomessage({Key? key, this.detail, this.title, this.detailpageurl})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return OurVisionState();
  }
}

class OurVisionState extends State<Homeceomessage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
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
    String? platformVersion;

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion!;
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
              Constantstring.shareceohomeeodetailpage + widget.detailpageurl!,
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
              padding: const EdgeInsets.only(bottom: 0),
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
                        HtmlWidget(
                          """${widget.title} """,
                         customWidgetBuilder: (element) {
              if (element.localName == 'video') {
                final src = element.children.firstWhere((e) => e.localName == 'source').attributes['src'];
                if (src != null && src.contains('youtube.com')) {
                  return SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: WebView(
                      initialUrl: src,
                      javascriptMode: JavascriptMode.unrestricted,
                    ),
                  );
                }
              }else  if (element.localName == 'iframe') {
                final iframeSrc = element.attributes['src'];

                // If the iframe is a YouTube video, handle it
                if (iframeSrc != null && iframeSrc.contains("youtube.com")) {
                  return SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: WebView(
                      initialUrl: iframeSrc,
                      javascriptMode: JavascriptMode.unrestricted,
                    ),
                  );
                }
              }else if (element.localName == 'table') {
     
        return  AutoResizeWebView(htmlContent: element.outerHtml,);
       
      }
              return null;
            },
                         
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        // _buildHtmlContent(context, widget.detail),

                        HtmlWidget(widget.detail!,
                         customWidgetBuilder: (element) {
              if (element.localName == 'video') {
                final src = element.children.firstWhere((e) => e.localName == 'source').attributes['src'];
                if (src != null && src.contains('youtube.com')) {
                  return SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: WebView(
                      initialUrl: src,
                      javascriptMode: JavascriptMode.unrestricted,
                    ),
                  );
                }
              }else  if (element.localName == 'iframe') {
                final iframeSrc = element.attributes['src'];

                // If the iframe is a YouTube video, handle it
                if (iframeSrc != null && iframeSrc.contains("youtube.com")) {
                  return SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: WebView(
                      initialUrl: iframeSrc,
                      javascriptMode: JavascriptMode.unrestricted,
                    ),
                  );
                }
              }else if (element.localName == 'table') {
     
        return  AutoResizeWebView(htmlContent: element.outerHtml,);
       
      }
              return null;
            },),

                      

                        SizedBox(
                          height: 5,
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
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Align(alignment: Alignment.bottomCenter, child: Bottomcardlink()),

            // TextSpan(

            // ),
          ],
        ));
  }

  // Widget _buildHtmlContent(BuildContext context, String htmlContent) {
  //   if (htmlContent == null || htmlContent.isEmpty) {
  //     return Text("No content available"); // Fallback UI
  //   }

  //   try {
  //     // Attempt to parse the HTML content
  //     return HtmlWidget(
  //      htmlContent,
       
     
       
  //     );
  //   } catch (e) {
  //     print("HTML Error: $e");
  //     // Fallback UI in case of an error
  //     return Text("Failed to load content");
  //   }
  // }
}

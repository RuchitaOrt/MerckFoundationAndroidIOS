import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:merckfoundation22dec/model/visionResponse.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter_html/style.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

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
  final String htmlData = """
    <h1>Hello, Flutter!</h1>
    <p>This is a <strong>scrollable</strong> HTML content.</p>
    <p>Scroll down to see more content.</p>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
  """;
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
          title: widget.title,
          titleImg: "assets/newImages/vision_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Stack(
          children: [
            ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 2, right: 1, top: 8, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        // scrollDirection: Axis.,
                        child: Container(
                            padding: EdgeInsets.all(10),
                            width: double.infinity,
                            child: HtmlWidget('${widget.details}')),
                      ),
                      SizedBox(
                        height: 10,
                      )
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
                  height: 40,
                ),
              ],
            ),

            // TextSpan(

            // ),

            Align(alignment: Alignment.bottomCenter, child: Bottomcardlink()),
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

// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:merckfoundation22dec/model/visionResponse.dart';
// import 'package:merckfoundation22dec/utility/APIManager.dart';
// import 'package:merckfoundation22dec/utility/GlobalLists.dart';
// import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
// import 'package:merckfoundation22dec/widget/botttomlink.dart';
// import 'package:merckfoundation22dec/widget/customcolor.dart';
// import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
// import 'package:merckfoundation22dec/widget/showdailog.dart';
// import 'package:screenshot/screenshot.dart';
// import 'package:flutter_html/style.dart';

// class StemInnerPages extends StatefulWidget {
//   final String title;
//   final String details;

//   const StemInnerPages({Key key, this.title, this.details}) : super(key: key);
//   @override
//   State<StatefulWidget> createState() {
//     return StemInnerPagesState();
//   }
// }

// class StemInnerPagesState extends State<StemInnerPages>
//     with TickerProviderStateMixin {
//   AnimationController _controller;
//   final GlobalKey<State> _keyLoader = new GlobalKey<State>();
//   double imgHeight = 50;
//   String _platformVersion = 'Unknown';

//   @override
//   void initState() {
//     // getvision();
//     super.initState();

//     _controller = new AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 250),
//     );
//   }

//   ScreenshotController screenshotController = ScreenshotController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Customcolor.background,
//         appBar: InnerCustomAppBar(
//           onTapvalfilter: () {},
//           onTapval: () {
//             Navigator.pop(context);
//             // Navigator.push(
//             //     context,
//             //     MaterialPageRoute(
//             //         builder: (BuildContext context) => Dashboard(
//             //               index: 0,
//             //             )));
//           },
//           index: 1,
//           title: widget.title,
//           titleImg: "assets/newImages/vision_logo.png",
//           trallingImg1: "assets/newImages/share.png",
//           trallingImg2: "assets/newImages/search.png",
//           height: 85,
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//         body: Stack(
//           children: [
//             ListView(
//               shrinkWrap: true,
//               // crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       left: 15, right: 8, top: 8, bottom: 15),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Center(
//                       //   child: Html(
//                       //     data: """${widget.title} """,
//                       //         onLinkTap:(url) {
//                       //       print("Opening $url...");
//                       //     },
//                       //     style: {
//                       //       "body": Style(
//                       //           textAlign: TextAlign.start,
//                       //           color: Customcolor.colorVoilet,
//                       //           fontSize: FontSize.larger,
//                       //           alignment: Alignment.center,
//                       //           fontWeight: FontWeight.w600),
//                       //     },
//                       //   ),
//                       // ),
//                       // SizedBox(
//                       //   height: 15,
//                       // ),
//                          SingleChildScrollView(
//                          scrollDirection: Axis.horizontal,
//                         child: Html(
//                            shrinkWrap: true,
//                           data: """${widget.details} """,
//                             onLinkTap:(url,) {
//                             print("Opening $url...");
//                             ShowDialogs.launchURL(url);
//                           },

//                           style: {
//                               "table": Style(
//                               //   textDecorationColor:Colors.black  ,
//                               //  color: Colors.black
//                     // backgroundColor: Colors.white,

//                   ),
//                   "span":Style(

//                     color: Customcolor.colorBlue
//                   )

//                   ,
//                   "img":Style(
//                     width: 20,

//                     height: 20
//                   ),
//                   "td": Style(
//                     height: 70,
//                   // width: 100
//                     //  padding: const EdgeInsets.all(2),
//                    ),
//                   "tr": Style(

//                     //textOverflow: TextOverflow.ellipsis,
//                     padding: const EdgeInsets.all(2),

//                       border: Border.all(color: Colors.black)),
//                   "th": Style(

//                   //    textOverflow: TextOverflow.ellipsis,
//                       padding: const EdgeInsets.all(2),

//                       border: Border.all(color: Colors.black)),
//                             "tr": Customcolor.tableboderstyle(context),
//                           },
//                         ),
//                       ),
//                       // Html(
//                       //   data: """${widget.details} """,
//                       //   onLinkTap: (url) {
//                       //     print("Opening $url...");
//                       //     ShowDialogs.launchURL(url);
//                       //   },
//                       //   style: {
//                       //     "tr": Customcolor.tableboderstyle(context),
//                       //   },
//                       // ),
//                       // Padding(
//                       //   padding:
//                       //       const EdgeInsets.only(right: 0, left: 0),
//                       //   child: Align(
//                       //     alignment: Alignment.topRight,
//                       //     child: Image.asset(
//                       //       "assets/newImages/flowers_footer.png",
//                       //       height: 170,
//                       //     ),
//                       //   ),
//                       // ),
//                       SizedBox(
//                         height: 10,
//                       )
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 0, left: 0),
//                   child: Align(
//                     alignment: Alignment.topRight,
//                     child: Image.asset(
//                       "assets/newImages/flowers_footer.png",
//                       height: 170,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 40,
//                 ),
//               ],
//             ),

//             // TextSpan(

//             // ),

//             Align(alignment: Alignment.bottomCenter, child: Bottomcardlink()),
//           ],
//         ));
//   }

//   // getvision() async {
//   //   var status1 = await ConnectionDetector.checkInternetConnection();

//   //   if (status1) {
//   //     ShowDialogs.showLoadingDialog(context, _keyLoader);

//   //     APIManager().apiRequest(
//   //       context,
//   //       API.vision,
//   //       (response) async {
//   //         VisionResponse resp = response;
//   //         print(response);
//   //         print('Resp : $resp');
//   //         GlobalLists.vision.clear();
//   //         Navigator.of(_keyLoader.currentContext).pop();

//   //         if (resp.success == "True") {
//   //           setState(() {
//   //             GlobalLists.vision = resp.data.list;
//   //           });
//   //         } else {
//   //           ShowDialogs.showToast(resp.msg);
//   //         }
//   //       },
//   //       (error) {
//   //         print('ERR msg is $error');
//   //         Navigator.of(_keyLoader.currentContext).pop();
//   //       },
//   //     );
//   //   } else {
//   //     ShowDialogs.showToast("Please check internet connection");
//   //   }
//   // }
// }

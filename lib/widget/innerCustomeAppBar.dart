import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/searchscreen/searchcategory.dart';

class InnerCustomAppBar extends PreferredSize {
  // final Widget child;
  final double height;
  final Function onTapval;
  final int index;
  final String title;
  final String titleImg;
  final String trallingImg1;
  final String trallingImg2;
  final Function onTapvalfilter;

  InnerCustomAppBar(
      {this.onTapvalfilter,
      this.onTapval,
      this.index,
      this.title,
      this.titleImg,
      this.trallingImg1,
      this.trallingImg2,
      @required this.height = kToolbarHeight});
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Size get preferredSize => Size.fromHeight(height);
  double imgHeight = 50;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Customcolor.baby_blue,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 10,
            ),
            GestureDetector(
                onTap: onTapval,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    "assets/newImages/arrow_back.png",
                    height: 25,
                  ),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FormLabel(
                      text: title,
                      fontSize: 18,
                      fontweight: FontWeight.w700,
                      labelColor: Customcolor.text_blue,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      "assets/newImages/toolflowerfortext.png",
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            index != 1
                ? GestureDetector(
                    onTap: onTapvalfilter,
                    child: Image.asset(
                      trallingImg1,
                      // "assets/images/search_icon@2x.png",
                      width: 23,
                      height: 23,
                    ),
                  )
                : Container(),
            SizedBox(
              width: 15,
            ),
            // GestureDetector(
            //   onTap: () {
            //     showModalBottomSheet<void>(
            //       shape: RoundedRectangleBorder(
            //         borderRadius:
            //             BorderRadius.vertical(top: Radius.circular(24.0)),
            //       ),
            //       context: context,
            //       builder: (BuildContext context) {
            //         return Padding(
            //           padding: const EdgeInsets.all(10.0),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               //
            //               GestureDetector(
            //                 onTap: () async {
            //                   FlutterShareMe().shareToFacebook(
            //                       url: 'https://github.com/lizhuoyuan',
            //                       msg: "msg");
            //                 },

            //                 child: Image.asset(
            //                   "assets/newImages/facebook.png",
            //                   height: imgHeight,
            //                   width: imgHeight,
            //                 ),
            //               ),

            //               SizedBox(
            //                 width: 7,
            //               ),
            //               GestureDetector(
            //                 onTap: ()

            //                     async {
            //                   var response = await FlutterShareMe()
            //                       .shareToTwitter(
            //                           url: 'https://github.com/lizhuoyuan',
            //                           msg: "Share");
            //                   if (response == 'success') {
            //                     print('navigate success');
            //                   }
            //                 },
            //                 child: Image.asset(
            //                   "assets/newImages/twitter.png",
            //                   height: imgHeight,
            //                   width: imgHeight,
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: 7,
            //               ),
            //               GestureDetector(
            //                 onTap: () async {
            //                   // SocialShare.shareLinkedin(
            //                   //         "Hello World \n https://google.com")
            //                   //     .then((data) {
            //                   //   print(data);
            //                   // });
            //                   var response = await FlutterShareMe()
            //                       .shareToLinkedin(
            //                           url: 'https://github.com/lizhuoyuan',
            //                           msg: "Share");
            //                 },
            //                 child: Image.asset(
            //                   "assets/newImages/linkedin.png",
            //                   height: imgHeight,
            //                   width: imgHeight,
            //                 ),
            //               ),
            //               GestureDetector(
            //                 onTap: () {
            //                   FlutterShareMe().shareToWhatsApp(
            //                       base64Image: "",
            //                       msg: "msg \n https://google.com");
            //                 },
            //                 child: Image.asset(
            //                   "assets/newImages/linkedin.png",
            //                   height: imgHeight,
            //                   width: imgHeight,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         );
            //       },
            //     ).whenComplete(() {});
            //   },
            //   child: Image.asset(
            //     trallingImg1,
            //     // "assets/images/search_icon@2x.png",
            //     width: 18,
            //     height: 18,
            //   ),
            // ),
            GestureDetector(
              onTap: () {
                print("search");

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Searchcategory()));
              },
              child: Image.asset(
                trallingImg2,
                width: 23,
                height: 23,
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class InnerMsgfromleadershipCustomAppBar extends PreferredSize {
  // final Widget child;
  final double height;
  final Function onTapval;
  final int index;
  final String title;
  final String titleImg;
  final String trallingImg1;
  final String trallingImg2;
  final Function onTapvalfilter;

  InnerMsgfromleadershipCustomAppBar(
      {this.onTapvalfilter,
      this.onTapval,
      this.index,
      this.title,
      this.titleImg,
      this.trallingImg1,
      this.trallingImg2,
      @required this.height = kToolbarHeight});
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Size get preferredSize => Size.fromHeight(height);
  double imgHeight = 50;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Customcolor.baby_blue,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 10,
            ),
            GestureDetector(
                onTap: onTapval,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    "assets/newImages/arrow_back.png",
                    height: 25,
                  ),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FormLabel(
                      text: title,
                      fontSize: 16,
                      fontweight: FontWeight.w700,
                      labelColor: Customcolor.text_blue,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      "assets/newImages/toolflowerfortext.png",
                      height: 40,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            index != 1
                ? GestureDetector(
                    onTap: onTapvalfilter,
                    child: Image.asset(
                      trallingImg1,
                      // "assets/images/search_icon@2x.png",
                      width: 23,
                      height: 23,
                    ),
                  )
                : Container(),
            SizedBox(
              width: 15,
            ),
            // GestureDetector(
            //   onTap: () {
            //     showModalBottomSheet<void>(
            //       shape: RoundedRectangleBorder(
            //         borderRadius:
            //             BorderRadius.vertical(top: Radius.circular(24.0)),
            //       ),
            //       context: context,
            //       builder: (BuildContext context) {
            //         return Padding(
            //           padding: const EdgeInsets.all(10.0),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               //
            //               GestureDetector(
            //                 onTap: () async {
            //                   FlutterShareMe().shareToFacebook(
            //                       url: 'https://github.com/lizhuoyuan',
            //                       msg: "msg");
            //                 },

            //                 child: Image.asset(
            //                   "assets/newImages/facebook.png",
            //                   height: imgHeight,
            //                   width: imgHeight,
            //                 ),
            //               ),

            //               SizedBox(
            //                 width: 7,
            //               ),
            //               GestureDetector(
            //                 onTap: ()

            //                     async {
            //                   var response = await FlutterShareMe()
            //                       .shareToTwitter(
            //                           url: 'https://github.com/lizhuoyuan',
            //                           msg: "Share");
            //                   if (response == 'success') {
            //                     print('navigate success');
            //                   }
            //                 },
            //                 child: Image.asset(
            //                   "assets/newImages/twitter.png",
            //                   height: imgHeight,
            //                   width: imgHeight,
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: 7,
            //               ),
            //               GestureDetector(
            //                 onTap: () async {
            //                   // SocialShare.shareLinkedin(
            //                   //         "Hello World \n https://google.com")
            //                   //     .then((data) {
            //                   //   print(data);
            //                   // });
            //                   var response = await FlutterShareMe()
            //                       .shareToLinkedin(
            //                           url: 'https://github.com/lizhuoyuan',
            //                           msg: "Share");
            //                 },
            //                 child: Image.asset(
            //                   "assets/newImages/linkedin.png",
            //                   height: imgHeight,
            //                   width: imgHeight,
            //                 ),
            //               ),
            //               GestureDetector(
            //                 onTap: () {
            //                   FlutterShareMe().shareToWhatsApp(
            //                       base64Image: "",
            //                       msg: "msg \n https://google.com");
            //                 },
            //                 child: Image.asset(
            //                   "assets/newImages/linkedin.png",
            //                   height: imgHeight,
            //                   width: imgHeight,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         );
            //       },
            //     ).whenComplete(() {});
            //   },
            //   child: Image.asset(
            //     trallingImg1,
            //     // "assets/images/search_icon@2x.png",
            //     width: 18,
            //     height: 18,
            //   ),
            // ),
            GestureDetector(
              onTap: () {
                print("search");

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Searchcategory()));
              },
              child: Image.asset(
                trallingImg2,
                width: 23,
                height: 23,
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class InnerAluminsCustomAppBar extends PreferredSize {
  // final Widget child;
  final double height;
  final Function onTapval;
  final int index;
  final String title;
  final String titleImg;
  final String trallingImg1;
  final String trallingImg2;
  final Function onTapvalfilter;

  InnerAluminsCustomAppBar(
      {this.onTapvalfilter,
      this.onTapval,
      this.index,
      this.title,
      this.titleImg,
      this.trallingImg1,
      this.trallingImg2,
      @required this.height = kToolbarHeight});
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Size get preferredSize => Size.fromHeight(height);
  double imgHeight = 50;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Customcolor.baby_blue,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 10,
            ),
            GestureDetector(
                onTap: onTapval,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    "assets/newImages/arrow_back.png",
                    height: 25,
                  ),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FormLabel(
                      text: title,
                      fontSize: 16,
                      fontweight: FontWeight.w700,
                      labelColor: Customcolor.text_blue,
                    ),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    Image.asset(
                      "assets/newImages/toolflowerfortext.png",
                      height: 40,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            index != 1
                ? GestureDetector(
                    onTap: onTapvalfilter,
                    child: Image.asset(
                      trallingImg1,
                      // "assets/images/search_icon@2x.png",
                      width: 23,
                      height: 23,
                    ),
                  )
                : Container(),
            SizedBox(
              width: 15,
            ),
            // GestureDetector(
            //   onTap: () {
            //     showModalBottomSheet<void>(
            //       shape: RoundedRectangleBorder(
            //         borderRadius:
            //             BorderRadius.vertical(top: Radius.circular(24.0)),
            //       ),
            //       context: context,
            //       builder: (BuildContext context) {
            //         return Padding(
            //           padding: const EdgeInsets.all(10.0),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               //
            //               GestureDetector(
            //                 onTap: () async {
            //                   FlutterShareMe().shareToFacebook(
            //                       url: 'https://github.com/lizhuoyuan',
            //                       msg: "msg");
            //                 },

            //                 child: Image.asset(
            //                   "assets/newImages/facebook.png",
            //                   height: imgHeight,
            //                   width: imgHeight,
            //                 ),
            //               ),

            //               SizedBox(
            //                 width: 7,
            //               ),
            //               GestureDetector(
            //                 onTap: ()

            //                     async {
            //                   var response = await FlutterShareMe()
            //                       .shareToTwitter(
            //                           url: 'https://github.com/lizhuoyuan',
            //                           msg: "Share");
            //                   if (response == 'success') {
            //                     print('navigate success');
            //                   }
            //                 },
            //                 child: Image.asset(
            //                   "assets/newImages/twitter.png",
            //                   height: imgHeight,
            //                   width: imgHeight,
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: 7,
            //               ),
            //               GestureDetector(
            //                 onTap: () async {
            //                   // SocialShare.shareLinkedin(
            //                   //         "Hello World \n https://google.com")
            //                   //     .then((data) {
            //                   //   print(data);
            //                   // });
            //                   var response = await FlutterShareMe()
            //                       .shareToLinkedin(
            //                           url: 'https://github.com/lizhuoyuan',
            //                           msg: "Share");
            //                 },
            //                 child: Image.asset(
            //                   "assets/newImages/linkedin.png",
            //                   height: imgHeight,
            //                   width: imgHeight,
            //                 ),
            //               ),
            //               GestureDetector(
            //                 onTap: () {
            //                   FlutterShareMe().shareToWhatsApp(
            //                       base64Image: "",
            //                       msg: "msg \n https://google.com");
            //                 },
            //                 child: Image.asset(
            //                   "assets/newImages/linkedin.png",
            //                   height: imgHeight,
            //                   width: imgHeight,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         );
            //       },
            //     ).whenComplete(() {});
            //   },
            //   child: Image.asset(
            //     trallingImg1,
            //     // "assets/images/search_icon@2x.png",
            //     width: 18,
            //     height: 18,
            //   ),
            // ),
            GestureDetector(
              onTap: () {
                print("search");

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Searchcategory()));
              },
              child: Image.asset(
                trallingImg2,
                width: 23,
                height: 23,
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}

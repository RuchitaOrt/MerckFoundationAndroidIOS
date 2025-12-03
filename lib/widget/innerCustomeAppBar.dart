import 'dart:io';

import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/utility/ResponsiveFlutter.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/searchscreen/searchcategory.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';

import 'package:screenshot/screenshot.dart';

import 'package:merckfoundation22dec/screens/dashboard.dart';

class InnerCustomAppBar extends PreferredSize {
  // final Widget child;
  final double height;
  final VoidCallback? onTapval;
  final int? index;
  final dynamic title;
  final dynamic titleImg;
  final dynamic trallingImg1;
  final dynamic trallingImg2;
  final VoidCallback? onTapvalfilter;
  final int? forfilterindes;
  final dynamic sharelink;
  final dynamic titleshowingindex;

  InnerCustomAppBar(
      {this.sharelink,
      this.onTapvalfilter,
      this.onTapval,
      this.index,
      this.title,
      this.titleImg,
      this.trallingImg1,
      this.trallingImg2,
      this.forfilterindes,
      this.titleshowingindex,
      @required this.height = kToolbarHeight}): super(
          preferredSize: titleshowingindex == "1"
              ? Size.fromHeight(height)
              : Size.fromHeight(120),
          child: AppBar(
            title: Text(title ?? "")));
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Size get preferredSize =>
      titleshowingindex == "1" ? Size.fromHeight(height) : Size.fromHeight(120);
  // Size get preferredSize => Size.fromHeight(height);
  double imgHeight = 50;
  double whatsupheigth = 45;
  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Dashboard(
                                          index: 0,
                                        )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Container(
                              child: Image.asset(
                                "assets/newImages/drawer_img.png",
                                // "assets/newImages/logoforheader.png",
                                // width: 200,
                                height: 100,
                              ),
                            ),
                          ),
                        ),

                        // FormLabel(
                        //   text: title,
                        //   fontSize: 18,
                        //   fontweight: FontWeight.w700,
                        //   labelColor: Customcolor.text_blue,
                        // ),
                        // SizedBox(
                        //   width: 5,
                        // ),
                        // Expanded(
                        //   child: Image.asset(
                        //     "assets/newImages/toolflowerfortext.png",
                        //     height: 50,
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   width: 20,
                // ),
                index != 1
                    ? forfilterindes == 3
                        ? Row(
                            children: [
                              GestureDetector(
                                onTap: onTapvalfilter,
                                child: Image.asset(
                                  trallingImg1,
                                  // "assets/images/search_icon@2x.png",
                                  width: 23,
                                  height: 23,
                                ),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  print("share");
                                  showModalBottomSheet<void>(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(24.0)),
                                    ),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Screenshot(
                                        controller: screenshotController,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10, bottom: 10),
                                                child: FormLabel(
                                                  text: "Share",
                                                  labelColor:
                                                      Customcolor.pink_col,
                                                  fontSize:
                                                      ResponsiveFlutter.of(
                                                              context)
                                                          .fontSize(2.5),
                                                  fontweight: FontWeight.w500,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10, bottom: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    //
                                                    GestureDetector(
                                                      onTap: ()  {
                                                        //changes 6june
                              //                            ShowDialogs.launchFacebook(
                              //  sharelink,
                              //   "550280998481446");

                               ShowDialogs.shareToFacebook(sharelink);
                                                        print("on tap fb");
                                                        // Platform.isAndroid
                                                        //     ? FlutterShareMe()
                                                        //         .shareToFacebook(
                                                        //             url:
                                                        //                 sharelink,
                                                        //             msg: "msg")
                                                        //     :

                                                        // await SocialSharePlugin
                                                        //     .shareToFeedFacebookLink(
                                                        //   quote: "",
                                                        //   url: sharelink,
                                                        //   onSuccess: (_) {
                                                        //     print(
                                                        //         'FACEBOOK SUCCESS');
                                                        //     return;
                                                        //   },
                                                        //   onCancel: () {
                                                        //     print(
                                                        //         'FACEBOOK CANCELLED');
                                                        //     return;
                                                        //   },
                                                        //   onError: (error) {
                                                        //     print(
                                                        //         'FACEBOOK ERROR $error');
                                                        //     return;
                                                        //   },
                                                        // );
                                                      },
                                                      child: Image.asset(
                                                        "assets/newImages/facebooknew.png",
                                                        height: imgHeight,
                                                        width: imgHeight,
                                                      ),
                                                    ),

                                                    SizedBox(
                                                      width: 7,
                                                    ),
                                                    GestureDetector(
                                                      onTap: ()  {
                                                        // Platform.isAndroid
                                                        //     ? await FlutterShareMe()
                                                        //         .shareToTwitter(
                                                        //             url:
                                                        //                 sharelink,
                                                        //             msg:
                                                        //                 "Share"):
  // ShowDialogs.launchTwitter(
  //                             sharelink);
  ShowDialogs.shareToTwitter("Merck Foundation",sharelink);
                                                        // await SocialSharePlugin
                                                        //     .shareToTwitterLink(
                                                        //         text: "",
                                                        //         url: sharelink,
                                                        //         onSuccess: (_) {
                                                        //           print(
                                                        //               'TWITTER SUCCESS');
                                                        //           return;
                                                        //         },
                                                        //         onCancel: () {
                                                        //           print(
                                                        //               'TWITTER CANCELLED');
                                                        //           return;
                                                        //         });
                                                      },
                                                      child: Image.asset(
                                                        "assets/newImages/twitternew.png",
                                                        height: imgHeight,
                                                        width: imgHeight,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 7,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        // Platform.isAndroid
                                                        //     ? await FlutterShareMe()
                                                        //         .shareToLinkedin(
                                                        //             url:
                                                        //                 "sharelink",
                                                        //             msg:
                                                        //                 sharelink)
                                                        //     :

                                                        ShowDialogs
                                                            .launchLinkdin(
                                                                sharelink);
                                                      },
                                                      child: Image.asset(
                                                        "assets/newImages/linkedinnew.png",
                                                        height: imgHeight,
                                                        width: imgHeight,
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        // Platform.isAndroid
                                                        //     ? FlutterShareMe()
                                                        //         .shareToWhatsApp(
                                                        //             base64Image:
                                                        //                 "",
                                                        //             msg:
                                                        //                 sharelink)
                                                        //     :
                                                        ShowDialogs
                                                            .launchWhatsappshare(
                                                                sharelink);

                                                        // :
                                                        //  SocialShare
                                                        //     .shareWhatsapp(
                                                        //     sharelink,
                                                        //   ).then((data) {
                                                        //     print(data);
                                                        //   });
                                                      },
                                                      child: Image.asset(
                                                        "assets/newImages/whatsappnew.png",
                                                        height: imgHeight,
                                                        width: imgHeight,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ).whenComplete(() {});
                                },
                                child: Image.asset(
                                  "assets/newImages/share.png",
                                  // "assets/images/search_icon@2x.png",
                                  width: 23,
                                  height: 23,
                                ),
                              )
                            ],
                          )
                        : GestureDetector(
                            onTap: () {
                              print("share");
                              showModalBottomSheet<void>(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(24.0)),
                                ),
                                context: context,
                                builder: (BuildContext context) {
                                  return Screenshot(
                                    controller: screenshotController,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: FormLabel(
                                              text: "Share",
                                              labelColor: Customcolor.pink_col,
                                              fontSize:
                                                  ResponsiveFlutter.of(context)
                                                      .fontSize(2.5),
                                              fontweight: FontWeight.w500,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                //
                                                GestureDetector(
                                                  onTap: () async {
                                                    print("on tap fb");
                                                    // Platform.isAndroid
                                                    //     ? FlutterShareMe()
                                                    //         .shareToFacebook(
                                                    //             url: sharelink,
                                                    //             msg: "msg")
                                                    //     :
                                                    //chnages 6june
//  ShowDialogs.launchFacebook(
//                                sharelink,
//                                 "550280998481446");
 ShowDialogs.shareToFacebook(sharelink);
                                                    // await SocialSharePlugin
                                                    //     .shareToFeedFacebookLink(
                                                    //   quote: "",
                                                    //   url: sharelink,
                                                    //   onSuccess: (_) {
                                                    //     print(
                                                    //         'FACEBOOK SUCCESS');
                                                    //     return;
                                                    //   },
                                                    //   onCancel: () {
                                                    //     print(
                                                    //         'FACEBOOK CANCELLED');
                                                    //     return;
                                                    //   },
                                                    //   onError: (error) {
                                                    //     print(
                                                    //         'FACEBOOK ERROR $error');
                                                    //     return;
                                                    //   },
                                                    // );
                                                  },
                                                  child: Image.asset(
                                                    "assets/newImages/facebooknew.png",
                                                    height: imgHeight,
                                                    width: imgHeight,
                                                  ),
                                                ),

                                                SizedBox(
                                                  width: 7,
                                                ),
                                                GestureDetector(
                                                  onTap: ()  {
                                                    // Platform.isAndroid
                                                    //     ? await FlutterShareMe()
                                                    //         .shareToTwitter(
                                                    //             url: sharelink,
                                                    //             msg: "Share")
                                                    // :
                              //                         ShowDialogs.launchTwitter(
                              // sharelink);
                              ShowDialogs.shareToTwitter("Merck Foundation",sharelink);
                                                    // await SocialSharePlugin
                                                    //     .shareToTwitterLink(
                                                    //         text: "",
                                                    //         url: sharelink,
                                                    //         onSuccess: (_) {
                                                    //           print(
                                                    //               'TWITTER SUCCESS');
                                                    //           return;
                                                    //         },
                                                    //         onCancel: () {
                                                    //           print(
                                                    //               'TWITTER CANCELLED');
                                                    //           return;
                                                    //         });
                                                  },
                                                  child: Image.asset(
                                                    "assets/newImages/twitternew.png",
                                                    height: imgHeight,
                                                    width: imgHeight,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 7,
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    // Platform.isAndroid
                                                    //     ? await FlutterShareMe()
                                                    //         .shareToLinkedin(
                                                    //             url:
                                                    //                 "sharelink",
                                                    //             msg: sharelink)
                                                    //     :

                                                    ShowDialogs.launchLinkdin(
                                                        sharelink);
                                                  },
                                                  child: Image.asset(
                                                    "assets/newImages/linkedinnew.png",
                                                    height: imgHeight,
                                                    width: imgHeight,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    // Platform.isAndroid
                                                    //     ? FlutterShareMe()
                                                    //         .shareToWhatsApp(
                                                    //             base64Image: "",
                                                    //             msg: sharelink)
                                                    //     :
                                                    ShowDialogs
                                                        .launchWhatsappshare(
                                                            sharelink);

                                                    // :
                                                    //  SocialShare
                                                    //     .shareWhatsapp(
                                                    //     sharelink,
                                                    //   ).then((data) {
                                                    //     print(data);
                                                    //   });
                                                  },
                                                  child: Image.asset(
                                                    "assets/newImages/whatsappnew.png",
                                                    height: imgHeight,
                                                    width: imgHeight,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ).whenComplete(() {});
                              // showModalBottomSheet<void>(
                              //   shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.vertical(
                              //         top: Radius.circular(24.0)),
                              //   ),
                              //   context: context,
                              //   builder: (BuildContext context) {
                              //     return Padding(
                              //       padding: const EdgeInsets.all(10.0),
                              //       child: Column(
                              //         mainAxisSize: MainAxisSize.min,
                              //         children: [
                              //           Padding(
                              //             padding: const EdgeInsets.only(
                              //                 top: 10, bottom: 10),
                              //             child: FormLabel(
                              //               text: "Share",
                              //               labelColor: Customcolor.pink_col,
                              //               fontSize:
                              //                   ResponsiveFlutter.of(context)
                              //                       .fontSize(2.5),
                              //               fontweight: FontWeight.w500,
                              //             ),
                              //           ),
                              //           Padding(
                              //             padding: const EdgeInsets.only(
                              //                 top: 10, bottom: 10),
                              //             child: Row(
                              //               mainAxisAlignment:
                              //                   MainAxisAlignment.center,
                              //               children: [
                              //                 //
                              //                 GestureDetector(
                              //                   onTap: () async {
                              //                     var response =
                              //                         await FlutterShareMe()
                              //                             .openinsta(
                              //                                 url: facebooklink,
                              //                                 msg: "Share");
                              //                   },
                              //                   child: Image.asset(
                              //                     "assets/newImages/facebook.png",
                              //                     height: imgHeight,
                              //                     width: imgHeight,
                              //                   ),
                              //                 ),

                              //                 SizedBox(
                              //                   width: 7,
                              //                 ),
                              //                 GestureDetector(
                              //                   onTap: () async {
                              //                     var response =
                              //                         await FlutterShareMe()
                              //                             .openinsta(
                              //                                 url: twitterlink,
                              //                                 msg: "Share");
                              //                     if (response == 'success') {
                              //                       print('navigate success');
                              //                     }
                              //                   },
                              //                   child: Image.asset(
                              //                     "assets/newImages/twitter.png",
                              //                     height: imgHeight,
                              //                     width: imgHeight,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 7,
                              //                 ),
                              //                 GestureDetector(
                              //                   onTap: () async {
                              //                     var response =
                              //                         await FlutterShareMe()
                              //                             .openinsta(
                              //                                 url: linkedinlink,
                              //                                 msg: "Share");
                              //                   },
                              //                   child: Image.asset(
                              //                     "assets/newImages/linkedin.png",
                              //                     height: imgHeight,
                              //                     width: imgHeight,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 7,
                              //                 ),
                              //                 GestureDetector(
                              //                   onTap: () {
                              //                     FlutterShareMe()
                              //                         .shareToWhatsApp(
                              //                             base64Image: "",
                              //                             msg: whatsuplink);
                              //                   },
                              //                   child: Image.asset(
                              //                     "assets/newImages/whatsapp.png",
                              //                     height: imgHeight,
                              //                     width: imgHeight,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     );
                              //   },
                              // ).whenComplete(() {});
                            },
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
                GestureDetector(
                  onTap: () {
                    print("search");

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Searchcategory()));
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
        ),
        titleshowingindex == "1"
            ? Container()
            : Flexible(
                child: Container(
                  height: 57,
                  color: Customcolor.colorVoilet,
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: forfilterindes == 4
                              ? SizeConfig.blockSizeHorizontal * 80
                              : SizeConfig.blockSizeHorizontal * 90,
                          child: Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        forfilterindes == 4
                            ? GestureDetector(
                                onTap: onTapvalfilter,
                                child: Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Image.asset(
                                      "assets/newImages/filter_white.png",
                                      width: 25,
                                      height: 25,
                                    )),
                              )
                            : Container()
                      ],
                    ),
                  ),
                ),
              )
      ],
    );
  }
}

class InnerMsgfromleadershipCustomAppBar extends PreferredSize {
  // final Widget child;
  final double height;
  final VoidCallback? onTapval;
  final int? index;
  final dynamic title;
  final dynamic titleImg;
  final dynamic trallingImg1;
  final dynamic trallingImg2;
  final VoidCallback? onTapvalfilter;

  InnerMsgfromleadershipCustomAppBar(
      {this.onTapvalfilter,
      this.onTapval,
      this.index,
      this.title,
      this.titleImg,
      this.trallingImg1,
      this.trallingImg2,
      @required this.height = kToolbarHeight}): super(
          preferredSize:  Size.fromHeight(height)
              ,
          child: AppBar(
            title: Text(title ?? "")));
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
            // SizedBox(
            //   width: 20,
            // ),
            index != 1
                ? GestureDetector(
                    onTap: () {
                      print("share");
                      showModalBottomSheet<void>(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(24.0)),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Padding(
                                //   padding: const EdgeInsets.only(
                                //       top: 10, bottom: 10),
                                //   child: FormLabel(
                                //     text: "Share",
                                //     labelColor: Customcolor.pink_col,
                                //     fontSize: ResponsiveFlutter.of(context)
                                //         .fontSize(2.5),
                                //     fontweight: FontWeight.w500,
                                //   ),
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.only(
                                //       top: 10, bottom: 10),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       //
                                //       GestureDetector(
                                //         onTap: () async {
                                //           FlutterShareMe().shareToFacebook(
                                //               url:
                                //                   'https://github.com/lizhuoyuan',
                                //               msg: "msg");
                                //         },
                                //         // await screenshotController
                                //         //     .capture()
                                //         //     .then((image) async {
                                //         //   //facebook appId is mandatory for andorid or else share won't work

                                //         // });
                                //         // Platform.isAndroid
                                //         //     ? SocialShare.shareFacebookStory("#ffffff",
                                //         //             "#000000", "https://google.com",
                                //         //             appId: "870993726807583")
                                //         //         .then((data) {
                                //         //         print(data);
                                //         //       })
                                //         //     : SocialShare.shareFacebookStory("#ffffff",
                                //         //             "#000000", "https://google.com")
                                //         //         .then((data) {
                                //         //         print(data);
                                //         //       });

                                //         child: Image.asset(
                                //           "assets/newImages/facebook.png",
                                //           height: imgHeight,
                                //           width: imgHeight,
                                //         ),
                                //       ),
                                //       // RaisedButton(
                                //       //   onPressed: () async {
                                //       //     await screenshotController
                                //       //         .capture()
                                //       //         .then((image) async {
                                //       //       //facebook appId is mandatory for andorid or else share won't work
                                //       //       Platform.isAndroid
                                //       //           ? SocialShare.shareFacebookStory(
                                //       //                   image.path,
                                //       //                   "#ffffff",
                                //       //                   "#000000",
                                //       //                   "https://google.com",
                                //       //                   appId: "870993726807583")
                                //       //               .then((data) {
                                //       //               print(data);
                                //       //             })
                                //       //           : SocialShare.shareFacebookStory(
                                //       //                   image.path,
                                //       //                   "#ffffff",
                                //       //                   "#000000",
                                //       //                   "https://google.com")
                                //       //               .then((data) {
                                //       //               print(data);
                                //       //             });
                                //       //     });
                                //       //   },
                                //       //   child: Text("Share On Facebook Story"),
                                //       // ),
                                //       SizedBox(
                                //         width: 7,
                                //       ),
                                //       GestureDetector(
                                //         onTap: ()
                                //             // SocialShare.shareTwitter(
                                //             //         "This is Social Share twitter example",
                                //             //         hashtags: ["hello", "world", "foo", "bar"],
                                //             //         url: "https://google.com/#/hello",
                                //             //         trailingText: "\nhello")
                                //             //     .then((data) {
                                //             //   print(data);
                                //             // });
                                //             async {
                                //           var response = await FlutterShareMe()
                                //               .shareToTwitter(
                                //                   url:
                                //                       'https://github.com/lizhuoyuan',
                                //                   msg: "Share");
                                //           if (response == 'success') {
                                //             print('navigate success');
                                //           }
                                //         },
                                //         child: Image.asset(
                                //           "assets/newImages/twitter.png",
                                //           height: imgHeight,
                                //           width: imgHeight,
                                //         ),
                                //       ),
                                //       SizedBox(
                                //         width: 7,
                                //       ),
                                //       GestureDetector(
                                //         onTap: () async {
                                //           // SocialShare.shareLinkedin(
                                //           //         "Hello World \n https://google.com")
                                //           //     .then((data) {
                                //           //   print(data);
                                //           // });
                                //           //uncomment theese code
                                //           var response = await FlutterShareMe()
                                //               .shareToLinkedin(
                                //                   url:
                                //                       'https://github.com/lizhuoyuan',
                                //                   msg: "Share");
                                //         },
                                //         child: Image.asset(
                                //           "assets/newImages/linkedin.png",
                                //           height: imgHeight,
                                //           width: imgHeight,
                                //         ),
                                //       ),
                                //       GestureDetector(
                                //         onTap: () {
                                //           FlutterShareMe().shareToWhatsApp(
                                //               base64Image: "",
                                //               msg: "msg \n https://google.com");
                                //         },
                                //         child: Image.asset(
                                //           "assets/newImages/whatsapp.png",
                                //           height: imgHeight,
                                //           width: imgHeight,
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          );
                        },
                      ).whenComplete(() {});
                    },
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
  final VoidCallback? onTapval;
  final int? index;
  final dynamic title;
  final dynamic titleImg;
  final dynamic trallingImg1;
  final dynamic trallingImg2;
  final VoidCallback? onTapvalfilter;

  InnerAluminsCustomAppBar(
      {this.onTapvalfilter,
      this.onTapval,
      this.index,
      this.title,
      this.titleImg,
      this.trallingImg1,
      this.trallingImg2,
      @required this.height = kToolbarHeight}) :super(
          preferredSize:Size.fromHeight(height)
            ,
          child: AppBar(
            title: Text(title ?? "")));
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

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';


import 'package:merckfoundation22dec/screens/EpisodeInformation.dart';
import 'package:merckfoundation22dec/widget/customHorizontalCard.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/utility/ResponsiveFlutter.dart';
import 'package:screenshot/screenshot.dart';

class CustomeCardEpisode extends StatefulWidget {
  final dynamic cardTitle;
  final dynamic cardImage;
  final dynamic subTitle;
  final dynamic cardsubtitle;
  final dynamic btnTitle;
  final Color? titleColor;
  final dynamic titleImg;
  final int? index;
  final dynamic buttontitle;
  final Color? buttontitlecolor;
  final VoidCallback? onBtnTap;
  final VoidCallback? oncardtap;
  final int? youtubeicon;
  final dynamic showbrief;
  final dynamic episodebrief;
  final dynamic guestinfo;
  final dynamic credits;
  final dynamic relatednews;
  final dynamic photid;
  final dynamic episodeid;
  final dynamic videolink;
  const CustomeCardEpisode(
      {Key? key,
      this.cardTitle,
      this.cardImage,
      this.subTitle,
      this.btnTitle,
      this.titleColor,
      this.titleImg,
      this.index,
      this.buttontitle,
      this.onBtnTap,
      this.buttontitlecolor,
      this.oncardtap,
      this.cardsubtitle,
      this.youtubeicon,
      this.showbrief,
      this.episodebrief,
      this.guestinfo,
      this.credits,
      this.relatednews,
      this.photid,
      this.episodeid,
      this.videolink})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CustomCardState();
  }
}

class CustomCardState extends State<CustomeCardEpisode> {
  ScreenshotController screenshotController = ScreenshotController();
  double imgHeight = 50;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // color: Colors.amber,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: widget.cardsubtitle,
                    style: TextStyle(
                        color: Customcolor.textsubtitlecolor,
                        fontSize: ResponsiveFlutter.of(context).fontSize(2.1),
                        fontWeight: FontWeight.w300,
                        fontFamily: AppFonts.normal),
                  ),
                  TextSpan(
                    text: widget.cardTitle,
                    style: TextStyle(
                      color: Customcolor.pink_col,
                      fontSize:
                          ResponsiveFlutter.of(context).fontSize(2.1), //18
                      fontFamily: AppFonts.normal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // WidgetSpan(
                  //   alignment: PlaceholderAlignment.bottom,
                  //   child: Image.asset(
                  //     //  widget.titleImg,
                  //     "",
                  //     width: 40,
                  //     height: 25,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          GestureDetector(
            onTap: widget.oncardtap,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: SizeConfig.blockSizeVertical * 31,
                      width: SizeConfig.blockSizeHorizontal * 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(widget.cardImage),
                              fit: BoxFit.fill)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Expanded(
                            //   child: Text(
                            //     widget.subTitle,
                            //     overflow: TextOverflow.ellipsis,
                            //     maxLines: 2,
                            //     style: TextStyle(
                            //         fontSize: 17,
                            //         color: Colors.white,
                            //         fontWeight: FontWeight.w500),
                            //     // fontSize: 17,
                            //     // labelColor: Colors.white,
                            //     // fontweight: FontWeight.w500,
                            //   ),
                            // ),
                            GestureDetector(
                              onTap: widget.onBtnTap,
                              child: Container(
                                width: 110,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Text(
                                    widget.buttontitle,
                                    style: TextStyle(
                                        color: widget.buttontitlecolor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    widget.youtubeicon == 0
                        ? Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 5,
                                top: SizeConfig.blockSizeVertical * 12),
                            child: Center(
                                child:
                                    Image.asset("assets/newImages/pause.png")),
                          )
                        : Container()
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: SizeConfig.blockSizeHorizontal * 77,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Text(
                          widget.subTitle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500),
                          // fontSize: 17,
                          // labelColor: Colors.white,
                          // fontweight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          EpisodeInformation(
                                            showbrief: widget.showbrief,
                                            episodebrief: widget.episodebrief,
                                            guestinfo: widget.guestinfo,
                                            credits: widget.credits,
                                            relatednews: widget.relatednews,
                                            photid: widget.photid,
                                            episodeid: widget.episodeid,
                                          )));

                              // showDialog(

                              //               context: context,
                              //               builder: (BuildContext context) {
                              //                 return AlertDialog(
                              //                   contentPadding: EdgeInsets.all(0),
                              //                   title: Container(child: Row(
                              //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //                     children: [
                              //                       Padding(
                              //                         padding: const EdgeInsets.all(0),
                              //                         child: Text('Episode Information',style: TextStyle(color:Customcolor.colorBlue,fontSize: 20),),
                              //                       ),
                              //                        GestureDetector(
                              //                          onTap: ()
                              //                          {
                              //                            Navigator.pop(context);
                              //                          }
                              //                          ,
                              //                          child: Icon(Icons.close)),
                              //         //                FlatButton(
                              //         //                  color: Colors.amber,

                              //         //   onPressed: (){
                              //         //   Navigator.pop(context);
                              //         // },child: Align(
                              //         //   alignment: Alignment.topRight,
                              //         //   child: Icon(Icons.close)),)
                              //                     ],
                              //                   ),),
                              //                   content: ShowDialogs.setupAlertDialoadContainer(context),
                              //                 );
                              //               }
                              //           );
                            },
                            child: Icon(
                              Icons.info_rounded,
                              color: Customcolor.colorBlue,
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                            onTap: () {
                              print("click");
                              var sharelink = widget.videolink;
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
                                                  onTap: ()  {
                                                    //changes 6june
                                                    print("on tap fb");
                                                     ShowDialogs.shareToFacebook(sharelink);
                              //                        ShowDialogs.launchFacebook(
                              //  sharelink,
                              //   "550280998481446");
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
                                                    ShowDialogs.shareToTwitter("Merck Foundation",sharelink);
                              //                         ShowDialogs.launchTwitter(
                              // sharelink);
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
                                                    ShowDialogs.launchLinkdin(
                                                        sharelink);
                                                  },
                                                  child: Image.asset(
                                                    "assets/newImages/linkedinnew.png",
                                                    height: imgHeight,
                                                    width: imgHeight,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 7,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
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
                            child: Container(
                                color: Customcolor.background,
                                child: Image.asset(
                                  "assets/newImages/share.png",
                                  width: 25,
                                  height: 25,
                                ))),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

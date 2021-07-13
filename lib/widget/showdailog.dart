import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowDialogs {
  static Future<void> showLoadingDialog(BuildContext context, GlobalKey key,
      {String message = "Loading, please wait...",
      bool setForLightScreen = false}) async {
    Future.delayed(
      Duration(microseconds: 300),
      () {
        showLoadingDialogWithDelay(context, key, message, setForLightScreen);
      },
    );
  }

  static showImageDialog(
      {BuildContext context, String image, String description}) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        elevation: 0,
        insetPadding: EdgeInsets.all(0),
        backgroundColor: Colors.black.withOpacity(0.7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(child: Container()),
            Expanded(
              child: PhotoView(
                backgroundDecoration: BoxDecoration(color: Colors.transparent),
                initialScale: PhotoViewComputedScale.covered,
                imageProvider: NetworkImage(image, scale: 0.4),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            // Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: 10.0),
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

//yuotube link
  static youtubevideolink(String videourl) async {
    if (Platform.isIOS) {
      _launchURL(videourl);
    } else {
      // var response =
      //     await FlutterShareMe().openinsta(url: videourl, msg: "Youtube");
    }
  }

  static _launchURL(String videourl) async {
    if (Platform.isIOS) {
      if (await canLaunch(videourl)) {
        print("in if");
        await launch(videourl,
            forceSafariVC: false,
            forceWebView: false,
            universalLinksOnly: true);
      } else {
        print("in else");
        if (await canLaunch(videourl)) {
          await launch(videourl);
        } else {
          throw 'Could not launch $videourl';
        }
      }
    } else {
      var url = videourl;
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  static void launchURLemail(String mail) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: mail,
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  static launchFacebook(String url, String pageId) async {
    String fbProtocolUrl;
    if (Platform.isIOS) {
      fbProtocolUrl = "fb://profile/$pageId"; //'fb://profile/1053979038068008';
    } else {
      fbProtocolUrl = 'fb://page/$pageId';
    }

    String fallbackUrl = url;

    try {
      bool launched = await launch(fbProtocolUrl, forceSafariVC: false);

      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false);
    }
  }

  static launchInstagram(String url, String username) async {
    String fbProtocolUrl;

    fbProtocolUrl = 'instagram://user?username=$username';

    String fallbackUrl = url;

    try {
      bool launched = await launch(fbProtocolUrl, forceSafariVC: false);

      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false);
    }
  }

  static launchTwitter(String url) async {
    String fbProtocolUrl;

    fbProtocolUrl = 'twitter://user?screen_name=merckfoundation';

    String fallbackUrl = url;

    try {
      bool launched = await launch(fbProtocolUrl, forceSafariVC: false);

      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false);
    }
  }

  static launchLinkdin(String url) async {
    String fbProtocolUrl;

    fbProtocolUrl =
        'https://www.linkedin.com/shareArticle/?mini=true&url=${url}';

    String fallbackUrl = url;

    try {
      bool launched = await launch(fbProtocolUrl, forceSafariVC: false);

      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false);
    }
  }

//follow link to specific app
  static followuslink(String videourl, String msg) async {
    // var response = await FlutterShareMe().openinsta(url: videourl, msg: msg);
  }

  static youtbeicon(BuildContext context) {
    Positioned(
      top: SizeConfig.blockSizeVertical * 4,
      left: SizeConfig.blockSizeVertical * 8,
      child: Center(
        child: Image.asset(
          "assets/newImages/pause.png",
          height: 30,
          width: 30,
        ),
      ),
    );
  }

  static Future<void> showLoadingDialogWithDelay(BuildContext context,
      GlobalKey key, String message, bool setForLightScreen) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Material(
            key: key,
            type: MaterialType.transparency,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitCircle(
                    color: setForLightScreen ? Colors.black : Colors.white),
                SizedBox(height: 15),
                Text(message,
                    style: TextStyle(
                        color: setForLightScreen ? Colors.black : Colors.white))
              ],
            )),
          );
        });
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Customcolor.colorBlue,
        backgroundColor: Customcolor.colorGrey,
        fontSize: 16.0);
  }

  static launchURL(String urlIs) async {
    var url = urlIs;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static launchWhatsappshare(String msg) async {
    print("on launch");
    var url = "whatsapp://send?text=$msg";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static void bottomlink(BuildContext context) {
    Container(
      child: Text(
        "© Merck Foundation is a German non-profit organization with limited liability, established in 31 May 2017",
      ),
    );
  }

  static void showSimpleDialog(
      BuildContext context, String dialogTitle, String dialogMessage) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(dialogTitle),
          content: new Text(dialogMessage),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<bool> returnShowSMDialog(
      BuildContext context, String dialogTitle, String dialogMessage) async {
    bool status = await showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          title: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
            child: Center(
              child: Text(
                dialogTitle,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Container(
            //height: 140.0,
            //width: double.infinity-10.0,
            //margin: EdgeInsets.zero,
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Text(dialogMessage),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    //padding: EdgeInsets.fromLTRB(60.0, 10.0, 60.0, 10.0),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.orange,
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ),
              ],
            ),
          ),
          // actions: <Widget>[
          //   // usually buttons at the bottom of the dialog
          //   new FlatButton(
          //     child: new Text("Close"),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ],
        );
      },
    );

    return status;
  }

  static void showSMDialog(
      BuildContext context, String dialogTitle, String dialogMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          title: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
            child: Center(
              child: Text(
                dialogTitle,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Container(
            //height: 140.0,
            //width: double.infinity-10.0,
            //margin: EdgeInsets.zero,
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Text(dialogMessage),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    //padding: EdgeInsets.fromLTRB(60.0, 10.0, 60.0, 10.0),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.orange,
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
          // actions: <Widget>[
          //   // usually buttons at the bottom of the dialog
          //   new FlatButton(
          //     child: new Text("Close"),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ],
        );
      },
    );
  }

  static Future<bool> showConfirmDialog(
      BuildContext context, String dialogTitle, String dialogMessage) async {
    bool yesNo = await showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          contentPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          title: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Customcolor.colorBlue,
              borderRadius: new BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Image.asset(
                  "assets/images/LogoutIcon.png",
                  width: 25,
                  height: 25,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Text(
                    '$dialogTitle',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          content: Container(
            height: 140,
            //width: double.infinity-10.0,
            //  color: customcolor.greybackground1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0)),
            ),
            margin: EdgeInsets.zero,
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Text(
                    '$dialogMessage',
                    style: TextStyle(
                      color: Customcolor.colorBlue,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0.0),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0)),
                      color: Colors.white,
                      child: Text(
                        'Stay',
                        style: TextStyle(
                          color: Customcolor.colorBlue,
                          fontSize: 14.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                    RaisedButton(
                      //padding: EdgeInsets.fromLTRB(60.0, 10.0, 60.0, 10.0),
                      padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0.0),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0)),
                      color: Customcolor.colorBlue,
                      child: Text(
                        'Yes, Quit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                      onPressed: () async {
                        SystemNavigator.pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
    return yesNo;
  }

  static Future<bool> showConfirmDialogdelete(
      BuildContext context,
      String dialogTitle,
      String dialogMessage,
      Function onYesTap,
      String btnTitle) async {
    bool yesNo = await showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          contentPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          title: Container(
            padding: EdgeInsets.all(10.0),
            // decoration: BoxDecoration(
            //   color: AppColors.screenBgColor,
            //   borderRadius: new BorderRadius.only(
            //       topLeft: Radius.circular(15.0),
            //       topRight: Radius.circular(15.0),
            //       bottomLeft: Radius.circular(15.0),
            //       bottomRight: Radius.circular(15.0)),
            // ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: 10.0,
                // ),
                // Image.asset(
                //   "assets/images/binicon.png",
                //   width: 25,
                //   height: 25,
                // ),
                SizedBox(height: 10.0),
                Center(
                  child: Text(
                    '$dialogTitle',
                    style: TextStyle(
                        color: Customcolor.colorBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          content: Container(
            height: 170,
            //width: double.infinity-10.0,
            //  color: customcolor.greybackground1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0)),
            ),
            margin: EdgeInsets.zero,
            padding: EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    '$dialogMessage',
                    style: TextStyle(
                      color: Customcolor.colorBlue,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0.0),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0)),
                      color: Colors.white,
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Customcolor.colorBlue,
                          fontSize: 14.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                    RaisedButton(
                      //padding: EdgeInsets.fromLTRB(60.0, 10.0, 60.0, 10.0),
                      padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0.0),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0)),
                      color: Customcolor.colorBlue,
                      child: Text(
                        btnTitle == null ? 'Yes, Delete' : btnTitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                        onYesTap();
                      },
                      // onPressed: () async {
                      //   // storage.delete(key: "token");

                      //   Navigator.of(context).pushAndRemoveUntil(
                      //     // the new route
                      //     MaterialPageRoute(
                      //       builder: (BuildContext context) => Login(),
                      //     ),
                      //     (Route route) => false,
                      //   );
                      // },
                    ),
                  ],
                ),
              ],
            ),
          ),
          // actions: <Widget>[
          // usually buttons at the bottom of the dialog
        );
      },
    );
    return yesNo;
  }

  // static Widget showLoader(String message) {
  //   return Container(
  //     padding: EdgeInsets.all(20.0),
  //     child: new Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         SpinKitCircle(color: Colors.white),
  //         // new CircularProgressIndicator(),
  //         new Container(
  //           margin: EdgeInsets.only(top: 20.0),
  //         ),
  //         new Text(
  //           message,
  //           style: TextStyle(
  //             fontSize: 16.0,
  //             color: AppColors.white,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

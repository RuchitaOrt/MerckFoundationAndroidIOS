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

  // static openThreadsApp(String url) async {
  //   if (await canLaunch(Constantstring.threadsUrlScheme)) {
  //     // If the Threads app is installed, open it
  //     await launch(Constantstring.threadsUrlScheme);
  //   } else {
  //     // If the Threads app is not installed, open the store
  //     if (Platform.isIOS) {
  //       if (await canLaunch(url)) {
  //         await launch(url);
  //       }
  //     } else if (Platform.isAndroid) {
  //       if (await canLaunch(url)) {
  //         await launch(url);
  //       }
  //     }
  //   }
  // }
static Future<void> openThreadsApp(String url) async {
  final Uri appUri = Uri.parse(Constantstring.threadsUrlScheme);   // threads://
  final Uri storeUri = Uri.parse(url);                             // App Store / Play Store URL

  try {
    // Try opening the Threads app
    bool launched = await launchUrl(
      appUri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched) {
      // Fallback → open store
      await launchUrl(
        storeUri,
        mode: LaunchMode.externalApplication,
      );
    }
  } catch (e) {
    // Final fallback
    await launchUrl(
      storeUri,
      mode: LaunchMode.externalApplication,
    );
  }
}
  static showImageDialog(
      {BuildContext? context, String? image, String? description}) {
    showDialog(
      context: context!,
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
                imageProvider: NetworkImage(image!, scale: 0.4),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description!,
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
//   static Future<void> youtubevideolink(String videourl) async {
//     if (await canLaunch(videourl)) {
//       await launch(videourl);
//     } else {
//       // Handle the error, e.g., show an error dialog or message
//       print('Could not launch $videourl');
//     }
//   }


//   static void launchURLemail(String mail) async {
//     final Uri params = Uri(
//       scheme: 'mailto',
//       path: mail,
//     );
//     String url = params.toString();
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       print('Could not launch $url');
//     }
//   }

//   static launchFacebook(String url, String pageId) async {
//     String fbProtocolUrl;
//     if (Platform.isIOS) {
//       fbProtocolUrl = "fb://profile/$pageId"; //'fb://profile/1053979038068008';
//     } else {
//       fbProtocolUrl = 'fb://page/$pageId';
//     }

//     String fallbackUrl = url;

//     try {
//       bool launched = await launch(fbProtocolUrl, forceSafariVC: false);

//       if (!launched) {
//         await launch(fallbackUrl, forceSafariVC: false);
//       }
//     } catch (e) {
//       await launch(fallbackUrl, forceSafariVC: false);
//     }
//   }
// static Future<void> shareToFacebook(String shareUrl) async {
//   final url = Uri.parse("https://www.facebook.com/sharer/sharer.php?u=$shareUrl");
//   if (await canLaunchUrl(url)) {
//     await launchUrl(url, mode: LaunchMode.externalApplication);
//   } else {
//     print('Could not launch Facebook share');
//   }
// }
// static Future<void> shareToTwitter(String text, String shareUrl) async {
//   final tweetText = Uri.encodeComponent(text);
//   final tweetUrl = Uri.encodeComponent(shareUrl);
//   final url = Uri.parse("https://twitter.com/intent/tweet?text=$tweetText&url=$tweetUrl");

//   if (await canLaunchUrl(url)) {
//     await launchUrl(url, mode: LaunchMode.externalApplication);
//   } else {
//     print('Could not launch Twitter share');
//   }
// }
  // static launchInstagram(String url, String username) async {
  //   String fbProtocolUrl;

  //   fbProtocolUrl = 'instagram://user?username=$username';

  //   String fallbackUrl = url;

  //   try {
  //     bool launched = await launch(fbProtocolUrl, forceSafariVC: false);

  //     if (!launched) {
  //       await launch(fallbackUrl, forceSafariVC: false);
  //     }
  //   } catch (e) {
  //     await launch(fallbackUrl, forceSafariVC: false);
  //   }
  // }
static Future<void> youtubevideolink(String videourl) async {
  final Uri uri = Uri.parse(videourl);

  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    print('Could not launch $uri');
  }
}
static Future<void> launchURLemail(String mail) async {
  final Uri uri = Uri(
    scheme: 'mailto',
    path: mail,
  );

  if (!await launchUrl(uri)) {
    print('Could not launch $uri');
  }
}
static Future<void> launchFacebook(String url, String pageId) async {
  final Uri fbAppUri = Platform.isIOS
      ? Uri.parse("fb://profile/$pageId")
      : Uri.parse("fb://page/$pageId");

  final Uri fbWebUri = Uri.parse(url);

  try {
    bool launched = await launchUrl(
      fbAppUri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched) {
      await launchUrl(
        fbWebUri,
        mode: LaunchMode.externalApplication,
      );
    }
  } catch (e) {
    await launchUrl(
      fbWebUri,
      mode: LaunchMode.externalApplication,
    );
  }
}
static Future<void> shareToFacebook(String shareUrl) async {
  final Uri url = Uri.parse(
      "https://www.facebook.com/sharer/sharer.php?u=$shareUrl");

  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    print('Could not launch Facebook share');
  }
}
static Future<void> shareToTwitter(String text, String shareUrl) async {
  final String tweetText = Uri.encodeComponent(text);
  final String tweetUrl = Uri.encodeComponent(shareUrl);

  final Uri url = Uri.parse(
      "https://twitter.com/intent/tweet?text=$tweetText&url=$tweetUrl");

  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    print('Could not launch Twitter share');
  }
}

static Future<void> launchInstagram(String url, String username) async {
  final Uri instaAppUri = Uri.parse('instagram://user?username=$username');
  final Uri instaWebUri = Uri.parse(url);

  // Try opening Instagram app
  try {
    bool launched = await launchUrl(
      instaAppUri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched) {
      // Fallback → open browser
      await launchUrl(
        instaWebUri,
        mode: LaunchMode.externalApplication,
      );
    }
  } catch (e) {
    // If error → open in browser anyway
    await launchUrl(
      instaWebUri,
      mode: LaunchMode.externalApplication,
    );
  }
}

  // static launchTwitter(String url) async {
  //   String fbProtocolUrl;

  //   fbProtocolUrl = 'twitter://user?screen_name=merckfoundation';

  //   String fallbackUrl = url;

  //   try {
  //     bool launched = await launch(fbProtocolUrl, forceSafariVC: false);

  //     if (!launched) {
  //       await launch(fallbackUrl, forceSafariVC: false);
  //     }
  //   } catch (e) {
  //     await launch(fallbackUrl, forceSafariVC: false);
  //   }
  // }

  // static launchLinkdin(String url) async {
  //   String fbProtocolUrl;

  //   fbProtocolUrl =
  //       'https://www.linkedin.com/shareArticle/?mini=true&url=${url}';

  //   String fallbackUrl = url;

  //   try {
  //     bool launched = await launch(fbProtocolUrl, forceSafariVC: false);

  //     if (!launched) {
  //       await launch(fallbackUrl, forceSafariVC: false);
  //     }
  //   } catch (e) {
  //     await launch(fallbackUrl, forceSafariVC: false);
  //   }
  // }

//follow link to specific app
  // static Future<void> followuslink(String url, String msg) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     // Handle the error, e.g., show an error dialog or message
  //     print('Could not launch $url');
  //   }
  // }
  static Future<void> launchTwitter(String url) async {
  final Uri twitterAppUri =
      Uri.parse('twitter://user?screen_name=merckfoundation');

  final Uri twitterWebUri = Uri.parse(url);

  try {
    bool launched = await launchUrl(
      twitterAppUri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched) {
      await launchUrl(
        twitterWebUri,
        mode: LaunchMode.externalApplication,
      );
    }
  } catch (e) {
    await launchUrl(
      twitterWebUri,
      mode: LaunchMode.externalApplication,
    );
  }
}

  static Future<void> launchLinkdin(String url) async {
  final Uri linkedInUri = Uri.parse(
      'https://www.linkedin.com/shareArticle/?mini=true&url=$url');

  if (!await launchUrl(linkedInUri, mode: LaunchMode.externalApplication)) {
    print("Could not launch LinkedIn link");
  }
}

static Future<void> followuslink(String url, String msg) async {
  final Uri uri = Uri.parse(url);

  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    print('Could not launch $uri');
  }
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

  // static Future<void> launchURL(String urlIs) async {
  //   var url = urlIs;
  //   print("Attempting to launch URL: $url");

  //   try {
  //     if (await canLaunch(url)) {
  //       print("Launching URL: $url");
  //       await launch(url, forceSafariVC: false, forceWebView: false);
  //     } else {
  //       print("Cannot launch URL: $url using universal link");
  //       await launch(url); // Try launching without specific options
  //     }
  //   } catch (e) {
  //     print("Error launching URL: $e");
  //     throw 'Could not launch $url';
  //   }
  // }

  // static launchWhatsappshare(String msg) async {
  //   print("on launch");
  //   var url; //= "whatsapp://send?text=$msg";
  //   if (Platform.isIOS) {
  //     url = "https://wa.me/?ext=$msg";
  //   }else
  //   {
  //      url= "whatsapp://send?text=$msg";
  //   }
  //   // else {
  //   //   return "whatsapp://send?phone=$phone&text=${Uri.encodeFull(message)}";
  //   // }
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
static Future<void> launchURL(String urlIs) async {
  print(urlIs);
  final Uri uri = Uri.parse(urlIs);
  print("Attempting to launch URL: $uri");

  try {
    final bool launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched) {
      print("Fallback launch failed: $uri");
      throw "Could not launch $uri";
    }
  } catch (e) {
    print("Error launching URL: $e");
    throw "Could not launch $uri";
  }
}
static Future<void> launchWhatsappshare(String msg) async {
  print("Launching WhatsApp share");

  final Uri uri = Platform.isIOS
      ? Uri.parse("https://wa.me/?text=${Uri.encodeComponent(msg)}")
      : Uri.parse("whatsapp://send?text=${Uri.encodeComponent(msg)}");

  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw "Could not launch $uri";
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
            new ElevatedButton(
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
                  child: ElevatedButton(
                    //padding: EdgeInsets.fromLTRB(60.0, 10.0, 60.0, 10.0),
                    //  shape: new RoundedRectangleBorder(
                    //    borderRadius: new BorderRadius.circular(30.0)),
                    //color: Colors.orange,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30)),
                    ),

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
                  child: ElevatedButton(
                    //padding: EdgeInsets.fromLTRB(60.0, 10.0, 60.0, 10.0),
                    // shape: new RoundedRectangleBorder(
                    //   borderRadius: new BorderRadius.circular(30.0)),
                    //color: Colors.orange,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30)),
                    ),

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
                // Image.asset(
                //   "assets/images/LogoutIcon.png",
                //   width: 25,
                //   height: 25,
                // ),
                // Icon(Icons.logout_outlined, size: 20, color: Colors.white),
                // SizedBox(
                //   height: 10.0,
                // ),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: ElevatedButton(
                        // padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0.0),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15)),
                        ),

                        // shape: new RoundedRectangleBorder(
                        //   borderRadius: new BorderRadius.circular(15.0)),
                        // color: Colors.white,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: ElevatedButton(
                        //padding: EdgeInsets.fromLTRB(60.0, 10.0, 60.0, 10.0),
                        //    padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0.0),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Customcolor.colorBlue,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15)),
                        ),

                        //    shape: new RoundedRectangleBorder(
                        //      borderRadius: new BorderRadius.circular(15.0)),
                        // color: Customcolor.colorBlue,
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: ElevatedButton(
                        // padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0.0),
                        //shape: new RoundedRectangleBorder(
                        //  borderRadius: new BorderRadius.circular(15.0)),
                        //color: Colors.white,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30)),
                        ),

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
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: ElevatedButton(
                        //padding: EdgeInsets.fromLTRB(60.0, 10.0, 60.0, 10.0),
                        //    padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0.0),
                        // shape: new RoundedRectangleBorder(
                        //   borderRadius: new BorderRadius.circular(15.0)),
                        //color: Customcolor.colorBlue,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Customcolor.colorBlue,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15)),
                        ),

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

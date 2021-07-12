import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:merckfoundation22dec/Landingpage.dart';
import 'package:merckfoundation22dec/model/Getupdatedversion.dart';
import 'package:merckfoundation22dec/model/GetversionResponse.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/SPManager.dart';
import 'package:merckfoundation22dec/utility/UtilityFile.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info/package_info.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String currentVersion = "";
  String serverVersionCount = "1.0.0";
  String appLink = "";
  @override
  void initState() {
    super.initState();

    splah();
  }

  splah() {
    Utility().loadAPIConfig(context);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      // fetch data
      getCurrentVersionCount();
      //
      getversion();
    });
  }

  Future<String> getCurrentVersionCount() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    currentVersion = info.version;
    print("currentVersion $currentVersion");
    // int currentVersionCount = getCount(currentVersion);
    return currentVersion;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/newImages/splashbg.png'),
                  fit: BoxFit.fill),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Image.asset(
                  'assets/newImages/splashlogo.png',
                  width: 300, //SizeConfig.blockSizeHorizontal * 80,
                  height: 350, //SizeConfig.blockSizeVertical * 80,
                ),
              ),
            ),
          ),
          Positioned(
            left: 8,
            bottom: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: SizeConfig.blockSizeHorizontal * 55,
                  child: Text(
                    "version ${currentVersion}",
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ),
                //   Expanded(child: Container()),
                Image.asset(
                  'assets/newImages/splashflower.png',
                  width: SizeConfig.blockSizeHorizontal * 40,
                  height: SizeConfig.blockSizeHorizontal * 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // getheader() async {
  //   var status1 = await ConnectionDetector.checkInternetConnection();

  //   if (status1) {
  //     APIManager().apiRequest(
  //       context,
  //       API.homeheader,
  //       (response) async {
  //         HomeheaderResponse resp = response;
  //         print(response);
  //         print('Resp : $resp');
  //         setState(() {
  //           Constantstring.homeheader = resp.marque.list[0].marque;
  //         });

  //         // if (resp.success == "True") {
  //         //   setState(() {
  //         //    Constantstring.homeheader=resp.
  //         //   });
  //         // } else {
  //         //   ShowDialogs.showToast(resp.msg);
  //         // }
  //       },
  //       (error) {
  //         print('ERR msg is $error');
  //       },
  //     );
  //   } else {
  //     ShowDialogs.showToast("Please check internet connection");
  //   }
  // }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 2), onDoneLoading);
  }

  Future loadpopup(BuildContext context) async {
    return ShowDialogs.showConfirmDialogdelete(
        context, "dialogTitle", "dialogMessage", () {}, "btnTitle");
  }

  checkmethod() {}

  void fetchRemoteConfig(BuildContext context) async {
    if (currentVersion != serverVersionCount) {
      showUpdateAlertDialog(context, "Update App",
          "A new Version is available on playstore", "Update", appLink, true);
      print("showpopup");
      // loadpopup(context);
    } else {
      loadData();
    }
  }

  showUpdateAlertDialog(BuildContext context, String title, String description,
      String downloadButtonText, String appLink, bool isCompulsory) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Skip"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text(downloadButtonText),
      onPressed: () {
        Navigator.pop(context);
        if (Platform.isAndroid) {
          updateversion();
          try {
            launch("market://details?id=de.merck.foundation");
          } on PlatformException catch (e) {
            launch(appLink);
          } finally {
            launch(appLink);
          }
        } else {
          launch(appLink);
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(description),
      actions: isCompulsory
          ? [
              continueButton,
            ]
          : [
              cancelButton,
              continueButton,
            ],
    );

    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(opacity: a1.value, child: alert),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: false,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {});

    // show the dialog
  }

  onDoneLoading() async {
    SPManager().getAuthToken().then((value) async {
      if (value == null)
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => Welcome()));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Landingpage()));
      else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Dashboard(index: 0)));
      }
    }

        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => Landingpage()));
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => Dashboard(index: 0))
        );
  }

  getversion() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      //  ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.versioncheck,
        (response) async {
          GetversionResponse resp = response;
          print(response);
          print('Resp : $resp');

          if (resp.success == true) {
            setState(() {
              serverVersionCount = resp.list.version;
              fetchRemoteConfig(context);
            });
          } else {
            ShowDialogs.showToast(resp.msg);
          }
        },
        (error) {
          print('ERR msg is $error');
        },
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }

  updateversion() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      //  ShowDialogs.showLoadingDialog(context, _keyLoader);
      var path = "/${currentVersion}";

      APIManager().apiRequest(context, API.updateversion, (response) async {
        print(response);
        GetupdatedversionResponse resp = response;
        print(response);
        print('Resp : $resp');

        // if (resp.success == true) {
        //   setState(() {});
        // } else {
        //   ShowDialogs.showToast(resp.msg);
        // }
      }, (error) {
        print('ERR msg is $error');
      }, path: path);
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

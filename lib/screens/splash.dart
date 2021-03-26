import 'dart:async';

import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/Landingpage.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/screens/home.dart';
import 'package:merckfoundation22dec/utility/SPManager.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/model/homeheader.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';

import '../login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
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
                  image: AssetImage('assets/images/splash.jpg'),
                  fit: BoxFit.fill),
            ),
          ),
          Positioned(
            left: 8,
            bottom: 20,
            child: Text(
              "version 1.9.5",
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
          )
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
}

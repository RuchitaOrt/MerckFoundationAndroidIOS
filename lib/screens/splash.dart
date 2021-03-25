import 'dart:async';

import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/Landingpage.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/screens/home.dart';
import 'package:merckfoundation22dec/utility/SPManager.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';

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
              "version 1.9.4",
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
          )
        ],
      ),
    );
  }

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

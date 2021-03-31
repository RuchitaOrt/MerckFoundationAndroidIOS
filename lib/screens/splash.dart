import 'dart:async';

import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/Landingpage.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/SPManager.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';

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
                  image: AssetImage('assets/newImages/splashbg.png'),
                  fit: BoxFit.fill),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Image.asset(
                  'assets/newImages/splashlogo.png',
                  width: 250,
                  height: 250,
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
                    "version 1.9.7",
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

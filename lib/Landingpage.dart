import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/utility/ResponsiveFlutter.dart';

class Landingpage extends StatefulWidget {
  static final String path = "lib/src/pages/login/login7.dart";
  @override
  _LandingpageState createState() => _LandingpageState();
}

class _LandingpageState extends State<Landingpage> {
  TextStyle style = TextStyle(fontFamily: 'Roboto', fontSize: 16.0);
  bool checkedValue = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      body: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Center(
            child: Image.asset(
              'assets/newImages/logo_menu.png',
              width: 200,
              height: 125,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: FormLabel(
              text: "Our Vision",
              labelColor: Customcolor.colorVoilet,
              fontSize: ResponsiveFlutter.of(context).fontSize(2),
              maxLines: 2,
              fontweight: FontWeight.w800,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FormLabel(
                text:
                    "A WORLD WHERE EVERYONE CAN LEAD A HEALTHY AND FULFILLING LIFE",
                labelColor: Customcolor.colorPink,
                fontSize: ResponsiveFlutter.of(context).fontSize(2),
                maxLines: 2,
                fontweight: FontWeight.w800,
                textAlignment: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, right: 14),
            child: Container(
              height: 370,
              decoration: BoxDecoration(
                  //borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  image: new DecorationImage(
                image: new AssetImage("assets/newImages/vision_pattern.png"),
                fit: BoxFit.fill,
              )),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 20, top: 10),
                child: Text(
                  "Merck Foundation, established in 2017, is the philanthropic arm of Merck KGaA, Germany that aims to improve the health and wellbeing of people and advance their lives through Science and Technology. \n\nOur efforts are primarily focused on improving access to quality and equitable healthcare solutions, building healthcare, scientific research & media capacity, breaking infertility stigma and supporting girls' education.",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              )),
            ),
            // child: ClipPath(
            //   clipper: MyCustomClipper(),
            //   child: Container(
            //     height: 340,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(50.0)),
            //       color: Customcolor.colorVoilet,
            //     ),
            //     child: Center(
            //         child: Padding(
            //       padding: const EdgeInsets.only(left: 25, right: 20, top: 50),
            //       child: Text(
            //         "The Merck Foundation is the philanthropic arm of Merck KGaA Germany that aims to improve the health and wekkbeing of people  and advance their lives throigh science and technology,Our efforts are primarily focused on improving access to quality & equitable healthcare solutions,building healthcare,scientific research & media capacity and empowering people in STEM* with a special focus on women and youth in under-served communites. \n\n*STEM:Science,Technology,Engineering and Mathematic",
            //         style: TextStyle(color: Colors.white),
            //       ),
            //     )),
            //   ),
            // ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90, right: 90, top: 10),
            child: ElevatedButton(
              //  shape: RoundedRectangleBorder(
              //    borderRadius: BorderRadius.circular(8.0),
              //  side: BorderSide(color: Colors.red)),
              // color: Customcolor.colorPink,
              // textColor: Colors.white,
              //padding: EdgeInsets.all(8.0),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Customcolor.colorPink,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8)),
                  side: BorderSide(color: Colors.red),
                  textStyle: TextStyle(color: Colors.white)),

              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Dashboard(index: 0)));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            // child: Container(
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(20))),
            //   child: FlatButton(
            //     color: Customcolor.colorPink,
            //     shape: RoundedRectangleBorder(
            //         side: BorderSide(color: Customcolor.transparent_white)),
            //     child: Text(
            //       "Continue",
            //       style: TextStyle(color: Colors.white),
            //     ),
            //     minWidth: 40,
            //     height: 50,
            //     onPressed: () {},
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}

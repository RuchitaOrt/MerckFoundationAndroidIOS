import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:merckfoundation22dec/model/visionResponse.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:screenshot/screenshot.dart';

class Communitysupport extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CommunitysupportState();
  }
}

class CommunitysupportState extends State<Communitysupport>
    with TickerProviderStateMixin {
  AnimationController _controller;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  double imgHeight = 50;
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();

    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Customcolor.background,
        appBar: InnerCustomAppBar(
          onTapvalfilter: () {},
          onTapval: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Dashboard(
                          index: 0,
                        )));
          },
          index: 2,
          title: "Merck Foundation Community Support",
          titleImg: "assets/newImages/vision_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: ListView(
                shrinkWrap: true,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 8, top: 8, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Center(
                        //   child: FormLabel(
                        //     text: "Community Support",
                        //     labelColor: Customcolor.violet_col,
                        //     fontSize:
                        //         ResponsiveFlutter.of(context).fontSize(2.5),
                        //     fontweight: FontWeight.w600,
                        //     textAlignment: TextAlign.center,
                        //   ),
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        FormLabel(
                          text:
                              "Merck Foundation partnered with the African First Ladies of Liberia, DRC, Niger, Chad, Burkina Faso, Zimbabwe, Malawi, and Ghana to support livelihood of thousands of women and families of casual and daily workers who are most affected by the Coronavirus (COVID -19) lockdown. The relief contribution was also undertaken in Egypt with the aim to support families of casual workers.",
                          labelColor: Colors.black54,
                          fontSize: 14,
                          fontweight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "As part of our signature campaign",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: "Merck More than a Mother, ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "Merck Foundation’s special focus remains women, as the pandemic has led to a horrifying increase in violence against women. The confinement at home with an abusive partner has resulted in not only physical violence but also emotional violence against women, it can have disastrous consequences for their health and well-being. We know they now need our support more than ever.",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FormLabel(
                          text: "GLIMPSES OF SOME OF OUR DONATION DRIVES",
                          labelColor: Customcolor.pink_col,
                          fontSize: ResponsiveFlutter.of(context).fontSize(1.9),
                          fontweight: FontWeight.w600,
                          textAlignment: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FormLabel(
                          text: "LIBERIA",
                          labelColor: Colors.black,
                          fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                          fontweight: FontWeight.w600,
                          textAlignment: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FormLabel(
                          text:
                              "Merck Foundation in partnership Liberia First Lady to support livelihood of women and casual workers affected by Coronavirus lockdown.",
                          labelColor: Colors.black54,
                          fontSize: 14,
                          fontweight: FontWeight.w500,
                          textAlignment: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Image.network(
                          "https://www.merck-foundation.com/servlet/rtaImage?eid=a2t1r000004YID8&feoid=00Nw0000009EtWJ&refid=0EM1r000002evEJ",
                          height: 290,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FormLabel(
                          text: "Visit Photo Gallery to view all pictures",
                          labelColor: Colors.black54,
                          fontSize: 14,
                          fontweight: FontWeight.w500,
                          textAlignment: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FormLabel(
                          text: "GHANA",
                          labelColor: Colors.black,
                          fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                          fontweight: FontWeight.w600,
                          textAlignment: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FormLabel(
                          text:
                              "Merck Foundation in partnership Ghana First Lady support casual and daily workers affected by Coronavirus lockdown",
                          labelColor: Colors.black54,
                          fontSize: 14,
                          fontweight: FontWeight.w500,
                          textAlignment: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Image.network(
                          "https://www.merck-foundation.com/servlet/rtaImage?eid=a2t1r000004YID8&feoid=00Nw0000009EtWJ&refid=0EM1r000002evFR",
                          height: 290,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FormLabel(
                          text: "Visit Photo Gallery to view all pictures",
                          labelColor: Colors.black54,
                          fontSize: 14,
                          fontweight: FontWeight.w500,
                          textAlignment: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FormLabel(
                          text: "NIGER",
                          labelColor: Colors.black,
                          fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                          fontweight: FontWeight.w600,
                          textAlignment: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FormLabel(
                          text:
                              "Merck Foundation in partnership Niger First Lady to support livelihood of to support retired people and residents of Niamey affected by Coronavirus lockdown.",
                          labelColor: Colors.black54,
                          fontSize: 14,
                          fontweight: FontWeight.w500,
                          textAlignment: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Image.network(
                          "https://www.merck-foundation.com/servlet/rtaImage?eid=a2t1r000004YID8&feoid=00Nw0000009EtWJ&refid=0EM1r000002evGP",
                          height: 290,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FormLabel(
                          text: "Visit Photo Gallery to view all pictures",
                          labelColor: Colors.black54,
                          fontSize: 14,
                          fontweight: FontWeight.w500,
                          textAlignment: TextAlign.start,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(right: 0, left: 0),
                        //   child: Align(
                        //     alignment: Alignment.topRight,
                        //     child: Image.asset(
                        //       "assets/newImages/flowers_footer.png",
                        //       height: 170,
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // TextSpan(

            // ),
          ],
        ));
  }
}

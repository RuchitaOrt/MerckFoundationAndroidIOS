import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:screenshot/screenshot.dart';

class Childrenyouth extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChildrenyouthState();
  }
}

class ChildrenyouthState extends State<Childrenyouth>
    with TickerProviderStateMixin {
  AnimationController? _controller;
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
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => Dashboard(
            //               index: 0,
            //             )));
            Navigator.pop(context);
          },
          index: 2,
          title: "Merck Foundation Community Awareness for Children and Youth",
          titleImg: "assets/newImages/vision_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: ListView(
                shrinkWrap: true,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 8, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Center(
                        //   child: FormLabel(
                        //     text: "Community Awareness for Children and Youth",
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
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "Merck Foundation launched an inspiring storybook called",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: "‘Make the Right Choice’ ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "in partnership with 18 African First Ladies. The story aims to raise awareness about coronavirus prevention amongst children and youth as it provides facts about the pandemic and how to stay safe and healthy during the outbreak. It also promotes honesty, hard-work and the ability to make the right choices even during the most challenging times.",
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
                          text:
                              "The storybook has been released in three languages: English, French and Portuguese.",
                          labelColor: Colors.black54,
                          fontSize: 14,
                          fontweight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Image.asset(
                            "assets/newImages/youth.jpeg",
                            height: 290,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: FormLabel(
                            text:
                                "Make the Right Choice English | French | Portuguese",
                            labelColor: Colors.black54,
                            fontSize: 14,
                            fontweight: FontWeight.w500,
                          ),
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

                    SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 0, left: 0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      "assets/newImages/flowers_footer.png",
                      height: 170,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Bottomcardlink(),
                ],
              ),
            ),

            // TextSpan(

            // ),
          ],
        ));
  }
}

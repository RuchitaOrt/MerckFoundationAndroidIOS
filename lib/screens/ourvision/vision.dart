import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';

import 'package:responsive_flutter/responsive_flutter.dart';
import 'dart:math' as math;

class OurVision extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OurVisionState();
  }
}

class OurVisionState extends State<OurVision> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Customcolor.background,
        appBar: InnerCustomAppBar(
          onTapval: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Dashboard(index: 0,)));
          },
          index: 2,
          title: "Our Vision",
          titleImg: "assets/newImages/flowers-1.png",
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
                    padding:
                        const EdgeInsets.only(right: 10, left: 10, top: 10),
                    child: Image.asset(
                      "assets/newImages/ourvison.png",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 8, top: 8, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "A world where everyone can lead a Healthy and Fulfilling Life.",
                          style: TextStyle(
                              color: Customcolor.pink_col,
                              fontFamily: AppFonts.normal,
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2.2),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                            "The Merck Foundation is the philanthropic arm of Merck KGaA Germany that aims to improve the health and wellbeing of people and advance their lives through science and technology.\n\nOur efforts are primarily focused on improving access to quality & equitable healthcare solutions, building healthcare, scientiﬁc research & media capacity and empowering people in STEM* with a special focus on women and youth in under-served communities.\n\n*STEM: Science, Technology, Engineering and Mathematics",
                            style: TextStyle(
                              color: Customcolor.text_darkgrey,
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2),
                            )
                            //fontWeight: FontWeight.w300),
                            ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Merck Foundation Strives to",
                          style: TextStyle(
                              color: Customcolor.pink_col,
                              fontFamily: AppFonts.normal,
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2.2),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 15),
                        Text(
                            "Work closely with partners that are African First Ladies, Ministries of Health, Education, Information & Communication, Gender, Academia, Research Institutions, Media and Art in building healthcare capacity and addressing health, social & economic challenges in developing countries and under-served communities.",
                            style: TextStyle(
                              color: Customcolor.text_darkgrey,
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2),
                            )
                            //fontWeight: FontWeight.w300),
                            ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 60, left: 60, top: 20),
                          child: Image.asset(
                            "assets/newImages/flowers_footer.png",
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
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

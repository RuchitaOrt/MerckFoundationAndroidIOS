import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';

import 'package:responsive_flutter/responsive_flutter.dart';

class OurMission extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OurMissionState();
  }
}

class OurMissionState extends State<OurMission> with TickerProviderStateMixin {
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
            Navigator.pop(context);
          },
          index: 2,
          title: "Our Mission",
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
                          "Our Mission: Together with its partners, the Merck Foundation aims to",
                          style: TextStyle(
                              color: Customcolor.pink_col,
                              fontFamily: AppFonts.normal,
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2.2),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 15),
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

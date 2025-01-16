import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';

import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class Perticulardetails extends StatefulWidget {
  final String title;
  final String image;
  final String details;

  const Perticulardetails({Key key, this.title, this.image, this.details})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return PerticulardetailsState();
  }
}

class PerticulardetailsState extends State<Perticulardetails>
    with TickerProviderStateMixin {
  AnimationController _controller;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

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
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => Dashboard(
            //               index: 0,
            //             )));
            // if (widget.callfrom == 1) {
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (BuildContext context) => Dashboard(
            //                 index: 3,
            //               )));
            // } else {
            //   Navigator.pop(context);
            // }
          },
          titleshowingindex: "1",
          title: widget.title,
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
                        left: 8, right: 8, top: 8, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HtmlWidget(
                          """${widget.title} """,
                        ),
                        HtmlWidget(
                          """${widget.details} """,
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       right: 60, left: 60, top: 20),
                        //   child: Image.asset(
                        //     "assets/newImages/flowers_footer.png",
                        //   ),
                        // ),
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
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            // TextSpan(

            // ),
          ],
        ));
  }
}

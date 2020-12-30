import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class InnerCustomAppBar extends PreferredSize {
  // final Widget child;
  final double height;
  final Function onTapval;
  final int index;
  final String title;
  final String titleImg;
  final String trallingImg1;
  final String trallingImg2;

  InnerCustomAppBar(
      {this.onTapval,
      this.index,
      this.title,
      this.titleImg,
      this.trallingImg1,
      this.trallingImg2,
      @required this.height = kToolbarHeight});
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Customcolor.baby_blue,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 10,
            ),
            GestureDetector(
                onTap: onTapval,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    "assets/newImages/arrow_back.png",
                    height: 25,
                  ),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FormLabel(
                      text: title,
                      fontSize: 20,
                      fontweight: FontWeight.w600,
                      labelColor: Customcolor.text_blue,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Image.asset(titleImg, height: 35,)
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            index != 1
                ? Image.asset(
                    trallingImg1,
                    // "assets/images/search_icon@2x.png",
                    width: 23,
                    height: 23,
                  )
                : Container(),
            SizedBox(
              width: 15,
            ),
            Image.asset(
              trallingImg2,
              width: 23,
              height: 23,
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class CustomAppBar extends PreferredSize {
  // final Widget child;
  final double height;
  final Function onTapval;
  final int index;
  CustomAppBar(this.onTapval, this.index,
      {@required this.height = kToolbarHeight});
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Customcolor.baby_blue,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 10,
              ),
              index == 1
                  ? GestureDetector(
                      onTap: onTapval,
                      child: Image.asset(
                        "assets/newImages/menu.png",
                        width: 30,
                        height: 30,
                      ),
                    )
                  : GestureDetector(
                      onTap: onTapval,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Customcolor.colorVoilet,
                        ),
                      )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    child: Image.asset(
                      "assets/newImages/top_bar_logo.png",
                      width: 100,
                      height: 50,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Image.asset(
                "assets/images/search_icon@2x.png",
                width: 20,
                height: 20,
              ),
              SizedBox(
                width: 10,
              ),
              index != 1
                  ? Image.asset(
                      "assets/images/search_icon@2x.png",
                      width: 20,
                      height: 20,
                    )
                  : Container()
            ],
          ),
          SizedBox(
            height: 8,
          ),
          FormLabel(
            text: 'The Philanthropic arm of Merck KGaA',
            fontSize: ResponsiveFlutter.of(context).fontSize(1.5),
            fontweight: FontWeight.w800,
            labelColor: Customcolor.text_blue,
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}

class CustomAppBarWebview extends PreferredSize {
  // final Widget child;
  final double height;
  final Function onTapval;
  final int index;
  CustomAppBarWebview(this.onTapval, this.index,
      {@required this.height = kToolbarHeight});
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Customcolor.background,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 10,
              ),
              index == 1
                  ? GestureDetector(
                      onTap: onTapval,
                      child: Image.asset(
                        "assets/images/menu_icon.png",
                        width: 30,
                        height: 30,
                      ),
                    )
                  : GestureDetector(
                      onTap: onTapval,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Customcolor.colorVoilet,
                        ),
                      )),
              Expanded(
                child: Container(
                  child: Image.asset(
                    "assets/images/logo_nav.png",
                    width: 100,
                    height: 50,
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          FormLabel(
            text: 'The Philanthropic arm of Merck KGaA',
            fontSize: ResponsiveFlutter.of(context).fontSize(1.4),
            labelColor: Customcolor.colorVoilet,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(
              'Jackline Mwende, Merck More Than A Mother Heroine from Kenya shares her story ',
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: new TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Roboto',
                  color: Customcolor.colorBlue,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

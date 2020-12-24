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
  

  InnerCustomAppBar({this.onTapval, this.index, this.title, this.titleImg, this.trallingImg1, this.trallingImg2,
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
      child:
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                        onTap: onTapval,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Customcolor.colorVoilet,
                          ),
                        )),

                    Expanded(
                                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          FormLabel(text: title, 
                          fontSize: 18,
                          fontweight: FontWeight.w600,
                          labelColor: Customcolor.colorBlue,
                          ),

                          Image.asset(titleImg)

                        ],
                      ),
                    ),    




               
                SizedBox(
                  width: 30,
                ),
                Image.asset(
                  trallingImg1,
                 // "assets/images/search_icon@2x.png",
                  width: 20,
                  height: 20,
                ),
                SizedBox(
                  width: 10,
                ),
              index != 1
                    ?   Image.asset(
                 trallingImg2,
                  width: 20,
                  height: 20,
                ):Container()
              ],
            ),
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

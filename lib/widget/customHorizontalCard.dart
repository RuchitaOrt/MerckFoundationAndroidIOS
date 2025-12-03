import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';

class CustomHorizontalCard extends StatelessWidget {
  final dynamic cardTitle;
  final dynamic cardImage;
  final dynamic subTitle;
  final dynamic btnTitle;
  final Color? titleColor;
  final dynamic titleImg;
  final int? index;
  final int? showviewmore;
  final VoidCallback? onbtnTap;
  final Widget? list;
  final heigthoflist;
  final dynamic cardsubtitle;
  final int? isheading;

  const CustomHorizontalCard(
      {Key? key,
      this.cardTitle,
      this.cardImage,
      this.subTitle,
      this.btnTitle,
      this.titleColor,
      this.titleImg,
      this.list,
      this.index,
      this.onbtnTap,
      this.heigthoflist,
      this.showviewmore,
      this.cardsubtitle,
      this.isheading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: cardsubtitle,
                        style: TextStyle(
                          color: Customcolor.textsubtitlecolor,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'times new roman',
                        ),
                      ),
                      isheading == 1
                          ? TextSpan(
                              text: cardTitle,
                              style: TextStyle(
                                color: Customcolor.text_blue,
                                fontSize: 17,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'verdana',
                              ),
                            )
                          : TextSpan(
                              text: cardTitle,
                              
                              style: TextStyle(
                              
                                color: Customcolor.pink_col,
                                fontSize: 20,
                                overflow: TextOverflow.ellipsis,///21jan
                              
                                fontWeight: FontWeight.bold,
                                fontFamily: 'times new roman',
                              ),
                            ),
                      // TextSpan(
                      //   text: cardTitle,
                      //   style: TextStyle(
                      //     color: titleColor,
                      //     fontSize: 17,
                      //     fontWeight: FontWeight.w700,
                      //   ),
                      // ),
                      // WidgetSpan(
                      //   alignment: PlaceholderAlignment.bottom,
                      //   child: Image.asset(
                      //     titleImg,
                      //     width: 40,
                      //     height: 25,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Row(
          //   children: [
          //     SizedBox(
          //       width: 15,
          //     ),
          //     Expanded(
          //       child: FormLabel(
          //         text: cardTitle,
          //         labelColor: Customcolor.colorPink,
          //         fontSize: 17,
          //         fontweight: FontWeight.w500,
          //       ),
          //     ),
          //     SizedBox(
          //       width: 7,
          //     ),
          //     Image.asset(
          //       titleImg,
          //       width: 40,
          //       height: 40,
          //     )
          //   ],
          // ),
          SizedBox(
            height: 10,
          ),
          Container(
              height: heigthoflist == null
                  ? SizeConfig.blockSizeVertical * 33
                  : heigthoflist,
              child: list),
          SizedBox(
            height: 4,
          ),
          showviewmore == 1
              ? Container()
              : Center(
                  child: GestureDetector(
                    onTap: onbtnTap,
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          btnTitle,
                          style: TextStyle(
                              color: Customcolor.colorBlue,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

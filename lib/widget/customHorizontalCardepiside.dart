import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';

class CustomHorizontalCardEpisode extends StatelessWidget {
  final String cardTitle;
  final String cardImage;
  final String subTitle;
  final String btnTitle;
  final Color titleColor;
  final String titleImg;
  final int index;
  final int showviewmore;
  final Function onbtnTap;
  final Widget list;
  final heigthoflist;
  final String cardsubtitle;
  final int isheading;

  const CustomHorizontalCardEpisode(
      {Key key,
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
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: cardsubtitle,
                        
                        style: TextStyle(
                          
                          color: Customcolor.colorBlue,
    
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          fontFamily: AppFonts.normalnew,
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
                                fontWeight: FontWeight.bold,
                                fontFamily: AppFonts.normalnew,
                              ),
                            ),
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
        
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

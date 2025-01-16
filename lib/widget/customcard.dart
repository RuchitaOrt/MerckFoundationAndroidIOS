import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';

class CustomeCard extends StatefulWidget {
  final String cardTitle;
  final String cardImage;
  final String subTitle;
  final String cardsubtitle;
  final String btnTitle;
  final Color titleColor;
  final String titleImg;
  final int index;
  final String buttontitle;
  final Color buttontitlecolor;
  final Function onBtnTap;
  final Function oncardtap;
  final int youtubeicon;

  const CustomeCard(
      {Key key,
      this.cardTitle,
      this.cardImage,
      this.subTitle,
      this.btnTitle,
      this.titleColor,
      this.titleImg,
      this.index,
      this.buttontitle,
      this.onBtnTap,
      this.buttontitlecolor,
      this.oncardtap,
      this.cardsubtitle,
      this.youtubeicon})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CustomCardState();
  }
}

class CustomCardState extends State<CustomeCard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: widget.cardsubtitle,
                  style: TextStyle(
                      color: Customcolor.textsubtitlecolor,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'times new roman'),
                ),
                TextSpan(
                  text: widget.cardTitle,
                  style: TextStyle(
                    color: Customcolor.pink_col,
                    fontSize: 20,
                    fontFamily: 'times new roman',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // WidgetSpan(
                //   alignment: PlaceholderAlignment.bottom,
                //   child: Image.asset(
                //     //  widget.titleImg,
                //     "",
                //     width: 40,
                //     height: 25,
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 14,
          ),
          GestureDetector(
            onTap: widget.oncardtap,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: SizeConfig.blockSizeVertical * 31,
                      width: SizeConfig.blockSizeHorizontal * 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(widget.cardImage),
                              fit: BoxFit.fill)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Expanded(
                            //   child: Text(
                            //     widget.subTitle,
                            //     overflow: TextOverflow.ellipsis,
                            //     maxLines: 2,
                            //     style: TextStyle(
                            //         fontSize: 17,
                            //         color: Colors.white,
                            //         fontWeight: FontWeight.w500),
                            //     // fontSize: 17,
                            //     // labelColor: Colors.white,
                            //     // fontweight: FontWeight.w500,
                            //   ),
                            // ),
                            GestureDetector(
                              onTap: widget.onBtnTap,
                              child: Container(
                                width: 110,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Text(
                                    widget.buttontitle,
                                    style: TextStyle(
                                        color: widget.buttontitlecolor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    widget.youtubeicon == 0
                        ? Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 5,
                                top: SizeConfig.blockSizeVertical * 12),
                            child: Center(
                                child:
                                    Image.asset("assets/newImages/pause.png")),
                          )
                        : Container()
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Text(
                    widget.subTitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500),
                    // fontSize: 17,
                    // labelColor: Colors.white,
                    // fontweight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

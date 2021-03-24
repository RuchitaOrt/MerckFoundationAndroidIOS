import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';

class CustomeCardforTestimonial extends StatefulWidget {
  final String cardTitle;
  final String cardImage;
  final String subTitle;
  final String btnTitle;
  final Color titleColor;
  final String titleImg;
  final int index;
  final String buttontitle;
  final Color buttontitlecolor;
  final Function onBtnTap;
  final Function oncardtap;
  final String testimonialname;
  final String departmentname;

  const CustomeCardforTestimonial(
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
      this.testimonialname,
      this.departmentname})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CustomCardState();
  }
}

class CustomCardState extends State<CustomeCardforTestimonial> {
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
                  text: widget.cardTitle,
                  style: TextStyle(
                    color: widget.titleColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.bottom,
                  child: Image.asset(
                    //  widget.titleImg,
                    "",
                    width: 40,
                    height: 25,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 14,
          ),
          GestureDetector(
            onTap: widget.oncardtap,
            child: Container(
              height: SizeConfig.blockSizeVertical * 25,
              width: SizeConfig.blockSizeHorizontal * 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(widget.cardImage), fit: BoxFit.fill)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(child: Container()),
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
          ),
          Center(
            child: Text(
              widget.testimonialname,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
              // fontSize: 17,
              // labelColor: Colors.white,
              // fontweight: FontWeight.w500,
            ),
          ),
          Center(
            child: Text(
              widget.departmentname,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 17,
                  color: Customcolor.colorBlue,
                  fontWeight: FontWeight.w500),
              // fontSize: 17,
              // labelColor: Colors.white,
              // fontweight: FontWeight.w500,
            ),
          ),
          Text(
            widget.subTitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontWeight: FontWeight.w500),
            // fontSize: 17,
            // labelColor: Colors.white,
            // fontweight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}

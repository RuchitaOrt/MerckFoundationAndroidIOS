import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';

class CustomeCardforTestimoniallist extends StatefulWidget {
  final String cardTitle;
  final String cardImage;
  final String subTitle;
  final String btnTitle;
  final String cardsubtitle;
  final Color titleColor;
  final String titleImg;
  final int index;
  final String buttontitle;
  final Color buttontitlecolor;
  final Function onBtnTap;
  final Function oncardtap;
  final String testimonialname;
  final String departmentname;

  const CustomeCardforTestimoniallist(
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
      this.departmentname,
      this.cardsubtitle})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CustomCardState();
  }
}

class CustomCardState extends State<CustomeCardforTestimoniallist> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: widget.oncardtap,
            child: Container(
              height: SizeConfig.blockSizeVertical * 32,
              width: SizeConfig.blockSizeHorizontal * 100,
              decoration: BoxDecoration(
                  //  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                image: NetworkImage(widget.cardImage),
                fit: BoxFit.fill,
              )),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 7),
            child: Text(
              widget.testimonialname,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              // textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
              // fontSize: 17,
              // labelColor: Colors.white,
              // fontweight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Html(
            data: widget.departmentname,
            style: {
              "body": Style(
                  fontSize: FontSize(17.0),
                  color: Customcolor.colorBlue,
                  //textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500),
            },
          ),
          Text(
            widget.subTitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            //textAlign: TextAlign.center,
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

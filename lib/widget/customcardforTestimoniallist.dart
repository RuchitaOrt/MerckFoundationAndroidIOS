import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';

class CustomeCardforTestimoniallist extends StatefulWidget {
  final dynamic cardTitle;
  final dynamic cardImage;
  final dynamic subTitle;
  final dynamic btnTitle;
  final dynamic cardsubtitle;
  final Color? titleColor;
  final dynamic titleImg;
  final int? index;
  final dynamic buttontitle;
  final Color? buttontitlecolor;
  final VoidCallback? onBtnTap;
  final VoidCallback? oncardtap;
  final dynamic testimonialname;
  final dynamic departmentname;

  const CustomeCardforTestimoniallist(
      {Key? key,
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
                   "tr": Customcolor.tableboderstyle(context),
            },
             extensions: [
      TagExtension(
        tagsToExtend: {"img"},
        builder: (ExtensionContext context) {
          final src = context.attributes['src'] ?? '';
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.network(
              src,
              width: double.infinity,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image),
            ),
          );
        },
      )
    ],
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

import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';

class CustomeCard extends StatefulWidget {
  final String cardTitle;
  final String cardImage;
  final String subTitle;
  final String btnTitle;
  final Color titleColor;
  final String titleImg;
  final int index;

  const CustomeCard(
      {Key key,
      this.cardTitle,
      this.cardImage,
      this.subTitle,
      this.btnTitle,
      this.titleColor,
      this.titleImg,
      this.index})
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
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              widget.index == 1
                  ? Container(
                      width: SizeConfig.blockSizeHorizontal * 70,
                      child: FormLabel(
                        text: widget.cardTitle,
                        labelColor: widget.titleColor,
                        fontSize: 18,
                        fontweight: FontWeight.w600,
                        maxLines: 2,
                      ),
                    )
                  : FormLabel(
                      text: widget.cardTitle,
                      labelColor: widget.titleColor,
                      fontSize: 18,
                      fontweight: FontWeight.w600,
                      maxLines: 2,
                    ),
              SizedBox(
                width: 7,
              ),
              Image.asset(
                widget.titleImg,
                width: 40,
                height: 40,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: SizeConfig.blockSizeVertical * 25,
            width: SizeConfig.blockSizeHorizontal * 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(widget.cardImage), fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FormLabel(
                      text: widget.subTitle,
                      fontSize: 17,
                      labelColor: Colors.white,
                      fontweight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    width: 110,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "Read More",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

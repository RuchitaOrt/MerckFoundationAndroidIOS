import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';

class CustomeCard extends StatefulWidget {
  final String cardTitle;
  final String cardImage;
  final String subTitle;
  final String btnTitle;
  final Color titleColor;

  const CustomeCard(
      {Key key,
      this.cardTitle,
      this.cardImage,
      this.subTitle,
      this.btnTitle,
      this.titleColor})
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
          FormLabel(
            text: widget.cardTitle,
            labelColor: widget.titleColor,
            fontSize: 18,
            fontweight: FontWeight.w400,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: SizeConfig.blockSizeVertical * 20,
            width: SizeConfig.blockSizeHorizontal * 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/covid-bg.png"),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FormLabel(
                      text: widget.subTitle,
                      fontSize: 19,
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

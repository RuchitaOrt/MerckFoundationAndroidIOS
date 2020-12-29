import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';

class CustomHorizontalCard extends StatelessWidget {
  final String cardTitle;
  final String cardImage;
  final String subTitle;
  final String btnTitle;
  final Color titleColor;
  final String titleImg;
  final int index;

  const CustomHorizontalCard(
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
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: cardTitle,
                style: TextStyle(
                  color: titleColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.bottom,
                child: Image.asset(
                  titleImg,
                  width: 40,
                  height: 25,
                ),
              ),
            ],
          ),
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
          height: SizeConfig.blockSizeVertical * 25,
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Container(
                  height: SizeConfig.blockSizeVertical * 25,
                  width: SizeConfig.blockSizeHorizontal * 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(cardImage), fit: BoxFit.cover)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 8),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: FormLabel(
                        textAlignment: TextAlign.start,
                        text: subTitle,
                        fontSize: 17,
                        labelColor: Colors.white,
                        fontweight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 9,
        ),
        Center(
          child: Container(
            width: 120,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Text(
                "Watch More",
                style: TextStyle(
                    color: Customcolor.colorBlue,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

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
  final Function onbtnTap;
  final Widget list;


  const CustomHorizontalCard(
      {Key key,
      this.cardTitle,
      this.cardImage,
      this.subTitle,
      this.btnTitle,
      this.titleColor,
      this.titleImg,
      this.list,
      this.index, this.onbtnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
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
                      text: cardTitle,
                      style: TextStyle(
                        color: titleColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
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
        Container(height: SizeConfig.blockSizeVertical * 25, child: list),
        SizedBox(
          height: 9,
        ),
        Center(
          child: GestureDetector(
            onTap: onbtnTap,
                      child: Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(5)),
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
    );
  }
}

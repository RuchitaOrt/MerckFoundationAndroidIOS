import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class DrawerWidget extends StatelessWidget {
  String image;
  String value;
  var controllervalue;
  var keyboardtype;
  Function onTapfun;
  var width;
  var heigth;

  DrawerWidget(
      {Key key, this.image, this.value, this.onTapfun, this.width, this.heigth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(5),
      // margin: EdgeInsets.fromLTRB(20, 3, 3, 3),
      child: GestureDetector(
        onTap: onTapfun,
        child: new Row(
          children: <Widget>[
            Image.asset(
              image,
              width: 40,
              height: 40,
            ),
            SizedBox(
              width: 10,
            ),
            Text(value,
                style: TextStyle(
                    color: Customcolor.text_darkblue,
                    fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                    fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}

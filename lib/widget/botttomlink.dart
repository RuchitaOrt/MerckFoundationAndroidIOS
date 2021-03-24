import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';

class Bottomcardlink extends StatelessWidget {
  const Bottomcardlink({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Text(
        "© Merck Foundation is a German non-profit organization with limited liability, established in 31 May 2017",
        style: TextStyle(color: Customcolor.colorBlue, fontSize: 12),
        textAlign: TextAlign.center,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';

class AnnualReport extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactusState();
  }
}

class ContactusState extends State<AnnualReport> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  double imgHeight = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Customcolor.background,
      appBar: InnerCustomAppBar(
        onTapval: () {
          Navigator.pop(context);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (BuildContext context) => Dashboard(
          //               index: 0,
          //             )));
        },
        index: 1,
        title: "Annual Report",
        titleImg: "assets/newImages/contactus_logo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Center(
                child: FormLabel(
                  text: "Coming Soon",
                  fontSize: 18,
                  labelColor: Customcolor.colorVoilet,
                  fontweight: FontWeight.bold,
                  textAlignment: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

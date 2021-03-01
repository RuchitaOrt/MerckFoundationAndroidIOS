import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';

class OurActivtyDetail extends StatefulWidget {
  final String activtydetaill;

  const OurActivtyDetail({Key key, this.activtydetaill}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return OurActivtyDetailState();
  }
}

class OurActivtyDetailState extends State<OurActivtyDetail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Customcolor.background,
        appBar: InnerCustomAppBar(
          onTapval: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Dashboard(
                          index: 0,
                        )));
          },
          index: 2,
          title: "Our Activty",
          titleImg: "assets/newImages/leadership_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Html(
                  data: """${widget.activtydetaill} """,
                  onLinkTap: (url) {
                    print("Opening $url...");
                  },
                  style: {
                    "body": Style(textAlign: TextAlign.start),
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

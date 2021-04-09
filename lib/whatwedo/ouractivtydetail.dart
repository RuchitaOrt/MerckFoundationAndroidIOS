import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';

class OurActivtyDetail extends StatefulWidget {
  final String activtydetaill;
  final String activtytitle;
  final String detailpageurl;

  const OurActivtyDetail(
      {Key key, this.activtydetaill, this.activtytitle, this.detailpageurl})
      : super(key: key);
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
            // Navigator.pop(context);
          },
          index: 2,
          sharelink:
              Constantstring.shareouractivitydetail + widget.detailpageurl,
          title: "Our Activties",
          titleImg: "assets/newImages/leadership_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Html(
                  data: """${widget.activtytitle} """,
                  onLinkTap: (url) {
                    print("Opening $url...");
                    ShowDialogs.launchURL(url);
                  },
                  style: {
                    "body": Style(
                        textAlign: TextAlign.center,
                        color: Customcolor.colorVoilet,
                        fontSize: FontSize.larger,
                        fontWeight: FontWeight.w600),
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Html(
                  data: """${widget.activtydetaill} """,
                  onLinkTap: (url) {
                    print("Opening $url...");
                    ShowDialogs.launchURL(url);
                  },
                  style: {
                    "body": Style(textAlign: TextAlign.start),
                  },
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 0, left: 0),
              //   child: Align(
              //     alignment: Alignment.topRight,
              //     child: Image.asset(
              //       "assets/newImages/flowers_footer.png",
              //       height: 170,
              //     ),
              //   ),
              // ),

              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.only(right: 0, left: 0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    "assets/newImages/flowers_footer.png",
                    height: 170,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Bottomcardlink(),
            ],
          ),
        ));
  }
}

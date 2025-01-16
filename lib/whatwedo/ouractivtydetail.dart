import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:http/http.dart' as http;
import '../model/OuredetailsActivies.dart';
import '../model/ourActivitiesObjectiveResp.dart';
import '../utility/APIManager.dart';
import '../utility/GlobalLists.dart';
import '../utility/checkInternetconnection.dart';

class OurActivtyDetail extends StatefulWidget {
  final String activtydetaill;
  final String activtytitle;
  final String detailpageurl;
  var id;

  OurActivtyDetail(
      {Key key,
      this.activtydetaill,
      this.activtytitle,
      this.detailpageurl,
      this.id})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return OurActivtyDetailState();
  }
}

class OurActivtyDetailState extends State<OurActivtyDetail> {
  @override
  void initState() {
    getActivitiesdetails();
    print('Inside in oure');
    print(widget.activtydetaill);
    print(widget.id);

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
                  onLinkTap: (url, renderContext, attributes, element) {
                    print("Opening $url...");
                    ShowDialogs.launchURL(url);
                  },
                  style: {
                    "body": Style(
                        textAlign: TextAlign.center,
                        color: Customcolor.colorVoilet,
                        fontSize: FontSize.larger,
                        fontWeight: FontWeight.w600),
                    "tr": Customcolor.tableboderstyle(context),
                  },
                ),
              ),
              //comment
              GlobalLists.ourDetailsActivitiesObjectives.length == 0
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: HtmlWidget(
                          "${GlobalLists.ourDetailsActivitiesObjectives[0].details}" ??
                              "")

                      // Html(
                      //   data: GlobalLists.ourDetailsActivitiesObjectives[0].details ??
                      //       "",
                      //   onLinkTap: (url) {
                      //     print("Opening $url...");
                      //     ShowDialogs.launchURL(url);
                      //   },
                      //   style: {
                      //     "body": Style(textAlign: TextAlign.start),
                      //     "tr": Customcolor.tableboderstyle(context),
                      //   },
                      // ),

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

  getActivitiesdetails() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      // ShowDialogs.showLoadingDialog(context, _keyLoader);
      final json = {
        'id': widget.id,
      };

      print("json $json");

      APIManager().apiRequest(context, API.ourdetails, (response) async {
        OuredetailsActivies resp = response;
        print(response);

        print('Resp : ${resp.data}');

        if (resp.status == true) {
          setState(() {
            GlobalLists.ourDetailsActivitiesObjectives = [resp.data];
          });

          print(
              "ourDetailsActivitiesObjectives ${GlobalLists.ourDetailsActivitiesObjectives}");
        } else {
          ShowDialogs.showToast(resp.message);
        }
      }, (error) {
        print('ERR  $error');
      }, jsonval: json);
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

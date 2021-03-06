import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:merckfoundation22dec/model/ourPartnerObjectivesResp.dart';
import 'package:merckfoundation22dec/model/ourPartnerResponse.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/screens/ourpartner/ourPartnerDetails.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';

class Ourpatner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OurpatnerState();
  }
}

class OurpatnerState extends State<Ourpatner> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  void initState() {
    getOurPartnerObjectives();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List paravalue = [
      "We are open to partner on programs that contribute to our goal of improving the health and wellbeing.",
      "We care for people living in underserved communities and want to advance their lives through science and technology.",
      "We are dedicated to sharing our expertise to jointly develop and implement those programs.",
    ];
    List imageAvailable = [
      "assets/images/img1.jpg",
      "assets/images/img2.jpg",
      "assets/images/img1.jpg",
      "assets/images/img2.jpg",
      "assets/images/img1.jpg"
    ];
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
          title: "Our Partners",
          titleImg: "assets/newImages/ourPartner_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            children: [
              GlobalLists.ourPartnerObjectives.length <= 0
                  ? Container(
                      child: Center(child: Text(Constantstring.emptyData)),
                    )
                  : ListView(
                      shrinkWrap: true,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 8, bottom: 15),
                          child: Html(
                            data:
                                """${GlobalLists.ourPartnerObjectives[0].pageContent} """,
                            onLinkTap: (url) {
                              print("Opening $url...");
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 90, right: 90, bottom: 20, top: 20),
                          child: FlatButton(
                            color: Customcolor.text_blue,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Customcolor.text_blue),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "View Partners",
                              style: TextStyle(color: Colors.white),
                            ),
                            minWidth: 38,
                            height: 40,
                            onPressed: () {
                              getOurPartnerData();
                            },
                          ),
                        ),
                        // Padding(
                        //   padding:
                        //       const EdgeInsets.only(right: 60, left: 60, top: 20),
                        //   child: Image.asset(
                        //     "assets/newImages/flowers_footer.png",
                        //   ),
                        // ),
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
                        )
                      ],
                    ),
            ],
          ),
        ));
  }

  getOurPartnerObjectives() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.ourPartnerObjectives,
        (response) async {
          OurpartnerobjectiveResponse resp = response;
          print(response);
          print('Resp : $resp');
          GlobalLists.ourPartnerObjectives.clear();
          Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.ourPartnerObjectives = resp.data.list;
            });
          } else {
            ShowDialogs.showToast(resp.msg);
          }
        },
        (error) {
          print('ERR msg is $error');
          Navigator.of(_keyLoader.currentContext).pop();
        },
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }

  getOurPartnerData() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.ourPartner,
        (response) async {
          OurpartnerResponse resp = response;
          print(response);
          print('Resp : $resp');
          GlobalLists.ourPartnerList.clear();
          Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.ourPartnerList = resp.data.list;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Ourpatnerdetail(
                            baseUrl: resp.baseUrl,
                          )));
            });
          } else {
            ShowDialogs.showToast(resp.msg);
          }
        },
        (error) {
          print('ERR msg is $error');
          Navigator.of(_keyLoader.currentContext).pop();
        },
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

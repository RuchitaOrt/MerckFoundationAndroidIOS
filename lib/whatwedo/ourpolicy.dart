import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:merckfoundation22dec/model/ourmissionResponse.dart';
import 'package:merckfoundation22dec/model/ourpolicy.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/UtilityFile.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';

class OurPolicy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OurPolicyState();
  }
}

class OurPolicyState extends State<OurPolicy> with TickerProviderStateMixin {
  AnimationController _controller;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  void initState() {
    getpolicy();
    super.initState();

    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Customcolor.background,
        appBar: InnerCustomAppBar(
          onTapval: () {
          //  Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Dashboard(
                          index: 0,
                        )));
          },
          index: 2,
          title: "Our Policy",
          titleImg: "assets/newImages/vision_logo.png",
          sharelink: Constantstring.shareourpolicy,
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: GlobalLists.ourpolicy.length <= 0
                  ? Container(
                      child: Center(child: Text(Constantstring.emptyData)),
                    )
                  : ListView(
                      shrinkWrap: true,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 8, top: 8, bottom: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Html(
                                data:
                                    """${GlobalLists.ourpolicy[0].pageContent} """,
                                onLinkTap: (url) {
                                  print("Opening $url...");
                                  ShowDialogs.launchURL(url);
                                },
                                // style: {
                                //   "body": Style(
                                //     fontSize: FontSize(
                                //         ResponsiveFlutter.of(context).fontSize(2.2)),
                                //     fontWeight: FontWeight.w600,
                                //     color: Customcolor.pink_col,
                                //   ),
                                // },
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //       right: 60, left: 60, top: 20),
                              //   child: Image.asset(
                              //     "assets/newImages/flowers_footer.png",
                              //   ),
                              // ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.only(right: 0, left: 0),
                              //   child: Align(
                              //     alignment: Alignment.topRight,
                              //     child: Image.asset(
                              //       "assets/newImages/flowers_footer.png",
                              //       height: 170,
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // )
                            ],
                          ),
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
            ),

            // TextSpan(

            // ),
          ],
        ));
  }

  getpolicy() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.ourPolicies,
        (response) async {
          OurpolicyResponse resp = response;
          print(response);
          Navigator.of(_keyLoader.currentContext).pop();
          print('Resp : $resp');
          if (resp.success == "True") {
            setState(() {
              GlobalLists.ourpolicy = resp.data.list;
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

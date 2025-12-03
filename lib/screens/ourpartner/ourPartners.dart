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
          sharelink: Constantstring.shareourpartner,
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
                            onLinkTap:
                                (url, attributes, element) {
                              print("Opening $url...");
                              ShowDialogs.launchURL(url!);
                            },
                            style: {
                              "tr": Customcolor.tableboderstyle(context),
                            },
                             extensions: [
      TagExtension(
        tagsToExtend: {"img"},
        builder: (ExtensionContext context) {
          final src = context.attributes['src'] ?? '';
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.network(
              src,
              width: double.infinity,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image),
            ),
          );
        },
      )
    ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 90, right: 90, bottom: 20, top: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Customcolor.text_blue,
                                minimumSize: Size(38, 40),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Customcolor.text_blue),
                                    borderRadius: BorderRadius.circular(5))),
                            // color: Customcolor.text_blue,
                            // shape: RoundedRectangleBorder(
                            //     side: BorderSide(color: Customcolor.text_blue),
                            //     borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "View Partners",
                              style: TextStyle(color: Colors.white),
                            ),

                            // minWidth: 38,
                            // height: 40,
                            onPressed: () {
                              // getOurPartnerData();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Ourpatnerdetail()));
                            },
                          ),
                        ),
                       
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
          Navigator.of(_keyLoader.currentContext!).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.ourPartnerObjectives = resp.data!.list!;
            });
          } else {
            ShowDialogs.showToast(resp.msg!);
          }
        },
        (error) {
          print('ERR msg is $error');
          Navigator.of(_keyLoader.currentContext!).pop();
        },
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

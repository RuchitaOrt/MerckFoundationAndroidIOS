import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:merckfoundation22dec/model/StrategyResponse.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';

import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/model/subproaboutmmtmResponse.dart'
    as aboutmmtm;
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:responsive_flutter/responsive_flutter.dart';

class StrategyDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OurProgramstrategyState();
  }
}

class OurProgramstrategyState extends State<StrategyDetails> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  bool isMiddleSectionLoaded = false;

  List<Widget> listofwiget = [];
  List typewidet = [];
  @override
  void initState() {
    getmmtmapi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: InnerCustomAppBar(
        onTapval: () {
          Navigator.pop(context);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (BuildContext context) => Dashboard(
          //               index: 1,
          //             )));
        },
        index: 2,
        sharelink: Constantstring.strategy,
        title: "Strategy",
        titleImg: "assets/newImages/our_programsLogo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          ListView(
             shrinkWrap: true,
             physics: ScrollPhysics(),
             //  crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Padding(
                 padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            
                 child: Visibility(
                   visible: isMiddleSectionLoaded,
                   replacement: Center(child: CircularProgressIndicator()),
                   child: ListView(
                       shrinkWrap: true,
                       physics: ScrollPhysics(),
                       // scrollDirection: Axis.horizontal,
                       children: list()),
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
          // SizedBox(
          //   height: 10,
          // )
        ],
      ),
    );
  }

  Future<http.Response> getmmtmapi() async {
    print("mmtm api");
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      var response = await APIManager.fetchget(
        encoding: APIManager.subprogramstrategy,
      );
      print("response");
      print(response);
      if (response.statusCode == 200) {
        var res = json.decode(response.body);
        print("ff");
        print(res);
        aboutmmtm.SubProgramabotmmtmResponse homepageres =
            aboutmmtm.SubProgramabotmmtmResponse.fromJson(res);

        Map<String, dynamic> section1 = homepageres.middleArea;

        print(section1);
        print(section1['1']);

        dynamic contentsection = res['middle_area']['1'];

        var middlecontentname1 = contentsection;

        var middlecontentname = middlecontentname1.keys.first;

        print(middlecontentname1);
        setState(() {
          typewidet.add('content');

          print(typewidet);
        });
        GlobalLists.homevideolist.clear();
        GlobalLists.homecontentlist.clear();
        print("hi");

        if (middlecontentname.toString().toLowerCase() ==
            "content".toLowerCase()) {
          print("hi");
          GlobalLists.homecontentlist =
              homepageres.middleArea['1'].content.list;
          print(GlobalLists.homecontentlist.length);
        }

        setState(() {
          isMiddleSectionLoaded = true;
        });

        return response;
      } else {
        setState(() {
          isMiddleSectionLoaded = true;
        });

        ShowDialogs.showToast(GlobalLists.serverresp);
      }
    } else {
      setState(() {
        isMiddleSectionLoaded = true;
      });

      ShowDialogs.showToast("Please check internet connection");
    }
  }

  List<Widget> list() {
    print("list");
    listofwiget.clear();
    for (int i = 0; i < typewidet.length; i++) {
      if (typewidet[i] == "content") {
        listofwiget.add(
          Html(
            data: """${GlobalLists.homecontentlist[0].pageContent} """,
            onLinkTap: (url) {
              print("Opening $url...");
              ShowDialogs.launchURL(url);
            },
          ),
        );
      }
    }
    return listofwiget;
  }
}

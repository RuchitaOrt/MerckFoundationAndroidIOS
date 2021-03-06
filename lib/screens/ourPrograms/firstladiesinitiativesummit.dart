import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:merckfoundation22dec/model/GetFirstLadiesInitaiveResponse.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';

import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';

class FirstLadiesInitiativeDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstLadiesInitiativeDetailsState();
  }
}

class FirstLadiesInitiativeDetailsState
    extends State<FirstLadiesInitiativeDetails> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  @override
  void initState() {
    // TODO: implement initState
    getfirstinitiative();
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
                        index: 1,
                      )));
        },
        index: 2,
        title: "Our Programs",
        titleImg: "assets/newImages/our_programsLogo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
        child: GlobalLists.firstladieslist.length <= 0
            ? Container(
                child: Center(child: Text(Constantstring.emptyData)),
              )
            : ListView(
                shrinkWrap: true,
                //  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Html(
                    data: """${GlobalLists.firstladieslist[0].pageContent} """,
                    onLinkTap: (url) {
                      print("Opening $url...");
                    },
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 60, left: 60),
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
      ),
    );
  }

  getfirstinitiative() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.firstladiesinitiative,
        (response) async {
          GetFirstLadiesInitaiveResp resp = response;
          print(response);
          print('Resp : $resp');
          Navigator.of(_keyLoader.currentContext).pop();
          if (resp.success == "True") {
            setState(() {
              GlobalLists.firstladieslist = resp.data.list;
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

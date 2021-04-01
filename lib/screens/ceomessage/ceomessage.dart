import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:merckfoundation22dec/model/LeadershipResponse.dart';
import 'package:merckfoundation22dec/screens/ceomessage/Detailpageceo.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customappbar.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class Ceomessage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CeomessageState();
  }
}

class CeomessageState extends State<Ceomessage> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getleadership();
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
          title: "Leadership",
          sharelink: Constantstring.shareleadership,
          titleImg: "assets/newImages/leadership_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        body: SingleChildScrollView(
          child: Column(
            // physics: ScrollPhysics(),
            // shrinkWrap: true,
            // scrollDirection: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalLists.ceolisting.length <= 0
                  ? Container()
                  : Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: ListView.builder(
                        itemCount: GlobalLists.ceolisting.length,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, bottom: 6),
                              child: Column(
                                children: [
                                  Center(
                                    child: Container(
                                      height: 200,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: FadeInImage.assetNetwork(
                                        placeholder:
                                            'assets/newImages/placeholder_3.jpg',
                                        image: Constantstring.baseUrl +
                                            GlobalLists.ceolisting[index].image,
                                        fit: BoxFit.cover,
                                        height: 150,
                                      ),
                                    ),
                                  ),
                                  Html(
                                    data:
                                        """${GlobalLists.ceolisting[index].leaderName} """,
                                    onLinkTap: (url) {
                                      print("Opening $url...");
                                      ShowDialogs.launchURL(url);
                                    },
                                    style: {
                                      "body": Style(
                                          textAlign: TextAlign.center,
                                          color: Customcolor.violet_col,
                                          fontWeight: FontWeight.bold,
                                          fontSize: FontSize.larger),
                                    },
                                  ),
                                  Html(
                                    data:
                                        """${GlobalLists.ceolisting[index].shortBiodata} """,
                                    onLinkTap: (url) {
                                      print("Opening $url...");
                                      ShowDialogs.launchURL(url);
                                    },
                                    style: {
                                      "body": Style(textAlign: TextAlign.center),
                                    },
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  Detailpageceo(
                                                    list:
                                                        GlobalLists.ceolisting,
                                                    imageurl:
                                                        Constantstring.baseUrl,
                                                    index: index,
                                                  )));
                                    },
                                    child: Html(
                                      data: "((View Bio))",
                                      onLinkTap: (url) {
                                        print("Opening $url...");
                                        ShowDialogs.launchURL(url);
                                      },
                                      style: {
                                        "body": Style(
                                            textAlign: TextAlign.start,
                                            color: Customcolor.pink_col,
                                            fontSize: FontSize.larger,
                                            fontWeight: FontWeight.w600),
                                      },
                                    ),
                                  ),
                                ],
                              ));
                        },
                      ),
                  ),
              GlobalLists.boardoftrust.length <= 0
                  ? Container()
                  : Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //Text("Board of Trustees of Merck Foundation"),

                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30, bottom: 15, left: 5),
                            child: FormLabel(
                              text: "Board of Trustees of Merck Foundation",
                              labelColor: Customcolor.pink_col,
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2),
                              maxLines: 2,
                              fontweight: FontWeight.w800,
                              textAlignment: TextAlign.left,
                            ),
                          ),
                          ListView.builder(
                            itemCount: GlobalLists.boardoftrust.length,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 6),
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Container(
                                          height: 200,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: FadeInImage.assetNetwork(
                                            placeholder:
                                                'assets/newImages/placeholder_3.jpg',
                                            image: Constantstring.baseUrl +
                                                GlobalLists
                                                    .boardoftrust[index].image,
                                            fit: BoxFit.cover,
                                            height: 150,
                                          ),
                                        ),
                                      ),
                                      Html(
                                        data:
                                            """${GlobalLists.boardoftrust[index].leaderName} """,
                                        onLinkTap: (url) {
                                          print("Opening $url...");
                                          ShowDialogs.launchURL(url);
                                        },
                                        style: {
                                          "body": Style(
                                              textAlign: TextAlign.center,
                                              color: Customcolor.violet_col,
                                              fontWeight: FontWeight.bold,
                                              fontSize: FontSize.larger),
                                        },
                                      ),
                                      Html(
                                        data:
                                            """${GlobalLists.boardoftrust[index].shortBiodata} """,
                                        onLinkTap: (url) {
                                          print("Opening $url...");
                                          ShowDialogs.launchURL(url);
                                        },
                                        style: {
                                          "body":
                                              Style(textAlign: TextAlign.center),
                                        },
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          Detailpageceo(
                                                            list: GlobalLists
                                                                .boardoftrust,
                                                            imageurl:
                                                                Constantstring
                                                                    .baseUrl,
                                                            index: index,
                                                          )));
                                        },
                                        child: Html(
                                          data: "((View Bio))",
                                          onLinkTap: (url) {
                                            print("Opening $url...");
                                            ShowDialogs.launchURL(url);
                                          },
                                          style: {
                                            "body": Style(
                                                textAlign: TextAlign.start,
                                                color: Customcolor.pink_col,
                                                fontSize: FontSize.larger,
                                                fontWeight: FontWeight.w600),
                                          },
                                        ),
                                      ),

                                      SizedBox(
                                        height: 50,
                                      )
                                    ],
                                  ));
                            },
                          ),
                        ],
                      ),
                  ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       left: 60, right: 60, top: 20, bottom: 10),
              //   child: Image.asset(
              //     "assets/newImages/flowers_footer.png",
              //   ),
              // ),
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

  getleadership() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.leadership,
        (response) async {
          LeadershipResponse resp = response;
          print(response);
          print('Resp : $resp');

          Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.ceolisting = resp.data.ceo;
              GlobalLists.boardoftrust =
                  resp.data.boardOfTrusteesOfMerckFoundation;
              Constantstring.baseUrl = resp.baseUrl;
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

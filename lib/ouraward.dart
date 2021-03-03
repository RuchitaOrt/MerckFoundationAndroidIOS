import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:merckfoundation22dec/model/OurawardResponse.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/model/OurawarddetailResponse.dart';
import 'package:merckfoundation22dec/ourawarddetail.dart';

class Ouraward extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ourawardState();
  }
}

class ourawardState extends State<Ouraward> {
  List awardlist = [
    "Stay At Home Media Recognization Awards 2020",
    "Merck more than a mother Recognization Awards",
    "Merck more than a mother Fashion Award"
  ];
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getaward();
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
          index: 1,
          title: "Our Awards",
          titleImg: "assets/nsewImages/news_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        body: ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: [
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              itemCount: GlobalLists.awardlisting.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 6),
                  child: GestureDetector(
                    onTap: () {},
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 0, left: 10, right: 10, top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Html(
                              data:
                                  """${GlobalLists.awardlisting[index].title} """,
                              onLinkTap: (url) {
                                print("Opening $url...");
                              },
                              style: {
                                "body": Style(
                                    textAlign: TextAlign.start,
                                    color: Customcolor.pink_col,
                                    fontSize: FontSize.large,
                                    fontWeight: FontWeight.w500),
                              },
                            ),
                            // Text(
                            //   GlobalLists.awardlisting[index].title,
                            //   overflow: TextOverflow.ellipsis,
                            //   style: TextStyle(
                            //       color: Customcolor.pink_col,
                            //       fontSize:
                            //           ResponsiveFlutter.of(context).fontSize(2),
                            //       fontWeight: FontWeight.w500),
                            //   maxLines: 4,
                            // ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    getawarddetail(GlobalLists
                                        .awardlisting[index].pageUrl);
                                  },
                                  child: Container(
                                    width: 110,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Text(
                                        "Read More",
                                        style: TextStyle(
                                            color: Customcolor.text_darkblue,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  "assets/images/trophy.png",
                                  width: 70,
                                  height: 70,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 60, right: 60, top: 20, bottom: 10),
              child: Image.asset(
                "assets/newImages/flowers_footer.png",
              ),
            ),
          ],
        ));
  }

  getaward() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.ouraward,
        (response) async {
          OurawardResponse resp = response;
          print(response);
          print('Resp : $resp');

          Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.awardlisting = resp.data.list;
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

  getawarddetail(String pageurl) async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);
      final json = {
        'page_url': pageurl,
      };
      print(json);
      APIManager().apiRequest(context, API.ourawarddetail, (response) async {
        OurawarddetailResponse resp = response;
        print(response);
        print('Resp : $resp');

        Navigator.of(_keyLoader.currentContext).pop();

        if (resp.success == "True") {
          setState(() {
            GlobalLists.awarddetallisting = resp.data.list;
            // GlobalLists.awarddetallisting[0].title
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => OurAwardDetail(
                          detaill: GlobalLists.awarddetallisting,
                        )));
          });
        } else {
          ShowDialogs.showToast(resp.msg);
        }
      }, (error) {
        print('ERR msg is $error');
        Navigator.of(_keyLoader.currentContext).pop();
      }, jsonval: json);
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

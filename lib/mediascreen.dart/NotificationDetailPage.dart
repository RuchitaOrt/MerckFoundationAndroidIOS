import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:merckfoundation22dec/model/NotificationdetailResponse.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:flutter_html/style.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class NotiDetailpage extends StatefulWidget {
  final String id;

  const NotiDetailpage({
    Key key,
    this.id,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DetailpageState();
  }
}

class DetailpageState extends State<NotiDetailpage>
    with TickerProviderStateMixin {
  AnimationController _controller;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  void initState() {
    super.initState();
    getnotificationdetail(widget.id);
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => Dashboard(
                      index: 0,
                    )));
      },
      child: Scaffold(
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
              // if (widget.callfrom == 1) {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (BuildContext context) => Dashboard(
              //                 index: 3,
              //               )));
              // } else {
              //   Navigator.pop(context);
              // }
            },
            index: 1,
            titleshowingindex: "1",
            sharelink: "",
            title: "Articles",
            titleImg: "assets/newImages/vision_logo.png",
            trallingImg1: "assets/newImages/share.png",
            trallingImg2: "assets/newImages/search.png",
            height: 85,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: Stack(
            children: [
              GlobalLists.notificationlist.length != 0
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 1),
                      child: ListView(
                        shrinkWrap: true,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 8, top: 8, bottom: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  GlobalLists.notificationlist[0].title == null
                                      ? ""
                                      : GlobalLists.notificationlist[0].title,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(2),
                                    fontWeight: FontWeight.w600,
                                    color: Customcolor.colorVoilet,
                                  ),
                                ),
                                // Html(
                                //   data: """${GlobalLists.notificationlist[0].details} """,
                                //   onLinkTap: (url) {
                                //     print("Opening $url...");
                                //     ShowDialogs.launchURL(url);
                                //   },
                                // ),
                                SizedBox(
                                  height: 15,
                                ),
                                GlobalLists.notificationlist[0].details == null
                                    ? Container()
                                    : Html(
                                        data:
                                            """${GlobalLists.notificationlist[0].details} """,
                                        onLinkTap: (url) {
                                          print("Opening $url...");
                                          ShowDialogs.launchURL(url);
                                        },
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
                          )
                        ],
                      ),
                    )
                  : Container(),

              // TextSpan(

              // ),
            ],
          )),
    );
  }

  getnotificationdetail(String id) async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);
      final json = {
        'newsletter_id': id,
      };
      print(json);
      APIManager().apiRequest(context, API.notificationdetail,
          (response) async {
        NotificationdetailResponse resp = response;
        print(response);
        print('Resp : $resp');

        Navigator.of(_keyLoader.currentContext).pop();

        if (resp.success == true) {
          setState(() {
            GlobalLists.notificationlist = resp.list;
            // GlobalLists.awarddetallisting[0].title
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

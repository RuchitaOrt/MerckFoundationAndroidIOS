import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/model/TestimonialProgram.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';

class Testimonialprogramviewmore extends StatefulWidget {
  final dynamic apiurl;
  final dynamic sharelink;
  const Testimonialprogramviewmore({
    Key key,
    this.apiurl,
    this.sharelink,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return TestimonialprogramviewmoreState();
  }
}

class TestimonialprogramviewmoreState extends State<Testimonialprogramviewmore>
    with TickerProviderStateMixin {
  AnimationController _controller;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  void initState() {
    super.initState();
    getMerckprogramTestimonial(widget.apiurl);
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
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => Dashboard(
            //               index: 0,
            //             )));
            Navigator.pop(context);
          },
          index: 2,
          sharelink: widget.sharelink,
          title: "Merck Foundation Alumni Testimonials",
          titleImg: "assets/newImages/vision_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalLists.testimonialprolist.length <= 0
                    ? Container()
                    : ListView.builder(
                        itemCount: GlobalLists.testimonialprolist.length,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, bottom: 6, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 200,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: FadeInImage.assetNetwork(
                                      placeholder:
                                          'assets/newImages/placeholder_3.jpg',
                                      image: GlobalLists.testimonialprobaseurl +
                                          GlobalLists
                                              .testimonialprolist[index].image,
                                      fit: BoxFit.fill,
                                      imageScale: 1,
                                      height: 150,
                                    ),
                                  ),
                                  Html(
                                      data:
                                          """${GlobalLists.testimonialprolist[index].testimonialName} """,
                                      onLinkTap: (url) {
                                        print("Opening $url...");
                                        ShowDialogs.launchURL(url);
                                      },
                                      style: {
                                        "body": Style(
                                            fontSize: FontSize(17.0),
                                            color: Customcolor.colorBlue,
                                            textAlign: TextAlign.start,
                                            fontWeight: FontWeight.w500),
                                      }),
                                  Html(
                                    data:
                                        """${GlobalLists.testimonialprolist[index].departmentName} """,
                                    onLinkTap: (url) {
                                      print("Opening $url...");
                                      ShowDialogs.launchURL(url);
                                    },
                                    style: {
                                      "body": Style(textAlign: TextAlign.start),
                                    },
                                  ),
                                  Html(
                                    data:
                                        """${GlobalLists.testimonialprolist[index].details} """,
                                    onLinkTap: (url) {
                                      print("Opening $url...");
                                      ShowDialogs.launchURL(url);
                                    },
                                    style: {
                                      "body": Style(textAlign: TextAlign.start),
                                    },
                                  ),
                                ],
                              ));
                        },
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
                )
              ],
            ),
          ),
        ));
  }

  getMerckprogramTestimonial(dynamic api) async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        api,
        (response) async {
          TestimonialprogramResponse resp = response;
          print(response);
          print('Resp : $resp');

          Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.testimonialprolist = resp.list;
              GlobalLists.testimonialprobaseurl = resp.baseUrl;
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

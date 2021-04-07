import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';

class DetailSearchTestimonialPage extends StatefulWidget {
  final int index;
  final String baseurl;
  const DetailSearchTestimonialPage({
    Key key,
    this.index,
    this.baseurl,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DetailSearchTestimonialPageState();
  }
}

class DetailSearchTestimonialPageState
    extends State<DetailSearchTestimonialPage> with TickerProviderStateMixin {
  AnimationController _controller;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  void initState() {
    super.initState();
    //  getMerckprogramTestimonial();
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
            Navigator.pop(context);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => Dashboard(
            //               index: 0,
            //             )));
          },
          index: 2,
          sharelink: Constantstring.sharetestimonialdetailpage +
              GlobalLists.searchtestimoniallisting[widget.index]
                  ['detail_page_url'],
          title: GlobalLists.searchtestimoniallisting[widget.index]
              ['testimonial_name'],
          titleImg: "assets/newImages/vision_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Center(
                  //   child: Container(
                  //     height: 200,
                  //     width: 150,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(8)),
                  //     child: FadeInImage.assetNetwork(
                  //       placeholder: 'assets/newImages/placeholder_3.jpg',
                  //       image: widget.baseurl +
                  //           GlobalLists
                  //               .mmttestimoniallist[widget.index].image,
                  //       fit: BoxFit.fill,
                  //       height: 150,
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 200,
                      width: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/newImages/placeholder_3.jpg',
                        image: widget.baseurl +
                            GlobalLists.searchtestimoniallisting[widget.index]
                                ['image'],
                        fit: BoxFit.fill,
                        imageScale: 1,
                        height: 150,
                      ),
                    ),
                  ),
                  Html(
                    data:
                        """${GlobalLists.searchtestimoniallisting[widget.index]['testimonial_name']} """,
                    onLinkTap: (url) {
                      print("Opening $url...");
                      ShowDialogs.launchURL(url);
                    },
                    // style: {
                    //   "body": Style(textAlign: TextAlign.start),
                    // },
                    style: {
                      "body": Style(
                          fontSize: FontSize(17.0),
                          color: Customcolor.colorBlue,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.w500),
                    },
                  ),
                  Html(
                    data:
                        """${GlobalLists.searchtestimoniallisting[widget.index]['department_name']} """,
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
                        """${GlobalLists.searchtestimoniallisting[widget.index]['details']} """,
                    onLinkTap: (url) {
                      print("Opening $url...");
                      ShowDialogs.launchURL(url);
                    },
                    style: {
                      "body": Style(textAlign: TextAlign.start),
                    },
                  ),

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

                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Bottomcardlink())
                ],
              ),
            ],
          ),
        ));
  }

  // getMerckprogramTestimonial() async {
  //   var status1 = await ConnectionDetector.checkInternetConnection();

  //   if (status1) {
  //     ShowDialogs.showLoadingDialog(context, _keyLoader);

  //     APIManager().apiRequest(
  //       context,
  //       API.testiomonailpro,
  //       (response) async {
  //         TestimonialprogramResponse resp = response;
  //         print(response);
  //         print('Resp : $resp');

  //         Navigator.of(_keyLoader.currentContext).pop();

  //         if (resp.success == "True") {
  //           setState(() {
  //             GlobalLists.testimonialprolist = resp.list;
  //             GlobalLists.testimonialprobaseurl = resp.baseUrl;
  //           });
  //         } else {
  //           ShowDialogs.showToast(resp.msg);
  //         }
  //       },
  //       (error) {
  //         print('ERR msg is $error');
  //         Navigator.of(_keyLoader.currentContext).pop();
  //       },
  //     );
  //   } else {
  //     ShowDialogs.showToast("Please check internet connection");
  //   }
  // }
}

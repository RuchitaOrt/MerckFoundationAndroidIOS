import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:flutter_html/style.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';

class Detailpage extends StatefulWidget {
  final int indexIs;
  final int callfrom;
  const Detailpage({Key key, this.indexIs, this.callfrom}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DetailpageState();
  }
}

class DetailpageState extends State<Detailpage> with TickerProviderStateMixin {
  AnimationController _controller;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  void initState() {
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
              Navigator.pop(context);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => Dashboard(
            //               index: 0,
            //             )));
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
          index: widget.callfrom == 1 ? 2 : 1,
          sharelink: Constantstring.sharearticledetailpage +
              GlobalLists.newsLettersList[widget.indexIs].detailPageUrl,
          title: widget.callfrom == 1
              ? GlobalLists.newsLettersList[widget.indexIs].detailPageUrl
              : "Articles",
          titleImg: "assets/newImages/vision_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: ListView(
                shrinkWrap: true,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  widget.callfrom == 1
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 8, top: 8, bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Html(
                                data:
                                    """${GlobalLists.newsLettersList[widget.indexIs].details} """,
                                onLinkTap: (url) {
                                  print("Opening $url...");
                                  ShowDialogs.launchURL(url);
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Html(
                                data:
                                    """${GlobalLists.newsLettersList[widget.indexIs].detailPageUrl} """,
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
                      : widget.callfrom == 2
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 8, bottom: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Html(
                                    data:
                                        """${GlobalLists.homeceomsglist[widget.indexIs].title} """,
                                    onLinkTap: (url) {
                                      print("Opening $url...");
                                    },
                                    style: {
                                      "body": Style(
                                          textAlign: TextAlign.center,
                                          color: Customcolor.colorVoilet,
                                          fontSize: FontSize.larger,
                                          fontWeight: FontWeight.w600),
                                    },
                                  ),
                                  Html(
                                    data:
                                        """${GlobalLists.homeceomsglist[widget.indexIs].details} """,
                                    onLinkTap: (url) {
                                      print("Opening $url...");
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),

                                  // Padding(
                                  //   padding: const EdgeInsets.only(
                                  //       right: 60, left: 60, top: 20),
                                  //   child: Image.asset(
                                  //     "assets/newImages/flowers_footer.png",
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 0, left: 0),
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
                            )
                          : Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 8, top: 8, bottom: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Html(
                                    data:
                                        """${GlobalLists.searcharticlelisting[widget.indexIs]['detail_page_url']} """,
                                    onLinkTap: (url) {
                                      print("Opening $url...");
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  // Html(
                                  //   data:
                                  //       """${GlobalLists.newsLettersList[widget.indexIs].detailPageUrl} """,
                                  //   onLinkTap: (url) {
                                  //     print("Opening $url...");
                                  //   },
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(
                                  //       right: 60, left: 60, top: 20),
                                  //   child: Image.asset(
                                  //     "assets/newImages/flowers_footer.png",
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 0, left: 0),
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
                            )
                ],
              ),
            ),

            // TextSpan(

            // ),
          ],
        ));
  }
}

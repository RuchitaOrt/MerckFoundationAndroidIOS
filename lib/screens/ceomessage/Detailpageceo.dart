import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';

class Detailpageceo extends StatefulWidget {
  final List list;
  final String imageurl;
  final int index;

  const Detailpageceo({Key key, this.list, this.imageurl, this.index})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DetailpageceoState();
  }
}

class DetailpageceoState extends State<Detailpageceo>
    with TickerProviderStateMixin {
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
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => Dashboard(
            //               index: 0,
            //             )));
            Navigator.pop(context);
          },
          index: 2,
          sharelink:
              Constantstring.shareceodetailpage + widget.list[widget.index].id,
          title: widget.list[widget.index].leaderName,
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
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 8, top: 8, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Html(
                          data: """${widget.list[widget.index].leaderLang} """,
                          onLinkTap: (url) {
                            print("Opening $url...");
                            ShowDialogs.launchURL(url);
                          },
                          style: {
                            "body": Style(
                              textAlign: TextAlign.right,
                            ),
                             "tr": Customcolor.tableboderstyle(),
                          },
                        ),
                        Center(
                          child: Container(
                            height: 200,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/newImages/placeholder_3.jpg',
                              image: widget.imageurl +
                                  widget.list[widget.index].image,
                              fit: BoxFit.cover,
                              height: 150,
                            ),
                          ),
                        ),
                        Center(
                          child: Html(
                            data:
                                """${widget.list[widget.index].leaderName} """,
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
                                   "tr": Customcolor.tableboderstyle(),
                            },
                          ),
                        ),
                        Center(
                          child: Html(
                            data:
                                """${widget.list[widget.index].shortBiodata} """,
                            onLinkTap: (url) {
                              print("Opening $url...");
                              ShowDialogs.launchURL(url);
                            },
                            style: {
                              "body": Style(textAlign: TextAlign.center),
                               "tr": Customcolor.tableboderstyle(),
                            },
                          ),
                        ),
                        Container(
                          // margin:
                          //     EdgeInsets.fromLTRB(16.0, 250.0, 16.0, 16.0),
                          decoration: BoxDecoration(
                              color: Customcolor.background,
                              borderRadius: BorderRadius.circular(5.0)),
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Divider(),
                              SizedBox(
                                height: 5.0,
                              ),
                              Html(
                                data:
                                    """${widget.list[widget.index].detailBiodata} """,
                                onLinkTap: (url) {
                                  print("Opening $url...");
                                  ShowDialogs.launchURL(url);
                                },
                                style: {
                                   "tr": Customcolor.tableboderstyle(),
                                },
                              ),
                              SizedBox(height: 10.0),
                              SizedBox(
                                height: 15,
                              ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.only(right: 60, left: 60),
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
                      ],
                    ),
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
                  Bottomcardlink(),
                ],
              ),
            ),

            // TextSpan(

            // ),
          ],
        ));
  }
}

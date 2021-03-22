import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/model/callforapplicationResponse.dart';
import 'package:url_launcher/url_launcher.dart';

class CallforApplication extends StatefulWidget {
  final dynamic apiurl;

  const CallforApplication({Key key, this.apiurl}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return CallApplicationState();
  }
}

class CallApplicationState extends State<CallforApplication>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController;
  TabController _tabController;
  List images = [
    "assets/newImages/cfa1.png",
    "assets/newImages/m3.png",
    "assets/newImages/cfa1.png"
  ];

  int _current1 = 0;
  int _current = 0;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  @override
  void initState() {
    // API.callforapplication
    getcallforapp(widget.apiurl);
    super.initState();
    _scrollViewController = new ScrollController();
    _tabController = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  _launchURL(String urlIs) async {
    var url = urlIs;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
        title: "Call For Application",
        titleImg: "assets/newImages/application_logo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      body: Column(
        // Column
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 15),
            color: Customcolor.background, // Tab Bar color change
            child: TabBar(
              // TabBar

              controller: _tabController,
              labelColor: Customcolor.text_darkblue,
              unselectedLabelColor: Customcolor.text_grey,
              indicatorSize: TabBarIndicatorSize.label,

              indicatorWeight: 2,
              indicatorColor: Customcolor.text_darkblue,

              tabs: <Widget>[
                Tab(
                  child: Text(
                    "Upcoming Call for \nApplication",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        //   color: Customcolor.colorBlue,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Tab(
                  child: Text(
                    "Past Call for \nApplication",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 3,
            child: TabBarView(
              // Tab Bar View
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: <Widget>[
                GlobalLists.upcomingevent.length <= 0
                    ? Container(
                        child: Center(child: Text(Constantstring.emptyData)),
                      )
                    : upcomingEvents(),
                GlobalLists.pastevent.length <= 0
                    ? Container(
                        child: Center(child: Text(Constantstring.emptyData)),
                      )
                    : pastEvents()
              ],
            ),
          ),
        ],
      ),
    );

    //  new TabBarView(
    //   children: <Widget>[upcomingEvents(), pastEvents()],
    //   controller: _tabController,
    // ),
  }

  Widget upcomingEvents() {
    return Container(
      height: double.infinity,
      // color: Colors.grey.shade800,
      padding: EdgeInsets.only(left: 8, right: 8, top: 8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              child: Swiper(
                fade: 0.0,
                onIndexChanged: (val) {
                  setState(() {
                    _current1 = val;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        height: 350,
                        child: Card(
                          //elevation: 5,
                          //color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    _launchURL(Constantstring.baseUrl +
                                        GlobalLists
                                            .upcomingevent[index].pdfFile);
                                  },
                                  child: Container(
                                    //  color: Colors.amber,
                                    width: double.infinity,
                                    //height: 350,
                                    child: FadeInImage.assetNetwork(
                                      placeholder:
                                          'assets/newImages/placeholder_3.jpg',
                                      image: Constantstring.baseUrl +
                                          GlobalLists
                                              .upcomingevent[index].appImg,
                                      fit: BoxFit.cover,
                                      //  height: 410
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: GlobalLists.upcomingevent.length,
                viewportFraction: 0.7,
                layout: SwiperLayout.DEFAULT,
                scale: 0.9,
                itemHeight: 410,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: new DotsIndicator(
                dotsCount: GlobalLists.upcomingevent.length,
                position: double.parse("$_current1"),
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(25.0, 9.0),
                  color: Customcolor.ligthpink,
                  spacing: EdgeInsets.only(right: 3),
                  activeColor: Customcolor.pink_col,
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
            ListTile(
              // subtitle: Text("awesome image caption"),
              title: Text(
                GlobalLists.upcomingevent[_current1].title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 17),
              ),
            ),
            SizedBox(
              height: 15,
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

  Widget pastEvents() {
    return Container(
      height: double.infinity,
      // color: Colors.grey.shade800,
      padding: EdgeInsets.only(left: 8, right: 8, top: 8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              child: Swiper(
                fade: 0.0,
                onIndexChanged: (val) {
                  setState(() {
                    _current1 = val;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        height: 350,
                        child: Card(
                          //elevation: 5,
                          //color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    _launchURL(Constantstring.baseUrl +
                                        GlobalLists.pastevent[index].pdfFile);
                                  },
                                  child: Container(
                                    //  color: Colors.amber,
                                    width: double.infinity,
                                    //height: 350,
                                    child: FadeInImage.assetNetwork(
                                      placeholder:
                                          'assets/newImages/placeholder_3.jpg',
                                      image: Constantstring.baseUrl +
                                          GlobalLists.pastevent[index].appImg,
                                      fit: BoxFit.cover,
                                      //  height: 410
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: GlobalLists.pastevent.length,
                viewportFraction: 0.7,
                layout: SwiperLayout.DEFAULT,
                scale: 0.9,
                itemHeight: 410,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: ScrollPhysics(),
                child: new DotsIndicator(
                  dotsCount: GlobalLists.pastevent.length,
                  position: double.parse("$_current"),
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(25.0, 9.0),
                    color: Customcolor.ligthpink,
                    spacing: EdgeInsets.only(right: 3),
                    activeColor: Customcolor.pink_col,
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ),
            ),
            ListTile(
              // subtitle: Text("awesome image caption"),
              title: Text(
                GlobalLists.pastevent[_current1].title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 17),
              ),
            ),
            SizedBox(
              height: 15,
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

  // Widget pastEvents() {
  //   return Container(
  //     height: 340,
  //     // color: Colors.grey.shade800,
  //     padding: EdgeInsets.only(left: 8, right: 8, top: 8),
  //     child: SingleChildScrollView(
  //       child: Column(
  //         children: [
  //           Container(
  //             height: 350,
  //             child: Expanded(
  //               child: Swiper(
  //                 onIndexChanged: (val) {
  //                   setState(() {
  //                     _current = val;
  //                   });
  //                 },
  //                 fade: 0.0,
  //                 itemBuilder: (BuildContext context, int index) {
  //                   // return Column(
  //                   //   children: <Widget>[
  //                   //     Expanded(
  //                   //       child: GestureDetector(
  //                   //         onTap: () {
  //                   //           _launchURL(Constantstring.baseUrl +
  //                   //               GlobalLists.pastevent[index].pdfFile);
  //                   //         },
  //                   //         child: Container(
  //                   //           width: double.infinity,
  //                   //           child: FadeInImage.assetNetwork(
  //                   //             placeholder:
  //                   //                 'assets/newImages/placeholder_3.jpg',
  //                   //             image: Constantstring.baseUrl +
  //                   //                 GlobalLists.pastevent[index].appImg,
  //                   //             fit: BoxFit.cover,
  //                   //             height: 80,
  //                   //           ),
  //                   //         ),
  //                   //       ),
  //                   //     ),
  //                   //   ],
  //                   // );
  //                   return Container(
  //                     height: 350,
  //                     child: Card(
  //                       //elevation: 5,
  //                       //color: Colors.transparent,
  //                       shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(10)),
  //                       child: Column(
  //                         children: <Widget>[
  //                           Expanded(
  //                             child: GestureDetector(
  //                               onTap: () {
  //                                 _launchURL(Constantstring.baseUrl +
  //                                     GlobalLists.pastevent[index].pdfFile);
  //                               },
  //                               child: Container(
  //                                 //  color: Colors.amber,
  //                                 width: double.infinity,
  //                                 //height: 350,
  //                                 child: FadeInImage.assetNetwork(
  //                                   placeholder:
  //                                       'assets/newImages/placeholder_3.jpg',
  //                                   image: Constantstring.baseUrl +
  //                                       GlobalLists.pastevent[index].appImg,
  //                                   fit: BoxFit.cover,
  //                                   //  height: 410
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   );
  //                 },
  //                 itemCount: GlobalLists.pastevent.length,
  //                 viewportFraction: 0.7,
  //                 layout: SwiperLayout.DEFAULT,
  //                 scale: 0.9,
  //                 // pagination: SwiperPagination(
  //                 //   builder: new DotSwiperPaginationBuilder(
  //                 //       color: Customcolor.ligthpink,
  //                 //       activeColor: Customcolor.pink_col),
  //                 // ),
  //               ),
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(top: 20, bottom: 20),
  //             child: SingleChildScrollView(
  //               scrollDirection: Axis.horizontal,
  //               physics: ScrollPhysics(),
  //               child: new DotsIndicator(
  //                 dotsCount: GlobalLists.pastevent.length,
  //                 position: double.parse("$_current"),
  //                 decorator: DotsDecorator(
  //                   size: const Size.square(9.0),
  //                   activeSize: const Size(25.0, 9.0),
  //                   color: Customcolor.ligthpink,
  //                   spacing: EdgeInsets.only(right: 3),
  //                   activeColor: Customcolor.pink_col,
  //                   activeShape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(5.0)),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           ListTile(
  //             // subtitle: Text("awesome image caption"),
  //             title: Text(
  //               GlobalLists.pastevent[_current].title,
  //               textAlign: TextAlign.center,
  //               style: TextStyle(
  //                   color: Colors.black87,
  //                   fontWeight: FontWeight.w600,
  //                   fontSize: 17),
  //             ),
  //           ),
  //           SizedBox(
  //             height: 15,
  //           ),
  //           // Padding(
  //           //   padding: const EdgeInsets.only(right: 60, left: 60),
  //           //   child: Image.asset(
  //           //     "assets/newImages/flowers_footer.png",
  //           //   ),
  //           // ),
  //           Padding(
  //             padding: const EdgeInsets.only(right: 0, left: 0),
  //             child: Align(
  //               alignment: Alignment.topRight,
  //               child: Image.asset(
  //                 "assets/newImages/flowers_footer.png",
  //                 height: 170,
  //               ),
  //             ),
  //           ),
  //           SizedBox(
  //             height: 10,
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  getcallforapp(dynamic api) async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      // ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        api,
        (response) async {
          CallforApplicationResponse resp = response;
          print(response);
          print('Resp : $resp');

          //   Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              if (resp.data.upcoming.length > 0) {
                GlobalLists.upcomingevent = resp.data.upcoming;
              }
              if (resp.data.past.length > 0) {
                GlobalLists.pastevent = resp.data.past;
              }

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

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';

class CallforApplication extends StatefulWidget {
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
  @override
  void initState() {
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
              children: <Widget>[upcomingEvents(), pastEvents()],
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
      height: 340,
      // color: Colors.grey.shade800,
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
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
                    Expanded(
                      child: Card(
                        //elevation: 5,
                        //color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                // height: SizeConfig.blockSizeVertical * 40,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          images[index],
                                        ),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: images.length,
              viewportFraction: 0.7,
              layout: SwiperLayout.DEFAULT,
              scale: 0.9,
              //outer: true,
              //itemWidth: 300.0,
              //itemHeight: 400,
              //itemHeight: 400,
              // pagination: SwiperPagination(
              //   builder: new DotSwiperPaginationBuilder(
              //     color: Customcolor.ligthpink,
              //     activeColor: Customcolor.pink_col,
              //   ),
              // ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: new DotsIndicator(
              dotsCount: images.length,
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
              "UNESCO-MARS 2020",
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
          Padding(
            padding: const EdgeInsets.only(right: 60, left: 60),
            child: Image.asset(
              "assets/newImages/flowers_footer.png",
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget pastEvents() {
    return Container(
      height: 340,
      // color: Colors.grey.shade800,
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: Swiper(
              onIndexChanged: (val) {
                setState(() {
                  _current = val;
                });
              },
              fade: 0.0,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(
                                  images[index],
                                ),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    // Container(
                    //     padding: EdgeInsets.only(bottom: 20),
                    //     decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.only(
                    //             bottomLeft: Radius.circular(10.0),
                    //             bottomRight: Radius.circular(10.0))),
                    //     child: ListTile(
                    //       // subtitle: Text("awesome image caption"),
                    //       title: Text(
                    //           "Online edition- Merck foundation Diabetes blue point program"),
                    //     ))
                  ],
                );
              },
              itemCount: images.length,
              viewportFraction: 0.7,
              layout: SwiperLayout.DEFAULT,
              scale: 0.9,
              // pagination: SwiperPagination(
              //   builder: new DotSwiperPaginationBuilder(
              //       color: Customcolor.ligthpink,
              //       activeColor: Customcolor.pink_col),
              // ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: new DotsIndicator(
              dotsCount: images.length,
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
          ListTile(
            // subtitle: Text("awesome image caption"),
            title: Text(
              "UNESCO-MARS 2020",
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
          Padding(
            padding: const EdgeInsets.only(right: 60, left: 60),
            child: Image.asset(
              "assets/newImages/flowers_footer.png",
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

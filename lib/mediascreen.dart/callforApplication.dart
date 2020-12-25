import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';

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
    "assets/images/slider1.jpg",
    "assets/images/slider2.jpg",
    "assets/images/slider1.jpg"
  ];
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Customcolor.background,
          elevation: 0.0,
          bottom: new TabBar(
            isScrollable: false,
            unselectedLabelColor: Customcolor.colorGrey,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: <Tab>[
              new Tab(
                //text: "Upcoming Events" ,
                child: Text(
                  "Upcoming Call for Application",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Customcolor.colorBlue,
                  ),
                ),
              ),
              new Tab(
                //  text: "Past Events",
                child: Text(
                  "Past Call \nfor Application",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Customcolor.colorBlue),
                ),
              ),
            ],
            controller: _tabController,
            indicatorColor: Customcolor.colorBlue,
          ),
        ),
      ),
      body: new TabBarView(
        children: <Widget>[upcomingEvents(), pastEvents()],
        controller: _tabController,
      ),
    );
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
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 5,
                        // color: Colors.red,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                // height: SizeConfig.blockSizeVertical * 40,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0)),
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
                            //     child: )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: images.length,
              viewportFraction: 0.9,
              layout: SwiperLayout.STACK,

              scale: 2,
              //outer: true,
              itemWidth: 300.0,
              //itemHeight: 400,
              itemHeight: 400,
              pagination: SwiperPagination(
                builder: new DotSwiperPaginationBuilder(
                    color: Colors.grey, activeColor: Customcolor.pink_col),
              ),
            ),
          ),
          ListTile(
            // subtitle: Text("awesome image caption"),
            title: Text(
              "UNESCO-MARS 2020",
              textAlign: TextAlign.center,
            ),
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
              fade: 0.0,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0)),
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/slider1.jpg",
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
              itemCount: 10,
              viewportFraction: 0.9,
              layout: SwiperLayout.STACK,
              scale: 2,
              //outer: true,
              itemWidth: 300.0,
              //itemHeight: 400,
              itemHeight: 400,
              pagination: SwiperPagination(
                builder: new DotSwiperPaginationBuilder(
                    color: Colors.grey, activeColor: Customcolor.pink_col),
              ),
            ),
          ),
          ListTile(
            // subtitle: Text("awesome image caption"),
            title: Text(
              "UNESCO-MARS 2020",
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:marquee/marquee.dart';
import 'package:merckfoundation22dec/ouraward.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/screens/ourvision/vision.dart';
import 'package:merckfoundation22dec/whatwedo/ourmission.dart';
import 'package:merckfoundation22dec/whatwedo/ourpolicy.dart';
import 'package:merckfoundation22dec/widget/customappbar.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/ourPrograms.dart';
import 'package:merckfoundation22dec/widget/customcard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/drawer.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';

import 'package:responsive_flutter/responsive_flutter.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class FlotingData {
  final String img;
  final String title;

  FlotingData({this.img, this.title});
}

class OurListModel {
  final Color bgCol;
  final String title;

  OurListModel({this.bgCol, this.title});
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  CarouselSlider carouselSlider;
  int _current = 0;
  int _current1 = 0;
  int currentIndex = 0;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  List _productsAvailable = [
    "assets/images/slider1.jpg",
    "assets/images/slider2.jpg",
    "assets/images/slider1.jpg",
    "assets/images/slider2.jpg"
  ];
  List _productsAvailable1 = [
    "assets/images/slider1.jpg",
    "assets/images/slider2.jpg",
  ];

  List<programclass> _ourlist = [
    //     programclass(
    // programname: "Our \nVision", colors: Customcolor.colorBlue),
    programclass(colors: Customcolor.pink_col, programname: "Our \nVision"),
    programclass(colors: Customcolor.green_col, programname: "Our \nPrograms"),
    programclass(
        colors: Customcolor.lightgreen_col, programname: "News \nArticles"),
    programclass(colors: Customcolor.violet_col, programname: "Our \nAwards"),
    programclass(
        colors: Customcolor.lightblue_col, programname: "Our \nMission"),
    programclass(
        colors: Customcolor.skyblue_col, programname: "Media \n& Events"),
    programclass(
        colors: Customcolor.darkblue_col, programname: "Covid \nResponse"),
    programclass(colors: Customcolor.orange_col, programname: "Our \nPolicies"),
  ];

  AnimationController _controller;
  bool iscall = true;
  bool islibrary = false;
  bool ismeck = false;
  double imgHeight = 50;
  bool expandClick = false;
  String expandedName = "Upcoming Events";

  final List<Tab> tabs = <Tab>[
    new Tab(text: "Call for Application"),
    new Tab(text: "Digital Library"),
    new Tab(text: "Merck More Than A Mother Ambassadors")
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        ShowDialogs.showConfirmDialog(
            context, "Exit", "Are you sure, want to exit?");
      },
      child: Scaffold(
        backgroundColor: Customcolor.background,
        key: _scaffoldKey,
        appBar: CustomAppBar(
          () {
            print("kk");
            _scaffoldKey.currentState.openDrawer();
          },
          1,
          height: 120,
        ),
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
          ),
          //child: null,
          child: AppDrawer(),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            //  crossAxisAlignment: CrossAxisAlignment.start,
            shrinkWrap: true,
            children: [
              slider(context),
              SizedBox(
                height: 10,
              ),
              _buildComplexMarquee(),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ourlist(),
              ),
              followUs(),
              //  newSlider(context),

              SizedBox(
                height: 12,
              ),
              CustomeCard(
                index: 1,
                cardImage: "assets/newImages/message.png",
                cardTitle:
                    "Message Form Dr.Rasha Kelej, CEO of Merck Foundation   ",
                titleColor: Customcolor.text_darkblue,
                titleImg: "assets/newImages/flowers-2.png",
                subTitle: "Message Form Dr.Rasha Kelej, on the inauguration...",
                buttontitle: "Read More ",
                buttontitlecolor: Customcolor.text_darkblue,
              ),
              SizedBox(
                height: 12,
              ),
              CustomeCard(
                index: 2,
                cardImage: "assets/newImages/mqdefault.png",
                cardTitle: "Our Stories   ",
                titleColor: Customcolor.text_darkblue,
                titleImg: "assets/newImages/flowers-2.png",
                subTitle: "Message Form Dr.Rasha Kelej, on the inauguration...",
                buttontitle: "Watch More ",
                onBtnTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Dashboard(
                                index: 2,
                              )));
                },
                buttontitlecolor: Customcolor.text_darkblue,
              ),

              SizedBox(
                height: 8,
              ),
              // RichText(
              //   text: TextSpan(
              //     children: [
              //       TextSpan(
              //         text:
              //             "Message Form Dr.Rasha Kelej, on the inauguration Message Form Dr.Rasha Kelej, on the inauguration...",
              //       ),
              //       WidgetSpan(
              //         child: Icon(Icons.add, size: 14),
              //       ),
              //     ],
              //   ),
              // ),
              CustomeCard(
                index: 3,
                cardImage: "assets/newImages/gallery.png",
                cardTitle: "Photo Gallery   ",
                titleColor: Customcolor.text_darkblue,
                titleImg: "assets/newImages/flowers-3.png",
                subTitle: "",
                buttontitle: "View More ",
                buttontitlecolor: Customcolor.text_darkblue,
              ),

              SizedBox(
                height: 8,
              ),

              Container(
                height: 450,
                child: Column(
                  children: [
                    TabBar(
                      isScrollable: true,
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: new BubbleTabIndicator(
                        indicatorHeight: 35.0,
                        indicatorRadius: 5,
                        indicatorColor: Customcolor.pinkbg.withOpacity(0.4),
                        tabBarIndicatorSize: TabBarIndicatorSize.tab,
                      ),
                      tabs: tabs,
                      controller: _tabController,
                    ),
                    Expanded(
                      flex: 3,
                      child: TabBarView(controller: _tabController, children: [
                        callforApplication(),
                        digitalLibrary(),
                        merckmorethanmother()
                      ]),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 10,
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
        ),
      ),
    );
  }

  Widget callforApplication() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
      ),
      child: Card(
        elevation: 5,
        // height: 1800,
        color: Colors.white,

        child: Padding(
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
            top: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                    expandedName,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  )),
                  GestureDetector(
                    onTap: () {
                      print("in tap");
                      setState(() {
                        expandClick = !expandClick;
                      });
                    },
                    child: Image.asset(
                      "assets/newImages/expand_more.png",
                      width: 30,
                      height: 30,
                    ),
                  )
                ],
              ),
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Swiper.children(
                        autoplay: false,
                        loop: true,
                        // pagination: SwiperPagination(
                        //   margin: EdgeInsets.only(
                        //     right: 25.0,
                        //   ),
                        //   builder: DotSwiperPaginationBuilder(
                        //       color: Colors.grey),
                        // ),
                        control: SwiperControl(
                            iconNext: Icons.arrow_forward_ios,
                            iconPrevious: Icons.arrow_back_ios,
                            size: 20,
                            color: Customcolor.darkblue_col),
                        children: <Widget>[
                          Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                    right: 40.0,
                                    left: 30,
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        "assets/newImages/cfa1.png",
                                        height: 270,
                                        fit: BoxFit.fill,
                                      ))),
                              SizedBox(
                                height: 10,
                              ),
                              Text("UNESCO-MARS 2020",
                                  style: TextStyle(
                                    fontSize: 17,
                                  ))
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                    right: 40.0,
                                    left: 30,
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        "assets/newImages/poster_4.png",
                                        height: 300,
                                        fit: BoxFit.fill,
                                      ))),
                              SizedBox(
                                height: 8,
                              ),
                              Text("UNESCO-MARS 2020",
                                  style: TextStyle(
                                    fontSize: 17,
                                  ))
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                    right: 40.0,
                                    left: 30,
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        "assets/newImages/poster_6.png",
                                        height: 300,
                                        fit: BoxFit.fill,
                                      ))),
                              SizedBox(
                                height: 8,
                              ),
                              Text("UNESCO-MARS 2020",
                                  style: TextStyle(
                                    fontSize: 17,
                                  ))
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                    right: 40.0,
                                    left: 30,
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        "assets/newImages/cfa1.png",
                                        height: 300,
                                        fit: BoxFit.fill,
                                      ))),
                              SizedBox(
                                height: 8,
                              ),
                              Text("UNESCO-MARS 2020",
                                  style: TextStyle(
                                    fontSize: 17,
                                  ))
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                    right: 40.0,
                                    left: 30,
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        "assets/newImages/poster_4.png",
                                        height: 300,
                                        fit: BoxFit.fill,
                                      ))),
                              SizedBox(
                                height: 8,
                              ),
                              Text("UNESCO-MARS 2020",
                                  style: TextStyle(
                                    fontSize: 17,
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    expandClick
                        ? Container(
                            height: 130,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 10, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          expandClick = false;
                                          expandedName = "Upcoming Events";
                                        });
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        width: SizeConfig.blockSizeHorizontal *
                                            100,
                                        child: Text(
                                          "Upcoming Events",
                                          style: TextStyle(
                                            color: Customcolor.colorblack,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      height: 1,
                                      color: Customcolor.colorblack
                                          .withOpacity(0.4),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          expandClick = false;
                                          expandedName = "Past Events";
                                        });
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        width: SizeConfig.blockSizeHorizontal *
                                            100,
                                        child: Text(
                                          "Past Events",
                                          style: TextStyle(
                                            color: Customcolor.colorblack,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Container()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget digitalLibrary() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
      ),
      child: Card(
        elevation: 5,
        // height: 1800,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
          child: Swiper.children(
            autoplay: false,
            loop: true,
            control: SwiperControl(
                iconNext: Icons.arrow_forward_ios,
                iconPrevious: Icons.arrow_back_ios,
                size: 20,
                color: Customcolor.darkblue_col),
            children: <Widget>[
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                        right: 40.0,
                        left: 30,
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            "assets/newImages/cfa1.png",
                            height: 300,
                            fit: BoxFit.fill,
                          ))),
                  SizedBox(
                    height: 8,
                  ),
                  Text("UNESCO-MARS 2020",
                      style: TextStyle(
                        fontSize: 17,
                      ))
                ],
              ),
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                        right: 40.0,
                        left: 30,
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            "assets/newImages/poster_4.png",
                            height: 300,
                            fit: BoxFit.fill,
                          ))),
                  SizedBox(
                    height: 8,
                  ),
                  Text("UNESCO-MARS 2020",
                      style: TextStyle(
                        fontSize: 17,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget merckmorethanmother() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
      ),
      child: Card(
        elevation: 5,
        // height: 1800,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
          child: Swiper.children(
            autoplay: false,
            loop: true,
            control: SwiperControl(
                iconNext: Icons.arrow_forward_ios,
                iconPrevious: Icons.arrow_back_ios,
                size: 20,
                color: Customcolor.darkblue_col),
            children: <Widget>[
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                        right: 40.0,
                        left: 30,
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            "assets/newImages/cfa1.png",
                            height: 300,
                            fit: BoxFit.fill,
                          ))),
                  SizedBox(
                    height: 8,
                  ),
                  Text("UNESCO-MARS 2020",
                      style: TextStyle(
                        fontSize: 17,
                      ))
                ],
              ),
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                        right: 40.0,
                        left: 30,
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            "assets/newImages/poster_4.png",
                            height: 300,
                            fit: BoxFit.fill,
                          ))),
                  SizedBox(
                    height: 8,
                  ),
                  Text("UNESCO-MARS 2020",
                      style: TextStyle(
                        fontSize: 17,
                      ))
                ],
              ),
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                        right: 40.0,
                        left: 30,
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            "assets/newImages/poster_6.png",
                            height: 300,
                            fit: BoxFit.fill,
                          ))),
                  SizedBox(
                    height: 8,
                  ),
                  Text("UNESCO-MARS 2020",
                      style: TextStyle(
                        fontSize: 17,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget slider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 8),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: carouselSlider = CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1.0,
                    height: 170,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                  items: _productsAvailable.map((product) {
                    return new Builder(
                      builder: (BuildContext context) {
                        return new Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: AssetImage(product),
                                  fit: BoxFit.cover)),
                          width: SizeConfig.blockSizeHorizontal * 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 0, bottom: 15),
                                child: Container(
                                  color: Colors.white.withOpacity(0.5),
                                  width: SizeConfig.blockSizeHorizontal * 100,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 5, bottom: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        FormLabel(
                                          text:
                                              "Merck Capacity Advancement & Diabetes Blue Point Program",
                                          labelColor: Customcolor.pink_col,
                                          fontSize:
                                              ResponsiveFlutter.of(context)
                                                  .fontSize(1.4),
                                          maxLines: 2,
                                          fontweight: FontWeight.w700,
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        FormLabel(
                                          text:
                                              "Building nationwide Diabetes Care Capacity",
                                          labelColor: Customcolor.pink_col,
                                          fontSize:
                                              ResponsiveFlutter.of(context)
                                                  .fontSize(1.2),
                                          fontweight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              // new DotsIndicator(
              //   dotsCount: _productsAvailable.length,
              //   position: double.parse("$_current"),
              //   decorator: DotsDecorator(
              //     size: const Size.square(9.0),
              //     activeSize: const Size(18.0, 9.0),
              //     activeColor: Customcolor.colorBlue,
              //     activeShape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(5.0)),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMarquee() {
    return Container(
      height: 20,
      child: Marquee(
        text: 'There once was a boy who told this story about a boy: "',
      ),
    );
  }

  Widget followUs() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 15),
      child: Container(
          child: Column(
        children: [
          Row(
            children: [
              Text("Follow Us on",
                  style: TextStyle(
                      fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
                      fontWeight: FontWeight.w700,
                      color: Customcolor.text_blue)),
              SizedBox(
                width: 8,
              ),
              Image.asset(
                "assets/newImages/flowers-1.png",
                height: 40,
                width: 40,
              )
            ],
          ),
          Row(
            children: [
              Image.asset(
                "assets/newImages/instagram.png",
                height: imgHeight,
                width: imgHeight,
              ),
              SizedBox(
                width: 7,
              ),
              Image.asset(
                "assets/newImages/facebook.png",
                height: imgHeight,
                width: imgHeight,
              ),
              SizedBox(
                width: 7,
              ),
              Image.asset(
                "assets/newImages/twitter.png",
                height: imgHeight,
                width: imgHeight,
              ),
              SizedBox(
                width: 7,
              ),
              Image.asset(
                "assets/newImages/youtube.png",
                height: imgHeight,
                width: imgHeight,
              ),
              SizedBox(
                width: 7,
              ),
              Image.asset(
                "assets/newImages/flickr.png",
                height: imgHeight,
                width: imgHeight,
              ),
              SizedBox(
                width: 7,
              ),
            ],
          )
        ],
      )),
    );
  }

  Widget _buildComplexMarquee() {
    return Container(
      height: 30,
      child: Marquee(
        text:
            'Call for Application-UNESCO MARS 2020          Savethe Date-Merck Foundation "Stay at home" Media recognization award 2020-online edtion for africa and latin america',
        style: TextStyle(
            fontWeight: FontWeight.w700, color: Customcolor.text_blue),
        scrollAxis: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        blankSpace: 20.0,
        velocity: 100.0,
        pauseAfterRound: Duration(seconds: 1),
        showFadingOnlyWhenScrolling: true,
        fadingEdgeStartFraction: 0.1,
        fadingEdgeEndFraction: 0.1,
        numberOfRounds: null,
        startPadding: 10.0,
        accelerationDuration: Duration(seconds: 1),
        accelerationCurve: Curves.linear,
        decelerationDuration: Duration(milliseconds: 500),
        decelerationCurve: Curves.easeOut,
      ),
    );
  }

  Widget _wrapWithStuff(Widget child) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(height: 50.0, color: Colors.white, child: child),
    );
  }

  Widget newSlider(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              child: carouselSlider = CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  height: 350,
                  autoPlay: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current1 = index;
                    });
                  },
                ),
                items: _productsAvailable1.map((product) {
                  return new Builder(
                    builder: (BuildContext context) {
                      return new GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          4,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/logo_nav1.png"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            new DotsIndicator(
              dotsCount: _productsAvailable1.length,
              position: double.parse("$_current1"),
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeColor: Customcolor.colorBlue,
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget ourlist() {
    print(_ourlist.length);

    return Container(
        height: 100,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _ourlist.length,
            itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.only(right: 0.0, left: 8),
                child: GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    OurVision()));
                      } else if (index == 1) {
                        //our program
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Dashboard(
                                      index: 1,
                                    )));
                      } else if (index == 2) {
                        //news article
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Dashboard(
                                      index: 3,
                                    )));
                      } else if (index == 3) {
                        //our award
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Ouraward()));
                      } else if (index == 4) {
                        //our mission
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    OurMission()));
                      } else if (index == 5) {
                        //media & events
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) => Dashboard(
                        //               index: 4,
                        //             )));
                      } else if (index == 6) {
                        //covid response
                      } else if (index == 7) {
                        //our polcies
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    OurPolicy()));
                      }
                    },
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: _ourlist[index].colors,
                      ),
                      child: Center(
                          child: Text(
                        _ourlist[index].programname,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                        ),
                      )),
                    )))));
  }
}

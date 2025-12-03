// ignore_for_file: unused_field, cancel_subscriptions, missing_return, unused_element, unnecessary_brace_in_string_interps, unused_import

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:marquee/marquee.dart';
import 'package:merckfoundation22dec/ViewmoremmtmAmbassadar.dart';
import 'package:merckfoundation22dec/WatchDigitalLibrary.dart';
import 'package:merckfoundation22dec/mediascreen.dart/NotificationDetailPage.dart';
import 'package:merckfoundation22dec/mediascreen.dart/merckFoundationMedia.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videolibray.dart';
import 'package:merckfoundation22dec/model/GettokenResponse.dart';
import 'package:merckfoundation22dec/model/HomepageResponse.dart';
import 'package:merckfoundation22dec/model/homeheader.dart';
import 'package:merckfoundation22dec/ouraward.dart';
import 'package:merckfoundation22dec/screens/Episodeseason.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/photo_gallery.dart';
import 'package:merckfoundation22dec/Homescreenceo.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/ourPrograms.dart';
import 'package:merckfoundation22dec/screens/ourvision/vision.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/model/Merckoverview.dart';
import 'package:merckfoundation22dec/model/yearwisephotogallery.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/SPManager.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/whatwedo/ourmission.dart';
import 'package:merckfoundation22dec/whatwedo/ourpolicy.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customappbar.dart';
import 'package:merckfoundation22dec/widget/customcard.dart';
import 'package:merckfoundation22dec/widget/customcardepisode.dart';
import 'package:merckfoundation22dec/widget/customcardforTestimonial.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/drawer.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:merckfoundation22dec/widget/slidercontainer.dart';
import 'package:merckfoundation22dec/utility/ResponsiveFlutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Testimonailprogramdetailpage.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Testimonailprogramviewmore.dart';
import 'package:intl/intl.dart';
import 'package:merckfoundation22dec/viewmorehomeceo.dart';
import 'package:merckfoundation22dec/covid/CovidResponse.dart';

class Staticlistclass {
  final String? imagename;

  Staticlistclass({this.imagename});
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class FlotingData {
  final String? img;
  final String? title;

  FlotingData({this.img, this.title});
}

class OurListModel {
  final Color? bgCol;
  final String? title;

  OurListModel({this.bgCol, this.title});
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late CarouselSlider carouselSlider;
  int _current = 0;
  int _current1 = 0;
  int currentIndex = 0;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  Map<dynamic, dynamic> mapsection = {};
  List<dynamic> slidersection = [];
  Map<dynamic, dynamic> videosection = {};
  List _productsAvailable = [];
  List typewidetofbottomsection = [];
  bool isbottomSectionLoaded = false;
  List _productsAvailable1 = [
    "assets/images/slider1.jpg",
    "assets/images/slider2.jpg",
  ];
  List typewidet = [];
  List typewidetofrightsection = [];
  List<programclass> _ourlist = [
    //     programclass(
    // programname: "Our \nVision", colors: Customcolor.colorBlue),
    programclass(colors: Customcolor.pink_col, programname: "Our \nVision"),
    programclass(colors: Customcolor.green_col, programname: "Our \nPrograms"),
    programclass(
        colors: Customcolor.prog6,
        programname: "Our Africa \nby Merck Foundation \n(TV Program)"),
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
  List<Staticlistclass> _ourstaticlist = [
    Staticlistclass(imagename: 'assets/newImages/Ambassador_st.png'),
    Staticlistclass(imagename: 'assets/newImages/Scholarships.png'),
    Staticlistclass(imagename: 'assets/newImages/Ministera_st.png'),
    Staticlistclass(imagename: 'assets/newImages/media.png'),
    Staticlistclass(imagename: 'assets/newImages/Songs_st.png'),
    Staticlistclass(imagename: 'assets/newImages/StoryBooks_st.png'),
    Staticlistclass(imagename: 'assets/newImages/Animation_st.png'),
    Staticlistclass(imagename: 'assets/newImages/schoolgirl_st.png'),
    Staticlistclass(imagename: 'assets/newImages/SocialMedia_st.png'),
  ];
  
  late AnimationController _controller;
  final CarouselSliderController callAppCarouselController =
      CarouselSliderController();
  final CarouselSliderController digitalLibraryCarouselController =
      CarouselSliderController();
  final CarouselSliderController mmtmCarouselController =
      CarouselSliderController();
  bool iscall = true;
  bool islibrary = false;
  bool ismeck = false;
  double imgHeight = 50;
  double imgfbHeight = 40;
  bool expandClick = false;
  String expandedName = "Upcoming Events";
  bool isMiddleSectionLoaded = false;
  bool isrightSectionLoaded = false;
  bool issliderSectionLoaded = false;
  final List<Tab> tabs = <Tab>[];
  List events = ["Upcoming Events", "Past Events"];
  TabController? _tabController;
  List<Widget> listofwiget = [];
  List<Widget> listoftabwiget = [];
  Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  ConnectivityResult? stats;
  late DateTime? _todaysDate;
  var todayformatdate;
  List<Widget> listofbottomwiget = [];
  List<dynamic> yearwisephotlist = [];
  @override
  void initState() {
    super.initState();
    SPManager().setAuthToken("token");
    _todaysDate = DateTime.now();
    todayformatdate = DateFormat('yyyy-MM-dd').format(_todaysDate!);
    print(todayformatdate);
    print("ho");
    // _connectivity.checkConnectivity().then((value) {
    //   stats = value;
    //   print(stats);
    //   if (stats != ConnectivityResult.none) {
    //     // gethomeapi();
    //     // exit(code)\
    //     _connectivitySubscription = Connectivity()
    //         .onConnectivityChanged
    //         .listen((ConnectivityResult result) {
    //       print(result);
    //       // Got a new connectivity status!
    //       setState(() {
    //         print("hi");
    //         gethomeapi();
    //       });
    //     });
    //   }
    // });
    gettokenapi();
    getheader();
    gethomeapi();
    getmerckoverview();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    _tabController!.dispose();
    //  _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          ShowDialogs.showConfirmDialog(
              context, "Exit", "Are you sure, want to exit?");
          return false;
        },
        child: Scaffold(
          backgroundColor: Customcolor.background,
          key: _scaffoldKey,
          appBar: CustomAppBar(
            () {
              print("kk");
              _scaffoldKey.currentState!.openDrawer();
            },
            1,
            height: 120,
          ),
          // bottomNavigationBar: Bottomcardlink(),
          drawer: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.transparent,
            ),
            //child: null,
            child: AppDrawer(),
          ),
          // bottomNavigationBar: Container(
          //   child: Text(
          //     "© Merck Foundation is a German non-profit organization with limited liability, established in 31 May 2017",
          //   ),
          // ),
          body:
              //  Container(
              //   padding: EdgeInsets.all(20.0),
              //   child: FutureBuilder(
              //       future: gethomeapi(),
              //       builder: (context, snapshot) {
              //         if (snapshot.hasData) {
              //           return ListView(children: list());
              //         } else {
              //           return CircularProgressIndicator();
              //         }
              //       }),
              // ),
              Container(
            width: double.infinity,
            height: double.infinity,
            child: ListView(
              //  crossAxisAlignment: CrossAxisAlignment.start,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                Visibility(
                  visible: issliderSectionLoaded,
                  replacement: Center(child: Container()),
                  child: slider(context),
                ),
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
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (BuildContext context) => NotiDetailpage(
                              //               id: "10",
                              //             )));
                            },
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 90,
                              child: Text("Follow Senator, Dr. Rasha Kelej",
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: ResponsiveFlutter.of(context)
                                          .fontSize(2.2),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: AppFonts.normal,
                                      color: Customcolor.text_blue)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              Platform.isAndroid
                                  ? ShowDialogs.followuslink(
                                      Constantstring.followrashainsta,
                                      Constantstring.followmsg)
                                  : ShowDialogs.launchInstagram(
                                      Constantstring.followrashainsta,
                                      "merckfoundation");
                            },
                            child: Image.asset(
                              "assets/newImages/instagram.png",
                              height: imgHeight,
                              width: imgHeight,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () async {
                              print(Constantstring.followrashafacebook);
                              // Platform.isAndroid
                              //     ? ShowDialogs.followuslink(
                              //         Constantstring.followfacebook,
                              //         Constantstring.followmsg):
                              // ShowDialogs.launchFacebook(
                              //     Constantstring.followrashafacebook,
                              //     "1053979038068008");
                              ShowDialogs.launchFacebook(
                                  Constantstring.followrashafacebook,
                                  "550280998481446");
                            },
                            child: Image.asset(
                              "assets/newImages/facebooknew.png",
                              height: imgHeight,
                              width: imgHeight,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () async {
                              Platform.isAndroid
                                  ? ShowDialogs.followuslink(
                                      Constantstring.followrashatwitter,
                                      Constantstring.followmsg)
                                  : ShowDialogs.launchTwitter(
                                      Constantstring.followrashatwitter);
                            },
                            child: Image.asset(
                              "assets/newImages/twitternew.png",
                              height: imgHeight,
                              width: imgHeight,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () async {
                              print("youtube");
                              Platform.isAndroid
                                  ? ShowDialogs.followuslink(
                                      Constantstring.followerashayoutube,
                                      Constantstring.followmsg)
                                  : ShowDialogs.youtubevideolink(
                                      Constantstring.followerashayoutube);
                            },
                            child: Image.asset(
                              "assets/newImages/youtube.png",
                              height: imgHeight,
                              width: imgHeight,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () async {
                              Platform.isAndroid
                                  ? ShowDialogs.followuslink(
                                      Constantstring.followrashaflicker,
                                      Constantstring.followmsg)
                                  : ShowDialogs.launchURL(
                                      Constantstring.followrashaflicker);
                            },
                            child: Image.asset(
                              "assets/newImages/flickr.png",
                              height: imgHeight,
                              width: imgHeight,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () async {
                              ShowDialogs.openThreadsApp(
                                  Constantstring.followthreasrasha);
                            },
                            child: Image.asset(
                              "assets/newImages/threads.png",
                              height: imgfbHeight,
                              width: imgfbHeight,
                            ),
                          ),
                          // GestureDetector(
                          //   onTap: () async {
                          //     Platform.isAndroid
                          //         ? ShowDialogs.followuslink(
                          //             Constantstring.followflicker,
                          //             Constantstring.followmsg)
                          //         : ShowDialogs.launchURL(
                          //             Constantstring.followflicker);
                          //   },
                          //   child: Image.asset(
                          //     "assets/newImages/flickr.png",
                          //     height: imgHeight,
                          //     width: imgHeight,
                          //   ),
                          // ),
                          // SizedBox(
                          //   width: 7,
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Impact of Merck Foundation Programs\n",
                          style: TextStyle(
                              color: Customcolor.textsubtitlecolor,
                              fontSize: ResponsiveFlutter.of(context)
                                  .fontSize(2.1), //20,
                              fontWeight: FontWeight.w300,
                              fontFamily: AppFonts.normalnew),
                        ),
                        TextSpan(
                          text: "(as of June 2025)",
                          style: TextStyle(
                            color: Customcolor.pink_col,
                            fontSize: ResponsiveFlutter.of(context)
                                .fontSize(2.1), //20,
                            fontFamily: AppFonts.normalnew,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // WidgetSpan(
                        //   alignment: PlaceholderAlignment.bottom,
                        //   child: Image.asset(
                        //     //  widget.titleImg,
                        //     "",
                        //     width: 40,
                        //     height: 25,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                ourstaticlist(),
                SizedBox(
                  height: 12,
                ),
                Visibility(
                  visible: isMiddleSectionLoaded,
                  replacement: (isMiddleSectionLoaded == false &&
                          stats.toString() ==
                              ConnectivityResult.none.toString())
                      ? CircularProgressIndicator()
                      : (isMiddleSectionLoaded == false &&
                              stats.toString() !=
                                  ConnectivityResult.none.toString())
                          ? Center(child: CircularProgressIndicator())
                          : Container(
                              width: 200,
                              height: 200,
                              color: Colors.green,
                            ),
                  child: ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      // scrollDirection: Axis.horizontal,
                      children: list()),
                ),

                SizedBox(
                  height: 12,
                ),
                Visibility(
                    visible: isbottomSectionLoaded,
                    replacement: Center(child: Container()),
                    child: ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      // scrollDirection: Axis.horizontal,
                      children: listbottomwidget(),
                    )),
                SizedBox(
                  height: 12,
                ),
                Visibility(
                  visible: isrightSectionLoaded,
                  replacement: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container()
                    ],
                  ),
                  child: Container(
                    height: Constantstring.tabheight,
                    //color: Colors.amber,
                    child: Column(
                      children: [
                        TabBar(
                          isScrollable: true,
                          unselectedLabelColor: Colors.white,
                          labelColor: Colors.black,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorWeight: 0,
                          indicator: new BubbleTabIndicator(

                            indicatorHeight: 35.0,
                            indicatorRadius: 5,
                            indicatorColor: Customcolor.pinkbg.withOpacity(0.4),
                            tabBarIndicatorSize: TabBarIndicatorSize.tab,
                          ),
                          tabs: tabs,
                          controller: _tabController,
                        ),
//                         Material(
//   color: Customcolor.background,
//   elevation: 0,
//   child: Container(
//     padding: EdgeInsets.zero, // removes any extra spacing
//     margin: EdgeInsets.zero,
//     decoration: BoxDecoration(
//       color: Customcolor.background,
//       border: Border(
//         bottom: BorderSide.none,
//       ),
//     ),
//     child: TabBar(
//       controller: _tabController,
//       isScrollable: true,
//       indicatorPadding: EdgeInsets.zero,
//       labelPadding: EdgeInsets.symmetric(horizontal: 12), // Adjust if needed
//       unselectedLabelColor: Colors.black54,
//       labelColor: Colors.black,
//       indicatorSize: TabBarIndicatorSize.tab,
//       indicatorWeight: 0,
//       indicator: BubbleTabIndicator(
//         indicatorHeight: 35.0,
//         indicatorRadius: 5,
//         indicatorColor: Customcolor.pinkbg.withOpacity(0.4),
//         tabBarIndicatorSize: TabBarIndicatorSize.tab,
//       ),
//       tabs: tabs,
//     ),
//   ),
// ),

                        // Material(
                        //   color: Customcolor.background,
                        //   elevation: 0, // removes default drop shadow
                        //   shadowColor: Colors.transparent, // just in case
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       //  color: Colors.grey, 
                        //          color: Customcolor.background,
                        //       border: Border(
                        //         bottom: BorderSide.none,
                        //       ),
                              
                        //     ),
                        //     child: TabBar(
                        //       indicatorPadding: EdgeInsets.all(0),
                        //       //automaticIndicatorColorAdjustment: false,
                        //       isScrollable: true,
                        //       unselectedLabelColor:Customcolor.background,
                        //       labelColor: Colors.black,
                        //       indicatorSize: TabBarIndicatorSize.tab,
                        //       indicatorWeight: 0,
                        //       indicator: BubbleTabIndicator(
                        //         indicatorHeight: 35.0,
                        //         indicatorRadius: 5,
                        //         indicatorColor:
                        //             Customcolor.pinkbg.withOpacity(0.4),
                        //         tabBarIndicatorSize: TabBarIndicatorSize.tab,
                        //       ),
                        //       tabs: tabs,
                        //       controller: _tabController,
                        //     ),
                        //   ),
                        // ),
                      
                        Expanded(
                          flex: 3,
                          child: TabBarView(
                              physics: ScrollPhysics(),
                              controller: _tabController,
                              children: tablist()
                              // callforApplication(),
                              // digitalLibrary(),
                              // merckmorethanmother()
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 60, left: 60),
                //   child: Image.asset(
                //     "assets/newImages/flowers_footer.png",
                //   ),
                // ),

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
                // Container(
                //   child: Text(
                //     "© Merck Foundation is a German non-profit organization with limited liability, established in 31 May 2017",
                //     style:
                //         TextStyle(color: Customcolor.colorBlue, fontSize: 12),
                //     textAlign: TextAlign.center,
                //   ),
                // ),
              ],
            ),
          ),
        ));
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
              Expanded(child: getcallforapp(context))
            ],
          ),
        ),
      ),
    );
  }

  Widget getcallforapp(BuildContext context) {
    return Stack(
      children: <Widget>[
        GlobalLists.homecallforapp.length <= 0
            ? Container(
                child: Center(child: Text(Constantstring.emptyData)),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    //color: Colors.amber,
                    width: SizeConfig.blockSizeHorizontal * 100,
                    // height: 590,
                    color: Colors.white,
                    child: Column(
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.all(10.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Expanded(
                        //           child: Text(
                        //         expandedName,
                        //         style: TextStyle(
                        //             fontSize: 18,
                        //             fontWeight: FontWeight.w700,
                        //             color: Colors.black),
                        //       )),
                        //       GestureDetector(
                        //         onTap: () {
                        //           print("in tap");
                        //           setState(() {
                        //             expandClick = !expandClick;
                        //           });
                        //         },
                        //         child: Image.asset(
                        //           "assets/newImages/expand_more.png",
                        //           width: 30,
                        //           height: 30,
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        //  expandClick ? eventDropdown() : Container(),
                        SizedBox(
                          height: 10,
                        ),
                        carouselSlider = CarouselSlider(
                          options: CarouselOptions(
                              autoPlay: false,
                              // aspectRatio: 0.1,
                              enlargeCenterPage: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                              viewportFraction: 1.0,
                              height: Constantstring.callcoursaheight,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current1 = index;
                                });
                              }),
                          items: GlobalLists.homecallforapp.map((product) {
                            return new Builder(
                              builder: (BuildContext context) {
                                return GestureDetector(
                                  onTap: () {
                                    print(GlobalLists.homeCallForAppBaseURL +
                                        product.pdfFile);
                                    if (product.pdfFile.contains("pdf")) {
                                      ShowDialogs.launchURL(
                                          GlobalLists.homeCallForAppPDFURL +
                                              product.pdfFile);
                                    } else {
                                      ShowDialogs.launchURL(
                                          GlobalLists.homeCallForAppBaseURL +
                                              product.pdfFile);
                                    }
                                  },
                                  child: ListView(
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: FadeInImage.assetNetwork(
                                          placeholder:
                                              'assets/newImages/placeholder_3.jpg',
                                          image: GlobalLists
                                                          .homeCallForAppBaseURL +
                                                      product.appImg ==
                                                  null
                                              ? "assets/newImages/placeholder_3.jpg"
                                              : GlobalLists
                                                      .homeCallForAppBaseURL +
                                                  product.appImg,
                                          fit: BoxFit.fill,
                                          width: Constantstring.callimagewidth,
                                          height:
                                              Constantstring.callimageheight,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: (product.title!) == null
                                            ? Container()
                                            : Text(product.title!,
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontFamily:
                                                        AppFonts.normal)),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          }).toList(),
                          carouselController: callAppCarouselController,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Dashboard(
                                              index: 4,
                                            )));
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (BuildContext context) =>
                                //             CallforApplication(
                                //               apiurl: API.watchcallhome,
                                //             )));
                              },
                              child: Container(
                                width: 120,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Text(
                                    "View All",
                                    style: TextStyle(
                                        color: Customcolor.colorBlue,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
        Positioned(
          top: 140,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      goTocallPrevious();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Customcolor.text_darkblue,
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      goTocallNext();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Customcolor.text_darkblue,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getdigitallib(BuildContext context) {
    return Stack(
      children: <Widget>[
        GlobalLists.homedigitallib.length <= 0
            ? Container(
                child: Center(child: Text(Constantstring.emptyData)),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    //color: Colors.amber,
                    width: SizeConfig.blockSizeHorizontal * 100,
                    // height: 590,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        carouselSlider = CarouselSlider(
                          options: CarouselOptions(
                              autoPlay: false,
                              // aspectRatio: 0.1,
                              enlargeCenterPage: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                              viewportFraction: 1.0,
                              height: Constantstring.callcoursaheight,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current1 = index;
                                });
                              }),
                          items: GlobalLists.homedigitallib.map((product) {
                            return new Builder(
                              builder: (BuildContext context) {
                                return GestureDetector(
                                  onTap: () {
                                    ShowDialogs.launchURL(
                                        GlobalLists.homeDigitalLibraryPdfURL +
                                            product.document);
                                  },
                                  child: ListView(
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: FadeInImage.assetNetwork(
                                          placeholder:
                                              'assets/newImages/placeholder_3.jpg',
                                          image: GlobalLists
                                                  .homeDigitalLibraryBaseURL +
                                              product.image,
                                          fit: BoxFit.fill,
                                          width: Constantstring.callimagewidth,
                                          height:
                                              Constantstring.callimageheight,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: product.title == null
                                            ? Container()
                                            : Text(product.title,
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontFamily:
                                                        AppFonts.normal)),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          }).toList(),
                          carouselController: digitalLibraryCarouselController,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            WatchDigitalLibrary(
                                              apiurl: API.digitalhome,
                                              digitallink: Constantstring
                                                  .sharedigitalhome,
                                            )));
                              },
                              child: Container(
                                width: 120,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Text(
                                    "View All",
                                    style: TextStyle(
                                        color: Customcolor.colorBlue,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
        Positioned(
          top: 140,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      goTodigitalPrevious();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Customcolor.text_darkblue,
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      goTodigitalNext();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Customcolor.text_darkblue,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getMMTMS(BuildContext context) {
    return Stack(
      children: <Widget>[
        GlobalLists.homemmtm.length <= 0
            ? Container(
                child: Center(child: Text(Constantstring.emptyData)),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Container(
                    //color: Colors.amber,
                    width: SizeConfig.blockSizeHorizontal * 100,
                    // height: 590,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        carouselSlider = CarouselSlider(
                          options: CarouselOptions(
                              autoPlay: false,
                              // aspectRatio: 0.1,
                              enlargeCenterPage: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                              viewportFraction: 1.0,
                              height: Constantstring.callcoursaheight,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current1 = index;
                                });
                              }),
                          items: GlobalLists.homemmtm.map((product) {
                            return new Builder(
                              builder: (BuildContext context) {
                                return ListView(
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: FadeInImage.assetNetwork(
                                        placeholder:
                                            'assets/newImages/placeholder_3.jpg',
                                        image: GlobalLists.homeMMTMBaseURL +
                                            product.photo,
                                        fit: BoxFit.fill,
                                        width: Constantstring
                                            .callAmbassadarimagewidth,
                                        height: Constantstring.callimageheight,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: product.photoDescription == null
                                          ? Container()
                                          : Text(product.photoDescription!,
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontFamily: AppFonts.normal)),
                                    )
                                  ],
                                );
                              },
                            );
                          }).toList(),
                          carouselController: mmtmCarouselController,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ViewmoremmtmAmbassadar(
                                              apiurl: API.watchhomemmtm,
                                              sharelink: Constantstring
                                                  .sharemmtmambassadarhome,
                                            )));
                              },
                              child: Container(
                                width: 120,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Text(
                                    "View All",
                                    style: TextStyle(
                                        color: Customcolor.colorBlue,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
        Positioned(
          top: 140,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      goTommtmPrevious();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Customcolor.text_darkblue,
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      goTommtmNext();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Customcolor.text_darkblue,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget digitalLibraryLastSection() {
    return getdigitallib(context);
  }

  goTommtmPrevious() {
    mmtmCarouselController.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goTommtmNext() {
    mmtmCarouselController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }

  goTodigitalPrevious() {
    digitalLibraryCarouselController.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goTodigitalNext() {
    digitalLibraryCarouselController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }

  goTocallPrevious() {
    callAppCarouselController.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goTocallNext() {
    callAppCarouselController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }

  // Widget digitalLibrary() {
  //   return Padding(
  //     padding: const EdgeInsets.only(
  //       left: 10,
  //       right: 10,
  //       top: 10,
  //     ),
  //     child: Card(
  //       elevation: 5,
  //       // height: 1800,
  //       color: Colors.white,
  //       child: Padding(
  //         padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
  //         child: Swiper.children(
  //           autoplay: false,
  //           loop: true,
  //           control: SwiperControl(
  //               iconNext: Icons.arrow_forward_ios,
  //               iconPrevious: Icons.arrow_back_ios,
  //               size: 20,
  //               color: Customcolor.darkblue_col),
  //           children: <Widget>[
  //             Column(
  //               children: [
  //                 Container(
  //                     margin: EdgeInsets.only(
  //                       right: 40.0,
  //                       left: 30,
  //                     ),
  //                     child: ClipRRect(
  //                         borderRadius: BorderRadius.circular(5.0),
  //                         child: Image.asset(
  //                           "assets/newImages/cfa1.png",
  //                           height: 300,
  //                           fit: BoxFit.fill,
  //                         ))),
  //                 SizedBox(
  //                   height: 8,
  //                 ),
  //                 Text("UNESCO-MARS 2020",
  //                     style: TextStyle(
  //                       fontSize: 17,
  //                     ))
  //               ],
  //             ),
  //             Column(
  //               children: [
  //                 Container(
  //                     margin: EdgeInsets.only(
  //                       right: 40.0,
  //                       left: 30,
  //                     ),
  //                     child: ClipRRect(
  //                         borderRadius: BorderRadius.circular(5.0),
  //                         child: Image.asset(
  //                           "assets/newImages/poster_4.png",
  //                           height: 300,
  //                           fit: BoxFit.fill,
  //                         ))),
  //                 SizedBox(
  //                   height: 8,
  //                 ),
  //                 Text("UNESCO-MARS 2020",
  //                     style: TextStyle(
  //                       fontSize: 17,
  //                     ))
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Stream<bool> _bids = (() async* {
    print("print");
    await Future<void>.delayed(Duration(seconds: 1));
    yield await ConnectionDetector.checkInternetConnection();
    await Future<void>.delayed(Duration(seconds: 1));
  })();

  // Widget merckmorethanmother() {
  //   return Padding(
  //     padding: const EdgeInsets.only(
  //       left: 10,
  //       right: 10,
  //       top: 10,
  //     ),
  //     child: Card(
  //       elevation: 5,
  //       // height: 1800,
  //       color: Colors.white,
  //       child: Padding(
  //         padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
  //         child: Swiper.children(
  //           autoplay: false,
  //           loop: true,
  //           control: SwiperControl(
  //               iconNext: Icons.arrow_forward_ios,
  //               iconPrevious: Icons.arrow_back_ios,
  //               size: 20,
  //               color: Customcolor.darkblue_col),
  //           children: <Widget>[
  //             Column(
  //               children: [
  //                 Container(
  //                     margin: EdgeInsets.only(
  //                       right: 40.0,
  //                       left: 30,
  //                     ),
  //                     child: ClipRRect(
  //                         borderRadius: BorderRadius.circular(5.0),
  //                         child: Image.asset(
  //                           "assets/newImages/cfa1.png",
  //                           height: 300,
  //                           fit: BoxFit.fill,
  //                         ))),
  //                 SizedBox(
  //                   height: 8,
  //                 ),
  //                 Text("UNESCO-MARS 2020",
  //                     style: TextStyle(
  //                       fontSize: 17,
  //                     ))
  //               ],
  //             ),
  //             Column(
  //               children: [
  //                 Container(
  //                     margin: EdgeInsets.only(
  //                       right: 40.0,
  //                       left: 30,
  //                     ),
  //                     child: ClipRRect(
  //                         borderRadius: BorderRadius.circular(5.0),
  //                         child: Image.asset(
  //                           "assets/newImages/poster_4.png",
  //                           height: 300,
  //                           fit: BoxFit.fill,
  //                         ))),
  //                 SizedBox(
  //                   height: 8,
  //                 ),
  //                 Text("UNESCO-MARS 2020",
  //                     style: TextStyle(
  //                       fontSize: 17,
  //                     ))
  //               ],
  //             ),
  //             Column(
  //               children: [
  //                 Container(
  //                     margin: EdgeInsets.only(
  //                       right: 40.0,
  //                       left: 30,
  //                     ),
  //                     child: ClipRRect(
  //                         borderRadius: BorderRadius.circular(5.0),
  //                         child: Image.asset(
  //                           "assets/newImages/poster_6.png",
  //                           height: 300,
  //                           fit: BoxFit.fill,
  //                         ))),
  //                 SizedBox(
  //                   height: 8,
  //                 ),
  //                 Text("UNESCO-MARS 2020",
  //                     style: TextStyle(
  //                       fontSize: 17,
  //                     ))
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget eventDropdown() {
    //building index 1, plant 2,stocks 3
    return Container(
      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
      height: 140,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Card(
        elevation: 5,
        child: Padding(
            padding: EdgeInsets.only(top: 5, left: 10, right: 5),
            child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            expandedName = events[index];

                            expandClick = false;
                          });
                        },
                        child: Container(
                          color: Colors.white,
                          width: SizeConfig.blockSizeHorizontal * 100,
                          child: Text(
                            events[index],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Divider(
                        color: Colors.black,
                      )
                    ],
                  );
                })),
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
                        return Slidercard(
                          cardImage: GlobalLists.sliderurl + product['image'],
                          cardTitle: product['image_title'],
                          subTitle: product['image_desc'],
                        );

                        // new Container(
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(8),
                        //       image: DecorationImage(
                        //           image: NetworkImage(
                        //               "http://merckfoundation.org/merck/public/uploads/slider/" +
                        //                   product['image']),
                        //           fit: BoxFit.cover)),
                        //   width: SizeConfig.blockSizeHorizontal * 100,
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     children: <Widget>[
                        //       Padding(
                        //         padding:
                        //             const EdgeInsets.only(right: 0, bottom: 15),
                        //         child: Container(
                        //           color: Colors.white.withOpacity(0.5),
                        //           width: SizeConfig.blockSizeHorizontal * 100,
                        //           child: Padding(
                        //             padding: const EdgeInsets.only(
                        //                 left: 10, right: 10, top: 5, bottom: 5),
                        //             child: Column(
                        //               mainAxisAlignment:
                        //                   MainAxisAlignment.center,
                        //               children: <Widget>[
                        //                 FormLabel(
                        //                     text: product['image_title'],
                        //                     labelColor: Customcolor.pink_col,
                        //                     fontSize:
                        //                         ResponsiveFlutter.of(context)
                        //                             .fontSize(1.4),
                        //                     maxLines: 2,
                        //                     fontweight: FontWeight.bold,
                        //                     textAlignment: TextAlign.center),
                        //                 SizedBox(
                        //                   height: 2,
                        //                 ),
                        //                 FormLabel(
                        //                     text: product['image_desc'],
                        //                     labelColor: Customcolor.colorBlue,
                        //                     fontSize:
                        //                         ResponsiveFlutter.of(context)
                        //                             .fontSize(1.2),
                        //                     fontweight: FontWeight.bold,
                        //                     textAlignment: TextAlign.center),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // );
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
    return GestureDetector(
      onTap: () {
        print("hint");
      },
      child: Container(
        height: 20,
        child: Marquee(
          text: 'There once was a boy who told this story about a boy: "',
        ),
      ),
    );
  }

  Widget followUs() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 15),
      child: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) => NotiDetailpage(
                      //               id: "10",
                      //             )));
                    },
                    child: Text("Follow Us",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.5),
                            fontWeight: FontWeight.w700,
                            fontFamily: AppFonts.normal,
                            color: Customcolor.text_blue)),
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      Platform.isAndroid
                          ? ShowDialogs.followuslink(Constantstring.followinsta,
                              Constantstring.followmsg)
                          : ShowDialogs.launchInstagram(
                              Constantstring.followinsta, "merckfoundation");
                    },
                    child: Image.asset(
                      "assets/newImages/instagram.png",
                      height: imgHeight,
                      width: imgHeight,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      // Platform.isAndroid
                      //     ? ShowDialogs.followuslink(
                      //         Constantstring.followfacebook,
                      //         Constantstring.followmsg):
                      ShowDialogs.launchFacebook(
                          Constantstring.followfacebook, "1053979038068008");
                    },
                    child: Image.asset(
                      "assets/newImages/facebooknew.png",
                      height: imgHeight,
                      width: imgHeight,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      Platform.isAndroid
                          ? ShowDialogs.followuslink(
                              Constantstring.followtwitter,
                              Constantstring.followmsg)
                          : ShowDialogs.launchTwitter(
                              Constantstring.followtwitter);
                    },
                    child: Image.asset(
                      "assets/newImages/twitternew.png",
                      height: imgHeight,
                      width: imgHeight,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      Platform.isAndroid
                          ? ShowDialogs.followuslink(
                              Constantstring.followyoutube,
                              Constantstring.followmsg)
                          : ShowDialogs.youtubevideolink(
                              Constantstring.followyoutube);
                    },
                    child: Image.asset(
                      "assets/newImages/youtube.png",
                      height: imgHeight,
                      width: imgHeight,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      Platform.isAndroid
                          ? ShowDialogs.followuslink(
                              Constantstring.followflicker,
                              Constantstring.followmsg)
                          : ShowDialogs.launchURL(Constantstring.followflicker);
                    },
                    child: Image.asset(
                      "assets/newImages/flickr.png",
                      height: imgHeight,
                      width: imgHeight,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      ShowDialogs.openThreadsApp(Constantstring.followthreas);
                    },
                    child: Image.asset(
                      "assets/newImages/threads.png",
                      height: imgfbHeight,
                      width: imgfbHeight,
                    ),
                  ),
                  // SizedBox(
                  //   width: 7,
                  // ),
                ],
              )
            ],
          ),
          Expanded(
            child: Image.asset(
              "assets/newImages/hometoolbar.png",
              height: 100,
              width: 80,
            ),
          )
        ],
      )),
    );
  }

  Widget _buildComplexMarquee() {
    return Constantstring.homeheader == ""
        ? Container()
        : GestureDetector(
            onTap: () {
              ShowDialogs.launchURL(Constantstring.homeheaderlink);
            },
            child: Container(
              height: 30,
              child: Marquee(
                text: Constantstring.homeheader,
                // 'Call for Application-UNESCO MARS 2020          Save the Date-Merck Foundation "Stay at home" Media recognization award 2020-online edtion for africa and latin america',
                style: TextStyle(
                    fontWeight: FontWeight.w700, color: Customcolor.text_blue),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                blankSpace: 20.0,
                velocity: 40.0,
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
            ),
          );
  }

  Widget _wrapWithStuff(Widget child) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(height: 50.0, color: Colors.white, child: child),
    );
  }

  // Future<void> _launchInWebViewWithJavaScript(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(
  //       url,
  //       forceSafariVC: true,
  //       forceWebView: true,
  //       enableJavaScript: true,
  //     );
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
Future<void> _launchInWebViewWithJavaScript(String url) async {
    if (await canLaunch(url)) {
      final Uri uri = Uri.parse(url);
      await launchUrl(
        uri,
         mode: LaunchMode.externalApplication,
  webViewConfiguration: WebViewConfiguration(enableJavaScript: true,)
        // forceSafariVC: true,
        // forceWebView: true,
        // enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  getheader() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      APIManager().apiRequest(
        context,
        API.homeheader,
        (response) async {
          HomeheaderResponse resp = response;
          print(response);
          print('Resp : $resp');
          setState(() {
            if (resp.marque!.list!.length > 0) {
              Constantstring.homeheader = resp.marque!.list![0].marque!;
              Constantstring.homeheaderlink = resp.marque!.list![0].marqueLink!;
            }
          });

          // if (resp.success == "True") {
          //   setState(() {
          //    Constantstring.homeheader=resp.
          //   });
          // } else {
          //   ShowDialogs.showToast(resp.msg);
          // }
        },
        (error) {
          print('ERR msg is $error');
        },
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }

  gettokenapi() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      //  ShowDialogs.showLoadingDialog(context, _keyLoader);
      var path = "/${GlobalLists.fcmtokenvalue}/${GlobalLists.deviceid}";

      APIManager().apiRequest(context, API.gettoken, (response) async {
        print(response);
        GettokenResponse resp = response;
        print(response);
        print('TokenResp : $resp');

        // if (resp.success == true) {
        //   setState(() {});
        // } else {
        //   ShowDialogs.showToast(resp.msg);
        // }
      }, (error) {
        print('ERR msg is $error');
      }, path: path);
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }
  // Widget newSlider(BuildContext context) {
  //   return Stack(
  //     children: <Widget>[
  //       Column(
  //         children: <Widget>[
  //           Container(
  //             child: carouselSlider = CarouselSlider(
  //               options: CarouselOptions(
  //                 viewportFraction: 1.0,
  //                 height: 350,
  //                 autoPlay: false,
  //                 onPageChanged: (index, reason) {
  //                   setState(() {
  //                     _current1 = index;
  //                   });
  //                 },
  //               ),
  //               items: _productsAvailable1.map((product) {
  //                 return new Builder(
  //                   builder: (BuildContext context) {
  //                     return new GridView.count(
  //                       crossAxisCount: 2,
  //                       crossAxisSpacing: 10.0,
  //                       mainAxisSpacing: 10.0,
  //                       shrinkWrap: true,
  //                       scrollDirection: Axis.horizontal,
  //                       children: List.generate(
  //                         4,
  //                         (index) {
  //                           return Padding(
  //                             padding: const EdgeInsets.all(10.0),
  //                             child: Container(
  //                               decoration: BoxDecoration(
  //                                 image: DecorationImage(
  //                                   image: AssetImage(
  //                                       "assets/images/logo_nav1.png"),
  //                                   fit: BoxFit.cover,
  //                                 ),
  //                                 borderRadius: BorderRadius.all(
  //                                   Radius.circular(20.0),
  //                                 ),
  //                               ),
  //                             ),
  //                           );
  //                         },
  //                       ),
  //                     );
  //                   },
  //                 );
  //               }).toList(),
  //             ),
  //           ),
  //           new DotsIndicator(
  //             dotsCount: _productsAvailable1.length,
  //             position: double.parse("$_current1"),
  //             decorator: DotsDecorator(
  //               size: const Size.square(9.0),
  //               activeSize: const Size(18.0, 9.0),
  //               activeColor: Customcolor.colorBlue,
  //               activeShape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(5.0)),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  Widget ourlist() {
    //print(_ourlist.length);

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
                        //tv show
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Merckepisodeseason()));
                      } else if (index == 3) {
                        //news article
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Dashboard(
                                      index: 3,
                                    )));
                      } else if (index == 4) {
                        //our award
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Ouraward()));
                      } else if (index == 5) {
                        //our mission
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    OurMission()));
                      } else if (index == 6) {
                        //  media & events
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    MerckFoundationMedia(
                                      apiurl: API.merckfoundationinmedia,
                                    )));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) => Dashboard(
                        //               index: 3,
                        //             )));
                      } else if (index == 7) {
                        //covid response
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CovidResponse()));
                      } else if (index == 8) {
                        //our polcies
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    OurPolicy()));
                      }
                    },
                    // onTap: () {
                    //   if (index == 0) {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (BuildContext context) =>
                    //                 OurVision()));
                    //   } else if (index == 1) {
                    //     //our program
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (BuildContext context) => Dashboard(
                    //                   index: 1,
                    //                 )));
                    //   } else if (index == 2) {
                    //     //news article
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (BuildContext context) => Dashboard(
                    //                   index: 3,
                    //                 )));
                    //   } else if (index == 3) {
                    //     //our award
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (BuildContext context) => Ouraward()));
                    //   } else if (index == 4) {
                    //     //our mission
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (BuildContext context) =>
                    //                 OurMission()));
                    //   } else if (index == 5) {
                    //     //  media & events
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (BuildContext context) =>
                    //                 MerckFoundationMedia(
                    //                   apiurl: API.merckfoundationinmedia,
                    //                 )));
                    //     // Navigator.push(
                    //     //     context,
                    //     //     MaterialPageRoute(
                    //     //         builder: (BuildContext context) => Dashboard(
                    //     //               index: 3,
                    //     //             )));
                    //   } else if (index == 6) {
                    //     //covid response
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (BuildContext context) =>
                    //                 CovidResponse()));
                    //   } else if (index == 7) {
                    //     //our polcies
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (BuildContext context) =>
                    //                 OurPolicy()));
                    //   }
                    // },
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: _ourlist[index].colors,
                      ),
                      child: Center(
                          child: Text(
                        _ourlist[index].programname!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                        ),
                      )),
                    )))));
  }

  Widget ourstaticlist() {
    //print(_ourlist.length);
    return Column(
      children: [
        GridView.count(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          padding: const EdgeInsets.all(5),
          crossAxisSpacing: 0,
          mainAxisSpacing: 1,
          crossAxisCount: 2,
          childAspectRatio: 0.97,
          children: List.generate(_ourstaticlist.length, (index) {
            // if (GlobalLists.digitallibraryviewlist.length - 1 ==

            //         index &&

            //     _isLoading) {

            //   return Center(

            //     child: CircularProgressIndicator(),

            //   );

            // } else {

            return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(_ourstaticlist[index].imagename!)));

            // }
          }),
        ),
//  Padding(

//                                       padding: const EdgeInsets.only(right: 2.0),

//                                       child:  Container(

//                           width: 170,

//                           decoration: BoxDecoration(

//                             borderRadius: BorderRadius.circular(8),

//                           ),

//                           child: Image.asset('assets/newImages/SocialMedia_st.png')

//                         )

//  )
      ],
    );
  }
  ////////////////////////

  Future<http.Response?> gethomeapi() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      print("home api");
      print(APIManager.homeurl);
      var response = await APIManager.fetchget(
        encoding: APIManager.homeurl,
      );
      print("response");
      print(response);
      if (response!.statusCode == 200) {
        var res = json.decode(response.body);
        print("ff");
        print(res);
        HomepageResponse homepageres = HomepageResponse.fromJson(res);
        GlobalLists.sliderurl = homepageres.sliderArea![0].slider!.baseUrl!;
        slidersection = homepageres.sliderArea![0].slider!.list!;
        slidersection.forEach((element) {
          _productsAvailable.add({
            "id": element.id,
            "menu_id": element.menuId,
            "image_title": element.imageTitle,
            "image_desc": element.imageDesc,
            "links": element.links,
            "image": element.image,
            "alt_text": element.altText,
            "status": element.status,
            "created_at": element.createdAt,
            "updated_at": element.updatedAt
          });
        });

        print("slidersection");
        print(slidersection.length);

        Map<String, dynamic> section1 = homepageres.middleArea!;
        Map<String, dynamic> lastsection = homepageres.rightArea!;
        Map<String, dynamic> bottomsection = homepageres.bottomArea!;
        print(section1);
        print(section1['1']);

        for (int i = 0; i < section1.length; i++) {
          //  MiddleArea categoryKeys = section1[(i + 1).toString()];
          //  print(categoryKeys.videos.type);
          dynamic section = res['middle_area']['${i + 1}'];
          print("TKey: ${section.keys.first}");
          var middlecategoryname = section.keys.first;

          // setState(() {
          typewidet.add(middlecategoryname);

          print(typewidet);
          // });
          if (middlecategoryname.toString().toLowerCase() ==
              "Videos".toLowerCase()) {
            GlobalLists.homevideolist =
                homepageres.middleArea!['${i + 1}']!.videos!.list!;
            print(GlobalLists.homevideolist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "awards".toLowerCase()) {
            GlobalLists.homeawardlist =
                homepageres.middleArea!['${i + 1}']!.awards!.list!;
            print(GlobalLists.homeawardlist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "content".toLowerCase()) {
            GlobalLists.homecontentlist =
                homepageres.middleArea!['${i + 1}']!.content!.list!;
            print(GlobalLists.homecontentlist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "gallery".toLowerCase()) {
            GlobalLists.homegallerybaseurl =
                homepageres.middleArea!['${i + 1}']!.gallery!.baseUrl;
            GlobalLists.homegallerylist =
                homepageres.middleArea!['${i + 1}']!.gallery!.list!;
            print(GlobalLists.homegallerylist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "ceo_msg".toLowerCase()) {
            GlobalLists.homeceomsgbaseurl =
                homepageres.middleArea!['${i + 1}']!.ceoMsg!.baseUrl;
            GlobalLists.homeceomsglist =
                homepageres.middleArea!['${i + 1}']!.ceoMsg!.list!;
            print(GlobalLists.homeceomsglist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "episodes".toLowerCase()) {
            GlobalLists.homeafricashowbaseurl =
                homepageres.middleArea!['${i + 1}']!.episodes!.baseUrl;
            GlobalLists.homeafricashowlist =
                homepageres.middleArea!['${i + 1}']!.episodes!.list!;
            print(GlobalLists.homeafricashowlist.length);
          }
        }

        ///////right section
        for (int i = 0; i < lastsection.length; i++) {
          //  MiddleArea categoryKeys = section1[(i + 1).toString()];
          //  print(categoryKeys.videos.type);
          dynamic rightsection = res['Right_area']['${i + 1}'];
          print("TKey: ${rightsection.keys.first}");
          var rightsectioncategoryname = rightsection.keys.first;

          typewidetofrightsection.add(rightsectioncategoryname);
          _tabController = new TabController(
              vsync: this, length: typewidetofrightsection.length);
          print(typewidetofrightsection);

          if (rightsectioncategoryname.toString().toLowerCase() ==
              "call_for_app".toLowerCase()) {
            print("year");
            // print(homepageres
            //     .rightArea['${i + 1}'].callForApp.list[3].eventEndDate.year);
            //
            for (int j = 0;
                j <
                    homepageres
                        .rightArea!['${i + 1}']!.callForApp!.list!.length;
                j++) {
              var enddate = new DateTime.utc(
                  homepageres.rightArea!['${i + 1}']!.callForApp!.list![j]
                      .eventEndDate!.year,
                  homepageres.rightArea!['${i + 1}']!.callForApp!.list![j]
                      .eventEndDate!.month,
                  homepageres.rightArea!['${i + 1}']!.callForApp!.list![j]
                      .eventEndDate!.day);

              if (_todaysDate!.isBefore(enddate)) {
                GlobalLists.homecallforapp.add(
                    homepageres.rightArea!['${i + 1}']!.callForApp!.list![j]);
                print(GlobalLists.homecallforapp.length);
              }
            }

            // GlobalLists.homecallforapp =
            //     homepageres.rightArea['${i + 1}'].callForApp.list;
            GlobalLists.homeCallForAppBaseURL =
                homepageres.rightArea!['${i + 1}']!.callForApp!.baseUrl;
            GlobalLists.homeCallForAppPDFURL =
                homepageres.rightArea!['${i + 1}']!.callForApp!.pdfUrl;
            print("callforapp length");
            print(GlobalLists.homecallforapp.length);
          } else if (rightsectioncategoryname.toString().toLowerCase() ==
              "mmtm".toLowerCase()) {
            GlobalLists.homemmtm =
                homepageres.rightArea!['${i + 1}']!.mmtm!.list!;
            print(GlobalLists.homemmtm.length);
            GlobalLists.homeMMTMBaseURL =
                homepageres.rightArea!['${i + 1}']!.mmtm!.baseUrl!;
          } else if (rightsectioncategoryname.toString().toLowerCase() ==
              "digital_library".toLowerCase()) {
            GlobalLists.homedigitallib =
                homepageres.rightArea!['${i + 1}']!.digitalLibrary!.list!;
            GlobalLists.homeDigitalLibraryBaseURL =
                homepageres.rightArea!['${i + 1}']!.digitalLibrary!.baseUrl!;

            GlobalLists.homeDigitalLibraryPdfURL =
                homepageres.rightArea!['${i + 1}']!.digitalLibrary!.pdfUrl!;
            print(GlobalLists.homedigitallib.length);
          }
        }

        ///////bottom section
        List<String> bottomareakey = [];
        bottomsection.keys.forEach((element) {
          bottomareakey.add(element.toString());
        });
        for (int i = 0; i < bottomsection.length; i++) {
          //  MiddleArea categoryKeys = section1[(i + 1).toString()];
          //  print(categoryKeys.videos.type);
          dynamic bottomendsection = res['bottom_area'][bottomareakey[i]];
          print("TKey: ${bottomendsection.keys.first}");
          var bottomectioncategoryname = bottomendsection.keys.first;

          //  setState(() {
          typewidetofbottomsection.add(bottomectioncategoryname);

          print(typewidetofbottomsection);
          //  });

          if (bottomectioncategoryname.toString().toLowerCase() ==
              "media".toLowerCase()) {
            GlobalLists.mmtmmediabaseurl =
                homepageres.bottomArea![bottomareakey[i]]!.media!.baseUrl!;
            GlobalLists.mmtmmedialist =
                homepageres.bottomArea![bottomareakey[i]]!.media!.list!;
            print(GlobalLists.mmtmmedialist.length);
          } else if (bottomectioncategoryname.toString().toLowerCase() ==
              "testimonial".toLowerCase()) {
            GlobalLists.mmttestimoniallist =
                homepageres.bottomArea![bottomareakey[i]]!.testimonial!.list!;
            print(GlobalLists.mmttestimoniallist.length);
            GlobalLists.mmttestimonialbaseurl =
                homepageres.bottomArea![bottomareakey[i]]!.testimonial!.baseUrl;
          }
        }
        setState(() {
          isMiddleSectionLoaded = true;
          isrightSectionLoaded = true;
          issliderSectionLoaded = true;
          isbottomSectionLoaded = true;
        });

        return response;
      } else {
        ShowDialogs.showToast(GlobalLists.serverresp);
        _tabController = new TabController(vsync: this, length: 0);
        setState(() {
          isbottomSectionLoaded = true;
          isMiddleSectionLoaded = true;
          isrightSectionLoaded = true;
          issliderSectionLoaded = true;
        });
      }
    } else {
      _tabController = new TabController(vsync: this, length: 0);
      setState(() {
        isMiddleSectionLoaded = true;
        issliderSectionLoaded = true;
        isrightSectionLoaded = true;
        isbottomSectionLoaded = true;
      });
      ShowDialogs.showToast("Please check internet connection");
    }
  }

  List<Widget> listbottomwidget() {
    listofbottomwiget.clear();
    for (int i = 0; i < typewidetofbottomsection.length; i++) {
      if (typewidetofbottomsection[i] == "testimonial") {
        listofbottomwiget.add(
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: CustomeCardforTestimonial(
              index: 1,
              cardImage: GlobalLists.mmttestimonialbaseurl +
                  GlobalLists.mmttestimoniallist[0].image,
              cardsubtitle: "Alumini ",
              cardTitle: "Testimonials  ",
              testimonialname:
                  GlobalLists.mmttestimoniallist[0].testimonialName,
              titleColor: Customcolor.text_darkblue,
              departmentname:
                  // "Gynecologic Oncology Fellow | 2018 \nMerck Foundation Alumni",
                  GlobalLists.mmttestimoniallist[0].departmentName,
              titleImg: "assets/newImages/flowers-2.png",
              subTitle: "",
              buttontitle: "View More ",
              buttontitlecolor: Customcolor.text_darkblue,
              onBtnTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Testimonialprogramviewmore(
                              apiurl: API.testiomonailpro,
                              sharelink:
                                  Constantstring.sharetestimonialviewmorehome,
                            )));
              },
              oncardtap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Testimonialprogramdetailpage(
                              index: 0,
                              baseurl: GlobalLists.mmttestimonialbaseurl,
                            )));
              },
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 10, top: 10),
          //   child: CustomHorizontalCard(
          //     index: 1,
          //     cardImage: "assets/newImages/mqdefault.png",
          //     cardTitle: "Alumini Testimonials  ",
          //     titleColor: Customcolor.pink_col,
          //     onbtnTap: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (BuildContext context) =>
          //                   Testimonialprogramviewmore(
          //                     apiurl: API.testiomonailpro,
          //                   )));
          //     },
          //     btnTitle: "View More",
          //     titleImg: "assets/newImages/flowers-3.png",
          //     list: Padding(
          //       padding: const EdgeInsets.only(left: 8, right: 8),
          //       child: GestureDetector(
          //         onTap: () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (BuildContext context) =>
          //                       Testimonialprogramdetailpage(
          //                         index: 0,
          //                         baseurl: GlobalLists.mmttestimonialbaseurl,
          //                       )));
          //         },
          //         child: Container(
          //           height: SizeConfig.blockSizeVertical * 15,
          //           width: SizeConfig.blockSizeHorizontal * 90,
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(5),
          //               color: Colors.white),
          //           child: Row(
          //             children: [
          //               Padding(
          //                 padding: const EdgeInsets.only(
          //                     top: 5, bottom: 3, left: 8, right: 8),
          //                 child: Container(
          //                   // height: 220,
          //                   width: 100,
          //                   decoration: BoxDecoration(
          //                     //color: Colors.amber,
          //                     borderRadius: BorderRadius.circular(10),
          //                   ),
          //                   child: FadeInImage.assetNetwork(
          //                     placeholder: 'assets/newImages/placeholder_3.jpg',
          //                     image:
          //                         "${GlobalLists.mmttestimonialbaseurl + GlobalLists.mmttestimoniallist[0].image}",
          //                     fit: BoxFit.cover,
          //                   ),
          //                 ),
          //               ),
          //               Expanded(
          //                 child: ListView(
          //                   shrinkWrap: true,
          //                   // crossAxisAlignment:
          //                   //     CrossAxisAlignment.start,
          //                   children: [
          //                     SizedBox(
          //                       height: 12,
          //                     ),
          //                     FormLabel(
          //                       text: GlobalLists
          //                           .mmttestimoniallist[0].testimonialName,
          //                       labelColor: Customcolor.colorPink,
          //                       fontSize: 17,
          //                       maxLines: 1,
          //                       fontweight: FontWeight.w700,
          //                     ),
          //                     SizedBox(
          //                       height: 4,
          //                     ),
          //                     FormLabel(
          //                       text: GlobalLists
          //                           .mmttestimoniallist[0].departmentName,
          //                       labelColor: Colors.black87,
          //                       fontSize: 13,
          //                       fontweight: FontWeight.w600,
          //                       maxLines: 2,
          //                     ),
          //                     SizedBox(
          //                       height: 7,
          //                     ),
          //                     FormLabel(
          //                       text: GlobalLists
          //                           .mmttestimoniallist[0].shortDescription,
          //                       labelColor: Colors.black54,
          //                       fontSize: 13,
          //                       fontweight: FontWeight.w500,
          //                       maxLines: 4,
          //                     ),
          //                   ],
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        );
      }
    }
    return listofbottomwiget;
  }

  List<Widget> list() {
    listofwiget.clear();
    for (int i = 0; i < typewidet.length; i++) {
      if (typewidet[i] == "videos") {
        listofwiget.add(
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: CustomeCard(
              //   index: 2,
              oncardtap: () {
                var storykey = GlobalLists.homevideolist[0].videoLink.substring(
                    GlobalLists.homevideolist[0].videoLink.length - 11);
                ShowDialogs.youtubevideolink(
                    "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
              },
              youtubeicon: 0,
              cardImage:
                  'https://img.youtube.com/vi/${GlobalLists.homevideolist[0].videoLink.substring(GlobalLists.homevideolist[0].videoLink.length - 11)}/mqdefault.jpg',
              cardsubtitle: "Hear Our ",
              cardTitle: "Stories   ",

              titleColor: Customcolor.text_darkblue,
              titleImg: "assets/newImages/flowers-2.png",
              subTitle: GlobalLists.homevideolist[0].videoDesc,
              buttontitle: "Watch More ",
              onBtnTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) => Dashboard(
                //               index: 2,
                //             )));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Videolibrary()));
              },
              buttontitlecolor: Customcolor.text_darkblue,
            ),
          ),
        );
      }
      if (typewidet[i] == "awards") {
        listofwiget.add(SizedBox());
      }
      if (typewidet[i] == "content") {
        listofwiget.add(SizedBox());
      }
      if (typewidet[i] == "gallery") {
        listofwiget.add(
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: GestureDetector(
              onTap: () {
                ShowDialogs.showImageDialog(
                  context: context,
                  image: GlobalLists.homegallerybaseurl +
                      GlobalLists.homegallerylist[0].photo,
                  description: GlobalLists.homegallerylist[0].photoDescription,
                );
              },
              child: CustomeCard(
                index: 3,
                cardImage: GlobalLists.homegallerybaseurl +
                    GlobalLists.homegallerylist[0].photo,
                youtubeicon: 1,
                cardsubtitle: "Photo ",
                cardTitle: "Gallery   ",
                titleColor: Customcolor.text_darkblue,
                titleImg: "assets/newImages/flowers-3.png",
                subTitle: GlobalLists.homegallerylist[0].photoDescription,
                buttontitle: "View More ",
                buttontitlecolor: Customcolor.text_darkblue,
                onBtnTap: () {
                  getyearwisephotgallery();
                },
              ),
            ),
          ),
        );
      }
      if (typewidet[i] == "ceo_msg") {
        listofwiget.add(
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: CustomeCard(
              index: 1,
              cardImage: GlobalLists.homeceomsgbaseurl +
                  GlobalLists.homeceomsglist[0].image,
              cardsubtitle: "Messages Form ",
              cardTitle: "Senator, Dr.Rasha Kelej, CEO of Merck Foundation   ",
              titleColor: Customcolor.text_darkblue,
              youtubeicon: 1,
              titleImg: "assets/newImages/flowers-2.png",
              subTitle: GlobalLists.homeceomsglist[0].title,
              buttontitle: "View More ",
              buttontitlecolor: Customcolor.text_darkblue,
              onBtnTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => viewmoreHomeceo()));
              },
              oncardtap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Homeceomessage(
                              title: GlobalLists.homeceomsglist[0].title,
                              detail: GlobalLists.homeceomsglist[0].details,
                              detailpageurl:
                                  GlobalLists.homeceomsglist[0].detailPageUrl,
                            )));
              },
            ),
          ),
        );
      }

      //Change here for africa
      if (typewidet[i] == "episodes") {
        listofwiget.add(
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: CustomeCardEpisode(
              //   index: 2,
              showbrief: GlobalLists.homeafricashowlist[0]["show_brief"],
              credits: GlobalLists.homeafricashowlist[0]["credits"],
              relatednews: GlobalLists.homeafricashowlist[0]["related_news"],
              photid: GlobalLists.homeafricashowlist[0]["photos_gallery_ids"],
              guestinfo: GlobalLists.homeafricashowlist[0]["guest_info"],
              episodebrief: GlobalLists.homeafricashowlist[0]["episode_brief"],
              episodeid: GlobalLists.homeafricashowlist[0]["id"],
              oncardtap: () {
                var storykey = GlobalLists.homeafricashowlist[0]["video_link"]
                    .substring(
                        GlobalLists.homeafricashowlist[0]["video_link"].length -
                            11);
                ShowDialogs.youtubevideolink(
                    "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
              },
              youtubeicon: 0,
              cardImage:
                  'https://img.youtube.com/vi/${GlobalLists.homeafricashowlist[0]["video_link"].substring(GlobalLists.homeafricashowlist[0]["video_link"].length - 11)}/mqdefault.jpg',
              cardsubtitle: "Merck Foundation Presents \n",
              cardTitle: '"Our Africa By Merck Foundation" \n(TV Program)   ',
              videolink: GlobalLists.homeafricashowlist[0]["video_link"],
              titleColor: Customcolor.text_darkblue,
              titleImg: "assets/newImages/flowers-2.png",
              subTitle: GlobalLists.homeafricashowlist[0]["episode_name"],
              buttontitle: "Watch More ",
              onBtnTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) => Dashboard(
                //               index: 2,
                //             )));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Merckepisodeseason()));
              },
              buttontitlecolor: Customcolor.text_darkblue,
            ),
          ),
        );
      }
    }

    return listofwiget;
  }

  List<Widget> tablist() {
    setState(() {
      listoftabwiget.clear();
      tabs.clear();

      // digitalLibrary(),
      // merckmorethanmother()
      print("typewidetofrightsection ${typewidetofrightsection.length}");
      print(
          "typewidetofrightsection call ${GlobalLists.homecallforapp.length}");
      for (int i = 0; i < typewidetofrightsection.length; i++) {
        if (typewidetofrightsection[i] == "call_for_app" &&
            GlobalLists.homecallforapp.length > 0) {
          print("typewidetofrightsection ${GlobalLists.homecallforapp.length}");
          tabs.add(
            new Tab(
              child: Callforapptext(),
            ),
          );
//child: ShowDialogs.callforapptext(context)
          listoftabwiget.add(
            getcallforapp(context),
          );
        }
        if (typewidetofrightsection[i] == "mmtm" &&
            GlobalLists.homemmtm.length > 0) {
          tabs.add(
            new Tab(
              child: Merckmtmtext(),
            ),
          );
          listoftabwiget.add(getMMTMS(context));
        }
        if (typewidetofrightsection[i] == "digital_library" &&
            GlobalLists.homedigitallib.length > 0) {
          tabs.add(
            new Tab(
              child: Digitaltext(),
            ),
          );
          listoftabwiget.add(digitalLibraryLastSection());
        }
        // print('tabs');
        // print(tabs.length);
      }
    });
    //_tabController.length = tabs.length;
    return listoftabwiget;
  }

  getmerckoverview() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      // ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.merckoverview,
        (response) async {
          MerckoverviewResponse resp = response;
          print(response);
          print('Resp : $resp');

          //    Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == true) {
            setState(() {
              GlobalLists.Constantmerckoverview =
                  resp.pdfUrl! + resp.list!.image!;
              print(GlobalLists.Constantmerckoverview);
            });
          } else {
            ShowDialogs.showToast(resp.msg!);
          }
        },
        (error) {
          print('ERR msg is $error');
          //   Navigator.of(_keyLoader.currentContext).pop();
        },
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }

  getyearwisephotgallery() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.yearwisegallery,
        (response) async {
          YearwisePhotogalleryResponse resp = response;

          Navigator.of(_keyLoader.currentContext!).pop();

          if (resp.success == "true") {
            setState(() {
              yearwisephotlist = resp.list!;
              Constantstring.baseUrl = resp.baseUrl!;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PhotoGalleryPage(
                            baseURL: Constantstring.baseUrl,
                            index: 0,
                            photosList: yearwisephotlist,
                          )));
            });
          } else {
            ShowDialogs.showToast(resp.msg!);
          }
        },
        (error) {
          print('ERR msg is $error');
          Navigator.of(_keyLoader.currentContext!).pop();
        },
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

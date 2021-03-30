import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;
import 'package:marquee/marquee.dart';
import 'package:merckfoundation22dec/GalleryProgram.dart';
import 'package:merckfoundation22dec/ViewmoremmtmAmbassadar.dart';
import 'package:merckfoundation22dec/WatchDigitalLibrary.dart';
import 'package:merckfoundation22dec/mediascreen.dart/merckFoundationMedia.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videolibray.dart';
import 'package:merckfoundation22dec/model/HomepageResponse.dart';
import 'package:merckfoundation22dec/model/homeheader.dart';
import 'package:merckfoundation22dec/ouraward.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/photo_gallery.dart';
import 'package:merckfoundation22dec/Homescreenceo.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/ourPrograms.dart';
import 'package:merckfoundation22dec/screens/ourvision/vision.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/model/Merckoverview.dart';
import 'package:merckfoundation22dec/model/yearwisephotogallery.dart';
import 'package:merckfoundation22dec/screens/ceomessage/Detailpageceo.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/SPManager.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/whatwedo/ourmission.dart';
import 'package:merckfoundation22dec/whatwedo/ourpolicy.dart';
import 'package:merckfoundation22dec/widget/customappbar.dart';
import 'package:merckfoundation22dec/widget/customcard.dart';
import 'package:merckfoundation22dec/widget/customcardforTestimonial.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/drawer.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:merckfoundation22dec/widget/slidercontainer.dart';
import 'package:photo_view/photo_view.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:merckfoundation22dec/mediascreen.dart/callforApplication.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Testimonailprogramdetailpage.dart';
import 'package:merckfoundation22dec/widget/customHorizontalCard.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Testimonailprogramviewmore.dart';
import 'package:intl/intl.dart';
import 'package:merckfoundation22dec/viewmorehomeceo.dart';
import 'package:merckfoundation22dec/covid/CovidResponse.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';

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
  final CarouselController callAppCarouselController = CarouselController();
  final CarouselController digitalLibraryCarouselController =
      CarouselController();
  final CarouselController mmtmCarouselController = CarouselController();
  bool iscall = true;
  bool islibrary = false;
  bool ismeck = false;
  double imgHeight = 50;
  bool expandClick = false;
  String expandedName = "Upcoming Events";
  bool isMiddleSectionLoaded = false;
  bool isrightSectionLoaded = false;
  bool issliderSectionLoaded = false;
  final List<Tab> tabs = <Tab>[];
  List events = ["Upcoming Events", "Past Events"];
  TabController _tabController;
  List<Widget> listofwiget = [];
  List<Widget> listoftabwiget = [];
  Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;
  ConnectivityResult stats;
  DateTime _todaysDate;
  var todayformatdate;
  List<Widget> listofbottomwiget = [];
  List<dynamic> yearwisephotlist = [];
  @override
  void initState() {
    super.initState();
    SPManager().setAuthToken("token");
    _todaysDate = DateTime.now();
    todayformatdate = DateFormat('yyyy-MM-dd').format(_todaysDate);
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
    _tabController.dispose();
    //  _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
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

                SizedBox(
                  height: 10,
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
                ),
                // Bottomcardlink(),
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
                                    ShowDialogs.launchURL(
                                        GlobalLists.homeCallForAppBaseURL +
                                            product.pdfFile);
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
                                        child: product.title == null
                                            ? ""
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
                                        GlobalLists.homeDigitalLibraryBaseURL +
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
                                            ? ""
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
                                        width: Constantstring.callimagewidth,
                                        height: Constantstring.callimageheight,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: product.photoDescription == null
                                          ? ""
                                          : Text(product.photoDescription,
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

  Stream<bool> _bids = (() async* {
    print("print");
    await Future<void>.delayed(Duration(seconds: 1));
    yield await ConnectionDetector.checkInternetConnection();
    await Future<void>.delayed(Duration(seconds: 1));
  })();

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
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Follow Us",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
                          fontWeight: FontWeight.w700,
                          fontFamily: AppFonts.normal,
                          color: Customcolor.text_blue)),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      ShowDialogs.followuslink(
                          Constantstring.followinsta, Constantstring.followmsg);
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
                      ShowDialogs.followuslink(Constantstring.followfacebook,
                          Constantstring.followmsg);
                    },
                    child: Image.asset(
                      "assets/newImages/facebook.png",
                      height: imgHeight,
                      width: imgHeight,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      ShowDialogs.followuslink(Constantstring.followtwitter,
                          Constantstring.followmsg);
                    },
                    child: Image.asset(
                      "assets/newImages/twitter.png",
                      height: imgHeight,
                      width: imgHeight,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      ShowDialogs.followuslink(Constantstring.followyoutube,
                          Constantstring.followmsg);
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
                      ShowDialogs.followuslink(Constantstring.followflicker,
                          Constantstring.followmsg);
                    },
                    child: Image.asset(
                      "assets/newImages/flickr.png",
                      height: imgHeight,
                      width: imgHeight,
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
        : Container(
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
          );
  }

  Widget _wrapWithStuff(Widget child) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(height: 50.0, color: Colors.white, child: child),
    );
  }

  Future<void> _launchInWebViewWithJavaScript(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
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
            Constantstring.homeheader = resp.marque.list[0].marque;
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
                      } else if (index == 6) {
                        //covid response
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CovidResponse()));
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

  ////////////////////////

  Future<http.Response> gethomeapi() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      print("home api");
      print(APIManager.homeurl);
      var response = await APIManager.fetchget(
        encoding: APIManager.homeurl,
      );
      print("response");
      print(response);
      if (response.statusCode == 200) {
        var res = json.decode(response.body);
        print("ff");
        print(res);
        HomepageResponse homepageres = HomepageResponse.fromJson(res);
        GlobalLists.sliderurl = homepageres.sliderArea[0].slider.baseUrl;
        slidersection = homepageres.sliderArea[0].slider.list;
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

        Map<String, dynamic> section1 = homepageres.middleArea;
        Map<String, dynamic> lastsection = homepageres.rightArea;
        Map<String, dynamic> bottomsection = homepageres.bottomArea;
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
                homepageres.middleArea['${i + 1}'].videos.list;
            print(GlobalLists.homevideolist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "awards".toLowerCase()) {
            GlobalLists.homeawardlist =
                homepageres.middleArea['${i + 1}'].awards.list;
            print(GlobalLists.homeawardlist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "content".toLowerCase()) {
            GlobalLists.homecontentlist =
                homepageres.middleArea['${i + 1}'].content.list;
            print(GlobalLists.homecontentlist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "gallery".toLowerCase()) {
            GlobalLists.homegallerybaseurl =
                homepageres.middleArea['${i + 1}'].gallery.baseUrl;
            GlobalLists.homegallerylist =
                homepageres.middleArea['${i + 1}'].gallery.list;
            print(GlobalLists.homegallerylist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "ceo_msg".toLowerCase()) {
            GlobalLists.homeceomsgbaseurl =
                homepageres.middleArea['${i + 1}'].ceoMsg.baseUrl;
            GlobalLists.homeceomsglist =
                homepageres.middleArea['${i + 1}'].ceoMsg.list;
            print(GlobalLists.homeceomsglist.length);
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
                j < homepageres.rightArea['${i + 1}'].callForApp.list.length;
                j++) {
              var enddate = new DateTime.utc(
                  homepageres.rightArea['${i + 1}'].callForApp.list[j]
                      .eventEndDate.year,
                  homepageres.rightArea['${i + 1}'].callForApp.list[j]
                      .eventEndDate.month,
                  homepageres.rightArea['${i + 1}'].callForApp.list[j]
                      .eventEndDate.day);

              if (_todaysDate.isBefore(enddate)) {
                GlobalLists.homecallforapp
                    .add(homepageres.rightArea['${i + 1}'].callForApp.list[j]);
                print(GlobalLists.homecallforapp.length);
              }
            }

            // GlobalLists.homecallforapp =
            //     homepageres.rightArea['${i + 1}'].callForApp.list;
            GlobalLists.homeCallForAppBaseURL =
                homepageres.rightArea['${i + 1}'].callForApp.baseUrl;
            print("callforapp length");
            print(GlobalLists.homecallforapp.length);
          } else if (rightsectioncategoryname.toString().toLowerCase() ==
              "mmtm".toLowerCase()) {
            GlobalLists.homemmtm = homepageres.rightArea['${i + 1}'].mmtm.list;
            print(GlobalLists.homemmtm.length);
            GlobalLists.homeMMTMBaseURL =
                homepageres.rightArea['${i + 1}'].mmtm.baseUrl;
          } else if (rightsectioncategoryname.toString().toLowerCase() ==
              "digital_library".toLowerCase()) {
            GlobalLists.homedigitallib =
                homepageres.rightArea['${i + 1}'].digitalLibrary.list;
            GlobalLists.homeDigitalLibraryBaseURL =
                homepageres.rightArea['${i + 1}'].digitalLibrary.baseUrl;
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
                homepageres.bottomArea[bottomareakey[i]].media.baseUrl;
            GlobalLists.mmtmmedialist =
                homepageres.bottomArea[bottomareakey[i]].media.list;
            print(GlobalLists.mmtmmedialist.length);
          } else if (bottomectioncategoryname.toString().toLowerCase() ==
              "testimonial".toLowerCase()) {
            GlobalLists.mmttestimoniallist =
                homepageres.bottomArea[bottomareakey[i]].testimonial.list;
            print(GlobalLists.mmttestimoniallist.length);
            GlobalLists.mmttestimonialbaseurl =
                homepageres.bottomArea[bottomareakey[i]].testimonial.baseUrl;
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
//   Future<http.Response> gethomeapi() async {
//     var response = await fetchget(
//       encoding: "program_page_api/home/Android/1",
//     );
//     print("response");
//     print(response);
//     const JsonEncoder encoder = JsonEncoder.withIndent('  ');
//     var res = json.decode(response.body);
//     print("ff");

//     // slidersection = res['slider_area']['5'];
//     // print("slidersection");
//     // print(slidersection.length);

//     dynamic section1 = res['middle_area']['1'];//1
//     dynamic section2 = res['middle_area']['2'];//2
//     dynamic section3 = res['middle_area']['3'];
//     dynamic section4 = res['middle_area']['4'];
//     dynamic section5 = res['middle_area']['5'];

//     var section1key = section1.keys.first; //video
//     var section2key = section2.keys.first; //award
//     var section3key = section3.keys.first; //content
//     var section4key = section4.keys.first; //gallery
//     var section5key = section5.keys.first;
//     setState(() {
//       typewidet = [
//         section1key,
//         section2key,
//         section3key,
//         section4key,
//         section5key
//       ];

//       print(typewidet);
//     }); //ceo_msg

//     print(section1key);
//     print("section1key");

//     print(section2key);
//     print("section2key");
//     print(section3key);
//     print("section3key");
//     print(section4key);
//     print("section4key");
//     print(section5key);
//     print("section5key");
//     //section1
//     if (section1key == "videos") {
//       //videolist
//       setState(() {
//         videosection = res['middle_area']['1']['videos']['list'];

//         dynamic key = videosection.keys.elementAt(0);
//         print(key);
// //1st Video Preview
//         Programvideo video = Programvideo.fromJson(videosection[key]);

//         //List of all vidwoModels
//         List<Programvideo> programVidList = [];
//         videosection.forEach((key, value) {
//           programVidList.add(Programvideo.fromJson(value));
//         });

//         print(video.videoDesc);
//         print(programVidList.length);

//         Map<dynamic, dynamic> contentsection =
//             res['middle_area']['3']['content']['list'];
//         dynamic keycontent = contentsection.keys.elementAt(0);
//         Homecontent content = Homecontent.fromJson(contentsection[keycontent]);
//         print(content.pageContent);
//       });

//       //print(video.videoDesc);
//       print("here");
//     } else if (section1key == "awards") {
//       //award
//       print("not here");
//     } else if (section1key == "content") {
//       //covid
//       print("not here");
//     } else if (section1key == "gallery") {
//       //album
//       print("not here");
//     } else if (section1key == "ceo_msg") {
//       //article
//       print("not here");
//     }
// //section2
//     if (section2key == "videos") {
//       //videolist
//       videosection = res['middle_area']['1']['videos'];
//       // print(videosection[0]);
//       print("not here");
//     } else if (section2key == "11") {
//       //award
//       print("here");
//     } else if (section2key == "13") {
//       //covid
//       print("not here");
//     } else if (section2key == "15") {
//       //album
//       print("not here");
//     } else if (section2key == "23") {
//       //article
//       print("not here");
//     }
// //section3
//     if (section3key == "videos") {
//       //videolist
//       videosection = res['middle_area']['1']['videos'];

//       print("not here");
//     } else if (section3key == "11") {
//       //award
//       print("not here");
//     } else if (section3key == "13") {
//       //covid
//       print("should came here");
//     } else if (section3key == "15") {
//       //album
//       print("not here");
//     } else if (section3key == "23") {
//       //article
//       print("not here");
//     }

//     //section4
//     if (section4key == "videos") {
//       //videolist
//       videosection = res['middle_area']['1']['videos'];

//       print("not here");
//     } else if (section4key == "11") {
//       //award
//       print("not here");
//     } else if (section4key == "13") {
//       //covid
//       print("not here");
//     } else if (section4key == "15") {
//       //album
//       print("here");
//     } else if (section4key == "23") {
//       //article
//       print("not here");
//     }

//     //section5
//     if (section5key == "videos") {
//       //videolist
//       videosection = res['middle_area']['1']['videos'];

//       print("not here");
//     } else if (section5key == "11") {
//       //award
//       print("not here");
//     } else if (section5key == "13") {
//       //covid
//       print("not here");
//     } else if (section5key == "15") {
//       //album
//       print("not here");
//     } else if (section5key == "23") {
//       //article
//       print("here");
//     }
//     // print(res['middle_area']["1"]['14'].runtimeType);
//     // setState(() {
//     //   mapsection = res['middle_area']["1"]['14'];
//     // });

//     // print("ken");
//     // print(mapsection.length);
//     // print(mapsection);
//     // mapsection.forEach((key, value) {
//     //   print("Key : ${key} value ${value}");
//     // });

//     return response;
//   }
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
              cardsubtitle: "Message Form ",
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
                        builder: (BuildContext context) => viewmoreHomeceo(
                            apiurl: API.viewallceomessagerasha)));
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
    }

    return listofwiget;
  }

  List<Widget> tablist() {
    setState(() {
      listoftabwiget.clear();
      tabs.clear();

      // digitalLibrary(),
      // merckmorethanmother()
      for (int i = 0; i < typewidetofrightsection.length; i++) {
        if (typewidetofrightsection[i] == "call_for_app") {
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
        if (typewidetofrightsection[i] == "mmtm") {
          tabs.add(
            new Tab(
              child: Merckmtmtext(),
            ),
          );
          listoftabwiget.add(getMMTMS(context));
        }
        if (typewidetofrightsection[i] == "digital_library") {
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
                  resp.baseUrl + resp.list.image;
              print(GlobalLists.Constantmerckoverview);
            });
          } else {
            ShowDialogs.showToast(resp.msg);
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

          Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "true") {
            setState(() {
              yearwisephotlist = resp.list;
              Constantstring.baseUrl = resp.baseUrl;
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

// import 'dart:convert';

// import 'dart:io';

// import 'package:android_intent/android_intent.dart';
// import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_share_me/flutter_share_me.dart';
// import 'package:http/http.dart' as http;

// import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:http/io_client.dart';
// import 'package:marquee/marquee.dart';
// import 'package:merckfoundation22dec/mediascreen.dart/videoplayer.dart';
// import 'package:merckfoundation22dec/model/HomepageResponse.dart';
// import 'package:merckfoundation22dec/ouraward.dart';
// import 'package:merckfoundation22dec/screens/dashboard.dart';
// import 'package:merckfoundation22dec/screens/ourvision/vision.dart';
// import 'package:merckfoundation22dec/utility/GlobalLists.dart';
// import 'package:merckfoundation22dec/whatwedo/ourmission.dart';
// import 'package:merckfoundation22dec/whatwedo/ourpolicy.dart';
// import 'package:merckfoundation22dec/widget/customappbar.dart';
// import 'package:merckfoundation22dec/screens/ourPrograms/ourPrograms.dart';
// import 'package:merckfoundation22dec/widget/customcard.dart';
// import 'package:merckfoundation22dec/widget/customcolor.dart';
// import 'package:merckfoundation22dec/widget/drawer.dart';
// import 'package:merckfoundation22dec/widget/formLabel.dart';
// import 'package:merckfoundation22dec/widget/showdailog.dart';
// import 'package:merckfoundation22dec/widget/sizeConfig.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:merckfoundation22dec/model/programvideo.dart';

// import 'package:responsive_flutter/responsive_flutter.dart';

// class Home extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return HomeState();
//   }
// }

// class FlotingData {
//   final String img;
//   final String title;

//   FlotingData({this.img, this.title});
// }

// class OurListModel {
//   final Color bgCol;
//   final String title;

//   OurListModel({this.bgCol, this.title});
// }

// class HomeState extends State<Home> with TickerProviderStateMixin {
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   CarouselSlider carouselSlider;
//   int _current = 0;
//   int _current1 = 0;
//   int currentIndex = 0;
//   final GlobalKey<State> _keyLoader = new GlobalKey<State>();
//   Map<dynamic, dynamic> mapsection = {};
//   List<dynamic> slidersection = [];
//   Map<dynamic, dynamic> videosection = {};
//   List _productsAvailable = [];
//   List _productsAvailable1 = [
//     "assets/images/slider1.jpg",
//     "assets/images/slider2.jpg",
//   ];
//   List typewidet = [];
//   List typewidetofrightsection = [];
//   List<programclass> _ourlist = [
//     //     programclass(
//     // programname: "Our \nVision", colors: Customcolor.colorBlue),
//     programclass(colors: Customcolor.pink_col, programname: "Our \nVision"),
//     programclass(colors: Customcolor.green_col, programname: "Our \nPrograms"),
//     programclass(
//         colors: Customcolor.lightgreen_col, programname: "News \nArticles"),
//     programclass(colors: Customcolor.violet_col, programname: "Our \nAwards"),
//     programclass(
//         colors: Customcolor.lightblue_col, programname: "Our \nMission"),
//     programclass(
//         colors: Customcolor.skyblue_col, programname: "Media \n& Events"),
//     programclass(
//         colors: Customcolor.darkblue_col, programname: "Covid \nResponse"),
//     programclass(colors: Customcolor.orange_col, programname: "Our \nPolicies"),
//   ];

//   AnimationController _controller;
//   bool iscall = true;
//   bool islibrary = false;
//   bool ismeck = false;
//   double imgHeight = 50;
//   bool expandClick = false;
//   String expandedName = "Upcoming Events";
//   bool isMiddleSectionLoaded = false;
//   bool isrightSectionLoaded = false;
//   final List<Tab> tabs = <Tab>[];

//   TabController _tabController;
//   List<Widget> listofwiget = [];
//   List<Widget> listoftabwiget = [];
//   @override
//   void initState() {
//     super.initState();
//     print("ho");
//     gethomeapi();
//     _tabController = new TabController(vsync: this, length: 3);
//     _controller = new AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 250),
//     );
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//         onWillPop: () {
//           ShowDialogs.showConfirmDialog(
//               context, "Exit", "Are you sure, want to exit?");
//         },
//         child: Scaffold(
//           backgroundColor: Customcolor.background,
//           key: _scaffoldKey,
//           appBar: CustomAppBar(
//             () {
//               print("kk");
//               _scaffoldKey.currentState.openDrawer();
//             },
//             1,
//             height: 120,
//           ),
//           drawer: Theme(
//             data: Theme.of(context).copyWith(
//               canvasColor: Colors.transparent,
//             ),
//             //child: null,
//             child: AppDrawer(),
//           ),
//           body:
//               //  Container(
//               //   padding: EdgeInsets.all(20.0),
//               //   child: FutureBuilder(
//               //       future: gethomeapi(),
//               //       builder: (context, snapshot) {
//               //         if (snapshot.hasData) {
//               //           return ListView(children: list());
//               //         } else {
//               //           return CircularProgressIndicator();
//               //         }
//               //       }),
//               // ),
//               Container(
//             width: double.infinity,
//             height: double.infinity,
//             child: ListView(
//               //  crossAxisAlignment: CrossAxisAlignment.start,
//               shrinkWrap: true,
//               physics: ScrollPhysics(),
//               children: [
//                 slider(context),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 _buildComplexMarquee(),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 8),
//                   child: ourlist(),
//                 ),
//                 followUs(),
//                 //  newSlider(context),

//                 SizedBox(
//                   height: 12,
//                 ),
//                 Visibility(
//                   visible: isMiddleSectionLoaded,
//                   replacement: Center(child: CircularProgressIndicator()),
//                   child: ListView(
//                       shrinkWrap: true,
//                       physics: ScrollPhysics(),
//                       // scrollDirection: Axis.horizontal,
//                       children: list()),
//                 ),
//                 // Container(
//                 //   padding: EdgeInsets.all(20.0),
//                 //   child: FutureBuilder(
//                 //       future: gethomeapi(),
//                 //       builder: (context, snapshot) {
//                 //         if (snapshot.hasData) {
//                 //           return ListView(
//                 //               shrinkWrap: true,
//                 //               scrollDirection: Axis.horizontal,
//                 //               children: list());
//                 //         } else {
//                 //           return CircularProgressIndicator();
//                 //         }
//                 //       }),
//                 // ),
//                 // CustomeCard(
//                 //   index: 1,
//                 //   cardImage: "assets/newImages/message.png",
//                 //   cardTitle:
//                 //       "Message Form Dr.Rasha Kelej, CEO of Merck Foundation   ",
//                 //   titleColor: Customcolor.text_darkblue,
//                 //   titleImg: "assets/newImages/flowers-2.png",
//                 //   subTitle:
//                 //       "Message Form Dr.Rasha Kelej, on the inauguration...",
//                 //   buttontitle: "Read More ",
//                 //   buttontitlecolor: Customcolor.text_darkblue,
//                 // ),
//                 // SizedBox(
//                 //   height: 12,
//                 // ),
//                 // CustomeCard(
//                 //   index: 2,
//                 //   cardImage: "assets/newImages/mqdefault.png",
//                 //   cardTitle: "Our Stories   ",
//                 //   titleColor: Customcolor.text_darkblue,
//                 //   titleImg: "assets/newImages/flowers-2.png",
//                 //   subTitle:
//                 //       "Message Form Dr.Rasha Kelej, on the inauguration...",
//                 //   buttontitle: "Watch More ",
//                 //   onBtnTap: () {
//                 //     Navigator.push(
//                 //         context,
//                 //         MaterialPageRoute(
//                 //             builder: (BuildContext context) => Dashboard(
//                 //                   index: 2,
//                 //                 )));
//                 //   },
//                 //   buttontitlecolor: Customcolor.text_darkblue,
//                 // ),

//                 // SizedBox(
//                 //   height: 8,
//                 // ),
//                 // RichText(
//                 //   text: TextSpan(
//                 //     children: [
//                 //       TextSpan(
//                 //         text:
//                 //             "Message Form Dr.Rasha Kelej, on the inauguration Message Form Dr.Rasha Kelej, on the inauguration...",
//                 //       ),
//                 //       WidgetSpan(
//                 //         child: Icon(Icons.add, size: 14),
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),
//                 // CustomeCard(
//                 //   index: 3,
//                 //   cardImage: "assets/newImages/gallery.png",
//                 //   cardTitle: "Photo Gallery   ",
//                 //   titleColor: Customcolor.text_darkblue,
//                 //   titleImg: "assets/newImages/flowers-3.png",
//                 //   subTitle: "",
//                 //   buttontitle: "View More ",
//                 //   buttontitlecolor: Customcolor.text_darkblue,
//                 // ),

//                 SizedBox(
//                   height: 8,
//                 ),

//                 Container(
//                   height: 450,
//                   //color: Colors.amber,
//                   child: Column(
//                     children: [
//                       TabBar(
//                         isScrollable: true,
//                         unselectedLabelColor: Colors.grey,
//                         labelColor: Colors.black,
//                         indicatorSize: TabBarIndicatorSize.tab,
//                         indicator: new BubbleTabIndicator(
//                           indicatorHeight: 35.0,
//                           indicatorRadius: 5,
//                           indicatorColor: Customcolor.pinkbg.withOpacity(0.4),
//                           tabBarIndicatorSize: TabBarIndicatorSize.tab,
//                         ),
//                         tabs: tabs,
//                         controller: _tabController,
//                       ),
//                       Expanded(
//                         flex: 3,
//                         child: TabBarView(
//                             physics: ScrollPhysics(),
//                             controller: _tabController,
//                             children: tablist()
//                             // callforApplication(),
//                             // digitalLibrary(),
//                             // merckmorethanmother()
//                             ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 SizedBox(
//                   height: 10,
//                 ),
//                 // Padding(
//                 //   padding: const EdgeInsets.only(right: 60, left: 60),
//                 //   child: Image.asset(
//                 //     "assets/newImages/flowers_footer.png",
//                 //   ),
//                 // ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 0, left: 0),
//                   child: Align(
//                     alignment: Alignment.topRight,
//                     child: Image.asset(
//                       "assets/newImages/flowers_footer.png",
//                       height: 170,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 )
//               ],
//             ),
//           ),
//         ));
//   }

//   Widget callforApplication() {
//     return Padding(
//       padding: const EdgeInsets.only(
//         left: 10,
//         right: 10,
//         top: 10,
//       ),
//       child: Card(
//         elevation: 5,
//         // height: 1800,
//         color: Colors.white,

//         child: Padding(
//           padding: const EdgeInsets.only(
//             left: 12,
//             right: 12,
//             top: 10,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                       child: Text(
//                     expandedName,
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.black),
//                   )),
//                   GestureDetector(
//                     onTap: () {
//                       print("in tap");
//                       setState(() {
//                         expandClick = !expandClick;
//                       });
//                     },
//                     child: Image.asset(
//                       "assets/newImages/expand_more.png",
//                       width: 30,
//                       height: 30,
//                     ),
//                   )
//                 ],
//               ),
//               Expanded(
//                 child: Stack(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10),
//                       child: Swiper.children(
//                         autoplay: false,
//                         loop: true,
//                         // pagination: SwiperPagination(
//                         //   margin: EdgeInsets.only(
//                         //     right: 25.0,
//                         //   ),
//                         //   builder: DotSwiperPaginationBuilder(
//                         //       color: Colors.grey),
//                         // ),
//                         control: SwiperControl(
//                             iconNext: Icons.arrow_forward_ios,
//                             iconPrevious: Icons.arrow_back_ios,
//                             size: 20,
//                             color: Customcolor.darkblue_col),
//                         children: <Widget>[
//                           Column(
//                             children: [
//                               Container(
//                                   margin: EdgeInsets.only(
//                                     right: 40.0,
//                                     left: 30,
//                                   ),
//                                   child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(5.0),
//                                       child: Image.asset(
//                                         "assets/newImages/cfa1.png",
//                                         height: 270,
//                                         fit: BoxFit.fill,
//                                       ))),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text("UNESCO-MARS 2020",
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                   ))
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               Container(
//                                   margin: EdgeInsets.only(
//                                     right: 40.0,
//                                     left: 30,
//                                   ),
//                                   child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(5.0),
//                                       child: Image.asset(
//                                         "assets/newImages/poster_4.png",
//                                         height: 300,
//                                         fit: BoxFit.fill,
//                                       ))),
//                               SizedBox(
//                                 height: 8,
//                               ),
//                               Text("UNESCO-MARS 2020",
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                   ))
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               Container(
//                                   margin: EdgeInsets.only(
//                                     right: 40.0,
//                                     left: 30,
//                                   ),
//                                   child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(5.0),
//                                       child: Image.asset(
//                                         "assets/newImages/poster_6.png",
//                                         height: 300,
//                                         fit: BoxFit.fill,
//                                       ))),
//                               SizedBox(
//                                 height: 8,
//                               ),
//                               Text("UNESCO-MARS 2020",
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                   ))
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               Container(
//                                   margin: EdgeInsets.only(
//                                     right: 40.0,
//                                     left: 30,
//                                   ),
//                                   child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(5.0),
//                                       child: Image.asset(
//                                         "assets/newImages/cfa1.png",
//                                         height: 300,
//                                         fit: BoxFit.fill,
//                                       ))),
//                               SizedBox(
//                                 height: 8,
//                               ),
//                               Text("UNESCO-MARS 2020",
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                   ))
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               Container(
//                                   margin: EdgeInsets.only(
//                                     right: 40.0,
//                                     left: 30,
//                                   ),
//                                   child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(5.0),
//                                       child: Image.asset(
//                                         "assets/newImages/poster_4.png",
//                                         height: 300,
//                                         fit: BoxFit.fill,
//                                       ))),
//                               SizedBox(
//                                 height: 8,
//                               ),
//                               Text("UNESCO-MARS 2020",
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                   ))
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     expandClick
//                         ? Container(
//                             height: 130,
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10)),
//                             child: Card(
//                               elevation: 5,
//                               child: Padding(
//                                 padding: EdgeInsets.only(
//                                     top: 20, left: 10, right: 10),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     GestureDetector(
//                                       onTap: () {
//                                         setState(() {
//                                           expandClick = false;
//                                           expandedName = "Upcoming Events";
//                                         });
//                                       },
//                                       child: Container(
//                                         color: Colors.transparent,
//                                         width: SizeConfig.blockSizeHorizontal *
//                                             100,
//                                         child: Text(
//                                           "Upcoming Events",
//                                           style: TextStyle(
//                                             color: Customcolor.colorblack,
//                                             fontSize: 20,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 15,
//                                     ),
//                                     Container(
//                                       height: 1,
//                                       color: Customcolor.colorblack
//                                           .withOpacity(0.4),
//                                     ),
//                                     SizedBox(
//                                       height: 15,
//                                     ),
//                                     GestureDetector(
//                                       onTap: () {
//                                         setState(() {
//                                           expandClick = false;
//                                           expandedName = "Past Events";
//                                         });
//                                       },
//                                       child: Container(
//                                         color: Colors.transparent,
//                                         width: SizeConfig.blockSizeHorizontal *
//                                             100,
//                                         child: Text(
//                                           "Past Events",
//                                           style: TextStyle(
//                                             color: Customcolor.colorblack,
//                                             fontSize: 20,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 15,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           )
//                         : Container()
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget digitalLibrary() {
//     return Padding(
//       padding: const EdgeInsets.only(
//         left: 10,
//         right: 10,
//         top: 10,
//       ),
//       child: Card(
//         elevation: 5,
//         // height: 1800,
//         color: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
//           child: Swiper.children(
//             autoplay: false,
//             loop: true,
//             control: SwiperControl(
//                 iconNext: Icons.arrow_forward_ios,
//                 iconPrevious: Icons.arrow_back_ios,
//                 size: 20,
//                 color: Customcolor.darkblue_col),
//             children: <Widget>[
//               Column(
//                 children: [
//                   Container(
//                       margin: EdgeInsets.only(
//                         right: 40.0,
//                         left: 30,
//                       ),
//                       child: ClipRRect(
//                           borderRadius: BorderRadius.circular(5.0),
//                           child: Image.asset(
//                             "assets/newImages/cfa1.png",
//                             height: 300,
//                             fit: BoxFit.fill,
//                           ))),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Text("UNESCO-MARS 2020",
//                       style: TextStyle(
//                         fontSize: 17,
//                       ))
//                 ],
//               ),
//               Column(
//                 children: [
//                   Container(
//                       margin: EdgeInsets.only(
//                         right: 40.0,
//                         left: 30,
//                       ),
//                       child: ClipRRect(
//                           borderRadius: BorderRadius.circular(5.0),
//                           child: Image.asset(
//                             "assets/newImages/poster_4.png",
//                             height: 300,
//                             fit: BoxFit.fill,
//                           ))),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Text("UNESCO-MARS 2020",
//                       style: TextStyle(
//                         fontSize: 17,
//                       ))
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget merckmorethanmother() {
//     return Padding(
//       padding: const EdgeInsets.only(
//         left: 10,
//         right: 10,
//         top: 10,
//       ),
//       child: Card(
//         elevation: 5,
//         // height: 1800,
//         color: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
//           child: Swiper.children(
//             autoplay: false,
//             loop: true,
//             control: SwiperControl(
//                 iconNext: Icons.arrow_forward_ios,
//                 iconPrevious: Icons.arrow_back_ios,
//                 size: 20,
//                 color: Customcolor.darkblue_col),
//             children: <Widget>[
//               Column(
//                 children: [
//                   Container(
//                       margin: EdgeInsets.only(
//                         right: 40.0,
//                         left: 30,
//                       ),
//                       child: ClipRRect(
//                           borderRadius: BorderRadius.circular(5.0),
//                           child: Image.asset(
//                             "assets/newImages/cfa1.png",
//                             height: 300,
//                             fit: BoxFit.fill,
//                           ))),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Text("UNESCO-MARS 2020",
//                       style: TextStyle(
//                         fontSize: 17,
//                       ))
//                 ],
//               ),
//               Column(
//                 children: [
//                   Container(
//                       margin: EdgeInsets.only(
//                         right: 40.0,
//                         left: 30,
//                       ),
//                       child: ClipRRect(
//                           borderRadius: BorderRadius.circular(5.0),
//                           child: Image.asset(
//                             "assets/newImages/poster_4.png",
//                             height: 300,
//                             fit: BoxFit.fill,
//                           ))),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Text("UNESCO-MARS 2020",
//                       style: TextStyle(
//                         fontSize: 17,
//                       ))
//                 ],
//               ),
//               Column(
//                 children: [
//                   Container(
//                       margin: EdgeInsets.only(
//                         right: 40.0,
//                         left: 30,
//                       ),
//                       child: ClipRRect(
//                           borderRadius: BorderRadius.circular(5.0),
//                           child: Image.asset(
//                             "assets/newImages/poster_6.png",
//                             height: 300,
//                             fit: BoxFit.fill,
//                           ))),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Text("UNESCO-MARS 2020",
//                       style: TextStyle(
//                         fontSize: 17,
//                       ))
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget slider(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 8),
//       child: Stack(
//         children: <Widget>[
//           Column(
//             children: <Widget>[
//               Container(
//                 child: carouselSlider = CarouselSlider(
//                   options: CarouselOptions(
//                     viewportFraction: 1.0,
//                     height: 170,
//                     autoPlay: true,
//                     onPageChanged: (index, reason) {
//                       setState(() {
//                         _current = index;
//                       });
//                     },
//                   ),
//                   items: _productsAvailable.map((product) {
//                     return new Builder(
//                       builder: (BuildContext context) {
//                         return new Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               image: DecorationImage(
//                                   image: NetworkImage(
//                                       "http://merckfoundation.org/merck/public/uploads/slider/" +
//                                           product['image']),
//                                   fit: BoxFit.cover)),
//                           width: SizeConfig.blockSizeHorizontal * 100,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: <Widget>[
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(right: 0, bottom: 15),
//                                 child: Container(
//                                   color: Colors.white.withOpacity(0.5),
//                                   width: SizeConfig.blockSizeHorizontal * 100,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 10, right: 10, top: 5, bottom: 5),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: <Widget>[
//                                         FormLabel(
//                                           text: product['image_title'],
//                                           labelColor: Customcolor.pink_col,
//                                           fontSize:
//                                               ResponsiveFlutter.of(context)
//                                                   .fontSize(1.4),
//                                           maxLines: 2,
//                                           fontweight: FontWeight.w700,
//                                         ),
//                                         SizedBox(
//                                           height: 2,
//                                         ),
//                                         FormLabel(
//                                           text: product['image_desc'],
//                                           labelColor: Customcolor.pink_col,
//                                           fontSize:
//                                               ResponsiveFlutter.of(context)
//                                                   .fontSize(1.2),
//                                           fontweight: FontWeight.w500,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   }).toList(),
//                 ),
//               ),
//               // new DotsIndicator(
//               //   dotsCount: _productsAvailable.length,
//               //   position: double.parse("$_current"),
//               //   decorator: DotsDecorator(
//               //     size: const Size.square(9.0),
//               //     activeSize: const Size(18.0, 9.0),
//               //     activeColor: Customcolor.colorBlue,
//               //     activeShape: RoundedRectangleBorder(
//               //         borderRadius: BorderRadius.circular(5.0)),
//               //   ),
//               // ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMarquee() {
//     return Container(
//       height: 20,
//       child: Marquee(
//         text: 'There once was a boy who told this story about a boy: "',
//       ),
//     );
//   }

//   Widget followUs() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8, top: 15),
//       child: Container(
//           child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Text("Follow Us on",
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                           fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
//                           fontWeight: FontWeight.w700,
//                           color: Customcolor.text_blue)),
//                 ],
//               ),
//               SizedBox(
//                 height: 18,
//               ),
//               Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () async {
//                       var response = await FlutterShareMe().openinsta(
//                           url: 'https://www.instagram.com/merckfoundation',
//                           msg: "Share");
// //                   var url = 'https://www.instagram.com/merckfoundation/';

// // if (await canLaunch(url)) {
// //   await launch(
// //     url,
// //     universalLinksOnly: true,
// //   );
// // } else {
// //   throw 'There was a problem to open the url: $url';
// // // }
//                       // _launchInWebViewWithJavaScript(
//                       //     "http://instagram.com/_u/merckfoundation");
//                       // if (Platform.isAndroid) {
//                       //   final AndroidIntent intent = AndroidIntent(
//                       //     action: 'Intent.ACTION_VIEW',
//                       //     package: "com.instagram.android",
//                       //     data:
//                       //         'https://instagram.com/merckfoundation/', // replace com.example.app with your applicationId
//                       //   );
//                       //   await intent.launch();
//                       // }

//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //         builder: (BuildContext context) => VideoPlayer(
//                       //               videoUrl:
//                       //                   " https://www.instagram.com/merckfoundation/",
//                       //             )));
//                       //  https://www.instagram.com/merckfoundation/
//                     },
//                     child: Image.asset(
//                       "assets/newImages/instagram.png",
//                       height: imgHeight,
//                       width: imgHeight,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   GestureDetector(
//                     onTap: () async {
//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //         builder: (BuildContext context) => VideoPlayer(
//                       //               videoUrl:
//                       //                   "https://www.facebook.com/merckfoundation/",
//                       //             )));
//                       var response = await FlutterShareMe().openinsta(
//                           url: 'https://www.facebook.com/merckfoundation/',
//                           msg: "Share");
//                     },
//                     child: Image.asset(
//                       "assets/newImages/facebook.png",
//                       height: imgHeight,
//                       width: imgHeight,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   GestureDetector(
//                     onTap: () async {
//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //         builder: (BuildContext context) => VideoPlayer(
//                       //               videoUrl:
//                       //                   "https://twitter.com/MerckFoundation/",
//                       //             )));
//                       var response = await FlutterShareMe().openinsta(
//                           url: 'https://twitter.com/MerckFoundation/',
//                           msg: "Share");
//                     },
//                     child: Image.asset(
//                       "assets/newImages/twitter.png",
//                       height: imgHeight,
//                       width: imgHeight,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   GestureDetector(
//                     onTap: () async {
//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //         builder: (BuildContext context) => VideoPlayer(
//                       //               videoUrl:
//                       //                   "https://www.youtube.com/channel/UCwU6L6rvR-6q0-5Jw03wscg",
//                       //             )));
//                       var response = await FlutterShareMe().openinsta(
//                           url:
//                               'https://www.youtube.com/channel/UCwU6L6rvR-6q0-5Jw03wscg',
//                           msg: "Share");
//                     },
//                     child: Image.asset(
//                       "assets/newImages/youtube.png",
//                       height: imgHeight,
//                       width: imgHeight,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   GestureDetector(
//                     onTap: () async {
//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //         builder: (BuildContext context) => VideoPlayer(
//                       //               videoUrl:
//                       //                   "https://www.flickr.com/photos/163124125@N08/",
//                       //             )));
//                       var response = await FlutterShareMe().openinsta(
//                           url: 'https://www.flickr.com/photos/163124125@N08/',
//                           msg: "Share");
//                     },
//                     child: Image.asset(
//                       "assets/newImages/flickr.png",
//                       height: imgHeight,
//                       width: imgHeight,
//                     ),
//                   ),
//                   // SizedBox(
//                   //   width: 7,
//                   // ),
//                 ],
//               )
//             ],
//           ),
//           Image.asset(
//             "assets/newImages/hometoolbar.png",
//             height: 100,
//             width: 80,
//           )
//         ],
//       )),
//     );
//   }

//   Widget _buildComplexMarquee() {
//     return Container(
//       height: 30,
//       child: Marquee(
//         text:
//             'Call for Application-UNESCO MARS 2020          Savethe Date-Merck Foundation "Stay at home" Media recognization award 2020-online edtion for africa and latin america',
//         style: TextStyle(
//             fontWeight: FontWeight.w700, color: Customcolor.text_blue),
//         scrollAxis: Axis.horizontal,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         blankSpace: 20.0,
//         velocity: 100.0,
//         pauseAfterRound: Duration(seconds: 1),
//         showFadingOnlyWhenScrolling: true,
//         fadingEdgeStartFraction: 0.1,
//         fadingEdgeEndFraction: 0.1,
//         numberOfRounds: null,
//         startPadding: 10.0,
//         accelerationDuration: Duration(seconds: 1),
//         accelerationCurve: Curves.linear,
//         decelerationDuration: Duration(milliseconds: 500),
//         decelerationCurve: Curves.easeOut,
//       ),
//     );
//   }

//   Widget _wrapWithStuff(Widget child) {
//     return Padding(
//       padding: EdgeInsets.all(16.0),
//       child: Container(height: 50.0, color: Colors.white, child: child),
//     );
//   }

//   Future<void> _launchInWebViewWithJavaScript(String url) async {
//     if (await canLaunch(url)) {
//       await launch(
//         url,
//         forceSafariVC: true,
//         forceWebView: true,
//         enableJavaScript: true,
//       );
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   // Widget newSlider(BuildContext context) {
//   //   return Stack(
//   //     children: <Widget>[
//   //       Column(
//   //         children: <Widget>[
//   //           Container(
//   //             child: carouselSlider = CarouselSlider(
//   //               options: CarouselOptions(
//   //                 viewportFraction: 1.0,
//   //                 height: 350,
//   //                 autoPlay: false,
//   //                 onPageChanged: (index, reason) {
//   //                   setState(() {
//   //                     _current1 = index;
//   //                   });
//   //                 },
//   //               ),
//   //               items: _productsAvailable1.map((product) {
//   //                 return new Builder(
//   //                   builder: (BuildContext context) {
//   //                     return new GridView.count(
//   //                       crossAxisCount: 2,
//   //                       crossAxisSpacing: 10.0,
//   //                       mainAxisSpacing: 10.0,
//   //                       shrinkWrap: true,
//   //                       scrollDirection: Axis.horizontal,
//   //                       children: List.generate(
//   //                         4,
//   //                         (index) {
//   //                           return Padding(
//   //                             padding: const EdgeInsets.all(10.0),
//   //                             child: Container(
//   //                               decoration: BoxDecoration(
//   //                                 image: DecorationImage(
//   //                                   image: AssetImage(
//   //                                       "assets/images/logo_nav1.png"),
//   //                                   fit: BoxFit.cover,
//   //                                 ),
//   //                                 borderRadius: BorderRadius.all(
//   //                                   Radius.circular(20.0),
//   //                                 ),
//   //                               ),
//   //                             ),
//   //                           );
//   //                         },
//   //                       ),
//   //                     );
//   //                   },
//   //                 );
//   //               }).toList(),
//   //             ),
//   //           ),
//   //           new DotsIndicator(
//   //             dotsCount: _productsAvailable1.length,
//   //             position: double.parse("$_current1"),
//   //             decorator: DotsDecorator(
//   //               size: const Size.square(9.0),
//   //               activeSize: const Size(18.0, 9.0),
//   //               activeColor: Customcolor.colorBlue,
//   //               activeShape: RoundedRectangleBorder(
//   //                   borderRadius: BorderRadius.circular(5.0)),
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //     ],
//   //   );
//   // }

//   Widget ourlist() {
//     //print(_ourlist.length);

//     return Container(
//         height: 100,
//         child: ListView.builder(
//             shrinkWrap: true,
//             scrollDirection: Axis.horizontal,
//             itemCount: _ourlist.length,
//             itemBuilder: (BuildContext context, int index) => Padding(
//                 padding: const EdgeInsets.only(right: 0.0, left: 8),
//                 child: GestureDetector(
//                     onTap: () {
//                       if (index == 0) {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) =>
//                                     OurVision()));
//                       } else if (index == 1) {
//                         //our program
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) => Dashboard(
//                                       index: 1,
//                                     )));
//                       } else if (index == 2) {
//                         //news article
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) => Dashboard(
//                                       index: 3,
//                                     )));
//                       } else if (index == 3) {
//                         //our award
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) => Ouraward()));
//                       } else if (index == 4) {
//                         //our mission
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) =>
//                                     OurMission()));
//                       } else if (index == 5) {
//                         //  media & events
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) => Dashboard(
//                                       index: 3,
//                                     )));
//                       } else if (index == 6) {
//                         //covid response
//                       } else if (index == 7) {
//                         //our polcies
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) =>
//                                     OurPolicy()));
//                       }
//                     },
//                     child: Container(
//                       width: 100,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         color: _ourlist[index].colors,
//                       ),
//                       child: Center(
//                           child: Text(
//                         _ourlist[index].programname,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                           fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
//                         ),
//                       )),
//                     )))));
//   }

//   ////////////////////////

//   Future<http.Response> gethomeapi() async {
//     print("home api");
//     var response = await fetchget(
//       encoding: "program_page_api/home/Android/1",
//     );
//     print("response");
//     print(response);

//     var res = json.decode(response.body);
//     print("ff");
//     print(res);
//     HomepageResponse homepageres = HomepageResponse.fromJson(res);

//     slidersection = homepageres.sliderArea[0].slider.list;
//     slidersection.forEach((element) {
//       _productsAvailable.add({
//         "id": element.id,
//         "menu_id": element.menuId,
//         "image_title": element.imageTitle,
//         "image_desc": element.imageDesc,
//         "links": element.links,
//         "image": element.image,
//         "alt_text": element.altText,
//         "status": element.status,
//         "created_at": element.createdAt,
//         "updated_at": element.updatedAt
//       });
//     });

//     print("slidersection");
//     print(slidersection.length);

//     Map<String, dynamic> section1 = homepageres.middleArea;
//     Map<String, dynamic> lastsection = homepageres.rightArea;
//     print(section1);
//     print(section1['1']);

//     for (int i = 0; i < section1.length; i++) {
//       //  MiddleArea categoryKeys = section1[(i + 1).toString()];
//       //  print(categoryKeys.videos.type);
//       dynamic section = res['middle_area']['${i + 1}'];
//       print("TKey: ${section.keys.first}");
//       var middlecategoryname = section.keys.first;

//       setState(() {
//         typewidet.add(middlecategoryname);

//         print(typewidet);
//       });
//       if (middlecategoryname.toString().toLowerCase() ==
//           "Videos".toLowerCase()) {
//         GlobalLists.homevideolist =
//             homepageres.middleArea['${i + 1}'].videos.list;
//         print(GlobalLists.homevideolist.length);
//       } else if (middlecategoryname.toString().toLowerCase() ==
//           "awards".toLowerCase()) {
//         GlobalLists.homeawardlist =
//             homepageres.middleArea['${i + 1}'].awards.list;
//         print(GlobalLists.homeawardlist.length);
//       } else if (middlecategoryname.toString().toLowerCase() ==
//           "content".toLowerCase()) {
//         GlobalLists.homecontentlist =
//             homepageres.middleArea['${i + 1}'].content.list;
//         print(GlobalLists.homecontentlist.length);
//       } else if (middlecategoryname.toString().toLowerCase() ==
//           "gallery".toLowerCase()) {
//         GlobalLists.homegallerybaseurl =
//             homepageres.middleArea['${i + 1}'].gallery.baseUrl;
//         GlobalLists.homegallerylist =
//             homepageres.middleArea['${i + 1}'].gallery.list;
//         print(GlobalLists.homegallerylist.length);
//       } else if (middlecategoryname.toString().toLowerCase() ==
//           "ceo_msg".toLowerCase()) {
//         GlobalLists.homeceomsgbaseurl =
//             homepageres.middleArea['${i + 1}'].ceoMsg.baseUrl;
//         GlobalLists.homeceomsglist =
//             homepageres.middleArea['${i + 1}'].ceoMsg.list;
//         print(GlobalLists.homeceomsglist.length);
//       }
//     }

//     ///////right section
//     for (int i = 0; i < lastsection.length; i++) {
//       //  MiddleArea categoryKeys = section1[(i + 1).toString()];
//       //  print(categoryKeys.videos.type);
//       dynamic rightsection = res['Right_area']['${i + 1}'];
//       print("TKey: ${rightsection.keys.first}");
//       var rightsectioncategoryname = rightsection.keys.first;

//       setState(() {
//         typewidetofrightsection.add(rightsectioncategoryname);

//         print(typewidetofrightsection);
//       });

//       if (rightsectioncategoryname.toString().toLowerCase() ==
//           "call_for_app".toLowerCase()) {
//         GlobalLists.homecallforapp =
//             homepageres.rightArea['${i + 1}'].callForApp.list;
//         print(GlobalLists.homecallforapp.length);
//       } else if (rightsectioncategoryname.toString().toLowerCase() ==
//           "mmtm".toLowerCase()) {
//         GlobalLists.homemmtm = homepageres.rightArea['${i + 1}'].mmtm.list;
//         print(GlobalLists.homemmtm.length);
//       } else if (rightsectioncategoryname.toString().toLowerCase() ==
//           "digital_library".toLowerCase()) {
//         GlobalLists.homedigitallib =
//             homepageres.rightArea['${i + 1}'].digitalLibrary.list;
//         print(GlobalLists.homedigitallib.length);
//       }
//     }
//     setState(() {
//       isMiddleSectionLoaded = true;
//       isrightSectionLoaded = true;
//     });

//     return response;
//   }
// //   Future<http.Response> gethomeapi() async {
// //     var response = await fetchget(
// //       encoding: "program_page_api/home/Android/1",
// //     );
// //     print("response");
// //     print(response);
// //     const JsonEncoder encoder = JsonEncoder.withIndent('  ');
// //     var res = json.decode(response.body);
// //     print("ff");

// //     // slidersection = res['slider_area']['5'];
// //     // print("slidersection");
// //     // print(slidersection.length);

// //     dynamic section1 = res['middle_area']['1'];//1
// //     dynamic section2 = res['middle_area']['2'];//2
// //     dynamic section3 = res['middle_area']['3'];
// //     dynamic section4 = res['middle_area']['4'];
// //     dynamic section5 = res['middle_area']['5'];

// //     var section1key = section1.keys.first; //video
// //     var section2key = section2.keys.first; //award
// //     var section3key = section3.keys.first; //content
// //     var section4key = section4.keys.first; //gallery
// //     var section5key = section5.keys.first;
// //     setState(() {
// //       typewidet = [
// //         section1key,
// //         section2key,
// //         section3key,
// //         section4key,
// //         section5key
// //       ];

// //       print(typewidet);
// //     }); //ceo_msg

// //     print(section1key);
// //     print("section1key");

// //     print(section2key);
// //     print("section2key");
// //     print(section3key);
// //     print("section3key");
// //     print(section4key);
// //     print("section4key");
// //     print(section5key);
// //     print("section5key");
// //     //section1
// //     if (section1key == "videos") {
// //       //videolist
// //       setState(() {
// //         videosection = res['middle_area']['1']['videos']['list'];

// //         dynamic key = videosection.keys.elementAt(0);
// //         print(key);
// // //1st Video Preview
// //         Programvideo video = Programvideo.fromJson(videosection[key]);

// //         //List of all vidwoModels
// //         List<Programvideo> programVidList = [];
// //         videosection.forEach((key, value) {
// //           programVidList.add(Programvideo.fromJson(value));
// //         });

// //         print(video.videoDesc);
// //         print(programVidList.length);

// //         Map<dynamic, dynamic> contentsection =
// //             res['middle_area']['3']['content']['list'];
// //         dynamic keycontent = contentsection.keys.elementAt(0);
// //         Homecontent content = Homecontent.fromJson(contentsection[keycontent]);
// //         print(content.pageContent);
// //       });

// //       //print(video.videoDesc);
// //       print("here");
// //     } else if (section1key == "awards") {
// //       //award
// //       print("not here");
// //     } else if (section1key == "content") {
// //       //covid
// //       print("not here");
// //     } else if (section1key == "gallery") {
// //       //album
// //       print("not here");
// //     } else if (section1key == "ceo_msg") {
// //       //article
// //       print("not here");
// //     }
// // //section2
// //     if (section2key == "videos") {
// //       //videolist
// //       videosection = res['middle_area']['1']['videos'];
// //       // print(videosection[0]);
// //       print("not here");
// //     } else if (section2key == "11") {
// //       //award
// //       print("here");
// //     } else if (section2key == "13") {
// //       //covid
// //       print("not here");
// //     } else if (section2key == "15") {
// //       //album
// //       print("not here");
// //     } else if (section2key == "23") {
// //       //article
// //       print("not here");
// //     }
// // //section3
// //     if (section3key == "videos") {
// //       //videolist
// //       videosection = res['middle_area']['1']['videos'];

// //       print("not here");
// //     } else if (section3key == "11") {
// //       //award
// //       print("not here");
// //     } else if (section3key == "13") {
// //       //covid
// //       print("should came here");
// //     } else if (section3key == "15") {
// //       //album
// //       print("not here");
// //     } else if (section3key == "23") {
// //       //article
// //       print("not here");
// //     }

// //     //section4
// //     if (section4key == "videos") {
// //       //videolist
// //       videosection = res['middle_area']['1']['videos'];

// //       print("not here");
// //     } else if (section4key == "11") {
// //       //award
// //       print("not here");
// //     } else if (section4key == "13") {
// //       //covid
// //       print("not here");
// //     } else if (section4key == "15") {
// //       //album
// //       print("here");
// //     } else if (section4key == "23") {
// //       //article
// //       print("not here");
// //     }

// //     //section5
// //     if (section5key == "videos") {
// //       //videolist
// //       videosection = res['middle_area']['1']['videos'];

// //       print("not here");
// //     } else if (section5key == "11") {
// //       //award
// //       print("not here");
// //     } else if (section5key == "13") {
// //       //covid
// //       print("not here");
// //     } else if (section5key == "15") {
// //       //album
// //       print("not here");
// //     } else if (section5key == "23") {
// //       //article
// //       print("here");
// //     }
// //     // print(res['middle_area']["1"]['14'].runtimeType);
// //     // setState(() {
// //     //   mapsection = res['middle_area']["1"]['14'];
// //     // });

// //     // print("ken");
// //     // print(mapsection.length);
// //     // print(mapsection);
// //     // mapsection.forEach((key, value) {
// //     //   print("Key : ${key} value ${value}");
// //     // });

// //     return response;
// //   }

//   List<Widget> list() {
//     listofwiget.clear();
//     for (int i = 0; i < typewidet.length; i++) {
//       if (typewidet[i] == "videos") {
//         listofwiget.add(
//           CustomeCard(
//             //   index: 2,
//             cardImage:
//                 'https://img.youtube.com/vi/${GlobalLists.homevideolist[0].videoLink.substring(GlobalLists.homevideolist[0].videoLink.length - 11)}/mqdefault.jpg',
//             cardTitle: "Our Stories   ",
//             titleColor: Customcolor.text_darkblue,
//             titleImg: "assets/newImages/flowers-2.png",
//             subTitle: GlobalLists.homevideolist[0].videoDesc,
//             buttontitle: "Watch More ",
//             onBtnTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (BuildContext context) => Dashboard(
//                             index: 2,
//                           )));
//             },
//             buttontitlecolor: Customcolor.text_darkblue,
//           ),
//         );
//       }
//       if (typewidet[i] == "awards") {
//         listofwiget.add(SizedBox());
//       }
//       if (typewidet[i] == "content") {
//         listofwiget.add(SizedBox());
//       }
//       if (typewidet[i] == "gallery") {
//         listofwiget.add(
//           CustomeCard(
//             index: 3,
//             cardImage: GlobalLists.homegallerybaseurl +
//                 GlobalLists.homegallerylist[0].photo,
//             cardTitle: "Photo Gallery   ",
//             titleColor: Customcolor.text_darkblue,
//             titleImg: "assets/newImages/flowers-3.png",
//             subTitle: GlobalLists.homegallerylist[0].photoDescription,
//             buttontitle: "View More ",
//             buttontitlecolor: Customcolor.text_darkblue,
//           ),
//         );
//       }
//       if (typewidet[i] == "ceo_msg") {
//         listofwiget.add(
//           CustomeCard(
//             index: 1,
//             cardImage: GlobalLists.homeceomsgbaseurl +
//                 GlobalLists.homeceomsglist[0].image,
//             cardTitle:
//                 "Message Form Dr.Rasha Kelej, CEO of Merck Foundation   ",
//             titleColor: Customcolor.text_darkblue,
//             titleImg: "assets/newImages/flowers-2.png",
//             subTitle: GlobalLists.homeceomsglist[0].title,
//             buttontitle: "Read More ",
//             buttontitlecolor: Customcolor.text_darkblue,
//           ),
//         );
//       }
//     }

//     return listofwiget;
//   }

//   List<Widget> tablist() {
//     setState(() {
//       listoftabwiget.clear();
//       tabs.clear();

//       // digitalLibrary(),
//       // merckmorethanmother()
//       for (int i = 0; i < typewidetofrightsection.length; i++) {
//         if (typewidetofrightsection[i] == "call_for_app") {
//           tabs.add(
//             new Tab(text: "Call for Application"),
//           );

//           listoftabwiget.add(
//             callforApplication(),
//           );
//         }
//         if (typewidetofrightsection[i] == "mmtm") {
//           tabs.add(
//             new Tab(text: "Merck More Than A Mother Ambassadors"),
//           );
//           listoftabwiget.add(merckmorethanmother());
//         }
//         if (typewidetofrightsection[i] == "digital_library") {
//           tabs.add(
//             new Tab(text: "Digital Library"),
//           );
//           listoftabwiget.add(digitalLibrary());
//         }
//         print('tabs');
//         print(tabs.length);
//       }
//     });
//     //_tabController.length = tabs.length;
//     return listoftabwiget;
//   }

//   static Future<http.Response> fetchget(
//       {@required String encoding, BuildContext context}) async {
//     IOClient ioClient = new IOClient();

//     HttpClient client = new HttpClient();

//     client.badCertificateCallback =
//         ((X509Certificate cert, String host, int port) => false);

//     ioClient = new IOClient(client);

//     //TODO: Use this URI for UATs
//     var uri = Uri.http(
//         'onerooftechnologiesllp.com', '/mfindia/web/public/api/$encoding');
//     final response = await ioClient.get(uri);

//     if (response.statusCode == 401) {
//     } else if (response.statusCode == 200) {
//       return response;
//     } else {
//       // throw AlertDialog(
//       //   title: Text("Invalid User"),
//       // );
//       return response;
//     }
//   }
// }

// import 'dart:convert';
// import 'dart:io';

// import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_share_me/flutter_share_me.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/io_client.dart';
// import 'package:marquee/marquee.dart';
// import 'package:merckfoundation22dec/model/HomepageResponse.dart';
// import 'package:merckfoundation22dec/ouraward.dart';
// import 'package:merckfoundation22dec/screens/dashboard.dart';
// import 'package:merckfoundation22dec/screens/ourPrograms/ourPrograms.dart';
// import 'package:merckfoundation22dec/screens/ourvision/vision.dart';
// import 'package:merckfoundation22dec/utility/APIManager.dart';
// import 'package:merckfoundation22dec/utility/GlobalLists.dart';
// import 'package:merckfoundation22dec/whatwedo/ourmission.dart';
// import 'package:merckfoundation22dec/whatwedo/ourpolicy.dart';
// import 'package:merckfoundation22dec/widget/customappbar.dart';
// import 'package:merckfoundation22dec/widget/customcard.dart';
// import 'package:merckfoundation22dec/widget/customcolor.dart';
// import 'package:merckfoundation22dec/widget/drawer.dart';
// import 'package:merckfoundation22dec/widget/formLabel.dart';
// import 'package:merckfoundation22dec/widget/showdailog.dart';
// import 'package:merckfoundation22dec/widget/sizeConfig.dart';
// import 'package:responsive_flutter/responsive_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';

// class Home extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return HomeState();
//   }
// }

// class FlotingData {
//   final String img;
//   final String title;

//   FlotingData({this.img, this.title});
// }

// class OurListModel {
//   final Color bgCol;
//   final String title;

//   OurListModel({this.bgCol, this.title});
// }

// class HomeState extends State<Home> with TickerProviderStateMixin {
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   CarouselSlider carouselSlider;
//   int _current = 0;
//   int _current1 = 0;
//   int currentIndex = 0;
//   final GlobalKey<State> _keyLoader = new GlobalKey<State>();
//   Map<dynamic, dynamic> mapsection = {};
//   List<dynamic> slidersection = [];
//   Map<dynamic, dynamic> videosection = {};
//   List _productsAvailable = [];
//   List _productsAvailable1 = [
//     "assets/images/slider1.jpg",
//     "assets/images/slider2.jpg",
//   ];
//   List typewidet = [];
//   List typewidetofrightsection = [];
//   List<programclass> _ourlist = [
//     //     programclass(
//     // programname: "Our \nVision", colors: Customcolor.colorBlue),
//     programclass(colors: Customcolor.pink_col, programname: "Our \nVision"),
//     programclass(colors: Customcolor.green_col, programname: "Our \nPrograms"),
//     programclass(
//         colors: Customcolor.lightgreen_col, programname: "News \nArticles"),
//     programclass(colors: Customcolor.violet_col, programname: "Our \nAwards"),
//     programclass(
//         colors: Customcolor.lightblue_col, programname: "Our \nMission"),
//     programclass(
//         colors: Customcolor.skyblue_col, programname: "Media \n& Events"),
//     programclass(
//         colors: Customcolor.darkblue_col, programname: "Covid \nResponse"),
//     programclass(colors: Customcolor.orange_col, programname: "Our \nPolicies"),
//   ];

//   AnimationController _controller;
//   final CarouselController callAppCarouselController = CarouselController();
//   final CarouselController digitalLibraryCarouselController =
//       CarouselController();
//   final CarouselController mmtmCarouselController = CarouselController();
//   bool iscall = true;
//   bool islibrary = false;
//   bool ismeck = false;
//   double imgHeight = 50;
//   bool expandClick = false;
//   String expandedName = "Upcoming Events";
//   bool isMiddleSectionLoaded = false;
//   bool isrightSectionLoaded = false;
//   final List<Tab> tabs = <Tab>[];

//   TabController _tabController;
//   List<Widget> listofwiget = [];
//   List<Widget> listoftabwiget = [];
//   @override
//   void initState() {
//     super.initState();
//     print("ho");
//     gethomeapi();
//     _tabController = new TabController(vsync: this, length: 3);
//     _controller = new AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 250),
//     );
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//         onWillPop: () {
//           ShowDialogs.showConfirmDialog(
//               context, "Exit", "Are you sure, want to exit?");
//         },
//         child: Scaffold(
//           backgroundColor: Customcolor.background,
//           key: _scaffoldKey,
//           appBar: CustomAppBar(
//             () {
//               print("kk");
//               _scaffoldKey.currentState.openDrawer();
//             },
//             1,
//             height: 120,
//           ),
//           drawer: Theme(
//             data: Theme.of(context).copyWith(
//               canvasColor: Colors.transparent,
//             ),
//             //child: null,
//             child: AppDrawer(),
//           ),
//           body:
//               //  Container(
//               //   padding: EdgeInsets.all(20.0),
//               //   child: FutureBuilder(
//               //       future: gethomeapi(),
//               //       builder: (context, snapshot) {
//               //         if (snapshot.hasData) {
//               //           return ListView(children: list());
//               //         } else {
//               //           return CircularProgressIndicator();
//               //         }
//               //       }),
//               // ),
//               Container(
//             width: double.infinity,
//             height: double.infinity,
//             child: ListView(
//               //  crossAxisAlignment: CrossAxisAlignment.start,
//               shrinkWrap: true,
//               physics: ScrollPhysics(),
//               children: [
//                 slider(context),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 _buildComplexMarquee(),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 8),
//                   child: ourlist(),
//                 ),
//                 followUs(),
//                 //  newSlider(context),

//                 SizedBox(
//                   height: 12,
//                 ),
//                 Visibility(
//                   visible: isMiddleSectionLoaded,
//                   replacement: Center(child: CircularProgressIndicator()),
//                   child: ListView(
//                       shrinkWrap: true,
//                       physics: ScrollPhysics(),
//                       // scrollDirection: Axis.horizontal,
//                       children: list()),
//                 ),
//                 // Container(
//                 //   padding: EdgeInsets.all(20.0),
//                 //   child: FutureBuilder(
//                 //       future: gethomeapi(),
//                 //       builder: (context, snapshot) {
//                 //         if (snapshot.hasData) {
//                 //           return ListView(
//                 //               shrinkWrap: true,
//                 //               scrollDirection: Axis.horizontal,
//                 //               children: list());
//                 //         } else {
//                 //           return CircularProgressIndicator();
//                 //         }
//                 //       }),
//                 // ),
//                 // CustomeCard(
//                 //   index: 1,
//                 //   cardImage: "assets/newImages/message.png",
//                 //   cardTitle:
//                 //       "Message Form Dr.Rasha Kelej, CEO of Merck Foundation   ",
//                 //   titleColor: Customcolor.text_darkblue,
//                 //   titleImg: "assets/newImages/flowers-2.png",
//                 //   subTitle:
//                 //       "Message Form Dr.Rasha Kelej, on the inauguration...",
//                 //   buttontitle: "Read More ",
//                 //   buttontitlecolor: Customcolor.text_darkblue,
//                 // ),
//                 // SizedBox(
//                 //   height: 12,
//                 // ),
//                 // CustomeCard(
//                 //   index: 2,
//                 //   cardImage: "assets/newImages/mqdefault.png",
//                 //   cardTitle: "Our Stories   ",
//                 //   titleColor: Customcolor.text_darkblue,
//                 //   titleImg: "assets/newImages/flowers-2.png",
//                 //   subTitle:
//                 //       "Message Form Dr.Rasha Kelej, on the inauguration...",
//                 //   buttontitle: "Watch More ",
//                 //   onBtnTap: () {
//                 //     Navigator.push(
//                 //         context,
//                 //         MaterialPageRoute(
//                 //             builder: (BuildContext context) => Dashboard(
//                 //                   index: 2,
//                 //                 )));
//                 //   },
//                 //   buttontitlecolor: Customcolor.text_darkblue,
//                 // ),

//                 // SizedBox(
//                 //   height: 8,
//                 // ),
//                 // RichText(
//                 //   text: TextSpan(
//                 //     children: [
//                 //       TextSpan(
//                 //         text:
//                 //             "Message Form Dr.Rasha Kelej, on the inauguration Message Form Dr.Rasha Kelej, on the inauguration...",
//                 //       ),
//                 //       WidgetSpan(
//                 //         child: Icon(Icons.add, size: 14),
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),
//                 // CustomeCard(
//                 //   index: 3,
//                 //   cardImage: "assets/newImages/gallery.png",
//                 //   cardTitle: "Photo Gallery   ",
//                 //   titleColor: Customcolor.text_darkblue,
//                 //   titleImg: "assets/newImages/flowers-3.png",
//                 //   subTitle: "",
//                 //   buttontitle: "View More ",
//                 //   buttontitlecolor: Customcolor.text_darkblue,
//                 // ),

//                 SizedBox(
//                   height: 8,
//                 ),

//                 Visibility(
//                   visible: isrightSectionLoaded,
//                   replacement: Column(
//                     children: [
//                       SizedBox(
//                         height: 20,
//                       ),
//                       CircularProgressIndicator()
//                     ],
//                   ),
//                   child: Container(
//                     height: 450,
//                     //color: Colors.amber,
//                     child: Column(
//                       children: [
//                         TabBar(
//                           isScrollable: true,
//                           unselectedLabelColor: Colors.grey,
//                           labelColor: Colors.black,
//                           indicatorSize: TabBarIndicatorSize.tab,
//                           indicator: new BubbleTabIndicator(
//                             indicatorHeight: 35.0,
//                             indicatorRadius: 5,
//                             indicatorColor: Customcolor.pinkbg.withOpacity(0.4),
//                             tabBarIndicatorSize: TabBarIndicatorSize.tab,
//                           ),
//                           tabs: tabs,
//                           controller: _tabController,
//                         ),
//                         Expanded(
//                           flex: 3,
//                           child: TabBarView(
//                               physics: ScrollPhysics(),
//                               controller: _tabController,
//                               children: tablist()
//                               // callforApplication(),
//                               // digitalLibrary(),
//                               // merckmorethanmother()
//                               ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 SizedBox(
//                   height: 10,
//                 ),
//                 // Padding(
//                 //   padding: const EdgeInsets.only(right: 60, left: 60),
//                 //   child: Image.asset(
//                 //     "assets/newImages/flowers_footer.png",
//                 //   ),
//                 // ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 0, left: 0),
//                   child: Align(
//                     alignment: Alignment.topRight,
//                     child: Image.asset(
//                       "assets/newImages/flowers_footer.png",
//                       height: 170,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 )
//               ],
//             ),
//           ),
//         ));
//   }

//   Widget callforApplication() {
//     return Padding(
//       padding: const EdgeInsets.only(
//         left: 10,
//         right: 10,
//         top: 10,
//       ),
//       child: Card(
//         elevation: 5,
//         // height: 1800,
//         color: Colors.white,

//         child: Padding(
//           padding: const EdgeInsets.only(
//             left: 12,
//             right: 12,
//             top: 10,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                       child: Text(
//                     expandedName,
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.black),
//                   )),
//                   GestureDetector(
//                     onTap: () {
//                       print("in tap");
//                       setState(() {
//                         expandClick = !expandClick;
//                       });
//                     },
//                     child: Image.asset(
//                       "assets/newImages/expand_more.png",
//                       width: 30,
//                       height: 30,
//                     ),
//                   )
//                 ],
//               ),
//               Expanded(child: getcallforapp(context)
//                   // Stack(
//                   //   children: [
//                   //     Padding(
//                   //       padding: const EdgeInsets.only(top: 10),
//                   //       child: Swiper.children(
//                   //         autoplay: false,
//                   //         loop: true,
//                   //         // pagination: SwiperPagination(
//                   //         //   margin: EdgeInsets.only(
//                   //         //     right: 25.0,
//                   //         //   ),
//                   //         //   builder: DotSwiperPaginationBuilder(
//                   //         //       color: Colors.grey),
//                   //         // ),
//                   //         control: SwiperControl(
//                   //             iconNext: Icons.arrow_forward_ios,
//                   //             iconPrevious: Icons.arrow_back_ios,
//                   //             size: 20,
//                   //             color: Customcolor.darkblue_col),
//                   //         children: <Widget>[
//                   //           Column(
//                   //             children: [
//                   //               Container(
//                   //                   margin: EdgeInsets.only(
//                   //                     right: 40.0,
//                   //                     left: 30,
//                   //                   ),
//                   //                   child: ClipRRect(
//                   //                       borderRadius: BorderRadius.circular(5.0),
//                   //                       child: Image.asset(
//                   //                         "assets/newImages/cfa1.png",
//                   //                         height: 270,
//                   //                         fit: BoxFit.fill,
//                   //                       ))),
//                   //               SizedBox(
//                   //                 height: 10,
//                   //               ),
//                   //               Text("UNESCO-MARS 2020",
//                   //                   style: TextStyle(
//                   //                     fontSize: 17,
//                   //                   ))
//                   //             ],
//                   //           ),
//                   //           Column(
//                   //             children: [
//                   //               Container(
//                   //                   margin: EdgeInsets.only(
//                   //                     right: 40.0,
//                   //                     left: 30,
//                   //                   ),
//                   //                   child: ClipRRect(
//                   //                       borderRadius: BorderRadius.circular(5.0),
//                   //                       child: Image.asset(
//                   //                         "assets/newImages/poster_4.png",
//                   //                         height: 300,
//                   //                         fit: BoxFit.fill,
//                   //                       ))),
//                   //               SizedBox(
//                   //                 height: 8,
//                   //               ),
//                   //               Text("UNESCO-MARS 2020",
//                   //                   style: TextStyle(
//                   //                     fontSize: 17,
//                   //                   ))
//                   //             ],
//                   //           ),
//                   //           Column(
//                   //             children: [
//                   //               Container(
//                   //                   margin: EdgeInsets.only(
//                   //                     right: 40.0,
//                   //                     left: 30,
//                   //                   ),
//                   //                   child: ClipRRect(
//                   //                       borderRadius: BorderRadius.circular(5.0),
//                   //                       child: Image.asset(
//                   //                         "assets/newImages/poster_6.png",
//                   //                         height: 300,
//                   //                         fit: BoxFit.fill,
//                   //                       ))),
//                   //               SizedBox(
//                   //                 height: 8,
//                   //               ),
//                   //               Text("UNESCO-MARS 2020",
//                   //                   style: TextStyle(
//                   //                     fontSize: 17,
//                   //                   ))
//                   //             ],
//                   //           ),
//                   //           Column(
//                   //             children: [
//                   //               Container(
//                   //                   margin: EdgeInsets.only(
//                   //                     right: 40.0,
//                   //                     left: 30,
//                   //                   ),
//                   //                   child: ClipRRect(
//                   //                       borderRadius: BorderRadius.circular(5.0),
//                   //                       child: Image.asset(
//                   //                         "assets/newImages/cfa1.png",
//                   //                         height: 300,
//                   //                         fit: BoxFit.fill,
//                   //                       ))),
//                   //               SizedBox(
//                   //                 height: 8,
//                   //               ),
//                   //               Text("UNESCO-MARS 2020",
//                   //                   style: TextStyle(
//                   //                     fontSize: 17,
//                   //                   ))
//                   //             ],
//                   //           ),
//                   //           Column(
//                   //             children: [
//                   //               Container(
//                   //                   margin: EdgeInsets.only(
//                   //                     right: 40.0,
//                   //                     left: 30,
//                   //                   ),
//                   //                   child: ClipRRect(
//                   //                       borderRadius: BorderRadius.circular(5.0),
//                   //                       child: Image.asset(
//                   //                         "assets/newImages/poster_4.png",
//                   //                         height: 300,
//                   //                         fit: BoxFit.fill,
//                   //                       ))),
//                   //               SizedBox(
//                   //                 height: 8,
//                   //               ),
//                   //               Text("UNESCO-MARS 2020",
//                   //                   style: TextStyle(
//                   //                     fontSize: 17,
//                   //                   ))
//                   //             ],
//                   //           ),
//                   //         ],
//                   //       ),
//                   //     ),
//                   //     expandClick
//                   //         ? Container(
//                   //             height: 130,
//                   //             decoration: BoxDecoration(
//                   //                 color: Colors.white,
//                   //                 borderRadius: BorderRadius.circular(10)),
//                   //             child: Card(
//                   //               elevation: 5,
//                   //               child: Padding(
//                   //                 padding: EdgeInsets.only(
//                   //                     top: 20, left: 10, right: 10),
//                   //                 child: Column(
//                   //                   crossAxisAlignment: CrossAxisAlignment.start,
//                   //                   children: [
//                   //                     GestureDetector(
//                   //                       onTap: () {
//                   //                         setState(() {
//                   //                           expandClick = false;
//                   //                           expandedName = "Upcoming Events";
//                   //                         });
//                   //                       },
//                   //                       child: Container(
//                   //                         color: Colors.transparent,
//                   //                         width: SizeConfig.blockSizeHorizontal *
//                   //                             100,
//                   //                         child: Text(
//                   //                           "Upcoming Events",
//                   //                           style: TextStyle(
//                   //                             color: Customcolor.colorblack,
//                   //                             fontSize: 20,
//                   //                           ),
//                   //                         ),
//                   //                       ),
//                   //                     ),
//                   //                     SizedBox(
//                   //                       height: 15,
//                   //                     ),
//                   //                     Container(
//                   //                       height: 1,
//                   //                       color: Customcolor.colorblack
//                   //                           .withOpacity(0.4),
//                   //                     ),
//                   //                     SizedBox(
//                   //                       height: 15,
//                   //                     ),
//                   //                     GestureDetector(
//                   //                       onTap: () {
//                   //                         setState(() {
//                   //                           expandClick = false;
//                   //                           expandedName = "Past Events";
//                   //                         });
//                   //                       },
//                   //                       child: Container(
//                   //                         color: Colors.transparent,
//                   //                         width: SizeConfig.blockSizeHorizontal *
//                   //                             100,
//                   //                         child: Text(
//                   //                           "Past Events",
//                   //                           style: TextStyle(
//                   //                             color: Customcolor.colorblack,
//                   //                             fontSize: 20,
//                   //                           ),
//                   //                         ),
//                   //                       ),
//                   //                     ),
//                   //                     SizedBox(
//                   //                       height: 15,
//                   //                     ),
//                   //                   ],
//                   //                 ),
//                   //               ),
//                   //             ),
//                   //           )
//                   //         : Container()
//                   //   ],
//                   // ),
//                   )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget getcallforapp(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         GlobalLists.homecallforapp.length <= 0
//             ? Container(
//                 child: Center(child: Text(Constantstring.emptyData)),
//               )
//             : Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   //color: Colors.amber,
//                   width: SizeConfig.blockSizeHorizontal * 100,
//                   height: 400,
//                   color: Colors.white,
//                   child: carouselSlider = CarouselSlider(
//                     options: CarouselOptions(
//                         autoPlay: false,
//                         // aspectRatio: 0.1,
//                         enlargeCenterPage: true,
//                         enlargeStrategy: CenterPageEnlargeStrategy.height,
//                         viewportFraction: 1.0,
//                         height: 340,
//                         onPageChanged: (index, reason) {
//                           setState(() {
//                             _current1 = index;
//                           });
//                         }),
//                     items: GlobalLists.homecallforapp.map((product) {
//                       return new Builder(
//                         builder: (BuildContext context) {
//                           return ListView(
//                             shrinkWrap: true,
//                             physics: ScrollPhysics(),
//                             // crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Center(
//                                 child: FadeInImage.assetNetwork(
//                                   placeholder:
//                                       'assets/newImages/placeholder_3.jpg',
//                                   image: GlobalLists.homeCallForAppBaseURL +
//                                       product.appImg,
//                                   fit: BoxFit.fill,
//                                   width: 240,
//                                   height: 290,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Center(
//                                 child: Text(product.title,
//                                     textAlign: TextAlign.center,
//                                     maxLines: 2,
//                                     style: TextStyle(
//                                       fontSize: 17,
//                                     )),
//                               )
//                             ],
//                           );
//                         },
//                       );
//                     }).toList(),
//                     carouselController: callAppCarouselController,
//                   ),
//                 ),
//               ),
//         Positioned(
//           top: 140,
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 GestureDetector(
//                     onTap: () {
//                       goToPrevious();
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Icon(
//                         Icons.arrow_back_ios,
//                         color: Customcolor.text_darkblue,
//                       ),
//                     )),
//                 GestureDetector(
//                     onTap: () {
//                       goToNext();
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 20),
//                       child: Icon(
//                         Icons.arrow_forward_ios,
//                         color: Customcolor.text_darkblue,
//                       ),
//                     )),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget getdigitallib(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         GlobalLists.homedigitallib.length <= 0
//             ? Container(
//                 child: Center(child: Text(Constantstring.emptyData)),
//               )
//             : Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   //color: Colors.amber,
//                   // width: SizeConfig.blockSizeHorizontal * 100,
//                   // height: SizeConfig.blockSizeVertical * 100,
//                   width: SizeConfig.blockSizeHorizontal * 100,
//                   height: 400,
//                   color: Colors.white,
//                   child: carouselSlider = CarouselSlider(
//                     options: CarouselOptions(
//                         autoPlay: false,
//                         // aspectRatio: 0.1,
//                         enlargeCenterPage: true,
//                         enlargeStrategy: CenterPageEnlargeStrategy.height,
//                         viewportFraction: 1.0,
//                         onPageChanged: (index, reason) {
//                           setState(() {
//                             _current1 = index;
//                           });
//                         }),
//                     items: GlobalLists.homedigitallib.map((product) {
//                       return new Builder(
//                         builder: (BuildContext context) {
//                           return ListView(
//                             shrinkWrap: true,
//                             physics: ScrollPhysics(),
//                             //  crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Center(
//                                 child: Container(
//                                   padding: EdgeInsets.only(top: 20),
//                                   width: 240,
//                                   height: 290,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(8)),
//                                   child: FadeInImage.assetNetwork(
//                                     placeholder:
//                                         'assets/newImages/placeholder_3.jpg',
//                                     image:
//                                         GlobalLists.homeDigitalLibraryBaseURL +
//                                             product.image,
//                                     fit: BoxFit.cover,
//                                     height: 200,
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Center(
//                                 child: Text(product.title,
//                                     textAlign: TextAlign.center,
//                                     maxLines: 2,
//                                     style: TextStyle(
//                                       fontSize: 17,
//                                     )),
//                               )
//                             ],
//                           );
//                         },
//                       );
//                     }).toList(),
//                     carouselController: callAppCarouselController,
//                   ),
//                 ),
//               ),
//         Positioned(
//           top: 140,
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 GestureDetector(
//                     onTap: () {
//                       goToPrevious();
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Icon(
//                         Icons.arrow_back_ios,
//                         color: Customcolor.text_darkblue,
//                       ),
//                     )),
//                 GestureDetector(
//                     onTap: () {
//                       goToNext();
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 20),
//                       child: Icon(
//                         Icons.arrow_forward_ios,
//                         color: Customcolor.text_darkblue,
//                       ),
//                     )),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget getMMTMS(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         GlobalLists.homemmtm.length <= 0
//             ? Container(
//                 child: Center(child: Text(Constantstring.emptyData)),
//               )
//             : Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   //color: Colors.amber,
//                   width: SizeConfig.blockSizeHorizontal * 100,
//                   height: 400,
//                   color: Colors.white,
//                   child: carouselSlider = CarouselSlider(
//                     options: CarouselOptions(
//                         autoPlay: false,
//                         aspectRatio: 1,
//                         enlargeCenterPage: true,
//                         enlargeStrategy: CenterPageEnlargeStrategy.height,
//                         viewportFraction: 1.0,
//                         //  height: SizeConfig.blockSizeVertical * 100,
//                         onPageChanged: (index, reason) {
//                           setState(() {
//                             _current1 = index;
//                           });
//                         }),
//                     items: GlobalLists.homemmtm.map((product) {
//                       return new Builder(
//                         builder: (BuildContext context) {
//                           return ListView(
//                             shrinkWrap: true,
//                             physics: ScrollPhysics(),
//                             //  crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Center(
//                                 child: Container(
//                                   padding: EdgeInsets.only(top: 20),
//                                   width: 240,
//                                   height: 290,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(8)),
//                                   child: FadeInImage.assetNetwork(
//                                     placeholder:
//                                         'assets/newImages/placeholder_3.jpg',
//                                     image: GlobalLists.homeMMTMBaseURL +
//                                         product.photo,
//                                     fit: BoxFit.cover,
//                                     height: 200,
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Center(
//                                 child: Text(product.photoDescription,
//                                     textAlign: TextAlign.center,
//                                     maxLines: 2,
//                                     style: TextStyle(
//                                       fontSize: 17,
//                                     )),
//                               )
//                             ],
//                           );
//                         },
//                       );
//                     }).toList(),
//                     carouselController: callAppCarouselController,
//                   ),
//                 ),
//               ),
//         Positioned(
//           top: 140,
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 GestureDetector(
//                     onTap: () {
//                       goToPrevious();
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Icon(
//                         Icons.arrow_back_ios,
//                         color: Customcolor.text_darkblue,
//                       ),
//                     )),
//                 GestureDetector(
//                     onTap: () {
//                       goToNext();
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 40),
//                       child: Icon(
//                         Icons.arrow_forward_ios,
//                         color: Customcolor.text_darkblue,
//                       ),
//                     )),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget digitalLibraryLastSection() {
//     return getdigitallib(context);
//   }

//   goToPrevious() {
//     callAppCarouselController.previousPage(
//         duration: Duration(milliseconds: 300), curve: Curves.ease);
//   }

//   goToNext() {
//     callAppCarouselController.nextPage(
//         duration: Duration(milliseconds: 300), curve: Curves.decelerate);
//   }

//   Widget digitalLibrary() {
//     return Padding(
//       padding: const EdgeInsets.only(
//         left: 10,
//         right: 10,
//         top: 10,
//       ),
//       child: Card(
//         elevation: 5,
//         // height: 1800,
//         color: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
//           child: Swiper.children(
//             autoplay: false,
//             loop: true,
//             control: SwiperControl(
//                 iconNext: Icons.arrow_forward_ios,
//                 iconPrevious: Icons.arrow_back_ios,
//                 size: 20,
//                 color: Customcolor.darkblue_col),
//             children: <Widget>[
//               Column(
//                 children: [
//                   Container(
//                       margin: EdgeInsets.only(
//                         right: 40.0,
//                         left: 30,
//                       ),
//                       child: ClipRRect(
//                           borderRadius: BorderRadius.circular(5.0),
//                           child: Image.asset(
//                             "assets/newImages/cfa1.png",
//                             height: 300,
//                             fit: BoxFit.fill,
//                           ))),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Text("UNESCO-MARS 2020",
//                       style: TextStyle(
//                         fontSize: 17,
//                       ))
//                 ],
//               ),
//               Column(
//                 children: [
//                   Container(
//                       margin: EdgeInsets.only(
//                         right: 40.0,
//                         left: 30,
//                       ),
//                       child: ClipRRect(
//                           borderRadius: BorderRadius.circular(5.0),
//                           child: Image.asset(
//                             "assets/newImages/poster_4.png",
//                             height: 300,
//                             fit: BoxFit.fill,
//                           ))),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Text("UNESCO-MARS 2020",
//                       style: TextStyle(
//                         fontSize: 17,
//                       ))
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget merckmorethanmother() {
//     return Padding(
//       padding: const EdgeInsets.only(
//         left: 10,
//         right: 10,
//         top: 10,
//       ),
//       child: Card(
//         elevation: 5,
//         // height: 1800,
//         color: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
//           child: Swiper.children(
//             autoplay: false,
//             loop: true,
//             control: SwiperControl(
//                 iconNext: Icons.arrow_forward_ios,
//                 iconPrevious: Icons.arrow_back_ios,
//                 size: 20,
//                 color: Customcolor.darkblue_col),
//             children: <Widget>[
//               Column(
//                 children: [
//                   Container(
//                       margin: EdgeInsets.only(
//                         right: 40.0,
//                         left: 30,
//                       ),
//                       child: ClipRRect(
//                           borderRadius: BorderRadius.circular(5.0),
//                           child: Image.asset(
//                             "assets/newImages/cfa1.png",
//                             height: 300,
//                             fit: BoxFit.fill,
//                           ))),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Text("UNESCO-MARS 2020",
//                       style: TextStyle(
//                         fontSize: 17,
//                       ))
//                 ],
//               ),
//               Column(
//                 children: [
//                   Container(
//                       margin: EdgeInsets.only(
//                         right: 40.0,
//                         left: 30,
//                       ),
//                       child: ClipRRect(
//                           borderRadius: BorderRadius.circular(5.0),
//                           child: Image.asset(
//                             "assets/newImages/poster_4.png",
//                             height: 300,
//                             fit: BoxFit.fill,
//                           ))),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Text("UNESCO-MARS 2020",
//                       style: TextStyle(
//                         fontSize: 17,
//                       ))
//                 ],
//               ),
//               Column(
//                 children: [
//                   Container(
//                       margin: EdgeInsets.only(
//                         right: 40.0,
//                         left: 30,
//                       ),
//                       child: ClipRRect(
//                           borderRadius: BorderRadius.circular(5.0),
//                           child: Image.asset(
//                             "assets/newImages/poster_6.png",
//                             height: 300,
//                             fit: BoxFit.fill,
//                           ))),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Text("UNESCO-MARS 2020",
//                       style: TextStyle(
//                         fontSize: 17,
//                       ))
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget slider(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 8),
//       child: Stack(
//         children: <Widget>[
//           Column(
//             children: <Widget>[
//               Container(
//                 child: carouselSlider = CarouselSlider(
//                   options: CarouselOptions(
//                     viewportFraction: 1.0,
//                     height: 170,
//                     autoPlay: true,
//                     onPageChanged: (index, reason) {
//                       setState(() {
//                         _current = index;
//                       });
//                     },
//                   ),
//                   items: _productsAvailable.map((product) {
//                     return new Builder(
//                       builder: (BuildContext context) {
//                         return new Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               image: DecorationImage(
//                                   image: NetworkImage(
//                                       "http://merckfoundation.org/merck/public/uploads/slider/" +
//                                           product['image']),
//                                   fit: BoxFit.cover)),
//                           width: SizeConfig.blockSizeHorizontal * 100,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: <Widget>[
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(right: 0, bottom: 15),
//                                 child: Container(
//                                   color: Colors.white.withOpacity(0.5),
//                                   width: SizeConfig.blockSizeHorizontal * 100,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 10, right: 10, top: 5, bottom: 5),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: <Widget>[
//                                         FormLabel(
//                                           text: product['image_title'],
//                                           labelColor: Customcolor.pink_col,
//                                           fontSize:
//                                               ResponsiveFlutter.of(context)
//                                                   .fontSize(1.4),
//                                           maxLines: 2,
//                                           fontweight: FontWeight.w700,
//                                         ),
//                                         SizedBox(
//                                           height: 2,
//                                         ),
//                                         FormLabel(
//                                           text: product['image_desc'],
//                                           labelColor: Customcolor.pink_col,
//                                           fontSize:
//                                               ResponsiveFlutter.of(context)
//                                                   .fontSize(1.2),
//                                           fontweight: FontWeight.w500,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   }).toList(),
//                 ),
//               ),
//               // new DotsIndicator(
//               //   dotsCount: _productsAvailable.length,
//               //   position: double.parse("$_current"),
//               //   decorator: DotsDecorator(
//               //     size: const Size.square(9.0),
//               //     activeSize: const Size(18.0, 9.0),
//               //     activeColor: Customcolor.colorBlue,
//               //     activeShape: RoundedRectangleBorder(
//               //         borderRadius: BorderRadius.circular(5.0)),
//               //   ),
//               // ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMarquee() {
//     return Container(
//       height: 20,
//       child: Marquee(
//         text: 'There once was a boy who told this story about a boy: "',
//       ),
//     );
//   }

//   Widget followUs() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8, top: 15),
//       child: Container(
//           child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Text("Follow Us on",
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                           fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
//                           fontWeight: FontWeight.w700,
//                           color: Customcolor.text_blue)),
//                 ],
//               ),
//               SizedBox(
//                 height: 18,
//               ),
//               Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () async {
//                       var response = await FlutterShareMe().openinsta(
//                           url: 'https://www.instagram.com/merckfoundation',
//                           msg: "Share");
// //                   var url = 'https://www.instagram.com/merckfoundation/';

// // if (await canLaunch(url)) {
// //   await launch(
// //     url,
// //     universalLinksOnly: true,
// //   );
// // } else {
// //   throw 'There was a problem to open the url: $url';
// // // }
//                       // _launchInWebViewWithJavaScript(
//                       //     "http://instagram.com/_u/merckfoundation");
//                       // if (Platform.isAndroid) {
//                       //   final AndroidIntent intent = AndroidIntent(
//                       //     action: 'Intent.ACTION_VIEW',
//                       //     package: "com.instagram.android",
//                       //     data:
//                       //         'https://instagram.com/merckfoundation/', // replace com.example.app with your applicationId
//                       //   );
//                       //   await intent.launch();
//                       // }

//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //         builder: (BuildContext context) => VideoPlayer(
//                       //               videoUrl:
//                       //                   " https://www.instagram.com/merckfoundation/",
//                       //             )));
//                       //  https://www.instagram.com/merckfoundation/
//                     },
//                     child: Image.asset(
//                       "assets/newImages/instagram.png",
//                       height: imgHeight,
//                       width: imgHeight,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   GestureDetector(
//                     onTap: () async {
//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //         builder: (BuildContext context) => VideoPlayer(
//                       //               videoUrl:
//                       //                   "https://www.facebook.com/merckfoundation/",
//                       //             )));
//                       var response = await FlutterShareMe().openinsta(
//                           url: 'https://www.facebook.com/merckfoundation/',
//                           msg: "Share");
//                     },
//                     child: Image.asset(
//                       "assets/newImages/facebook.png",
//                       height: imgHeight,
//                       width: imgHeight,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   GestureDetector(
//                     onTap: () async {
//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //         builder: (BuildContext context) => VideoPlayer(
//                       //               videoUrl:
//                       //                   "https://twitter.com/MerckFoundation/",
//                       //             )));
//                       var response = await FlutterShareMe().openinsta(
//                           url: 'https://twitter.com/MerckFoundation/',
//                           msg: "Share");
//                     },
//                     child: Image.asset(
//                       "assets/newImages/twitter.png",
//                       height: imgHeight,
//                       width: imgHeight,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   GestureDetector(
//                     onTap: () async {
//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //         builder: (BuildContext context) => VideoPlayer(
//                       //               videoUrl:
//                       //                   "https://www.youtube.com/channel/UCwU6L6rvR-6q0-5Jw03wscg",
//                       //             )));
//                       var response = await FlutterShareMe().openinsta(
//                           url:
//                               'https://www.youtube.com/channel/UCwU6L6rvR-6q0-5Jw03wscg',
//                           msg: "Share");
//                     },
//                     child: Image.asset(
//                       "assets/newImages/youtube.png",
//                       height: imgHeight,
//                       width: imgHeight,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   GestureDetector(
//                     onTap: () async {
//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //         builder: (BuildContext context) => VideoPlayer(
//                       //               videoUrl:
//                       //                   "https://www.flickr.com/photos/163124125@N08/",
//                       //             )));
//                       var response = await FlutterShareMe().openinsta(
//                           url: 'https://www.flickr.com/photos/163124125@N08/',
//                           msg: "Share");
//                     },
//                     child: Image.asset(
//                       "assets/newImages/flickr.png",
//                       height: imgHeight,
//                       width: imgHeight,
//                     ),
//                   ),
//                   // SizedBox(
//                   //   width: 7,
//                   // ),
//                 ],
//               )
//             ],
//           ),
//           Image.asset(
//             "assets/newImages/hometoolbar.png",
//             height: 100,
//             width: 80,
//           )
//         ],
//       )),
//     );
//   }

//   Widget _buildComplexMarquee() {
//     return Container(
//       height: 30,
//       child: Marquee(
//         text:
//             'Call for Application-UNESCO MARS 2020          Savethe Date-Merck Foundation "Stay at home" Media recognization award 2020-online edtion for africa and latin america',
//         style: TextStyle(
//             fontWeight: FontWeight.w700, color: Customcolor.text_blue),
//         scrollAxis: Axis.horizontal,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         blankSpace: 20.0,
//         velocity: 100.0,
//         pauseAfterRound: Duration(seconds: 1),
//         showFadingOnlyWhenScrolling: true,
//         fadingEdgeStartFraction: 0.1,
//         fadingEdgeEndFraction: 0.1,
//         numberOfRounds: null,
//         startPadding: 10.0,
//         accelerationDuration: Duration(seconds: 1),
//         accelerationCurve: Curves.linear,
//         decelerationDuration: Duration(milliseconds: 500),
//         decelerationCurve: Curves.easeOut,
//       ),
//     );
//   }

//   Widget _wrapWithStuff(Widget child) {
//     return Padding(
//       padding: EdgeInsets.all(16.0),
//       child: Container(height: 50.0, color: Colors.white, child: child),
//     );
//   }

//   Future<void> _launchInWebViewWithJavaScript(String url) async {
//     if (await canLaunch(url)) {
//       await launch(
//         url,
//         forceSafariVC: true,
//         forceWebView: true,
//         enableJavaScript: true,
//       );
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   // Widget newSlider(BuildContext context) {
//   //   return Stack(
//   //     children: <Widget>[
//   //       Column(
//   //         children: <Widget>[
//   //           Container(
//   //             child: carouselSlider = CarouselSlider(
//   //               options: CarouselOptions(
//   //                 viewportFraction: 1.0,
//   //                 height: 350,
//   //                 autoPlay: false,
//   //                 onPageChanged: (index, reason) {
//   //                   setState(() {
//   //                     _current1 = index;
//   //                   });
//   //                 },
//   //               ),
//   //               items: _productsAvailable1.map((product) {
//   //                 return new Builder(
//   //                   builder: (BuildContext context) {
//   //                     return new GridView.count(
//   //                       crossAxisCount: 2,
//   //                       crossAxisSpacing: 10.0,
//   //                       mainAxisSpacing: 10.0,
//   //                       shrinkWrap: true,
//   //                       scrollDirection: Axis.horizontal,
//   //                       children: List.generate(
//   //                         4,
//   //                         (index) {
//   //                           return Padding(
//   //                             padding: const EdgeInsets.all(10.0),
//   //                             child: Container(
//   //                               decoration: BoxDecoration(
//   //                                 image: DecorationImage(
//   //                                   image: AssetImage(
//   //                                       "assets/images/logo_nav1.png"),
//   //                                   fit: BoxFit.cover,
//   //                                 ),
//   //                                 borderRadius: BorderRadius.all(
//   //                                   Radius.circular(20.0),
//   //                                 ),
//   //                               ),
//   //                             ),
//   //                           );
//   //                         },
//   //                       ),
//   //                     );
//   //                   },
//   //                 );
//   //               }).toList(),
//   //             ),
//   //           ),
//   //           new DotsIndicator(
//   //             dotsCount: _productsAvailable1.length,
//   //             position: double.parse("$_current1"),
//   //             decorator: DotsDecorator(
//   //               size: const Size.square(9.0),
//   //               activeSize: const Size(18.0, 9.0),
//   //               activeColor: Customcolor.colorBlue,
//   //               activeShape: RoundedRectangleBorder(
//   //                   borderRadius: BorderRadius.circular(5.0)),
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //     ],
//   //   );
//   // }

//   Widget ourlist() {
//     //print(_ourlist.length);

//     return Container(
//         height: 100,
//         child: ListView.builder(
//             shrinkWrap: true,
//             scrollDirection: Axis.horizontal,
//             itemCount: _ourlist.length,
//             itemBuilder: (BuildContext context, int index) => Padding(
//                 padding: const EdgeInsets.only(right: 0.0, left: 8),
//                 child: GestureDetector(
//                     onTap: () {
//                       if (index == 0) {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) =>
//                                     OurVision()));
//                       } else if (index == 1) {
//                         //our program
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) => Dashboard(
//                                       index: 1,
//                                     )));
//                       } else if (index == 2) {
//                         //news article
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) => Dashboard(
//                                       index: 3,
//                                     )));
//                       } else if (index == 3) {
//                         //our award
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) => Ouraward()));
//                       } else if (index == 4) {
//                         //our mission
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) =>
//                                     OurMission()));
//                       } else if (index == 5) {
//                         //  media & events
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) => Dashboard(
//                                       index: 3,
//                                     )));
//                       } else if (index == 6) {
//                         //covid response
//                       } else if (index == 7) {
//                         //our polcies
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) =>
//                                     OurPolicy()));
//                       }
//                     },
//                     child: Container(
//                       width: 100,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         color: _ourlist[index].colors,
//                       ),
//                       child: Center(
//                           child: Text(
//                         _ourlist[index].programname,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                           fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
//                         ),
//                       )),
//                     )))));
//   }

//   ////////////////////////

//   Future<http.Response> gethomeapi() async {
//     print("home api");
//     var response = await APIManager.fetchget(
//       encoding: APIManager.homeurl,
//     );
//     print("response");
//     print(response);

//     var res = json.decode(response.body);
//     print("ff");
//     print(res);
//     HomepageResponse homepageres = HomepageResponse.fromJson(res);

//     slidersection = homepageres.sliderArea[0].slider.list;
//     slidersection.forEach((element) {
//       _productsAvailable.add({
//         "id": element.id,
//         "menu_id": element.menuId,
//         "image_title": element.imageTitle,
//         "image_desc": element.imageDesc,
//         "links": element.links,
//         "image": element.image,
//         "alt_text": element.altText,
//         "status": element.status,
//         "created_at": element.createdAt,
//         "updated_at": element.updatedAt
//       });
//     });

//     print("slidersection");
//     print(slidersection.length);

//     Map<String, dynamic> section1 = homepageres.middleArea;
//     Map<String, dynamic> lastsection = homepageres.rightArea;
//     print(section1);
//     print(section1['1']);

//     for (int i = 0; i < section1.length; i++) {
//       //  MiddleArea categoryKeys = section1[(i + 1).toString()];
//       //  print(categoryKeys.videos.type);
//       dynamic section = res['middle_area']['${i + 1}'];
//       print("TKey: ${section.keys.first}");
//       var middlecategoryname = section.keys.first;

//       setState(() {
//         typewidet.add(middlecategoryname);

//         print(typewidet);
//       });
//       if (middlecategoryname.toString().toLowerCase() ==
//           "Videos".toLowerCase()) {
//         GlobalLists.homevideolist =
//             homepageres.middleArea['${i + 1}'].videos.list;
//         print(GlobalLists.homevideolist.length);
//       } else if (middlecategoryname.toString().toLowerCase() ==
//           "awards".toLowerCase()) {
//         GlobalLists.homeawardlist =
//             homepageres.middleArea['${i + 1}'].awards.list;
//         print(GlobalLists.homeawardlist.length);
//       } else if (middlecategoryname.toString().toLowerCase() ==
//           "content".toLowerCase()) {
//         GlobalLists.homecontentlist =
//             homepageres.middleArea['${i + 1}'].content.list;
//         print(GlobalLists.homecontentlist.length);
//       } else if (middlecategoryname.toString().toLowerCase() ==
//           "gallery".toLowerCase()) {
//         GlobalLists.homegallerybaseurl =
//             homepageres.middleArea['${i + 1}'].gallery.baseUrl;
//         GlobalLists.homegallerylist =
//             homepageres.middleArea['${i + 1}'].gallery.list;
//         print(GlobalLists.homegallerylist.length);
//       } else if (middlecategoryname.toString().toLowerCase() ==
//           "ceo_msg".toLowerCase()) {
//         GlobalLists.homeceomsgbaseurl =
//             homepageres.middleArea['${i + 1}'].ceoMsg.baseUrl;
//         GlobalLists.homeceomsglist =
//             homepageres.middleArea['${i + 1}'].ceoMsg.list;
//         print(GlobalLists.homeceomsglist.length);
//       }
//     }

//     ///////right section
//     for (int i = 0; i < lastsection.length; i++) {
//       //  MiddleArea categoryKeys = section1[(i + 1).toString()];
//       //  print(categoryKeys.videos.type);
//       dynamic rightsection = res['Right_area']['${i + 1}'];
//       print("TKey: ${rightsection.keys.first}");
//       var rightsectioncategoryname = rightsection.keys.first;

//       setState(() {
//         typewidetofrightsection.add(rightsectioncategoryname);

//         print(typewidetofrightsection);
//       });

//       if (rightsectioncategoryname.toString().toLowerCase() ==
//           "call_for_app".toLowerCase()) {
//         GlobalLists.homecallforapp =
//             homepageres.rightArea['${i + 1}'].callForApp.list;
//         GlobalLists.homeCallForAppBaseURL =
//             homepageres.rightArea['${i + 1}'].callForApp.baseUrl;
//         print(GlobalLists.homecallforapp.length);
//       } else if (rightsectioncategoryname.toString().toLowerCase() ==
//           "mmtm".toLowerCase()) {
//         GlobalLists.homemmtm = homepageres.rightArea['${i + 1}'].mmtm.list;
//         print(GlobalLists.homemmtm.length);
//         GlobalLists.homeMMTMBaseURL =
//             homepageres.rightArea['${i + 1}'].mmtm.baseUrl;
//       } else if (rightsectioncategoryname.toString().toLowerCase() ==
//           "digital_library".toLowerCase()) {
//         GlobalLists.homedigitallib =
//             homepageres.rightArea['${i + 1}'].digitalLibrary.list;
//         GlobalLists.homeDigitalLibraryBaseURL =
//             homepageres.rightArea['${i + 1}'].digitalLibrary.baseUrl;
//         print(GlobalLists.homedigitallib.length);
//       }
//     }
//     setState(() {
//       isMiddleSectionLoaded = true;
//       isrightSectionLoaded = true;
//     });

//     return response;
//   }
// //   Future<http.Response> gethomeapi() async {
// //     var response = await fetchget(
// //       encoding: "program_page_api/home/Android/1",
// //     );
// //     print("response");
// //     print(response);
// //     const JsonEncoder encoder = JsonEncoder.withIndent('  ');
// //     var res = json.decode(response.body);
// //     print("ff");

// //     // slidersection = res['slider_area']['5'];
// //     // print("slidersection");
// //     // print(slidersection.length);

// //     dynamic section1 = res['middle_area']['1'];//1
// //     dynamic section2 = res['middle_area']['2'];//2
// //     dynamic section3 = res['middle_area']['3'];
// //     dynamic section4 = res['middle_area']['4'];
// //     dynamic section5 = res['middle_area']['5'];

// //     var section1key = section1.keys.first; //video
// //     var section2key = section2.keys.first; //award
// //     var section3key = section3.keys.first; //content
// //     var section4key = section4.keys.first; //gallery
// //     var section5key = section5.keys.first;
// //     setState(() {
// //       typewidet = [
// //         section1key,
// //         section2key,
// //         section3key,
// //         section4key,
// //         section5key
// //       ];

// //       print(typewidet);
// //     }); //ceo_msg

// //     print(section1key);
// //     print("section1key");

// //     print(section2key);
// //     print("section2key");
// //     print(section3key);
// //     print("section3key");
// //     print(section4key);
// //     print("section4key");
// //     print(section5key);
// //     print("section5key");
// //     //section1
// //     if (section1key == "videos") {
// //       //videolist
// //       setState(() {
// //         videosection = res['middle_area']['1']['videos']['list'];

// //         dynamic key = videosection.keys.elementAt(0);
// //         print(key);
// // //1st Video Preview
// //         Programvideo video = Programvideo.fromJson(videosection[key]);

// //         //List of all vidwoModels
// //         List<Programvideo> programVidList = [];
// //         videosection.forEach((key, value) {
// //           programVidList.add(Programvideo.fromJson(value));
// //         });

// //         print(video.videoDesc);
// //         print(programVidList.length);

// //         Map<dynamic, dynamic> contentsection =
// //             res['middle_area']['3']['content']['list'];
// //         dynamic keycontent = contentsection.keys.elementAt(0);
// //         Homecontent content = Homecontent.fromJson(contentsection[keycontent]);
// //         print(content.pageContent);
// //       });

// //       //print(video.videoDesc);
// //       print("here");
// //     } else if (section1key == "awards") {
// //       //award
// //       print("not here");
// //     } else if (section1key == "content") {
// //       //covid
// //       print("not here");
// //     } else if (section1key == "gallery") {
// //       //album
// //       print("not here");
// //     } else if (section1key == "ceo_msg") {
// //       //article
// //       print("not here");
// //     }
// // //section2
// //     if (section2key == "videos") {
// //       //videolist
// //       videosection = res['middle_area']['1']['videos'];
// //       // print(videosection[0]);
// //       print("not here");
// //     } else if (section2key == "11") {
// //       //award
// //       print("here");
// //     } else if (section2key == "13") {
// //       //covid
// //       print("not here");
// //     } else if (section2key == "15") {
// //       //album
// //       print("not here");
// //     } else if (section2key == "23") {
// //       //article
// //       print("not here");
// //     }
// // //section3
// //     if (section3key == "videos") {
// //       //videolist
// //       videosection = res['middle_area']['1']['videos'];

// //       print("not here");
// //     } else if (section3key == "11") {
// //       //award
// //       print("not here");
// //     } else if (section3key == "13") {
// //       //covid
// //       print("should came here");
// //     } else if (section3key == "15") {
// //       //album
// //       print("not here");
// //     } else if (section3key == "23") {
// //       //article
// //       print("not here");
// //     }

// //     //section4
// //     if (section4key == "videos") {
// //       //videolist
// //       videosection = res['middle_area']['1']['videos'];

// //       print("not here");
// //     } else if (section4key == "11") {
// //       //award
// //       print("not here");
// //     } else if (section4key == "13") {
// //       //covid
// //       print("not here");
// //     } else if (section4key == "15") {
// //       //album
// //       print("here");
// //     } else if (section4key == "23") {
// //       //article
// //       print("not here");
// //     }

// //     //section5
// //     if (section5key == "videos") {
// //       //videolist
// //       videosection = res['middle_area']['1']['videos'];

// //       print("not here");
// //     } else if (section5key == "11") {
// //       //award
// //       print("not here");
// //     } else if (section5key == "13") {
// //       //covid
// //       print("not here");
// //     } else if (section5key == "15") {
// //       //album
// //       print("not here");
// //     } else if (section5key == "23") {
// //       //article
// //       print("here");
// //     }
// //     // print(res['middle_area']["1"]['14'].runtimeType);
// //     // setState(() {
// //     //   mapsection = res['middle_area']["1"]['14'];
// //     // });

// //     // print("ken");
// //     // print(mapsection.length);
// //     // print(mapsection);
// //     // mapsection.forEach((key, value) {
// //     //   print("Key : ${key} value ${value}");
// //     // });

// //     return response;
// //   }

//   List<Widget> list() {
//     listofwiget.clear();
//     for (int i = 0; i < typewidet.length; i++) {
//       if (typewidet[i] == "videos") {
//         listofwiget.add(
//           CustomeCard(
//             //   index: 2,
//             cardImage:
//                 'https://img.youtube.com/vi/${GlobalLists.homevideolist[0].videoLink.substring(GlobalLists.homevideolist[0].videoLink.length - 11)}/mqdefault.jpg',
//             cardTitle: "Our Stories   ",
//             titleColor: Customcolor.text_darkblue,
//             titleImg: "assets/newImages/flowers-2.png",
//             subTitle: GlobalLists.homevideolist[0].videoDesc,
//             buttontitle: "Watch More ",
//             onBtnTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (BuildContext context) => Dashboard(
//                             index: 2,
//                           )));
//             },
//             buttontitlecolor: Customcolor.text_darkblue,
//           ),
//         );
//       }
//       if (typewidet[i] == "awards") {
//         listofwiget.add(SizedBox());
//       }
//       if (typewidet[i] == "content") {
//         listofwiget.add(SizedBox());
//       }
//       if (typewidet[i] == "gallery") {
//         listofwiget.add(
//           CustomeCard(
//             index: 3,
//             cardImage: GlobalLists.homegallerybaseurl +
//                 GlobalLists.homegallerylist[0].photo,
//             cardTitle: "Photo Gallery   ",
//             titleColor: Customcolor.text_darkblue,
//             titleImg: "assets/newImages/flowers-3.png",
//             subTitle: GlobalLists.homegallerylist[0].photoDescription,
//             buttontitle: "View More ",
//             buttontitlecolor: Customcolor.text_darkblue,
//           ),
//         );
//       }
//       if (typewidet[i] == "ceo_msg") {
//         listofwiget.add(
//           CustomeCard(
//             index: 1,
//             cardImage: GlobalLists.homeceomsgbaseurl +
//                 GlobalLists.homeceomsglist[0].image,
//             cardTitle:
//                 "Message Form Dr.Rasha Kelej, CEO of Merck Foundation   ",
//             titleColor: Customcolor.text_darkblue,
//             titleImg: "assets/newImages/flowers-2.png",
//             subTitle: GlobalLists.homeceomsglist[0].title,
//             buttontitle: "Read More ",
//             buttontitlecolor: Customcolor.text_darkblue,
//           ),
//         );
//       }
//     }

//     return listofwiget;
//   }

//   List<Widget> tablist() {
//     setState(() {
//       listoftabwiget.clear();
//       tabs.clear();

//       // digitalLibrary(),
//       // merckmorethanmother()
//       for (int i = 0; i < typewidetofrightsection.length; i++) {
//         if (typewidetofrightsection[i] == "call_for_app") {
//           tabs.add(
//             new Tab(text: "Call for Application"),
//           );

//           listoftabwiget.add(
//             getcallforapp(context),
//           );
//         }
//         if (typewidetofrightsection[i] == "mmtm") {
//           tabs.add(
//             new Tab(text: "Merck More Than A Mother Ambassadors"),
//           );
//           listoftabwiget.add(getMMTMS(context));
//         }
//         if (typewidetofrightsection[i] == "digital_library") {
//           tabs.add(
//             new Tab(text: "Digital Library"),
//           );
//           listoftabwiget.add(digitalLibraryLastSection());
//         }
//         print('tabs');
//         print(tabs.length);
//       }
//     });
//     //_tabController.length = tabs.length;
//     return listoftabwiget;
//   }
// }

// // import 'dart:convert';

// // import 'dart:io';

// // import 'package:android_intent/android_intent.dart';
// // import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
// // import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:dots_indicator/dots_indicator.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_share_me/flutter_share_me.dart';
// // import 'package:http/http.dart' as http;

// // import 'package:flutter_swiper/flutter_swiper.dart';
// // import 'package:http/io_client.dart';
// // import 'package:marquee/marquee.dart';
// // import 'package:merckfoundation22dec/mediascreen.dart/videoplayer.dart';
// // import 'package:merckfoundation22dec/model/HomepageResponse.dart';
// // import 'package:merckfoundation22dec/ouraward.dart';
// // import 'package:merckfoundation22dec/screens/dashboard.dart';
// // import 'package:merckfoundation22dec/screens/ourvision/vision.dart';
// // import 'package:merckfoundation22dec/utility/GlobalLists.dart';
// // import 'package:merckfoundation22dec/whatwedo/ourmission.dart';
// // import 'package:merckfoundation22dec/whatwedo/ourpolicy.dart';
// // import 'package:merckfoundation22dec/widget/customappbar.dart';
// // import 'package:merckfoundation22dec/screens/ourPrograms/ourPrograms.dart';
// // import 'package:merckfoundation22dec/widget/customcard.dart';
// // import 'package:merckfoundation22dec/widget/customcolor.dart';
// // import 'package:merckfoundation22dec/widget/drawer.dart';
// // import 'package:merckfoundation22dec/widget/formLabel.dart';
// // import 'package:merckfoundation22dec/widget/showdailog.dart';
// // import 'package:merckfoundation22dec/widget/sizeConfig.dart';
// // import 'package:url_launcher/url_launcher.dart';
// // import 'package:merckfoundation22dec/model/programvideo.dart';

// // import 'package:responsive_flutter/responsive_flutter.dart';

// // class Home extends StatefulWidget {
// //   @override
// //   State<StatefulWidget> createState() {
// //     return HomeState();
// //   }
// // }

// // class FlotingData {
// //   final String img;
// //   final String title;

// //   FlotingData({this.img, this.title});
// // }

// // class OurListModel {
// //   final Color bgCol;
// //   final String title;

// //   OurListModel({this.bgCol, this.title});
// // }

// // class HomeState extends State<Home> with TickerProviderStateMixin {
// //   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
// //   CarouselSlider carouselSlider;
// //   int _current = 0;
// //   int _current1 = 0;
// //   int currentIndex = 0;
// //   final GlobalKey<State> _keyLoader = new GlobalKey<State>();
// //   Map<dynamic, dynamic> mapsection = {};
// //   List<dynamic> slidersection = [];
// //   Map<dynamic, dynamic> videosection = {};
// //   List _productsAvailable = [];
// //   List _productsAvailable1 = [
// //     "assets/images/slider1.jpg",
// //     "assets/images/slider2.jpg",
// //   ];
// //   List typewidet = [];
// //   List typewidetofrightsection = [];
// //   List<programclass> _ourlist = [
// //     //     programclass(
// //     // programname: "Our \nVision", colors: Customcolor.colorBlue),
// //     programclass(colors: Customcolor.pink_col, programname: "Our \nVision"),
// //     programclass(colors: Customcolor.green_col, programname: "Our \nPrograms"),
// //     programclass(
// //         colors: Customcolor.lightgreen_col, programname: "News \nArticles"),
// //     programclass(colors: Customcolor.violet_col, programname: "Our \nAwards"),
// //     programclass(
// //         colors: Customcolor.lightblue_col, programname: "Our \nMission"),
// //     programclass(
// //         colors: Customcolor.skyblue_col, programname: "Media \n& Events"),
// //     programclass(
// //         colors: Customcolor.darkblue_col, programname: "Covid \nResponse"),
// //     programclass(colors: Customcolor.orange_col, programname: "Our \nPolicies"),
// //   ];

// //   AnimationController _controller;
// //   bool iscall = true;
// //   bool islibrary = false;
// //   bool ismeck = false;
// //   double imgHeight = 50;
// //   bool expandClick = false;
// //   String expandedName = "Upcoming Events";
// //   bool isMiddleSectionLoaded = false;
// //   bool isrightSectionLoaded = false;
// //   final List<Tab> tabs = <Tab>[];

// //   TabController _tabController;
// //   List<Widget> listofwiget = [];
// //   List<Widget> listoftabwiget = [];
// //   @override
// //   void initState() {
// //     super.initState();
// //     print("ho");
// //     gethomeapi();
// //     _tabController = new TabController(vsync: this, length: 3);
// //     _controller = new AnimationController(
// //       vsync: this,
// //       duration: const Duration(milliseconds: 250),
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     _tabController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return WillPopScope(
// //         onWillPop: () {
// //           ShowDialogs.showConfirmDialog(
// //               context, "Exit", "Are you sure, want to exit?");
// //         },
// //         child: Scaffold(
// //           backgroundColor: Customcolor.background,
// //           key: _scaffoldKey,
// //           appBar: CustomAppBar(
// //             () {
// //               print("kk");
// //               _scaffoldKey.currentState.openDrawer();
// //             },
// //             1,
// //             height: 120,
// //           ),
// //           drawer: Theme(
// //             data: Theme.of(context).copyWith(
// //               canvasColor: Colors.transparent,
// //             ),
// //             //child: null,
// //             child: AppDrawer(),
// //           ),
// //           body:
// //               //  Container(
// //               //   padding: EdgeInsets.all(20.0),
// //               //   child: FutureBuilder(
// //               //       future: gethomeapi(),
// //               //       builder: (context, snapshot) {
// //               //         if (snapshot.hasData) {
// //               //           return ListView(children: list());
// //               //         } else {
// //               //           return CircularProgressIndicator();
// //               //         }
// //               //       }),
// //               // ),
// //               Container(
// //             width: double.infinity,
// //             height: double.infinity,
// //             child: ListView(
// //               //  crossAxisAlignment: CrossAxisAlignment.start,
// //               shrinkWrap: true,
// //               physics: ScrollPhysics(),
// //               children: [
// //                 slider(context),
// //                 SizedBox(
// //                   height: 10,
// //                 ),
// //                 _buildComplexMarquee(),
// //                 SizedBox(
// //                   height: 5,
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.only(right: 8),
// //                   child: ourlist(),
// //                 ),
// //                 followUs(),
// //                 //  newSlider(context),

// //                 SizedBox(
// //                   height: 12,
// //                 ),
// //                 Visibility(
// //                   visible: isMiddleSectionLoaded,
// //                   replacement: Center(child: CircularProgressIndicator()),
// //                   child: ListView(
// //                       shrinkWrap: true,
// //                       physics: ScrollPhysics(),
// //                       // scrollDirection: Axis.horizontal,
// //                       children: list()),
// //                 ),
// //                 // Container(
// //                 //   padding: EdgeInsets.all(20.0),
// //                 //   child: FutureBuilder(
// //                 //       future: gethomeapi(),
// //                 //       builder: (context, snapshot) {
// //                 //         if (snapshot.hasData) {
// //                 //           return ListView(
// //                 //               shrinkWrap: true,
// //                 //               scrollDirection: Axis.horizontal,
// //                 //               children: list());
// //                 //         } else {
// //                 //           return CircularProgressIndicator();
// //                 //         }
// //                 //       }),
// //                 // ),
// //                 // CustomeCard(
// //                 //   index: 1,
// //                 //   cardImage: "assets/newImages/message.png",
// //                 //   cardTitle:
// //                 //       "Message Form Dr.Rasha Kelej, CEO of Merck Foundation   ",
// //                 //   titleColor: Customcolor.text_darkblue,
// //                 //   titleImg: "assets/newImages/flowers-2.png",
// //                 //   subTitle:
// //                 //       "Message Form Dr.Rasha Kelej, on the inauguration...",
// //                 //   buttontitle: "Read More ",
// //                 //   buttontitlecolor: Customcolor.text_darkblue,
// //                 // ),
// //                 // SizedBox(
// //                 //   height: 12,
// //                 // ),
// //                 // CustomeCard(
// //                 //   index: 2,
// //                 //   cardImage: "assets/newImages/mqdefault.png",
// //                 //   cardTitle: "Our Stories   ",
// //                 //   titleColor: Customcolor.text_darkblue,
// //                 //   titleImg: "assets/newImages/flowers-2.png",
// //                 //   subTitle:
// //                 //       "Message Form Dr.Rasha Kelej, on the inauguration...",
// //                 //   buttontitle: "Watch More ",
// //                 //   onBtnTap: () {
// //                 //     Navigator.push(
// //                 //         context,
// //                 //         MaterialPageRoute(
// //                 //             builder: (BuildContext context) => Dashboard(
// //                 //                   index: 2,
// //                 //                 )));
// //                 //   },
// //                 //   buttontitlecolor: Customcolor.text_darkblue,
// //                 // ),

// //                 // SizedBox(
// //                 //   height: 8,
// //                 // ),
// //                 // RichText(
// //                 //   text: TextSpan(
// //                 //     children: [
// //                 //       TextSpan(
// //                 //         text:
// //                 //             "Message Form Dr.Rasha Kelej, on the inauguration Message Form Dr.Rasha Kelej, on the inauguration...",
// //                 //       ),
// //                 //       WidgetSpan(
// //                 //         child: Icon(Icons.add, size: 14),
// //                 //       ),
// //                 //     ],
// //                 //   ),
// //                 // ),
// //                 // CustomeCard(
// //                 //   index: 3,
// //                 //   cardImage: "assets/newImages/gallery.png",
// //                 //   cardTitle: "Photo Gallery   ",
// //                 //   titleColor: Customcolor.text_darkblue,
// //                 //   titleImg: "assets/newImages/flowers-3.png",
// //                 //   subTitle: "",
// //                 //   buttontitle: "View More ",
// //                 //   buttontitlecolor: Customcolor.text_darkblue,
// //                 // ),

// //                 SizedBox(
// //                   height: 8,
// //                 ),

// //                 Container(
// //                   height: 450,
// //                   //color: Colors.amber,
// //                   child: Column(
// //                     children: [
// //                       TabBar(
// //                         isScrollable: true,
// //                         unselectedLabelColor: Colors.grey,
// //                         labelColor: Colors.black,
// //                         indicatorSize: TabBarIndicatorSize.tab,
// //                         indicator: new BubbleTabIndicator(
// //                           indicatorHeight: 35.0,
// //                           indicatorRadius: 5,
// //                           indicatorColor: Customcolor.pinkbg.withOpacity(0.4),
// //                           tabBarIndicatorSize: TabBarIndicatorSize.tab,
// //                         ),
// //                         tabs: tabs,
// //                         controller: _tabController,
// //                       ),
// //                       Expanded(
// //                         flex: 3,
// //                         child: TabBarView(
// //                             physics: ScrollPhysics(),
// //                             controller: _tabController,
// //                             children: tablist()
// //                             // callforApplication(),
// //                             // digitalLibrary(),
// //                             // merckmorethanmother()
// //                             ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),

// //                 SizedBox(
// //                   height: 10,
// //                 ),
// //                 // Padding(
// //                 //   padding: const EdgeInsets.only(right: 60, left: 60),
// //                 //   child: Image.asset(
// //                 //     "assets/newImages/flowers_footer.png",
// //                 //   ),
// //                 // ),
// //                 Padding(
// //                   padding: const EdgeInsets.only(right: 0, left: 0),
// //                   child: Align(
// //                     alignment: Alignment.topRight,
// //                     child: Image.asset(
// //                       "assets/newImages/flowers_footer.png",
// //                       height: 170,
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(
// //                   height: 10,
// //                 )
// //               ],
// //             ),
// //           ),
// //         ));
// //   }

// //   Widget callforApplication() {
// //     return Padding(
// //       padding: const EdgeInsets.only(
// //         left: 10,
// //         right: 10,
// //         top: 10,
// //       ),
// //       child: Card(
// //         elevation: 5,
// //         // height: 1800,
// //         color: Colors.white,

// //         child: Padding(
// //           padding: const EdgeInsets.only(
// //             left: 12,
// //             right: 12,
// //             top: 10,
// //           ),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Expanded(
// //                       child: Text(
// //                     expandedName,
// //                     style: TextStyle(
// //                         fontSize: 18,
// //                         fontWeight: FontWeight.w700,
// //                         color: Colors.black),
// //                   )),
// //                   GestureDetector(
// //                     onTap: () {
// //                       print("in tap");
// //                       setState(() {
// //                         expandClick = !expandClick;
// //                       });
// //                     },
// //                     child: Image.asset(
// //                       "assets/newImages/expand_more.png",
// //                       width: 30,
// //                       height: 30,
// //                     ),
// //                   )
// //                 ],
// //               ),
// //               Expanded(
// //                 child: Stack(
// //                   children: [
// //                     Padding(
// //                       padding: const EdgeInsets.only(top: 10),
// //                       child: Swiper.children(
// //                         autoplay: false,
// //                         loop: true,
// //                         // pagination: SwiperPagination(
// //                         //   margin: EdgeInsets.only(
// //                         //     right: 25.0,
// //                         //   ),
// //                         //   builder: DotSwiperPaginationBuilder(
// //                         //       color: Colors.grey),
// //                         // ),
// //                         control: SwiperControl(
// //                             iconNext: Icons.arrow_forward_ios,
// //                             iconPrevious: Icons.arrow_back_ios,
// //                             size: 20,
// //                             color: Customcolor.darkblue_col),
// //                         children: <Widget>[
// //                           Column(
// //                             children: [
// //                               Container(
// //                                   margin: EdgeInsets.only(
// //                                     right: 40.0,
// //                                     left: 30,
// //                                   ),
// //                                   child: ClipRRect(
// //                                       borderRadius: BorderRadius.circular(5.0),
// //                                       child: Image.asset(
// //                                         "assets/newImages/cfa1.png",
// //                                         height: 270,
// //                                         fit: BoxFit.fill,
// //                                       ))),
// //                               SizedBox(
// //                                 height: 10,
// //                               ),
// //                               Text("UNESCO-MARS 2020",
// //                                   style: TextStyle(
// //                                     fontSize: 17,
// //                                   ))
// //                             ],
// //                           ),
// //                           Column(
// //                             children: [
// //                               Container(
// //                                   margin: EdgeInsets.only(
// //                                     right: 40.0,
// //                                     left: 30,
// //                                   ),
// //                                   child: ClipRRect(
// //                                       borderRadius: BorderRadius.circular(5.0),
// //                                       child: Image.asset(
// //                                         "assets/newImages/poster_4.png",
// //                                         height: 300,
// //                                         fit: BoxFit.fill,
// //                                       ))),
// //                               SizedBox(
// //                                 height: 8,
// //                               ),
// //                               Text("UNESCO-MARS 2020",
// //                                   style: TextStyle(
// //                                     fontSize: 17,
// //                                   ))
// //                             ],
// //                           ),
// //                           Column(
// //                             children: [
// //                               Container(
// //                                   margin: EdgeInsets.only(
// //                                     right: 40.0,
// //                                     left: 30,
// //                                   ),
// //                                   child: ClipRRect(
// //                                       borderRadius: BorderRadius.circular(5.0),
// //                                       child: Image.asset(
// //                                         "assets/newImages/poster_6.png",
// //                                         height: 300,
// //                                         fit: BoxFit.fill,
// //                                       ))),
// //                               SizedBox(
// //                                 height: 8,
// //                               ),
// //                               Text("UNESCO-MARS 2020",
// //                                   style: TextStyle(
// //                                     fontSize: 17,
// //                                   ))
// //                             ],
// //                           ),
// //                           Column(
// //                             children: [
// //                               Container(
// //                                   margin: EdgeInsets.only(
// //                                     right: 40.0,
// //                                     left: 30,
// //                                   ),
// //                                   child: ClipRRect(
// //                                       borderRadius: BorderRadius.circular(5.0),
// //                                       child: Image.asset(
// //                                         "assets/newImages/cfa1.png",
// //                                         height: 300,
// //                                         fit: BoxFit.fill,
// //                                       ))),
// //                               SizedBox(
// //                                 height: 8,
// //                               ),
// //                               Text("UNESCO-MARS 2020",
// //                                   style: TextStyle(
// //                                     fontSize: 17,
// //                                   ))
// //                             ],
// //                           ),
// //                           Column(
// //                             children: [
// //                               Container(
// //                                   margin: EdgeInsets.only(
// //                                     right: 40.0,
// //                                     left: 30,
// //                                   ),
// //                                   child: ClipRRect(
// //                                       borderRadius: BorderRadius.circular(5.0),
// //                                       child: Image.asset(
// //                                         "assets/newImages/poster_4.png",
// //                                         height: 300,
// //                                         fit: BoxFit.fill,
// //                                       ))),
// //                               SizedBox(
// //                                 height: 8,
// //                               ),
// //                               Text("UNESCO-MARS 2020",
// //                                   style: TextStyle(
// //                                     fontSize: 17,
// //                                   ))
// //                             ],
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     expandClick
// //                         ? Container(
// //                             height: 130,
// //                             decoration: BoxDecoration(
// //                                 color: Colors.white,
// //                                 borderRadius: BorderRadius.circular(10)),
// //                             child: Card(
// //                               elevation: 5,
// //                               child: Padding(
// //                                 padding: EdgeInsets.only(
// //                                     top: 20, left: 10, right: 10),
// //                                 child: Column(
// //                                   crossAxisAlignment: CrossAxisAlignment.start,
// //                                   children: [
// //                                     GestureDetector(
// //                                       onTap: () {
// //                                         setState(() {
// //                                           expandClick = false;
// //                                           expandedName = "Upcoming Events";
// //                                         });
// //                                       },
// //                                       child: Container(
// //                                         color: Colors.transparent,
// //                                         width: SizeConfig.blockSizeHorizontal *
// //                                             100,
// //                                         child: Text(
// //                                           "Upcoming Events",
// //                                           style: TextStyle(
// //                                             color: Customcolor.colorblack,
// //                                             fontSize: 20,
// //                                           ),
// //                                         ),
// //                                       ),
// //                                     ),
// //                                     SizedBox(
// //                                       height: 15,
// //                                     ),
// //                                     Container(
// //                                       height: 1,
// //                                       color: Customcolor.colorblack
// //                                           .withOpacity(0.4),
// //                                     ),
// //                                     SizedBox(
// //                                       height: 15,
// //                                     ),
// //                                     GestureDetector(
// //                                       onTap: () {
// //                                         setState(() {
// //                                           expandClick = false;
// //                                           expandedName = "Past Events";
// //                                         });
// //                                       },
// //                                       child: Container(
// //                                         color: Colors.transparent,
// //                                         width: SizeConfig.blockSizeHorizontal *
// //                                             100,
// //                                         child: Text(
// //                                           "Past Events",
// //                                           style: TextStyle(
// //                                             color: Customcolor.colorblack,
// //                                             fontSize: 20,
// //                                           ),
// //                                         ),
// //                                       ),
// //                                     ),
// //                                     SizedBox(
// //                                       height: 15,
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ),
// //                             ),
// //                           )
// //                         : Container()
// //                   ],
// //                 ),
// //               )
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget digitalLibrary() {
// //     return Padding(
// //       padding: const EdgeInsets.only(
// //         left: 10,
// //         right: 10,
// //         top: 10,
// //       ),
// //       child: Card(
// //         elevation: 5,
// //         // height: 1800,
// //         color: Colors.white,
// //         child: Padding(
// //           padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
// //           child: Swiper.children(
// //             autoplay: false,
// //             loop: true,
// //             control: SwiperControl(
// //                 iconNext: Icons.arrow_forward_ios,
// //                 iconPrevious: Icons.arrow_back_ios,
// //                 size: 20,
// //                 color: Customcolor.darkblue_col),
// //             children: <Widget>[
// //               Column(
// //                 children: [
// //                   Container(
// //                       margin: EdgeInsets.only(
// //                         right: 40.0,
// //                         left: 30,
// //                       ),
// //                       child: ClipRRect(
// //                           borderRadius: BorderRadius.circular(5.0),
// //                           child: Image.asset(
// //                             "assets/newImages/cfa1.png",
// //                             height: 300,
// //                             fit: BoxFit.fill,
// //                           ))),
// //                   SizedBox(
// //                     height: 8,
// //                   ),
// //                   Text("UNESCO-MARS 2020",
// //                       style: TextStyle(
// //                         fontSize: 17,
// //                       ))
// //                 ],
// //               ),
// //               Column(
// //                 children: [
// //                   Container(
// //                       margin: EdgeInsets.only(
// //                         right: 40.0,
// //                         left: 30,
// //                       ),
// //                       child: ClipRRect(
// //                           borderRadius: BorderRadius.circular(5.0),
// //                           child: Image.asset(
// //                             "assets/newImages/poster_4.png",
// //                             height: 300,
// //                             fit: BoxFit.fill,
// //                           ))),
// //                   SizedBox(
// //                     height: 8,
// //                   ),
// //                   Text("UNESCO-MARS 2020",
// //                       style: TextStyle(
// //                         fontSize: 17,
// //                       ))
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget merckmorethanmother() {
// //     return Padding(
// //       padding: const EdgeInsets.only(
// //         left: 10,
// //         right: 10,
// //         top: 10,
// //       ),
// //       child: Card(
// //         elevation: 5,
// //         // height: 1800,
// //         color: Colors.white,
// //         child: Padding(
// //           padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
// //           child: Swiper.children(
// //             autoplay: false,
// //             loop: true,
// //             control: SwiperControl(
// //                 iconNext: Icons.arrow_forward_ios,
// //                 iconPrevious: Icons.arrow_back_ios,
// //                 size: 20,
// //                 color: Customcolor.darkblue_col),
// //             children: <Widget>[
// //               Column(
// //                 children: [
// //                   Container(
// //                       margin: EdgeInsets.only(
// //                         right: 40.0,
// //                         left: 30,
// //                       ),
// //                       child: ClipRRect(
// //                           borderRadius: BorderRadius.circular(5.0),
// //                           child: Image.asset(
// //                             "assets/newImages/cfa1.png",
// //                             height: 300,
// //                             fit: BoxFit.fill,
// //                           ))),
// //                   SizedBox(
// //                     height: 8,
// //                   ),
// //                   Text("UNESCO-MARS 2020",
// //                       style: TextStyle(
// //                         fontSize: 17,
// //                       ))
// //                 ],
// //               ),
// //               Column(
// //                 children: [
// //                   Container(
// //                       margin: EdgeInsets.only(
// //                         right: 40.0,
// //                         left: 30,
// //                       ),
// //                       child: ClipRRect(
// //                           borderRadius: BorderRadius.circular(5.0),
// //                           child: Image.asset(
// //                             "assets/newImages/poster_4.png",
// //                             height: 300,
// //                             fit: BoxFit.fill,
// //                           ))),
// //                   SizedBox(
// //                     height: 8,
// //                   ),
// //                   Text("UNESCO-MARS 2020",
// //                       style: TextStyle(
// //                         fontSize: 17,
// //                       ))
// //                 ],
// //               ),
// //               Column(
// //                 children: [
// //                   Container(
// //                       margin: EdgeInsets.only(
// //                         right: 40.0,
// //                         left: 30,
// //                       ),
// //                       child: ClipRRect(
// //                           borderRadius: BorderRadius.circular(5.0),
// //                           child: Image.asset(
// //                             "assets/newImages/poster_6.png",
// //                             height: 300,
// //                             fit: BoxFit.fill,
// //                           ))),
// //                   SizedBox(
// //                     height: 8,
// //                   ),
// //                   Text("UNESCO-MARS 2020",
// //                       style: TextStyle(
// //                         fontSize: 17,
// //                       ))
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget slider(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 8),
// //       child: Stack(
// //         children: <Widget>[
// //           Column(
// //             children: <Widget>[
// //               Container(
// //                 child: carouselSlider = CarouselSlider(
// //                   options: CarouselOptions(
// //                     viewportFraction: 1.0,
// //                     height: 170,
// //                     autoPlay: true,
// //                     onPageChanged: (index, reason) {
// //                       setState(() {
// //                         _current = index;
// //                       });
// //                     },
// //                   ),
// //                   items: _productsAvailable.map((product) {
// //                     return new Builder(
// //                       builder: (BuildContext context) {
// //                         return new Container(
// //                           decoration: BoxDecoration(
// //                               borderRadius: BorderRadius.circular(8),
// //                               image: DecorationImage(
// //                                   image: NetworkImage(
// //                                       "http://merckfoundation.org/merck/public/uploads/slider/" +
// //                                           product['image']),
// //                                   fit: BoxFit.cover)),
// //                           width: SizeConfig.blockSizeHorizontal * 100,
// //                           child: Column(
// //                             mainAxisAlignment: MainAxisAlignment.end,
// //                             children: <Widget>[
// //                               Padding(
// //                                 padding:
// //                                     const EdgeInsets.only(right: 0, bottom: 15),
// //                                 child: Container(
// //                                   color: Colors.white.withOpacity(0.5),
// //                                   width: SizeConfig.blockSizeHorizontal * 100,
// //                                   child: Padding(
// //                                     padding: const EdgeInsets.only(
// //                                         left: 10, right: 10, top: 5, bottom: 5),
// //                                     child: Column(
// //                                       mainAxisAlignment:
// //                                           MainAxisAlignment.center,
// //                                       children: <Widget>[
// //                                         FormLabel(
// //                                           text: product['image_title'],
// //                                           labelColor: Customcolor.pink_col,
// //                                           fontSize:
// //                                               ResponsiveFlutter.of(context)
// //                                                   .fontSize(1.4),
// //                                           maxLines: 2,
// //                                           fontweight: FontWeight.w700,
// //                                         ),
// //                                         SizedBox(
// //                                           height: 2,
// //                                         ),
// //                                         FormLabel(
// //                                           text: product['image_desc'],
// //                                           labelColor: Customcolor.pink_col,
// //                                           fontSize:
// //                                               ResponsiveFlutter.of(context)
// //                                                   .fontSize(1.2),
// //                                           fontweight: FontWeight.w500,
// //                                         ),
// //                                       ],
// //                                     ),
// //                                   ),
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         );
// //                       },
// //                     );
// //                   }).toList(),
// //                 ),
// //               ),
// //               // new DotsIndicator(
// //               //   dotsCount: _productsAvailable.length,
// //               //   position: double.parse("$_current"),
// //               //   decorator: DotsDecorator(
// //               //     size: const Size.square(9.0),
// //               //     activeSize: const Size(18.0, 9.0),
// //               //     activeColor: Customcolor.colorBlue,
// //               //     activeShape: RoundedRectangleBorder(
// //               //         borderRadius: BorderRadius.circular(5.0)),
// //               //   ),
// //               // ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildMarquee() {
// //     return Container(
// //       height: 20,
// //       child: Marquee(
// //         text: 'There once was a boy who told this story about a boy: "',
// //       ),
// //     );
// //   }

// //   Widget followUs() {
// //     return Padding(
// //       padding: const EdgeInsets.only(left: 8, top: 15),
// //       child: Container(
// //           child: Row(
// //         mainAxisAlignment: MainAxisAlignment.start,
// //         children: [
// //           Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Row(
// //                 children: [
// //                   Text("Follow Us on",
// //                       textAlign: TextAlign.start,
// //                       style: TextStyle(
// //                           fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
// //                           fontWeight: FontWeight.w700,
// //                           color: Customcolor.text_blue)),
// //                 ],
// //               ),
// //               SizedBox(
// //                 height: 18,
// //               ),
// //               Row(
// //                 children: [
// //                   GestureDetector(
// //                     onTap: () async {
// //                       var response = await FlutterShareMe().openinsta(
// //                           url: 'https://www.instagram.com/merckfoundation',
// //                           msg: "Share");
// // //                   var url = 'https://www.instagram.com/merckfoundation/';

// // // if (await canLaunch(url)) {
// // //   await launch(
// // //     url,
// // //     universalLinksOnly: true,
// // //   );
// // // } else {
// // //   throw 'There was a problem to open the url: $url';
// // // // }
// //                       // _launchInWebViewWithJavaScript(
// //                       //     "http://instagram.com/_u/merckfoundation");
// //                       // if (Platform.isAndroid) {
// //                       //   final AndroidIntent intent = AndroidIntent(
// //                       //     action: 'Intent.ACTION_VIEW',
// //                       //     package: "com.instagram.android",
// //                       //     data:
// //                       //         'https://instagram.com/merckfoundation/', // replace com.example.app with your applicationId
// //                       //   );
// //                       //   await intent.launch();
// //                       // }

// //                       // Navigator.push(
// //                       //     context,
// //                       //     MaterialPageRoute(
// //                       //         builder: (BuildContext context) => VideoPlayer(
// //                       //               videoUrl:
// //                       //                   " https://www.instagram.com/merckfoundation/",
// //                       //             )));
// //                       //  https://www.instagram.com/merckfoundation/
// //                     },
// //                     child: Image.asset(
// //                       "assets/newImages/instagram.png",
// //                       height: imgHeight,
// //                       width: imgHeight,
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     width: 5,
// //                   ),
// //                   GestureDetector(
// //                     onTap: () async {
// //                       // Navigator.push(
// //                       //     context,
// //                       //     MaterialPageRoute(
// //                       //         builder: (BuildContext context) => VideoPlayer(
// //                       //               videoUrl:
// //                       //                   "https://www.facebook.com/merckfoundation/",
// //                       //             )));
// //                       var response = await FlutterShareMe().openinsta(
// //                           url: 'https://www.facebook.com/merckfoundation/',
// //                           msg: "Share");
// //                     },
// //                     child: Image.asset(
// //                       "assets/newImages/facebook.png",
// //                       height: imgHeight,
// //                       width: imgHeight,
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     width: 5,
// //                   ),
// //                   GestureDetector(
// //                     onTap: () async {
// //                       // Navigator.push(
// //                       //     context,
// //                       //     MaterialPageRoute(
// //                       //         builder: (BuildContext context) => VideoPlayer(
// //                       //               videoUrl:
// //                       //                   "https://twitter.com/MerckFoundation/",
// //                       //             )));
// //                       var response = await FlutterShareMe().openinsta(
// //                           url: 'https://twitter.com/MerckFoundation/',
// //                           msg: "Share");
// //                     },
// //                     child: Image.asset(
// //                       "assets/newImages/twitter.png",
// //                       height: imgHeight,
// //                       width: imgHeight,
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     width: 5,
// //                   ),
// //                   GestureDetector(
// //                     onTap: () async {
// //                       // Navigator.push(
// //                       //     context,
// //                       //     MaterialPageRoute(
// //                       //         builder: (BuildContext context) => VideoPlayer(
// //                       //               videoUrl:
// //                       //                   "https://www.youtube.com/channel/UCwU6L6rvR-6q0-5Jw03wscg",
// //                       //             )));
// //                       var response = await FlutterShareMe().openinsta(
// //                           url:
// //                               'https://www.youtube.com/channel/UCwU6L6rvR-6q0-5Jw03wscg',
// //                           msg: "Share");
// //                     },
// //                     child: Image.asset(
// //                       "assets/newImages/youtube.png",
// //                       height: imgHeight,
// //                       width: imgHeight,
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     width: 5,
// //                   ),
// //                   GestureDetector(
// //                     onTap: () async {
// //                       // Navigator.push(
// //                       //     context,
// //                       //     MaterialPageRoute(
// //                       //         builder: (BuildContext context) => VideoPlayer(
// //                       //               videoUrl:
// //                       //                   "https://www.flickr.com/photos/163124125@N08/",
// //                       //             )));
// //                       var response = await FlutterShareMe().openinsta(
// //                           url: 'https://www.flickr.com/photos/163124125@N08/',
// //                           msg: "Share");
// //                     },
// //                     child: Image.asset(
// //                       "assets/newImages/flickr.png",
// //                       height: imgHeight,
// //                       width: imgHeight,
// //                     ),
// //                   ),
// //                   // SizedBox(
// //                   //   width: 7,
// //                   // ),
// //                 ],
// //               )
// //             ],
// //           ),
// //           Image.asset(
// //             "assets/newImages/hometoolbar.png",
// //             height: 100,
// //             width: 80,
// //           )
// //         ],
// //       )),
// //     );
// //   }

// //   Widget _buildComplexMarquee() {
// //     return Container(
// //       height: 30,
// //       child: Marquee(
// //         text:
// //             'Call for Application-UNESCO MARS 2020          Savethe Date-Merck Foundation "Stay at home" Media recognization award 2020-online edtion for africa and latin america',
// //         style: TextStyle(
// //             fontWeight: FontWeight.w700, color: Customcolor.text_blue),
// //         scrollAxis: Axis.horizontal,
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         blankSpace: 20.0,
// //         velocity: 100.0,
// //         pauseAfterRound: Duration(seconds: 1),
// //         showFadingOnlyWhenScrolling: true,
// //         fadingEdgeStartFraction: 0.1,
// //         fadingEdgeEndFraction: 0.1,
// //         numberOfRounds: null,
// //         startPadding: 10.0,
// //         accelerationDuration: Duration(seconds: 1),
// //         accelerationCurve: Curves.linear,
// //         decelerationDuration: Duration(milliseconds: 500),
// //         decelerationCurve: Curves.easeOut,
// //       ),
// //     );
// //   }

// //   Widget _wrapWithStuff(Widget child) {
// //     return Padding(
// //       padding: EdgeInsets.all(16.0),
// //       child: Container(height: 50.0, color: Colors.white, child: child),
// //     );
// //   }

// //   Future<void> _launchInWebViewWithJavaScript(String url) async {
// //     if (await canLaunch(url)) {
// //       await launch(
// //         url,
// //         forceSafariVC: true,
// //         forceWebView: true,
// //         enableJavaScript: true,
// //       );
// //     } else {
// //       throw 'Could not launch $url';
// //     }
// //   }

// //   // Widget newSlider(BuildContext context) {
// //   //   return Stack(
// //   //     children: <Widget>[
// //   //       Column(
// //   //         children: <Widget>[
// //   //           Container(
// //   //             child: carouselSlider = CarouselSlider(
// //   //               options: CarouselOptions(
// //   //                 viewportFraction: 1.0,
// //   //                 height: 350,
// //   //                 autoPlay: false,
// //   //                 onPageChanged: (index, reason) {
// //   //                   setState(() {
// //   //                     _current1 = index;
// //   //                   });
// //   //                 },
// //   //               ),
// //   //               items: _productsAvailable1.map((product) {
// //   //                 return new Builder(
// //   //                   builder: (BuildContext context) {
// //   //                     return new GridView.count(
// //   //                       crossAxisCount: 2,
// //   //                       crossAxisSpacing: 10.0,
// //   //                       mainAxisSpacing: 10.0,
// //   //                       shrinkWrap: true,
// //   //                       scrollDirection: Axis.horizontal,
// //   //                       children: List.generate(
// //   //                         4,
// //   //                         (index) {
// //   //                           return Padding(
// //   //                             padding: const EdgeInsets.all(10.0),
// //   //                             child: Container(
// //   //                               decoration: BoxDecoration(
// //   //                                 image: DecorationImage(
// //   //                                   image: AssetImage(
// //   //                                       "assets/images/logo_nav1.png"),
// //   //                                   fit: BoxFit.cover,
// //   //                                 ),
// //   //                                 borderRadius: BorderRadius.all(
// //   //                                   Radius.circular(20.0),
// //   //                                 ),
// //   //                               ),
// //   //                             ),
// //   //                           );
// //   //                         },
// //   //                       ),
// //   //                     );
// //   //                   },
// //   //                 );
// //   //               }).toList(),
// //   //             ),
// //   //           ),
// //   //           new DotsIndicator(
// //   //             dotsCount: _productsAvailable1.length,
// //   //             position: double.parse("$_current1"),
// //   //             decorator: DotsDecorator(
// //   //               size: const Size.square(9.0),
// //   //               activeSize: const Size(18.0, 9.0),
// //   //               activeColor: Customcolor.colorBlue,
// //   //               activeShape: RoundedRectangleBorder(
// //   //                   borderRadius: BorderRadius.circular(5.0)),
// //   //             ),
// //   //           ),
// //   //         ],
// //   //       ),
// //   //     ],
// //   //   );
// //   // }

// //   Widget ourlist() {
// //     //print(_ourlist.length);

// //     return Container(
// //         height: 100,
// //         child: ListView.builder(
// //             shrinkWrap: true,
// //             scrollDirection: Axis.horizontal,
// //             itemCount: _ourlist.length,
// //             itemBuilder: (BuildContext context, int index) => Padding(
// //                 padding: const EdgeInsets.only(right: 0.0, left: 8),
// //                 child: GestureDetector(
// //                     onTap: () {
// //                       if (index == 0) {
// //                         Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                                 builder: (BuildContext context) =>
// //                                     OurVision()));
// //                       } else if (index == 1) {
// //                         //our program
// //                         Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                                 builder: (BuildContext context) => Dashboard(
// //                                       index: 1,
// //                                     )));
// //                       } else if (index == 2) {
// //                         //news article
// //                         Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                                 builder: (BuildContext context) => Dashboard(
// //                                       index: 3,
// //                                     )));
// //                       } else if (index == 3) {
// //                         //our award
// //                         Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                                 builder: (BuildContext context) => Ouraward()));
// //                       } else if (index == 4) {
// //                         //our mission
// //                         Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                                 builder: (BuildContext context) =>
// //                                     OurMission()));
// //                       } else if (index == 5) {
// //                         //  media & events
// //                         Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                                 builder: (BuildContext context) => Dashboard(
// //                                       index: 3,
// //                                     )));
// //                       } else if (index == 6) {
// //                         //covid response
// //                       } else if (index == 7) {
// //                         //our polcies
// //                         Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                                 builder: (BuildContext context) =>
// //                                     OurPolicy()));
// //                       }
// //                     },
// //                     child: Container(
// //                       width: 100,
// //                       decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.circular(8),
// //                         color: _ourlist[index].colors,
// //                       ),
// //                       child: Center(
// //                           child: Text(
// //                         _ourlist[index].programname,
// //                         textAlign: TextAlign.center,
// //                         style: TextStyle(
// //                           color: Colors.white,
// //                           fontWeight: FontWeight.w600,
// //                           fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
// //                         ),
// //                       )),
// //                     )))));
// //   }

// //   ////////////////////////

// //   Future<http.Response> gethomeapi() async {
// //     print("home api");
// //     var response = await fetchget(
// //       encoding: "program_page_api/home/Android/1",
// //     );
// //     print("response");
// //     print(response);

// //     var res = json.decode(response.body);
// //     print("ff");
// //     print(res);
// //     HomepageResponse homepageres = HomepageResponse.fromJson(res);

// //     slidersection = homepageres.sliderArea[0].slider.list;
// //     slidersection.forEach((element) {
// //       _productsAvailable.add({
// //         "id": element.id,
// //         "menu_id": element.menuId,
// //         "image_title": element.imageTitle,
// //         "image_desc": element.imageDesc,
// //         "links": element.links,
// //         "image": element.image,
// //         "alt_text": element.altText,
// //         "status": element.status,
// //         "created_at": element.createdAt,
// //         "updated_at": element.updatedAt
// //       });
// //     });

// //     print("slidersection");
// //     print(slidersection.length);

// //     Map<String, dynamic> section1 = homepageres.middleArea;
// //     Map<String, dynamic> lastsection = homepageres.rightArea;
// //     print(section1);
// //     print(section1['1']);

// //     for (int i = 0; i < section1.length; i++) {
// //       //  MiddleArea categoryKeys = section1[(i + 1).toString()];
// //       //  print(categoryKeys.videos.type);
// //       dynamic section = res['middle_area']['${i + 1}'];
// //       print("TKey: ${section.keys.first}");
// //       var middlecategoryname = section.keys.first;

// //       setState(() {
// //         typewidet.add(middlecategoryname);

// //         print(typewidet);
// //       });
// //       if (middlecategoryname.toString().toLowerCase() ==
// //           "Videos".toLowerCase()) {
// //         GlobalLists.homevideolist =
// //             homepageres.middleArea['${i + 1}'].videos.list;
// //         print(GlobalLists.homevideolist.length);
// //       } else if (middlecategoryname.toString().toLowerCase() ==
// //           "awards".toLowerCase()) {
// //         GlobalLists.homeawardlist =
// //             homepageres.middleArea['${i + 1}'].awards.list;
// //         print(GlobalLists.homeawardlist.length);
// //       } else if (middlecategoryname.toString().toLowerCase() ==
// //           "content".toLowerCase()) {
// //         GlobalLists.homecontentlist =
// //             homepageres.middleArea['${i + 1}'].content.list;
// //         print(GlobalLists.homecontentlist.length);
// //       } else if (middlecategoryname.toString().toLowerCase() ==
// //           "gallery".toLowerCase()) {
// //         GlobalLists.homegallerybaseurl =
// //             homepageres.middleArea['${i + 1}'].gallery.baseUrl;
// //         GlobalLists.homegallerylist =
// //             homepageres.middleArea['${i + 1}'].gallery.list;
// //         print(GlobalLists.homegallerylist.length);
// //       } else if (middlecategoryname.toString().toLowerCase() ==
// //           "ceo_msg".toLowerCase()) {
// //         GlobalLists.homeceomsgbaseurl =
// //             homepageres.middleArea['${i + 1}'].ceoMsg.baseUrl;
// //         GlobalLists.homeceomsglist =
// //             homepageres.middleArea['${i + 1}'].ceoMsg.list;
// //         print(GlobalLists.homeceomsglist.length);
// //       }
// //     }

// //     ///////right section
// //     for (int i = 0; i < lastsection.length; i++) {
// //       //  MiddleArea categoryKeys = section1[(i + 1).toString()];
// //       //  print(categoryKeys.videos.type);
// //       dynamic rightsection = res['Right_area']['${i + 1}'];
// //       print("TKey: ${rightsection.keys.first}");
// //       var rightsectioncategoryname = rightsection.keys.first;

// //       setState(() {
// //         typewidetofrightsection.add(rightsectioncategoryname);

// //         print(typewidetofrightsection);
// //       });

// //       if (rightsectioncategoryname.toString().toLowerCase() ==
// //           "call_for_app".toLowerCase()) {
// //         GlobalLists.homecallforapp =
// //             homepageres.rightArea['${i + 1}'].callForApp.list;
// //         print(GlobalLists.homecallforapp.length);
// //       } else if (rightsectioncategoryname.toString().toLowerCase() ==
// //           "mmtm".toLowerCase()) {
// //         GlobalLists.homemmtm = homepageres.rightArea['${i + 1}'].mmtm.list;
// //         print(GlobalLists.homemmtm.length);
// //       } else if (rightsectioncategoryname.toString().toLowerCase() ==
// //           "digital_library".toLowerCase()) {
// //         GlobalLists.homedigitallib =
// //             homepageres.rightArea['${i + 1}'].digitalLibrary.list;
// //         print(GlobalLists.homedigitallib.length);
// //       }
// //     }
// //     setState(() {
// //       isMiddleSectionLoaded = true;
// //       isrightSectionLoaded = true;
// //     });

// //     return response;
// //   }
// // //   Future<http.Response> gethomeapi() async {
// // //     var response = await fetchget(
// // //       encoding: "program_page_api/home/Android/1",
// // //     );
// // //     print("response");
// // //     print(response);
// // //     const JsonEncoder encoder = JsonEncoder.withIndent('  ');
// // //     var res = json.decode(response.body);
// // //     print("ff");

// // //     // slidersection = res['slider_area']['5'];
// // //     // print("slidersection");
// // //     // print(slidersection.length);

// // //     dynamic section1 = res['middle_area']['1'];//1
// // //     dynamic section2 = res['middle_area']['2'];//2
// // //     dynamic section3 = res['middle_area']['3'];
// // //     dynamic section4 = res['middle_area']['4'];
// // //     dynamic section5 = res['middle_area']['5'];

// // //     var section1key = section1.keys.first; //video
// // //     var section2key = section2.keys.first; //award
// // //     var section3key = section3.keys.first; //content
// // //     var section4key = section4.keys.first; //gallery
// // //     var section5key = section5.keys.first;
// // //     setState(() {
// // //       typewidet = [
// // //         section1key,
// // //         section2key,
// // //         section3key,
// // //         section4key,
// // //         section5key
// // //       ];

// // //       print(typewidet);
// // //     }); //ceo_msg

// // //     print(section1key);
// // //     print("section1key");

// // //     print(section2key);
// // //     print("section2key");
// // //     print(section3key);
// // //     print("section3key");
// // //     print(section4key);
// // //     print("section4key");
// // //     print(section5key);
// // //     print("section5key");
// // //     //section1
// // //     if (section1key == "videos") {
// // //       //videolist
// // //       setState(() {
// // //         videosection = res['middle_area']['1']['videos']['list'];

// // //         dynamic key = videosection.keys.elementAt(0);
// // //         print(key);
// // // //1st Video Preview
// // //         Programvideo video = Programvideo.fromJson(videosection[key]);

// // //         //List of all vidwoModels
// // //         List<Programvideo> programVidList = [];
// // //         videosection.forEach((key, value) {
// // //           programVidList.add(Programvideo.fromJson(value));
// // //         });

// // //         print(video.videoDesc);
// // //         print(programVidList.length);

// // //         Map<dynamic, dynamic> contentsection =
// // //             res['middle_area']['3']['content']['list'];
// // //         dynamic keycontent = contentsection.keys.elementAt(0);
// // //         Homecontent content = Homecontent.fromJson(contentsection[keycontent]);
// // //         print(content.pageContent);
// // //       });

// // //       //print(video.videoDesc);
// // //       print("here");
// // //     } else if (section1key == "awards") {
// // //       //award
// // //       print("not here");
// // //     } else if (section1key == "content") {
// // //       //covid
// // //       print("not here");
// // //     } else if (section1key == "gallery") {
// // //       //album
// // //       print("not here");
// // //     } else if (section1key == "ceo_msg") {
// // //       //article
// // //       print("not here");
// // //     }
// // // //section2
// // //     if (section2key == "videos") {
// // //       //videolist
// // //       videosection = res['middle_area']['1']['videos'];
// // //       // print(videosection[0]);
// // //       print("not here");
// // //     } else if (section2key == "11") {
// // //       //award
// // //       print("here");
// // //     } else if (section2key == "13") {
// // //       //covid
// // //       print("not here");
// // //     } else if (section2key == "15") {
// // //       //album
// // //       print("not here");
// // //     } else if (section2key == "23") {
// // //       //article
// // //       print("not here");
// // //     }
// // // //section3
// // //     if (section3key == "videos") {
// // //       //videolist
// // //       videosection = res['middle_area']['1']['videos'];

// // //       print("not here");
// // //     } else if (section3key == "11") {
// // //       //award
// // //       print("not here");
// // //     } else if (section3key == "13") {
// // //       //covid
// // //       print("should came here");
// // //     } else if (section3key == "15") {
// // //       //album
// // //       print("not here");
// // //     } else if (section3key == "23") {
// // //       //article
// // //       print("not here");
// // //     }

// // //     //section4
// // //     if (section4key == "videos") {
// // //       //videolist
// // //       videosection = res['middle_area']['1']['videos'];

// // //       print("not here");
// // //     } else if (section4key == "11") {
// // //       //award
// // //       print("not here");
// // //     } else if (section4key == "13") {
// // //       //covid
// // //       print("not here");
// // //     } else if (section4key == "15") {
// // //       //album
// // //       print("here");
// // //     } else if (section4key == "23") {
// // //       //article
// // //       print("not here");
// // //     }

// // //     //section5
// // //     if (section5key == "videos") {
// // //       //videolist
// // //       videosection = res['middle_area']['1']['videos'];

// // //       print("not here");
// // //     } else if (section5key == "11") {
// // //       //award
// // //       print("not here");
// // //     } else if (section5key == "13") {
// // //       //covid
// // //       print("not here");
// // //     } else if (section5key == "15") {
// // //       //album
// // //       print("not here");
// // //     } else if (section5key == "23") {
// // //       //article
// // //       print("here");
// // //     }
// // //     // print(res['middle_area']["1"]['14'].runtimeType);
// // //     // setState(() {
// // //     //   mapsection = res['middle_area']["1"]['14'];
// // //     // });

// // //     // print("ken");
// // //     // print(mapsection.length);
// // //     // print(mapsection);
// // //     // mapsection.forEach((key, value) {
// // //     //   print("Key : ${key} value ${value}");
// // //     // });

// // //     return response;
// // //   }

// //   List<Widget> list() {
// //     listofwiget.clear();
// //     for (int i = 0; i < typewidet.length; i++) {
// //       if (typewidet[i] == "videos") {
// //         listofwiget.add(
// //           CustomeCard(
// //             //   index: 2,
// //             cardImage:
// //                 'https://img.youtube.com/vi/${GlobalLists.homevideolist[0].videoLink.substring(GlobalLists.homevideolist[0].videoLink.length - 11)}/mqdefault.jpg',
// //             cardTitle: "Our Stories   ",
// //             titleColor: Customcolor.text_darkblue,
// //             titleImg: "assets/newImages/flowers-2.png",
// //             subTitle: GlobalLists.homevideolist[0].videoDesc,
// //             buttontitle: "Watch More ",
// //             onBtnTap: () {
// //               Navigator.push(
// //                   context,
// //                   MaterialPageRoute(
// //                       builder: (BuildContext context) => Dashboard(
// //                             index: 2,
// //                           )));
// //             },
// //             buttontitlecolor: Customcolor.text_darkblue,
// //           ),
// //         );
// //       }
// //       if (typewidet[i] == "awards") {
// //         listofwiget.add(SizedBox());
// //       }
// //       if (typewidet[i] == "content") {
// //         listofwiget.add(SizedBox());
// //       }
// //       if (typewidet[i] == "gallery") {
// //         listofwiget.add(
// //           CustomeCard(
// //             index: 3,
// //             cardImage: GlobalLists.homegallerybaseurl +
// //                 GlobalLists.homegallerylist[0].photo,
// //             cardTitle: "Photo Gallery   ",
// //             titleColor: Customcolor.text_darkblue,
// //             titleImg: "assets/newImages/flowers-3.png",
// //             subTitle: GlobalLists.homegallerylist[0].photoDescription,
// //             buttontitle: "View More ",
// //             buttontitlecolor: Customcolor.text_darkblue,
// //           ),
// //         );
// //       }
// //       if (typewidet[i] == "ceo_msg") {
// //         listofwiget.add(
// //           CustomeCard(
// //             index: 1,
// //             cardImage: GlobalLists.homeceomsgbaseurl +
// //                 GlobalLists.homeceomsglist[0].image,
// //             cardTitle:
// //                 "Message Form Dr.Rasha Kelej, CEO of Merck Foundation   ",
// //             titleColor: Customcolor.text_darkblue,
// //             titleImg: "assets/newImages/flowers-2.png",
// //             subTitle: GlobalLists.homeceomsglist[0].title,
// //             buttontitle: "Read More ",
// //             buttontitlecolor: Customcolor.text_darkblue,
// //           ),
// //         );
// //       }
// //     }

// //     return listofwiget;
// //   }

// //   List<Widget> tablist() {
// //     setState(() {
// //       listoftabwiget.clear();
// //       tabs.clear();

// //       // digitalLibrary(),
// //       // merckmorethanmother()
// //       for (int i = 0; i < typewidetofrightsection.length; i++) {
// //         if (typewidetofrightsection[i] == "call_for_app") {
// //           tabs.add(
// //             new Tab(text: "Call for Application"),
// //           );

// //           listoftabwiget.add(
// //             callforApplication(),
// //           );
// //         }
// //         if (typewidetofrightsection[i] == "mmtm") {
// //           tabs.add(
// //             new Tab(text: "Merck More Than A Mother Ambassadors"),
// //           );
// //           listoftabwiget.add(merckmorethanmother());
// //         }
// //         if (typewidetofrightsection[i] == "digital_library") {
// //           tabs.add(
// //             new Tab(text: "Digital Library"),
// //           );
// //           listoftabwiget.add(digitalLibrary());
// //         }
// //         print('tabs');
// //         print(tabs.length);
// //       }
// //     });
// //     //_tabController.length = tabs.length;
// //     return listoftabwiget;
// //   }

// //   static Future<http.Response> fetchget(
// //       {@required String encoding, BuildContext context}) async {
// //     IOClient ioClient = new IOClient();

// //     HttpClient client = new HttpClient();

// //     client.badCertificateCallback =
// //         ((X509Certificate cert, String host, int port) => false);

// //     ioClient = new IOClient(client);

// //     //TODO: Use this URI for UATs
// //     var uri = Uri.http(
// //         'onerooftechnologiesllp.com', '/mfindia/web/public/api/$encoding');
// //     final response = await ioClient.get(uri);

// //     if (response.statusCode == 401) {
// //     } else if (response.statusCode == 200) {
// //       return response;
// //     } else {
// //       // throw AlertDialog(
// //       //   title: Text("Invalid User"),
// //       // );
// //       return response;
// //     }
// //   }
// // }

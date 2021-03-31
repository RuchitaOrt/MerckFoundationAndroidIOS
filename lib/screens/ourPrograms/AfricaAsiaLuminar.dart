import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:merckfoundation22dec/WatchDigitalLibrary.dart';
import 'package:merckfoundation22dec/mediascreen.dart/Detailpage.dart';
import 'package:merckfoundation22dec/mediascreen.dart/merckFoudationTestimonial.dart';
import 'package:merckfoundation22dec/mediascreen.dart/merckFoundationMedia.dart';
import 'package:merckfoundation22dec/mediascreen.dart/news.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videolibray.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videoplayer.dart';
import 'package:merckfoundation22dec/model/MMTMMainResponse.dart';
import 'package:merckfoundation22dec/mediascreen.dart/callforApplication.dart';
import 'package:merckfoundation22dec/model/AfricaAsialuminar.dart'
    as africaasia;
import 'package:merckfoundation22dec/model/OurawarddetailResponse.dart';
import 'package:merckfoundation22dec/widget/slidercontainer.dart';
import 'package:merckfoundation22dec/ourawarddetail.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/screens/watchmorevideolibray.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/customHorizontalCard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'dart:convert';

import 'package:flutter_html/flutter_html.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Testimonailprogramviewmore.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Testimonailprogramdetailpage.dart';
import 'package:merckfoundation22dec/GalleryProgram.dart';
import 'package:merckfoundation22dec/model/GalleryProgram.dart';

class MerckAfricaasialuminar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MerckAfricaasialuminarState();
  }
}

class MerckAfricaasialuminarState extends State<MerckAfricaasialuminar>
    with TickerProviderStateMixin {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  int _current = 0;
  List<dynamic> slidersection = [];
  List typewidet = [];
  List typewidetofrightsection = [];
  List typewidetofbottomsection = [];
  int _current1 = 0;
  List _productsAvailable = [];
  bool isMiddleSectionLoaded = false;
  bool isrightSectionLoaded = false;

  List<Widget> listofwiget = [];
  List<Widget> listoftabwiget = [];
  List<Widget> listofbottomwiget = [];
  DateTime _todaysDate;

  List _imgarray = [
    "assets/newImages/img3.jpg",
    "assets/newImages/img4.jpg",
    "assets/newImages/leader1.png",
    "assets/newImages/leader2.png",
    "assets/newImages/img3.jpg",
    "assets/newImages/leader1.png",
    "assets/newImages/leader2.png",
  ];
  CarouselSlider carouselSlider;

  bool iscall = true;
  bool islibrary = false;
  bool ismeck = false;
  bool expandClick = false;
  String expandedName = "Upcoming Events";

  final List<Tab> tabs = <Tab>[];
  final CarouselController callAppCarouselController = CarouselController();
  final CarouselController digitalLibraryCarouselController =
      CarouselController();
  final CarouselController mmtmCarouselController = CarouselController();
  TabController _tabController;

  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    // getmmtmslider();
    _todaysDate = DateTime.now();
    getmmtmapi();
    super.initState();
    //_tabController = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: InnerCustomAppBar(
        onTapval: () {
          Navigator.pop(context);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (BuildContext context) => Dashboard(
          //               index: 1,
          //             )));
        },
        index: 1,
        title: "Merck Foundation Africa Asia Luminary",
        titleImg: "assets/newImages/our_programsLogo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView(
              //  crossAxisAlignment: CrossAxisAlignment.start,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                slider(context),
                Visibility(
                  visible: isMiddleSectionLoaded,
                  replacement: Center(child: CircularProgressIndicator()),
                  child: ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      // scrollDirection: Axis.horizontal,
                      children: list()),
                ),
                SizedBox(
                  height: 8,
                ),
                Visibility(
                  visible: isrightSectionLoaded,
                  replacement: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CircularProgressIndicator()
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
                              children: tablist()),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ])),
    );
  }

  // Widget callforApplication() {
  //   return Padding(
  //     padding: const EdgeInsets.only(
  //       left: 10,
  //       right: 10,
  //       top: 10,
  //     ),
  //     child: Card(
  //         elevation: 5,
  //         // height: 1800,
  //         color: Colors.white,
  //         child: getcallforapp(context)),
  //   );
  // }

  // Widget digitalLibraryLastSection() {
  //   return getdigitallib(context);
  // }

  // Widget getcallforapp(BuildContext context) {
  //   return Stack(
  //     children: <Widget>[
  //       GlobalLists.homecallforapp.length <= 0
  //           ? Container(
  //               child: Center(child: Text(Constantstring.emptyData)),
  //             )
  //           : Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Container(
  //                   //color: Colors.amber,
  //                   width: SizeConfig.blockSizeHorizontal * 100,
  //                   height: 470,
  //                   color: Colors.white,
  //                   child: Column(
  //                     children: [
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Expanded(
  //                               child: Text(
  //                             expandedName,
  //                             style: TextStyle(
  //                                 fontSize: 18,
  //                                 fontWeight: FontWeight.w700,
  //                                 color: Colors.black),
  //                           )),
  //                           GestureDetector(
  //                             onTap: () {
  //                               print("in tap");
  //                               setState(() {
  //                                 expandClick = !expandClick;
  //                               });
  //                             },
  //                             child: Image.asset(
  //                               "assets/newImages/expand_more.png",
  //                               width: 30,
  //                               height: 30,
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                       SizedBox(
  //                         height: 10,
  //                       ),
  //                       carouselSlider = CarouselSlider(
  //                         options: CarouselOptions(
  //                             autoPlay: false,
  //                             // aspectRatio: 0.1,
  //                             enlargeCenterPage: true,
  //                             enlargeStrategy: CenterPageEnlargeStrategy.height,
  //                             viewportFraction: 1.0,
  //                             height: 340,
  //                             onPageChanged: (index, reason) {
  //                               setState(() {
  //                                 _current1 = index;
  //                               });
  //                             }),
  //                         items: GlobalLists.homecallforapp.map((product) {
  //                           return new Builder(
  //                             builder: (BuildContext context) {
  //                               return ListView(
  //                                 shrinkWrap: true,
  //                                 physics: ScrollPhysics(),
  //                                 // crossAxisAlignment: CrossAxisAlignment.center,
  //                                 children: [
  //                                   Center(
  //                                     child: FadeInImage.assetNetwork(
  //                                       placeholder:
  //                                           'assets/newImages/placeholder_3.jpg',
  //                                       image:
  //                                           GlobalLists.homeCallForAppBaseURL +
  //                                               product.appImg,
  //                                       fit: BoxFit.fill,
  //                                       width: 240,
  //                                       height: 290,
  //                                     ),
  //                                   ),
  //                                   SizedBox(
  //                                     height: 10,
  //                                   ),
  //                                   Center(
  //                                     child: Text(product.title,
  //                                         textAlign: TextAlign.center,
  //                                         maxLines: 2,
  //                                         style: TextStyle(
  //                                           fontSize: 17,
  //                                         )),
  //                                   )
  //                                 ],
  //                               );
  //                             },
  //                           );
  //                         }).toList(),
  //                         carouselController: callAppCarouselController,
  //                       ),
  //                     ],
  //                   )),
  //             ),
  //       Positioned(
  //         top: 140,
  //         child: Container(
  //           width: MediaQuery.of(context).size.width,
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: <Widget>[
  //               GestureDetector(
  //                   onTap: () {
  //                     goToPrevious();
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(left: 20),
  //                     child: Icon(
  //                       Icons.arrow_back_ios,
  //                       color: Customcolor.text_darkblue,
  //                     ),
  //                   )),
  //               GestureDetector(
  //                   onTap: () {
  //                     goToNext();
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(right: 20),
  //                     child: Icon(
  //                       Icons.arrow_forward_ios,
  //                       color: Customcolor.text_darkblue,
  //                     ),
  //                   )),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget getdigitallib(BuildContext context) {
  //   return Stack(
  //     children: <Widget>[
  //       GlobalLists.homedigitallib.length <= 0
  //           ? Container(
  //               child: Center(child: Text(Constantstring.emptyData)),
  //             )
  //           : Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Container(
  //                 //color: Colors.amber,
  //                 width: SizeConfig.blockSizeHorizontal * 100,
  //                 height: 400,
  //                 color: Colors.white,
  //                 child: carouselSlider = CarouselSlider(
  //                   options: CarouselOptions(
  //                       autoPlay: false,
  //                       aspectRatio: 1,
  //                       enlargeCenterPage: true,
  //                       enlargeStrategy: CenterPageEnlargeStrategy.height,
  //                       viewportFraction: 1.0,
  //                       //  height: SizeConfig.blockSizeVertical * 100,
  //                       onPageChanged: (index, reason) {
  //                         setState(() {
  //                           _current1 = index;
  //                         });
  //                       }),
  //                   items: GlobalLists.homedigitallib.map((product) {
  //                     print(GlobalLists.homeDigitalLibraryBaseURL +
  //                         product.image);
  //                     return new Builder(
  //                       builder: (BuildContext context) {
  //                         return ListView(
  //                           shrinkWrap: true,
  //                           physics: ScrollPhysics(),
  //                           //  crossAxisAlignment: CrossAxisAlignment.center,
  //                           children: [
  //                             Center(
  //                               child: Container(
  //                                 padding: EdgeInsets.only(top: 20),
  //                                 width: 240,
  //                                 height: 290,
  //                                 decoration: BoxDecoration(
  //                                     borderRadius: BorderRadius.circular(8)),
  //                                 child: FadeInImage.assetNetwork(
  //                                   placeholder:
  //                                       'assets/newImages/placeholder_3.jpg',
  //                                   image:
  //                                       GlobalLists.homeDigitalLibraryBaseURL +
  //                                           product.image,
  //                                   fit: BoxFit.fitHeight,
  //                                   height: 200,
  //                                 ),
  //                               ),
  //                             ),
  //                             SizedBox(
  //                               height: 10,
  //                             ),
  //                             Center(
  //                               child: Text(product.title,
  //                                   textAlign: TextAlign.center,
  //                                   maxLines: 2,
  //                                   style: TextStyle(
  //                                     fontSize: 17,
  //                                   )),
  //                             )
  //                           ],
  //                         );
  //                       },
  //                     );
  //                   }).toList(),
  //                   carouselController: callAppCarouselController,
  //                 ),
  //               ),
  //             ),
  //       Positioned(
  //         top: 140,
  //         child: Container(
  //           width: MediaQuery.of(context).size.width,
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: <Widget>[
  //               GestureDetector(
  //                   onTap: () {
  //                     goToPrevious();
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(left: 20),
  //                     child: Icon(
  //                       Icons.arrow_back_ios,
  //                       color: Customcolor.text_darkblue,
  //                     ),
  //                   )),
  //               GestureDetector(
  //                   onTap: () {
  //                     goToNext();
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(right: 40),
  //                     child: Icon(
  //                       Icons.arrow_forward_ios,
  //                       color: Customcolor.text_darkblue,
  //                     ),
  //                   )),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // // goToPrevious() {
  // //   _controller.previousPage(
  // //       duration: Duration(milliseconds: 300), curve: Curves.ease);
  // // }

  // // goToNext() {
  // //   _controller.nextPage(
  // //       duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  // // }

  // goToPrevious() {
  //   callAppCarouselController.previousPage(
  //       duration: Duration(milliseconds: 300), curve: Curves.ease);
  // }

  // goToNext() {
  //   callAppCarouselController.nextPage(
  //       duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  // }

  // Widget digitalLibrary() {
  //   return Padding(
  //       padding: const EdgeInsets.only(
  //         left: 10,
  //         right: 10,
  //         top: 10,
  //       ),
  //       child: getdigitallib(context));
  // }

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
                                        child: Text(product.title,
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontFamily: AppFonts.normal)),
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            CallforApplication(
                                              apiurl: API.watchcallafrica,
                                              sharelink: Constantstring
                                                  .sharecallforappafrica,
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
                                        child: Text(product.title,
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontFamily: AppFonts.normal)),
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
                                              apiurl: API.digitalafrica,
                                              digitallink: Constantstring
                                                  .sharedigitalafrica,
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
                                      child: Text(product.photoDescription,
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontSize: 17,
                                          )),
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
                              onTap: () {},
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

  // Widget slider(BuildContext context) {
  //   return Stack(
  //     children: <Widget>[
  //       Column(
  //         children: <Widget>[
  //           Container(
  //             child: carouselSlider = CarouselSlider(
  //               options: CarouselOptions(
  //                 viewportFraction: 1.0,
  //                 height: 200,
  //                 autoPlay: true,
  //                 onPageChanged: (index, reason) {
  //                   setState(() {
  //                     _current = index;
  //                   });
  //                 },
  //               ),
  //               items: GlobalLists.mmtmsliderlist.map((product) {
  //                 return new Builder(
  //                   builder: (BuildContext context) {
  //                     return new Container(
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(10),
  //                       ),
  //                       width: SizeConfig.blockSizeHorizontal * 100,
  //                       child: FadeInImage.assetNetwork(
  //                         placeholder: 'assets/newImages/placeholder_3.jpg',
  //                         image: Constantstring.baseUrl + product.image,
  //                         fit: BoxFit.cover,
  //                       ),
  //                     );
  //                   },
  //                 );
  //               }).toList(),
  //             ),
  //           ),
  //           new DotsIndicator(
  //             dotsCount: GlobalLists.mmtmsliderlist.length,
  //             position: double.parse("$_current"),
  //             decorator: DotsDecorator(
  //               size: const Size.square(9.0),
  //               activeSize: const Size(18.0, 9.0),
  //               activeColor: Customcolor.colorPink,
  //               activeShape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(5.0)),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }
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
                        //     mainAxisAlignment: MainAxisAlignment.end,
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
                        //                   text: product['image_title'],
                        //                   labelColor: Customcolor.pink_col,
                        //                   fontSize:
                        //                       ResponsiveFlutter.of(context)
                        //                           .fontSize(1.4),
                        //                   maxLines: 2,
                        //                   fontweight: FontWeight.w700,
                        //                 ),
                        //                 SizedBox(
                        //                   height: 2,
                        //                 ),
                        //                 FormLabel(
                        //                   text: product['image_desc'],
                        //                   labelColor: Customcolor.pink_col,
                        //                   fontSize:
                        //                       ResponsiveFlutter.of(context)
                        //                           .fontSize(1.2),
                        //                   fontweight: FontWeight.w500,
                        //                 ),
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

  List<Widget> list() {
    listofwiget.clear();
    for (int i = 0; i < typewidet.length; i++) {
      if (typewidet[i] == "gallery") {
        listofwiget.add(
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CustomHorizontalCard(
              index: 1,
              cardImage: "assets/newImages/ourvison.png",
              cardsubtitle: "Photo ",
              cardTitle: "Gallery",
              btnTitle: "View More",
              onbtnTap: () {
                // getprogramgallery();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => GalleryProgram(
                              apiurl: API.programgalleryafrica,
                            )));
              },
              titleColor: Customcolor.pink_col,
              titleImg: "assets/newImages/flowers-3.png",
              list: ListView.builder(
                itemCount: GlobalLists.homegallerylist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      ShowDialogs.showImageDialog(
                        context: context,
                        image: GlobalLists.homegallerybaseurl +
                            GlobalLists.homegallerylist[index].photo,
                        description:
                            GlobalLists.homegallerylist[index].photoDescription,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5, left: 5),
                      child: Stack(
                        children: [
                          Container(
                            //   width: SizeConfig.blockSizeHorizontal * 70,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/newImages/placeholder_3.jpg',
                              image:
                                  "${GlobalLists.homegallerybaseurl + GlobalLists.homegallerylist[index].photo}",
                              fit: BoxFit.contain,
                            ),
                          ),
                          // Align(
                          //   alignment: Alignment.bottomCenter,
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(
                          //         left: 10, right: 10, bottom: 10),
                          //     child: Row(
                          //       crossAxisAlignment: CrossAxisAlignment.end,
                          //       //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         Column(
                          //           mainAxisAlignment: MainAxisAlignment.end,
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //           children: [
                          //             // Container(
                          //             //   width:
                          //             //       SizeConfig.blockSizeHorizontal * 80,
                          //             //   child: Text(
                          //             //     GlobalLists.homegallerylist[index].title,
                          //             //     overflow: TextOverflow.ellipsis,
                          //             //     style: TextStyle(
                          //             //         color: Colors.white,
                          //             //         fontSize: 14,
                          //             //         fontWeight: FontWeight.w700),
                          //             //     maxLines: 3,
                          //             //   ),
                          //             // ),
                          //             SizedBox(
                          //               height: 8,
                          //             )
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      }
      if (typewidet[i] == "videos") {
        listofwiget.add(
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: CustomHorizontalCard(
              index: 1,
              cardImage: "assets/newImages/gallery.png",
              cardsubtitle: "Our ",
              cardTitle: "Videos",
              btnTitle: "Watch More",
              onbtnTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            WatchmoreVideolibrary(
                              apiurl: API.watchvideoafrica,
                              headertitle:
                                  "Merck Foundation Africa Asia Luminary Videos",
                              sharelink:
                                  Constantstring.sharewatchallvideoafrica,
                            )));
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) => Videolibrary()));
              },
              titleColor: Customcolor.pink_col,
              titleImg: "assets/newImages/flowers-3.png",
              list: ListView.builder(
                itemCount: GlobalLists.homevideolist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) => VideoPlayer(
                      //               videoUrl: GlobalLists
                      //                   .homevideolist[index].videoLink,
                      //             )));
                      var storykey = GlobalLists.homevideolist[index].videoLink
                          .substring(GlobalLists
                                  .homevideolist[index].videoLink.length -
                              11);
                      ShowDialogs.youtubevideolink(
                          "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
                      // _launchInWebViewWithJavaScript(
                      //     "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8, left: 10),
                      child: Stack(
                        children: [
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 86,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/newImages/placeholder_3.jpg',
                              image:
                                  "https://img.youtube.com/vi/${GlobalLists.homevideolist[index].videoLink.substring(GlobalLists.homevideolist[index].videoLink.length - 11)}/mqdefault.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 80,
                                        child: Text(
                                          GlobalLists
                                              .homevideolist[index].videoDesc,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                          maxLines: 3,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 120),
                            child: Center(
                                child:
                                    Image.asset("assets/newImages/pause.png")),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      }
      if (typewidet[i] == "awards") {
        listofwiget.add(
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: CustomHorizontalCard(
              index: 1,
              cardImage: "assets/newImages/ourvison.png",
              cardTitle: "",
              btnTitle: "",
              titleColor: Customcolor.pink_col,
              titleImg: "assets/newImages/flowers-3.png",
              heigthoflist: SizeConfig.blockSizeVertical * 15,
              list: ListView.builder(
                itemCount: GlobalLists.merckcancerawardlist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 6),
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 0, left: 10, right: 10, top: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Html(
                                data:
                                    """${GlobalLists.merckcancerawardlist[index].title} """,
                                onLinkTap: (url) {
                                  print("Opening $url...");
                                  ShowDialogs.launchURL(url);
                                },
                                style: {
                                  "body": Style(
                                      textAlign: TextAlign.start,
                                      color: Customcolor.pink_col,
                                      fontSize: FontSize.large,
                                      fontWeight: FontWeight.w500),
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      getawarddetail(GlobalLists
                                          .merckcancerawardlist[index].pageUrl);
                                    },
                                    child: Container(
                                      width: 110,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          "Read More",
                                          style: TextStyle(
                                              color: Customcolor.text_darkblue,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Image.asset(
                                  //   "assets/images/trophy.png",
                                  //   width: 70,
                                  //   height: 70,
                                  // )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      }
      if (typewidet[i] == "content") {
        listofwiget.add(
          Html(
            data: """${GlobalLists.homecontentlist[0].pageContent} """,
            onLinkTap: (url) {
              print("Opening $url...");
              ShowDialogs.launchURL(url);
            },
          ),
        );
      }
      if (typewidet[i] == "latest_updates") {
        listofwiget.add(
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: CustomHorizontalCard(
              index: 1,
              cardImage: "assets/newImages/ourvison.png",
              cardsubtitle: "Latest ",
              cardTitle: "Updates",
              btnTitle: "View More",
              titleColor: Customcolor.pink_col,
              titleImg: "assets/newImages/flowers-3.png",
              onbtnTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) =>
                //             Dashboard(index: 3)));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => NewsPage(
                              apiurl: API.watchmorelatestupafrica,
                            )));
              },
              list: ListView.builder(
                itemCount: GlobalLists.homeceomsglist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Detailpage(
                                    indexIs: index,
                                    callfrom: 2,
                                  )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8, left: 10),
                      child: Stack(
                        children: [
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 86,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/newImages/placeholder_3.jpg',
                              image:
                                  "${GlobalLists.homeceomsgbaseurl + GlobalLists.homeceomsglist[index].image}",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 80,
                                        child: Text(
                                          GlobalLists
                                              .homeceomsglist[index].title,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                          maxLines: 3,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      }
      if (typewidet[i] == "media") {
        listofwiget.add(
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: CustomHorizontalCard(
              index: 1,
              cardImage: "assets/newImages/mqdefault.png",
              cardsubtitle: "Merck Foundation In ",
              cardTitle: "Media",
              titleColor: Customcolor.pink_col,
              btnTitle: "View More",
              titleImg: "assets/newImages/flowers-3.png",
              onbtnTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            MerckFoundationMedia()));
              },
              list: ListView.builder(
                itemCount: GlobalLists.mmtmmedialist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => VideoPlayer(
                                    videoUrl: GlobalLists
                                        .mmtmmedialist[index].mediaUrl,
                                  )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8, left: 10),
                      child: Stack(
                        children: [
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 86,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/newImages/placeholder_3.jpg',
                              image:
                                  "${GlobalLists.mmtmmediabaseurl + GlobalLists.mmtmmedialist[index].image}",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 80,
                                        child: Text(
                                          GlobalLists
                                              .mmtmmedialist[index].title,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                          maxLines: 3,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      }
      if (typewidet[i] == "testimonial") {
        listofwiget.add(
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: CustomHorizontalCard(
                index: 1,
                cardImage: "assets/newImages/mqdefault.png",
                cardsubtitle: "Merck Foundation ",
                cardTitle: "Alumini Testimonials  ",
                titleColor: Customcolor.pink_col,
                onbtnTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Testimonialprogramviewmore()));
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) =>
                  //             MerckFoundationTestimonial()));
                },
                btnTitle: "View More",
                titleImg: "assets/newImages/flowers-3.png",
                list: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Container(
                    height: 160,
                    child: ListView.builder(
                      itemCount: GlobalLists.mmttestimoniallist.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Testimonialprogramdetailpage(
                                          index: index,
                                          baseurl:
                                              GlobalLists.mmttestimonialbaseurl,
                                        )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Container(
                              height: SizeConfig.blockSizeVertical * 15,
                              width: SizeConfig.blockSizeHorizontal * 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 3, left: 8, right: 8),
                                    child: Container(
                                      // height: 220,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        //color: Colors.amber,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: FadeInImage.assetNetwork(
                                        placeholder:
                                            'assets/newImages/placeholder_3.jpg',
                                        image:
                                            "${GlobalLists.mmttestimonialbaseurl + GlobalLists.mmttestimoniallist[index].image}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView(
                                      shrinkWrap: true,
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 12,
                                        ),
                                        FormLabel(
                                          text: GlobalLists
                                              .mmttestimoniallist[index]
                                              .testimonialName,
                                          labelColor: Customcolor.colorPink,
                                          fontSize: 17,
                                          maxLines: 1,
                                          fontweight: FontWeight.w700,
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Html(
                                          data: GlobalLists
                                              .mmttestimoniallist[index]
                                              .departmentName,
                                          style: {
                                            "body": Style(
                                                fontSize: FontSize(13.0),
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w600),
                                          },
                                        ),
                                        // FormLabel(
                                        //   text: GlobalLists
                                        //       .mmttestimoniallist[index]
                                        //       .departmentName,
                                        //   labelColor: Colors.black87,
                                        //   fontSize: 13,
                                        //   fontweight: FontWeight.w600,
                                        //   maxLines: 2,
                                        // ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        FormLabel(
                                          text: GlobalLists
                                              .mmttestimoniallist[index]
                                              .shortDescription,
                                          labelColor: Colors.black54,
                                          fontSize: 13,
                                          fontweight: FontWeight.w500,
                                          maxLines: 4,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )),
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
            new Tab(child: Callforapptext()),
          );

          listoftabwiget.add(
            getcallforapp(context),
          );
        }
        // if (typewidetofrightsection[i] == "mmtm") {
        //   tabs.add(
        //     new Tab(text: "Merck More Than A Mother Ambassadors"),
        //   );
        //   listoftabwiget.add(getMMTMS(context));
        // }
        if (typewidetofrightsection[i] == "digital_library") {
          tabs.add(
            new Tab(
              child: Digitaltext(),
            ),
          );
          listoftabwiget.add(digitalLibraryLastSection());
        }
        print('tabs');
        print(tabs.length);
      }
    });
    //_tabController.length = tabs.length;
    return listoftabwiget;
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

  // Widget getMMTMS(BuildContext context) {
  //   return Stack(
  //     children: <Widget>[
  //       GlobalLists.homemmtm.length <= 0
  //           ? Container(
  //               child: Center(child: Text(Constantstring.emptyData)),
  //             )
  //           : Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Container(
  //                 //color: Colors.amber,
  //                 width: SizeConfig.blockSizeHorizontal * 100,
  //                 height: 400,
  //                 color: Colors.white,
  //                 child: carouselSlider = CarouselSlider(
  //                   options: CarouselOptions(
  //                       autoPlay: false,
  //                       aspectRatio: 1,
  //                       enlargeCenterPage: true,
  //                       enlargeStrategy: CenterPageEnlargeStrategy.height,
  //                       viewportFraction: 1.0,
  //                       //  height: SizeConfig.blockSizeVertical * 100,
  //                       onPageChanged: (index, reason) {
  //                         setState(() {
  //                           _current1 = index;
  //                         });
  //                       }),
  //                   items: GlobalLists.homemmtm.map((product) {
  //                     return new Builder(
  //                       builder: (BuildContext context) {
  //                         return ListView(
  //                           shrinkWrap: true,
  //                           physics: ScrollPhysics(),
  //                           //  crossAxisAlignment: CrossAxisAlignment.center,
  //                           children: [
  //                             Center(
  //                               child: Container(
  //                                 padding: EdgeInsets.only(top: 20),
  //                                 width: 240,
  //                                 height: 290,
  //                                 decoration: BoxDecoration(
  //                                     borderRadius: BorderRadius.circular(8)),
  //                                 child: FadeInImage.assetNetwork(
  //                                   placeholder:
  //                                       'assets/newImages/placeholder_3.jpg',
  //                                   image: GlobalLists.homeMMTMBaseURL +
  //                                       product.photo,
  //                                   fit: BoxFit.cover,
  //                                   height: 200,
  //                                 ),
  //                               ),
  //                             ),
  //                             SizedBox(
  //                               height: 10,
  //                             ),
  //                             Center(
  //                               child: Text(product.photoDescription,
  //                                   textAlign: TextAlign.center,
  //                                   maxLines: 2,
  //                                   style: TextStyle(
  //                                     fontSize: 17,
  //                                   )),
  //                             )
  //                           ],
  //                         );
  //                       },
  //                     );
  //                   }).toList(),
  //                   carouselController: callAppCarouselController,
  //                 ),
  //               ),
  //             ),
  //       Positioned(
  //         top: 140,
  //         child: Container(
  //           width: MediaQuery.of(context).size.width,
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: <Widget>[
  //               GestureDetector(
  //                   onTap: () {
  //                     goToPrevious();
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(left: 20),
  //                     child: Icon(
  //                       Icons.arrow_back_ios,
  //                       color: Customcolor.text_darkblue,
  //                     ),
  //                   )),
  //               GestureDetector(
  //                   onTap: () {
  //                     goToNext();
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(right: 40),
  //                     child: Icon(
  //                       Icons.arrow_forward_ios,
  //                       color: Customcolor.text_darkblue,
  //                     ),
  //                   )),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Future<http.Response> getmmtmapi() async {
    print("mmtm api");
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      var response = await APIManager.fetchget(
        encoding: APIManager.merckafricaasialuminar,
      );
      print("response");
      print(response);
      if (response.statusCode == 200) {
        var res = json.decode(response.body);
        print("ff");
        print(res);
        africaasia.AfricaAsiaResponse homepageres =
            africaasia.AfricaAsiaResponse.fromJson(res);
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

        print("sliderprogramsection");
        print(slidersection.length);

        Map<String, dynamic> section1 = homepageres.middleArea;
        Map<String, dynamic> lastsection = homepageres.rightArea;

        List<String> middleareakey = [];
        section1.keys.forEach((element) {
          middleareakey.add(element.toString());
        });
        print(middleareakey);
        for (int i = 0; i < section1.length; i++) {
          //  MiddleArea categoryKeys = section1[(i + 1).toString()];
          //  print(categoryKeys.videos.type);
          // dynamic section = res['middle_area']['${i + 1}'];
          // print("TKey: ${section.keys.first}");
          // var middlecategoryname = section.keys.first;
          dynamic section = res['middle_area'][middleareakey[i]];
          print("TKey: ${section.keys.first}");
          var middlecategoryname = section.keys.first;
          setState(() {
            typewidet.add(middlecategoryname);

            print(typewidet);
          });
          if (middlecategoryname.toString().toLowerCase() ==
              "Videos".toLowerCase()) {
            GlobalLists.homevideolist =
                homepageres.middleArea[middleareakey[i]].videos.list;
            print(GlobalLists.homevideolist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "content".toLowerCase()) {
            GlobalLists.homecontentlist =
                homepageres.middleArea[middleareakey[i]].content.list;
            print(GlobalLists.homecontentlist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "gallery".toLowerCase()) {
            GlobalLists.homegallerybaseurl =
                homepageres.middleArea[middleareakey[i]].gallery.baseUrl;
            GlobalLists.homegallerylist =
                homepageres.middleArea[middleareakey[i]].gallery.list;
            print(GlobalLists.homegallerylist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "latest_updates".toLowerCase()) {
            //latest update
            GlobalLists.homeceomsgbaseurl =
                homepageres.middleArea[middleareakey[i]].latestUpdates.baseUrl;
            GlobalLists.homeceomsglist =
                homepageres.middleArea[middleareakey[i]].latestUpdates.list;
            print(GlobalLists.homeceomsglist.length);
          }
        }

        ///////right section

        dynamic rightsection1 = res['Right_area'][1];
        dynamic rightsection3 = res['Right_area'][3];
        // print("TKey: ${rightsection.keys.first}");
        var rightsection1categoryname = rightsection1;
        var rightsection3categoryname = rightsection3;

        setState(() {
          typewidetofrightsection.add('call_for_app');
          typewidetofrightsection.add('digital_library');

          print(typewidetofrightsection);
          _tabController = new TabController(
              vsync: this, length: typewidetofrightsection.length);
        });

        if (rightsection1categoryname.toString().toLowerCase() ==
            "call_for_app".toLowerCase()) {
          for (int j = 0;
              j < homepageres.rightArea[1].callForApp.list.length;
              j++) {
            var enddate = new DateTime.utc(
                homepageres.rightArea[1].callForApp.list[j].eventEndDate.year,
                homepageres.rightArea[1].callForApp.list[j].eventEndDate.month,
                homepageres.rightArea[1].callForApp.list[j].eventEndDate.day);

            if (_todaysDate.isBefore(enddate)) {
              GlobalLists.homecallforapp
                  .add(homepageres.rightArea[1].callForApp.list[j]);
              print(GlobalLists.homecallforapp.length);
            }
          }
          // GlobalLists.homecallforapp = homepageres.rightArea[1].callForApp.list;
          GlobalLists.homeCallForAppBaseURL =
              homepageres.rightArea[1].callForApp.baseUrl;
          print(GlobalLists.homecallforapp.length);
        } else if (rightsection3categoryname.toString().toLowerCase() ==
            "digital_library".toLowerCase()) {
          GlobalLists.homedigitallib =
              homepageres.rightArea[3].digitalLibrary.list;
          GlobalLists.homeDigitalLibraryBaseURL =
              homepageres.rightArea[3].digitalLibrary.baseUrl;
          print(GlobalLists.homedigitallib.length);
        }

        setState(() {
          isMiddleSectionLoaded = true;
          isrightSectionLoaded = true;
        });

        return response;
      } else {
        _tabController = new TabController(vsync: this, length: 0);
        isMiddleSectionLoaded = true;

        isrightSectionLoaded = true;
        ShowDialogs.showToast(GlobalLists.serverresp);
      }
    } else {
      _tabController = new TabController(vsync: this, length: 0);
      isMiddleSectionLoaded = true;

      isrightSectionLoaded = true;
      ShowDialogs.showToast("Please check internet connection");
    }
  }

  getprogramgallery() async {
    var status1 = await ConnectionDetector.checkInternetConnection();
    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(context, API.programgalleryafrica,
          (response) async {
        GalleryProgramResponse resp = response;

        print(response);
        print('Resp : $resp');
        Navigator.of(_keyLoader.currentContext).pop();
        if (resp.success == "True".toLowerCase()) {
          print(resp.list);
          GlobalLists.programgallerybaseurl = resp.baseUrl;
          GlobalLists.programgallerylist = resp.list;
          print(GlobalLists.programgallerylist);
          // GlobalLists.awarddetallisting[0].title

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => GalleryProgram(
                        baseURL: GlobalLists.programgallerybaseurl,
                        photosList: GlobalLists.programgallerylist,
                      )));
        } else {
          ShowDialogs.showToast(resp.msg);
        }
      }, (error) {
        print('ERR msg is $error');
        Navigator.of(_keyLoader.currentContext).pop();
      }, jsonval: json);
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }

  getawarddetail(String pageurl) async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);
      final json = {
        'page_url': pageurl,
      };
      print(json);
      APIManager().apiRequest(context, API.ourawarddetail, (response) async {
        OurawarddetailResponse resp = response;
        print(response);
        print('Resp : $resp');

        Navigator.of(_keyLoader.currentContext).pop();

        if (resp.success == "True") {
          setState(() {
            GlobalLists.awarddetallisting = resp.data.list;
            // GlobalLists.awarddetallisting[0].title
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => OurAwardDetail(
                          detaill: GlobalLists.awarddetallisting,
                        )));
          });
        } else {
          ShowDialogs.showToast(resp.msg);
        }
      }, (error) {
        print('ERR msg is $error');
        Navigator.of(_keyLoader.currentContext).pop();
      }, jsonval: json);
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

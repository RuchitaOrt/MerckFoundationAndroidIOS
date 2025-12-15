import 'dart:convert';
import 'dart:io';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:http/http.dart' as http;

import 'package:merckfoundation22dec/WatchDigitalLibrary.dart';
import 'package:merckfoundation22dec/mediascreen.dart/Detailpage.dart';
import 'package:merckfoundation22dec/mediascreen.dart/news.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videoplayer.dart';
import 'package:merckfoundation22dec/model/Merckcanceraccess.dart'
    as merckcancer;
import 'package:merckfoundation22dec/model/OurawarddetailResponse.dart';
import 'package:merckfoundation22dec/ourawarddetail.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/ourProgramdetailcancerlist.dart';
import 'package:merckfoundation22dec/screens/watchmorevideolibray.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/viewMoreMedia.dart';
import 'package:merckfoundation22dec/widget/customHorizontalCard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:merckfoundation22dec/utility/ResponsiveFlutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Testimonailprogramviewmore.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Testimonailprogramdetailpage.dart';
import 'package:merckfoundation22dec/widget/slidercontainer.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';

class MerckCanceraccess extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MerckCanceraccessState();
  }
}

class MerckCanceraccessState extends State<MerckCanceraccess>
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
  Color? color;

  List<Widget> listofwiget = [];
  List<Widget> listoftabwiget = [];
  List<Widget> listofbottomwiget = [];

  List _imgarray = [
    "assets/newImages/img3.jpg",
    "assets/newImages/img4.jpg",
    "assets/newImages/leader1.png",
    "assets/newImages/leader2.png",
    "assets/newImages/img3.jpg",
    "assets/newImages/leader1.png",
    "assets/newImages/leader2.png",
  ];
  late CarouselSlider carouselSlider;

  bool iscall = true;
  bool islibrary = false;
  bool ismeck = false;
  bool expandClick = false;
  String expandedName = "Upcoming Events";

  final List<Tab> tabs = <Tab>[];
  final CarouselSliderController callAppCarouselController = CarouselSliderController();
  TabController? _tabController;
  // final CarouselController  callAppCarouselController = CarouselController ();
  final CarouselSliderController digitalLibraryCarouselController =
      CarouselSliderController();
  final CarouselSliderController mmtmCarouselController = CarouselSliderController();

  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    // getmmtmslider();
    // GlobalLists.homecallforapp.clear();
    // GlobalLists.homemmtm.clear();
    GlobalLists.homedigitallib.clear();
    getmmtmapi();
    super.initState();
    // _tabController = new TabController(vsync: this, length: 1);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: InnerCustomAppBar(
        onTapval: () {
          // Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Dashboard(
                        index: 1,
                      )));
        },
        index: 1,
        title: "Merck Foundation Cancer Access Program",
        titleImg: "assets/newImages/our_programsLogo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      // bottomNavigationBar: Bottomcardlink(),
      body: 
      Container(
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

                followUs(),

                SizedBox(
                  height: 10,
                ),

                followUsformerckcancer(),

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
                // Bottomcardlink(),
              ])),
    );
  }

  double imgHeight = 30;
  double imgHeightfb = 24;
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
                  Text(
                    "Follow Merck Foundation on",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize:
                            11, //ResponsiveFlutter.of(context).fontSize(1.7),
                        fontWeight: FontWeight.w700,
                        fontFamily: AppFonts.normal,
                        color: Colors.black87),
                  )
                ],
              ),
              SizedBox(
                height: 10,
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
                      height: imgHeightfb,
                      width: imgHeightfb,
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
                      height: imgHeightfb,
                      width: imgHeightfb,
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
          // Expanded(
          //   child: Image.asset(
          //     "assets/newImages/hometoolbar.png",
          //     height: 100,
          //     width: 80,
          //   ),
          // )
        ],
      )),
    );
  }

  Widget followUsformerckcancer() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 15),
      child: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Follow Merck Foundation Cancer Access Program on ",
                textAlign: TextAlign.start,
                maxLines: 2,
                style: TextStyle(
                    fontSize: 11, //ResponsiveFlutter.of(context).fontSize(1.7),
                    fontWeight: FontWeight.w700,
                    fontFamily: AppFonts.normal,
                    color: Colors.black87),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      // Platform.isAndroid
                      //     ? ShowDialogs.followuslink(
                      //         Constantstring.followmmerckCancerFb,
                      //         Constantstring.followmsg):
                      ShowDialogs.launchFacebook(
                          Constantstring.followmmerckCancerFb,
                          "1595566227361051");
                    },
                    child: Image.asset(
                      "assets/newImages/facebooknew.png",
                      height: imgHeightfb,
                      width: imgHeightfb,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      Platform.isAndroid
                          ? ShowDialogs.followuslink(
                              Constantstring.followmmerckCancertwitter,
                              Constantstring.followmsg)
                          : ShowDialogs.launchTwitter(
                              Constantstring.followmmerckCancertwitter);
                    },
                    child: Image.asset(
                      "assets/newImages/twitternew.png",
                      height: imgHeightfb,
                      width: imgHeightfb,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),

                  // GestureDetector(
                  //   onTap: () async {
                  //     // Platform.isAndroid
                  //     //     ? ShowDialogs.followuslink(Constantstring.followinsta,
                  //     //         Constantstring.followmsg)
                  //     //     : ShowDialogs.launchInstagram(
                  //     //         Constantstring.followinsta, "merckfoundation");
                  //     ShowDialogs.launchURLemail(
                  //         Constantstring.followmmerckCancergmailPlus);
                  //   },
                  //   child: Image.asset(
                  //     "assets/newImages/gmail.png",
                  //     height: imgHeight,
                  //     width: imgHeight,
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 5,
                  // ),

                  GestureDetector(
                    onTap: () async {
                      Platform.isAndroid
                          ? ShowDialogs.followuslink(
                              Constantstring.followmmerckCanceryoutube,
                              Constantstring.followmsg)
                          : ShowDialogs.youtubevideolink(
                              Constantstring.followmmerckCanceryoutube);
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
                 
                ],
              )
            ],
          ),
        
        ],
      )),
    );
  }

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
                        
                      },
                    );
                  }).toList(),
                ),
              ),
              
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
              cardTitle: "Our Gallery  ",
              btnTitle: "View More",
              titleColor: Customcolor.pink_col,
              titleImg: "assets/newImages/flowers-3.png",
              list: ListView.builder(
                itemCount: GlobalLists.homegallerylist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8, left: 10),
                    child: Stack(
                      children: [
                        Container(
                          width: SizeConfig.blockSizeHorizontal * 86,
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/newImages/placeholder_3.jpg',
                            image:
                                "${GlobalLists.homegallerybaseurl + GlobalLists.homegallerylist[index].photo}",
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Container(
                                    //   width:
                                    //       SizeConfig.blockSizeHorizontal * 80,
                                    //   child: Text(
                                    //     GlobalLists.homegallerylist[index].title,
                                    //     overflow: TextOverflow.ellipsis,
                                    //     style: TextStyle(
                                    //         color: Colors.white,
                                    //         fontSize: 14,
                                    //         fontWeight: FontWeight.w700),
                                    //     maxLines: 3,
                                    //   ),
                                    // ),
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
              cardTitle: "Videos  ",
              btnTitle: "Watch More",
              heigthoflist: SizeConfig.blockSizeVertical * 34,
              onbtnTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            WatchmoreVideolibrary(
                              apiurl: API.watchvideocancer,
                              headertitle:
                                  "Merck Foundation Cancer Access Program Videos",
                              sharelink:
                                  Constantstring.sharewatchallvideocancer,
                            )));
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8, left: 10),
                          child: Stack(
                            children: [
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 86,
                                height: SizeConfig.blockSizeVertical * 26,
                                child: FadeInImage.assetNetwork(
                                  placeholder:
                                      'assets/newImages/placeholder_3.jpg',
                                  image:
                                      "https://img.youtube.com/vi/${GlobalLists.homevideolist[index].videoLink.substring(GlobalLists.homevideolist[index].videoLink.length - 11)}/mqdefault.jpg",
                                  fit: BoxFit.fill,
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
                              //             Container(
                              //               width:
                              //                   SizeConfig.blockSizeHorizontal * 80,
                              //               child: Text(
                              //                 GlobalLists
                              //                     .homevideolist[index].videoDesc,
                              //                 overflow: TextOverflow.ellipsis,
                              //                 style: TextStyle(
                              //                     color: Colors.white,
                              //                     fontSize: 14,
                              //                     fontWeight: FontWeight.w700),
                              //                 maxLines: 3,
                              //               ),
                              //             ),
                              //             SizedBox(
                              //               height: 25,
                              //             )
                              //           ],
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              Padding(
                                padding: EdgeInsets.only(left: 120, top: 70),
                                child: Center(
                                    child: Image.asset(
                                        "assets/newImages/pause.png")),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 9),
                          width: SizeConfig.blockSizeHorizontal * 80,
                          child: Text(
                            GlobalLists.homevideolist[index].videoDesc,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                            maxLines: 2,
                          ),
                        ),
                        // SizedBox(
                        //   height: 5,
                        // )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      }
      if (typewidet[i] == "awards") {
        print("GlobalLists.merckcancerawardlist.length");
        print( GlobalLists.merckcancerawardlist.length);
       print(GlobalLists.merckcancerawardlist);
        listofwiget.add(
        GlobalLists.merckcancerawardlist.length==0?Container():  Padding(
            padding: const EdgeInsets.only(left: 10, top: 2),
            child:
             CustomHorizontalCard(
              index: 1,
              cardImage: "assets/newImages/ourvison.png",
             cardsubtitle: "Our ",
              cardTitle: "Awards  ",
              showviewmore: 1,
              btnTitle: "View More",
              titleColor: Customcolor.pink_col,
              titleImg: "assets/newImages/flowers-3.png",
              heigthoflist: 140.0,
              list: 
              ListView.builder(
                itemCount: GlobalLists.merckcancerawardlist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  if (index % 7 == 0) {
                    print("index");
                    print(index % 3);
                    color = Customcolor.prog1;
                  } else if (index % 7 == 1) {
                    color = Customcolor.prog2;
                  } else if (index % 7 == 2) {
                    color = Customcolor.prog3;
                  } else if (index % 7 == 3) {
                    color = Customcolor.prog4;
                  } else if (index % 7 == 4) {
                    color = Customcolor.prog5;
                  } else if (index % 7 == 5) {
                    color = Customcolor.prog6;
                  } else if (index % 7 == 6) {
                    color = Customcolor.prog7;
                  } else if (index % 7 == 7) {
                    color = Customcolor.prog8;
                  }
              
                  return 
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        color: color,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 0, left: 10, right: 10, top: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(GlobalLists.merckcancerawardlist[index].title),
              //                 Html(
              //                   data:
              //                       """${GlobalLists.merckcancerawardlist[index].title} """,
              //                   onLinkTap:
              //                       (url, attributes, element) {
              //                     print("Opening $url...");
              //                     ShowDialogs.launchURL(url!);
              //                   },
              //                   style: {
              //                     "body": Style(
              //                         textAlign: TextAlign.start,
              //                         color:
              //                             Colors.white, //Customcolor.pink_col,
              //                         fontSize: FontSize.large,
              //                         fontWeight: FontWeight.w500),
              //                     "tr": Customcolor.tableboderstyle(context),
              //                   },
              //                    extensions: [
              //       TagExtension(
              //         tagsToExtend: {"img"},
              //         builder: (ExtensionContext context) {
              //           final src = context.attributes['src'] ?? '';
              //           return Padding(
              //             padding: const EdgeInsets.symmetric(vertical: 8.0),
              //             child: Image.network(
              // src,
              // width: double.infinity,
              // fit: BoxFit.contain,
              // errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image),
              //             ),
              //           );
              //         },
              //       )
              //     ],
              //                 ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // getawarddetail(GlobalLists
                                      //     .merckcancerawardlist[index].pageUrl);
                                      if (GlobalLists
                                              .merckcancerawardlist[index]
                                              .pageUrl ==
                                          "merck-foundation-oncology-fellowship-program") {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        OurProgramcancerlist(
                                                          indexpass: 23,
                                                        )
                                                //   MerckFellowship()
                                                ));
                                      } else if (GlobalLists
                                              .merckcancerawardlist[index]
                                              .pageUrl ==
                                          "merck-foundation-more-than-a-patient") {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        OurProgramcancerlist(
                                                          indexpass: 24,
                                                        )
                                                // MerckCancerPatient()
                                                ));
                                      } else if (GlobalLists
                                              .merckcancerawardlist[index]
                                              .pageUrl ==
                                          "merck-foundation-more-than-a-patiant") {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        OurProgramcancerlist(
                                                          indexpass: 24,
                                                        )
                                                // MerckCancerPatient()
                                                ));
                                      } else if (GlobalLists
                                              .merckcancerawardlist[index]
                                              .pageUrl ==
                                          "merck-foundation-community-awareness") {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        OurProgramcancerlist(
                                                          indexpass: 25,
                                                        )
                                                //  Merckcancercommunityawareness()
                                                ));
                                      } else {
                                        getawarddetail(
                                            GlobalLists
                                                .merckcancerawardlist[index]
                                                .pageUrl,
                                            GlobalLists
                                                .merckcancerawardlist[index]
                                                .id);
                                      }
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
            onLinkTap: (url, attributes, element) {
              print("Opening $url...");
              ShowDialogs.launchURL(url!);
            },
            style: {
              "tr": Customcolor.tableboderstyle(context),
            },
             extensions: [
      TagExtension(
        tagsToExtend: {"img"},
        builder: (ExtensionContext context) {
          final src = context.attributes['src'] ?? '';
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.network(
              src,
              width: double.infinity,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image),
            ),
          );
        },
      )
    ],
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
              heigthoflist: SizeConfig.blockSizeVertical * 36,
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
                              apiurl: API.watchmorelatestupcancer,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 86,
                            height: SizeConfig.blockSizeVertical * 27,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/newImages/placeholder_3.jpg',
                              image:
                                  "${GlobalLists.homeceomsgbaseurl + GlobalLists.homeceomsglist[index].image}",
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),

                          Container(
                            padding: EdgeInsets.only(left: 2),
                            width: SizeConfig.blockSizeHorizontal * 80,
                            child: Text(
                              GlobalLists.homeceomsglist[index].title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                              maxLines: 3,
                            ),
                          ),
                          // SizedBox(
                          //   height: 8,
                          // )
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
                          //             Container(
                          //               width:
                          //                   SizeConfig.blockSizeHorizontal * 80,
                          //               child: Text(
                          //                 GlobalLists
                          //                     .homeceomsglist[index].title,
                          //                 overflow: TextOverflow.ellipsis,
                          //                 style: TextStyle(
                          //                     color: Colors.white,
                          //                     fontSize: 14,
                          //                     fontWeight: FontWeight.w700),
                          //                 maxLines: 3,
                          //               ),
                          //             ),
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
      if (typewidet[i] == "media") {
        listofwiget.add(
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: CustomHorizontalCard(
              index: 1,
              cardImage: "assets/newImages/mqdefault.png",
              cardsubtitle: "Merck Foundation In ",
              cardTitle: "Media  ",
              titleColor: Customcolor.pink_col,
              btnTitle: "View More",
              titleImg: "assets/newImages/flowers-3.png",
              heigthoflist: SizeConfig.blockSizeVertical * 36,
              onbtnTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ViewmoreMedia(
                              apiurl: API.watchmediaprogramcancer,
                            )));
              },
              list: ListView.builder(
                itemCount: GlobalLists.mmtmmedialist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) => VideoPlayer(
                      //               videoUrl: GlobalLists
                      //                   .mmtmmedialist[index].mediaUrl,
                      //             )));
                      ShowDialogs.launchURL(
                          GlobalLists.mmtmmedialist[index].mediaUrl);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 86,
                            height: SizeConfig.blockSizeVertical * 27,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/newImages/placeholder_3.jpg',
                              image:
                                  "${GlobalLists.mmtmmediabaseurl + GlobalLists.mmtmmedialist[index].image}",
                              fit: BoxFit.fill,
                            ),
                          ),

                          SizedBox(
                            height: 8,
                          ),

                          Container(
                            padding: EdgeInsets.only(left: 4),
                            width: SizeConfig.blockSizeHorizontal * 80,
                            child: Text(
                              GlobalLists.mmtmmedialist[index].title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                              maxLines: 3,
                            ),
                          ),
                          // SizedBox(
                          //   height: 8,
                          // )
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
                          //             Container(
                          //               width:
                          //                   SizeConfig.blockSizeHorizontal * 80,
                          //               child: Text(
                          //                 GlobalLists
                          //                     .mmtmmedialist[index].title,
                          //                 overflow: TextOverflow.ellipsis,
                          //                 style: TextStyle(
                          //                     color: Colors.white,
                          //                     fontSize: 14,
                          //                     fontWeight: FontWeight.w700),
                          //                 maxLines: 3,
                          //               ),
                          //             ),
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
              heigthoflist: SizeConfig.blockSizeVertical * 42,
              onbtnTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Testimonialprogramviewmore(
                              apiurl: API.watchmoretestimonialcancer,
                              sharelink:
                                  Constantstring.sharetestimonialviewmorecancer,
                            )));
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) =>
                //             MerckFoundationTestimonial()));
              },
              btnTitle: "View More",
              titleImg: "assets/newImages/flowers-3.png",
              list: ListView.builder(
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
                                    baseurl: GlobalLists.mmttestimonialbaseurl,
                                  )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8, left: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 86,
                            height: SizeConfig.blockSizeVertical * 28,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/newImages/placeholder_3.jpg',
                              image:
                                  "${GlobalLists.mmttestimonialbaseurl + GlobalLists.mmttestimoniallist[index].image}",
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                             width: SizeConfig.blockSizeHorizontal * 86,
                            child:
                            HtmlWidget(
  GlobalLists.mmttestimoniallist[index].testimonialName,

  // --- Styling ---
  textStyle: TextStyle(
    fontSize: 14,
    color: Colors.black87,
    fontWeight: FontWeight.w500,
  ),

  // --- Custom Image Handling (replaces TagExtension) ---
  factoryBuilder: () => _CustomWidgetFactory(),
)

                            //  Html(
                            //   data: GlobalLists
                            //       .mmttestimoniallist[index].testimonialName,
                            //   style: {
                            //     "body": Style(
                            //         fontSize: FontSize(14.0),
                            //         color: Colors.black87,
                            //         //   lineHeight: 1.0,
                            
                            //         //textAlign: TextAlign.center,
                            //         fontWeight: FontWeight.w500),
                            //     "tr": Customcolor.tableboderstyle(context),
                            //   },
                            //    extensions: [
                            //       TagExtension(
                            //         tagsToExtend: {"img"},
                            //         builder: (ExtensionContext context) {
                            //           final src = context.attributes['src'] ?? '';
                            //           return Padding(
                            //             padding: const EdgeInsets.symmetric(vertical: 8.0),
                            //             child: Image.network(
                            //               src,
                            //               width: double.infinity,
                            //               fit: BoxFit.contain,
                            //               errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image),
                            //             ),
                            //           );
                            //         },
                            //       )
                            //     ],
                            // ),
                          ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          SizedBox(
                             width: SizeConfig.blockSizeHorizontal * 86,
                            child: 
                             HtmlWidget(
  GlobalLists.mmttestimoniallist[index].departmentName,

  // --- Styling ---
  textStyle: TextStyle(
    fontSize: 14,
    color: Colors.black87,
    fontWeight: FontWeight.w500,
  ),

  // --- Custom Image Handling (replaces TagExtension) ---
  factoryBuilder: () => _CustomWidgetFactory(),
)
                            // Html(
                            //   data: GlobalLists
                            //       .mmttestimoniallist[index].departmentName,
                            //   style: {
                            //     "body": Style(
                            //         fontSize: FontSize(14.0),
                            //         color: Customcolor.colorBlue,
                            //         //  lineHeight: 1.0,
                            
                            //         //textAlign: TextAlign.center,
                            //         fontWeight: FontWeight.w500),
                            //     "tr": Customcolor.tableboderstyle(context),
                            //   },
                            //    extensions: [
                            //       TagExtension(
                            //         tagsToExtend: {"img"},
                            //         builder: (ExtensionContext context) {
                            //           final src = context.attributes['src'] ?? '';
                            //           return Padding(
                            //             padding: const EdgeInsets.symmetric(vertical: 8.0),
                            //             child: Image.network(
                            //               src,
                            //               width: double.infinity,
                            //               fit: BoxFit.contain,
                            //               errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image),
                            //             ),
                            //           );
                            //         },
                            //       )
                            //     ],
                            // ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 8),
              //   child: Container(
              //     height: 160,
              //     child: ListView.builder(
              //       itemCount: GlobalLists.mmttestimoniallist.length,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (BuildContext context, int index) {
              //         return GestureDetector(
              //           onTap: () {
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (BuildContext context) =>
              //                         Testimonialprogramdetailpage(
              //                           index: index,
              //                           baseurl:
              //                               GlobalLists.mmttestimonialbaseurl,
              //                         )));
              //           },
              //           child: Padding(
              //             padding: const EdgeInsets.only(left: 8, right: 8),
              //             child: Container(
              //               height: SizeConfig.blockSizeVertical * 15,
              //               width: SizeConfig.blockSizeHorizontal * 80,
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(5),
              //                   color: Colors.white),
              //               child: Row(
              //                 children: [
              //                   Padding(
              //                     padding: const EdgeInsets.only(
              //                         top: 5, bottom: 3, left: 8, right: 8),
              //                     child: Container(
              //                       // height: 220,
              //                       width: 100,
              //                       decoration: BoxDecoration(
              //                         //color: Colors.amber,
              //                         borderRadius: BorderRadius.circular(10),
              //                       ),
              //                       child: FadeInImage.assetNetwork(
              //                         placeholder:
              //                             'assets/newImages/placeholder_3.jpg',
              //                         image:
              //                             "${GlobalLists.mmttestimonialbaseurl + GlobalLists.mmttestimoniallist[index].image}",
              //                         fit: BoxFit.cover,
              //                       ),
              //                     ),
              //                   ),
              //                   Expanded(
              //                     child: ListView(
              //                       shrinkWrap: true,
              //                       // crossAxisAlignment:
              //                       //     CrossAxisAlignment.start,
              //                       children: [
              //                         SizedBox(
              //                           height: 12,
              //                         ),
              //                         FormLabel(
              //                           text: GlobalLists
              //                               .mmttestimoniallist[index]
              //                               .testimonialName,
              //                           labelColor: Customcolor.colorPink,
              //                           fontSize: 17,
              //                           maxLines: 1,
              //                           fontweight: FontWeight.w700,
              //                         ),
              //                         SizedBox(
              //                           height: 4,
              //                         ),
              //                         Html(
              //                           data: GlobalLists
              //                               .mmttestimoniallist[index]
              //                               .departmentName,
              //                           style: {
              //                             "body": Style(
              //                                 fontSize: FontSize(13.0),
              //                                 color: Colors.black87,
              //                                 fontWeight: FontWeight.w600),
              //                           },
              //                         ),
              //                         // FormLabel(
              //                         //   text: GlobalLists
              //                         //       .mmttestimoniallist[index]
              //                         //       .departmentName,
              //                         //   labelColor: Colors.black87,
              //                         //   fontSize: 13,
              //                         //   fontweight: FontWeight.w600,
              //                         //   maxLines: 2,
              //                         // ),
              //                         SizedBox(
              //                           height: 7,
              //                         ),
              //                         FormLabel(
              //                           text: GlobalLists
              //                               .mmttestimoniallist[index]
              //                               .shortDescription,
              //                           labelColor: Colors.black54,
              //                           fontSize: 13,
              //                           fontweight: FontWeight.w500,
              //                           maxLines: 4,
              //                         ),
              //                       ],
              //                     ),
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // )
            ),
          ),
        );
        //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //   Row(
        //     children: [
        //       SizedBox(
        //         width: 25,
        //       ),
        //       FormLabel(
        //         text: "Alumini Testimonials",
        //         labelColor: Customcolor.colorPink,
        //         fontSize: 18,
        //         fontweight: FontWeight.w700,
        //         maxLines: 2,
        //       ),
        //       SizedBox(
        //         width: 7,
        //       ),
        //       Image.asset(
        //         'assets/newImages/flowers-3.png',
        //         width: 40,
        //         height: 40,
        //       )
        //     ],
        //   ),
        //   SizedBox(
        //     height: 10,
        //   ),
        //   Padding(
        //     padding: const EdgeInsets.only(left: 8),
        //     child: Container(
        //       height: 160,
        //       child: ListView.builder(
        //         itemCount: GlobalLists.mmttestimoniallist.length,
        //         scrollDirection: Axis.horizontal,
        //         itemBuilder: (BuildContext context, int index) {
        //           return Padding(
        //             padding: const EdgeInsets.only(left: 8, right: 8),
        //             child: Container(
        //               height: SizeConfig.blockSizeVertical * 15,
        //               width: SizeConfig.blockSizeHorizontal * 80,
        //               decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(5),
        //                   color: Colors.white),
        //               child: Row(
        //                 children: [
        //                   Padding(
        //                     padding: const EdgeInsets.only(
        //                         top: 5, bottom: 3, left: 8, right: 8),
        //                     child: Container(
        //                       // height: 220,
        //                       width: 100,
        //                       decoration: BoxDecoration(
        //                         //color: Colors.amber,
        //                         borderRadius: BorderRadius.circular(10),
        //                       ),
        //                       child: FadeInImage.assetNetwork(
        //                         placeholder:
        //                             'assets/newImages/placeholder_3.jpg',
        //                         image:
        //                             "${GlobalLists.mmttestimonialbaseurl + GlobalLists.mmttestimoniallist[index].image}",
        //                         fit: BoxFit.cover,
        //                       ),
        //                     ),
        //                   ),
        //                   Expanded(
        //                     child: ListView(
        //                       shrinkWrap: true,
        //                       // crossAxisAlignment:
        //                       //     CrossAxisAlignment.start,
        //                       children: [
        //                         SizedBox(
        //                           height: 12,
        //                         ),
        //                         FormLabel(
        //                           text: GlobalLists.mmttestimoniallist[index]
        //                               .testimonialName,
        //                           labelColor: Customcolor.colorPink,
        //                           fontSize: 17,
        //                           maxLines: 1,
        //                           fontweight: FontWeight.w700,
        //                         ),
        //                         SizedBox(
        //                           height: 4,
        //                         ),
        //                         FormLabel(
        //                           text: GlobalLists
        //                               .mmttestimoniallist[index].departmentName,
        //                           labelColor: Colors.black87,
        //                           fontSize: 13,
        //                           fontweight: FontWeight.w600,
        //                           maxLines: 2,
        //                         ),
        //                         SizedBox(
        //                           height: 7,
        //                         ),
        //                         FormLabel(
        //                           text: GlobalLists.mmttestimoniallist[index]
        //                               .shortDescription,
        //                           labelColor: Colors.black54,
        //                           fontSize: 13,
        //                           fontweight: FontWeight.w500,
        //                           maxLines: 4,
        //                         ),
        //                       ],
        //                     ),
        //                   )
        //                 ],
        //               ),
        //             ),
        //           );
        //         },
        //       ),
        //     ),
        //   ),
        // ]));
      }
    }
    return listofwiget;
  }

  // List<Widget> listbottomwidget() {
  //   listofbottomwiget.clear();
  //   for (int i = 0; i < typewidetofbottomsection.length; i++) {
  //     if (typewidetofbottomsection[i] == "media") {
  //       listofbottomwiget.add(
  //         Padding(
  //           padding: const EdgeInsets.only(left: 10),
  //           child: CustomHorizontalCard(
  //             index: 1,
  //             cardImage: "assets/newImages/mqdefault.png",
  //             cardTitle: "Merck Foundation In Media  ",
  //             titleColor: Customcolor.pink_col,
  //             btnTitle: "View More",
  //             titleImg: "assets/newImages/flowers-3.png",
  //             list: ListView.builder(
  //               itemCount: GlobalLists.mmtmmedialist.length,
  //               scrollDirection: Axis.horizontal,
  //               itemBuilder: (BuildContext context, int index) {
  //                 return Padding(
  //                   padding: const EdgeInsets.only(right: 8, left: 10),
  //                   child: Stack(
  //                     children: [
  //                       Container(
  //                         width: SizeConfig.blockSizeHorizontal * 86,
  //                         child: FadeInImage.assetNetwork(
  //                           placeholder: 'assets/newImages/placeholder_3.jpg',
  //                           image:
  //                               "${GlobalLists.mmtmmediabaseurl + GlobalLists.mmtmmedialist[index].image}",
  //                           fit: BoxFit.fill,
  //                         ),
  //                       ),
  //                       Align(
  //                         alignment: Alignment.bottomCenter,
  //                         child: Padding(
  //                           padding: const EdgeInsets.only(
  //                               left: 10, right: 10, bottom: 10),
  //                           child: Row(
  //                             crossAxisAlignment: CrossAxisAlignment.end,
  //                             //mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             children: [
  //                               Column(
  //                                 mainAxisAlignment: MainAxisAlignment.end,
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children: [
  //                                   Container(
  //                                     width:
  //                                         SizeConfig.blockSizeHorizontal * 80,
  //                                     child: Text(
  //                                       GlobalLists.mmtmmedialist[index].title,
  //                                       overflow: TextOverflow.ellipsis,
  //                                       style: TextStyle(
  //                                           color: Colors.white,
  //                                           fontSize: 14,
  //                                           fontWeight: FontWeight.w700),
  //                                       maxLines: 3,
  //                                     ),
  //                                   ),
  //                                   SizedBox(
  //                                     height: 8,
  //                                   )
  //                                 ],
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //         ),
  //       );
  //     }
  //     if (typewidetofbottomsection[i] == "testimonial") {
  //       listofbottomwiget.add(
  //           Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //         Row(
  //           children: [
  //             SizedBox(
  //               width: 25,
  //             ),
  //             FormLabel(
  //               text: "Alumini Testimonials",
  //               labelColor: Customcolor.colorPink,
  //               fontSize: 18,
  //               fontweight: FontWeight.w700,
  //               maxLines: 2,
  //             ),
  //             SizedBox(
  //               width: 7,
  //             ),
  //             Image.asset(
  //               'assets/newImages/flowers-3.png',
  //               width: 40,
  //               height: 40,
  //             )
  //           ],
  //         ),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.only(left: 8),
  //           child: Container(
  //             height: 160,
  //             child: ListView.builder(
  //               itemCount: GlobalLists.mmttestimoniallist.length,
  //               scrollDirection: Axis.horizontal,
  //               itemBuilder: (BuildContext context, int index) {
  //                 return GestureDetector(
  //                   onTap: () {
  //                     Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (BuildContext context) =>
  //                                 Testimonialprogramdetailpage(
  //                                   index: index,
  //                                   baseurl: GlobalLists.mmttestimonialbaseurl,
  //                                 )));
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(left: 8, right: 8),
  //                     child: Container(
  //                       height: SizeConfig.blockSizeVertical * 15,
  //                       width: SizeConfig.blockSizeHorizontal * 80,
  //                       decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(5),
  //                           color: Colors.white),
  //                       child: Row(
  //                         children: [
  //                           Padding(
  //                             padding: const EdgeInsets.only(
  //                                 top: 5, bottom: 3, left: 8, right: 8),
  //                             child: Container(
  //                               // height: 220,
  //                               width: 100,
  //                               decoration: BoxDecoration(
  //                                 //color: Colors.amber,
  //                                 borderRadius: BorderRadius.circular(10),
  //                               ),
  //                               child: FadeInImage.assetNetwork(
  //                                 placeholder:
  //                                     'assets/newImages/placeholder_3.jpg',
  //                                 image:
  //                                     "${GlobalLists.mmttestimonialbaseurl + GlobalLists.mmttestimoniallist[index].image}",
  //                                 fit: BoxFit.cover,
  //                               ),
  //                             ),
  //                           ),
  //                           Expanded(
  //                             child: ListView(
  //                               shrinkWrap: true,
  //                               // crossAxisAlignment:
  //                               //     CrossAxisAlignment.start,
  //                               children: [
  //                                 SizedBox(
  //                                   height: 12,
  //                                 ),
  //                                 FormLabel(
  //                                   text: GlobalLists.mmttestimoniallist[index]
  //                                       .testimonialName,
  //                                   labelColor: Customcolor.colorPink,
  //                                   fontSize: 17,
  //                                   maxLines: 1,
  //                                   fontweight: FontWeight.w700,
  //                                 ),
  //                                 SizedBox(
  //                                   height: 4,
  //                                 ),
  //                                 FormLabel(
  //                                   text: GlobalLists.mmttestimoniallist[index]
  //                                       .departmentName,
  //                                   labelColor: Colors.black87,
  //                                   fontSize: 13,
  //                                   fontweight: FontWeight.w600,
  //                                   maxLines: 2,
  //                                 ),
  //                                 SizedBox(
  //                                   height: 7,
  //                                 ),
  //                                 FormLabel(
  //                                   text: GlobalLists.mmttestimoniallist[index]
  //                                       .shortDescription,
  //                                   labelColor: Colors.black54,
  //                                   fontSize: 13,
  //                                   fontweight: FontWeight.w500,
  //                                   maxLines: 4,
  //                                 ),
  //                               ],
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //         ),
  //       ]));
  //     }
  //   }
  //   return listofbottomwiget;
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
                                return ListView(
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: FadeInImage.assetNetwork(
                                        placeholder:
                                            'assets/newImages/placeholder_3.jpg',
                                        image:
                                            GlobalLists.homeCallForAppBaseURL +
                                                product.appImg,
                                        fit: BoxFit.fill,
                                        width: Constantstring.callimagewidth,
                                        height: Constantstring.callimageheight,
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
                                              apiurl: API.digitalcancer,
                                              digitallink: Constantstring
                                                  .sharedigitalcancer,
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

  List<Widget> tablist() {
    setState(() {
      listoftabwiget.clear();
      tabs.clear();

      // digitalLibrary(),
      // merckmorethanmother()
      for (int i = 0; i < typewidetofrightsection.length; i++) {
        // if (typewidetofrightsection[i] == "call_for_app") {
        //   tabs.add(
        //     new Tab(text: "Call for Application"),
        //   );

        //   listoftabwiget.add(
        //     getcallforapp(context),
        //   );
        // }
        // if (typewidetofrightsection[i] == "mmtm") {
        //   tabs.add(
        //     new Tab(text: "Merck More Than A Mother Ambassadors"),
        //   );
        //   listoftabwiget.add(getMMTMS(context));
        // }
        if (typewidetofrightsection[i] == "digital_library" &&
            GlobalLists.homedigitallib.length > 0) {
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



  Future<http.Response?> getmmtmapi() async {
    print("mmtm api");
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      var response = await APIManager.fetchget(
        encoding: APIManager.merckcancerprogramurl,
      );
       print(APIManager.merckcancerprogramurl);
      print("response");
      print(response);
      if (response!.statusCode == 200) {
        var res = json.decode(response.body);
        print("ff");
        print(res);
        merckcancer.MerckcanceraccessResponse homepageres =
            merckcancer.MerckcanceraccessResponse.fromJson(res);
        GlobalLists.sliderurl = homepageres.sliderArea![0].slider!.baseUrl;
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

        print("sliderprogramsection");
        print(slidersection.length);

        Map<String, dynamic> section1 = homepageres.middleArea!;
        List<dynamic> digitallibrary =
            homepageres.rightArea!.the3!.digitalLibrary!.list!;
        GlobalLists.homedigitallib = digitallibrary;
        print(section1);
        print(section1['1']);
        setState(() {
          typewidetofrightsection.add('digital_library');
          _tabController = new TabController(
              vsync: this, length: typewidetofrightsection.length);
          print(typewidetofrightsection);
        });
        // for (int i = 0; i < digitallibrary.length; i++) {
        //   dynamic rightsection = res['Right_area']['${i + 1}'];
        //   print("TKey: ${rightsection.keys.first}");
        //   var rightsectioncategoryname = rightsection.keys.first;

        //   setState(() {
        //     typewidetofrightsection.add(rightsectioncategoryname);

        //     print(typewidetofrightsection);
        //   });
        // }
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
                homepageres.middleArea![middleareakey[i]]!.videos!.list!;
            print(GlobalLists.homevideolist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "content".toLowerCase()) {
            GlobalLists.homecontentlist =
                homepageres.middleArea![middleareakey[i]]!.content!.list!;
            print(GlobalLists.homecontentlist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "media".toLowerCase()) {
            GlobalLists.mmtmmediabaseurl =
                homepageres.middleArea![middleareakey[i]]!.media!.baseUrl;
            GlobalLists.mmtmmedialist =
                homepageres.middleArea![middleareakey[i]]!.media!.list!;
            print(GlobalLists.homegallerylist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "latest_updates".toLowerCase()) {
            //latest update
            GlobalLists.homeceomsgbaseurl =
                homepageres.middleArea![middleareakey[i]]!.latestUpdates!.baseUrl;
            GlobalLists.homeceomsglist =
                homepageres.middleArea![middleareakey[i]]!.latestUpdates!.list!;
            print(GlobalLists.homeceomsglist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "testimonial".toLowerCase()) {
            //latest update
            GlobalLists.mmttestimonialbaseurl =
                homepageres.middleArea![middleareakey[i]]!.testimonial!.baseUrl!;
            GlobalLists.mmttestimoniallist =
                homepageres.middleArea![middleareakey[i]]!.testimonial!.list!;
            print(GlobalLists.homeceomsglist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "awards".toLowerCase()) {
            //latest update
            GlobalLists.merckcancerawardbaseurl =
                homepageres.middleArea![middleareakey[i]]!.awards!.baseUrl;
            GlobalLists.merckcancerawardlist =
                homepageres.middleArea![middleareakey[i]]!.awards!.list!;
            print(GlobalLists.merckcancerawardlist.length);
          }
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

  getawarddetail(String pageurl, String awardid) async {
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

        Navigator.of(_keyLoader.currentContext!).pop();

        if (resp.success == "True") {
          setState(() {
            GlobalLists.awarddetallisting = resp.data!.list!;
            // GlobalLists.awarddetallisting[0].title
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => OurAwardDetail(
            //               detaill: GlobalLists.awarddetallisting,
            //             )));
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => OurAwardDetail(
                          detaill: GlobalLists.awarddetallisting,
                          pageurl: pageurl,
                          awardid: awardid,
                        )));
          });
        } else {
          ShowDialogs.showToast(resp.msg!);
        }
      }, (error) {
        print('ERR msg is $error');
        Navigator.of(_keyLoader.currentContext!).pop();
      }, jsonval: json);
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}
class _CustomWidgetFactory extends WidgetFactory {
  @override
  Widget? buildImage(BuildMetadata meta, Object? provider) {
    final src = meta.element.attributes['src'] ?? "";

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Image.network(
            src,
            width: constraints.maxWidth, // FIX: no infinite width
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image),
          );
        },
      ),
    );
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:merckfoundation22dec/GalleryProgram.dart';
import 'package:merckfoundation22dec/ViewmoremmtmAmbassadar.dart';
import 'package:merckfoundation22dec/WatchDigitalLibrary.dart';
import 'package:merckfoundation22dec/mediascreen.dart/Detailpage.dart';
import 'package:merckfoundation22dec/mediascreen.dart/news.dart';
import 'package:merckfoundation22dec/mediascreen.dart/callforApplication.dart';
import 'package:merckfoundation22dec/model/GalleryProgram.dart';
import 'package:merckfoundation22dec/model/MMTMMainResponse.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/screens/watchmorevideolibray.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/viewMoreMedia.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customHorizontalCard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';

import 'package:merckfoundation22dec/screens/ourPrograms/Testimonailprogramviewmore.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Testimonailprogramdetailpage.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:merckfoundation22dec/widget/slidercontainer.dart';

class OurProgramDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OurProgramsDetailsState();
  }
}

class OurProgramsDetailsState extends State<OurProgramDetails>
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
  bool isbottomSectionLoaded = false;
  List<Widget> listofwiget = [];
  List<Widget> listoftabwiget = [];
  List<Widget> listofbottomwiget = [];
  late DateTime _todaysDate;
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

  final CarouselSliderController _controller = CarouselSliderController();
  // final CarouselController  callAppCarouselController = CarouselController ();
  final CarouselSliderController digitalLibraryCarouselController =
      CarouselSliderController();
  final CarouselSliderController mmtmCarouselController = CarouselSliderController();

  @override
  void initState() {
    print('mother mo');
    // getmmtmslider();
    _todaysDate = DateTime.now();
    GlobalLists.homecallforapp.clear();
    GlobalLists.homemmtm.clear();
    GlobalLists.homedigitallib.clear();
    getmmtmapi();
    super.initState();
    // _tabController = new TabController(vsync: this, length: 3);
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
        title:
            'Merck Foundation "More Than a Mother" Movement', //"Merck Foundation More Than A Mother",
        titleImg: "assets/newImages/our_programsLogo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      // bottomNavigationBar: Bottomcardlink(),
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
                Visibility(
                    visible: isbottomSectionLoaded,
                    replacement: Center(child: CircularProgressIndicator()),
                    child: ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      // scrollDirection: Axis.horizontal,
                      children: listbottomwidget(),
                    )),
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

                followUsformerckmother(),

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
                //  Bottomcardlink(),
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
                      print(
                          'Constantstring.followflicker${Constantstring.followflicker}');
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

  Widget followUsformerckmother() {
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
                'Follow Merck Foundation "More Than a Mother" Movement on',

                ///"Follow Merck Foundation More Than a Mother on",
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
                          Constantstring.followmmtmfacebook,
                          "1438845759757442");
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
                              Constantstring.followmmtmtwitter,
                              Constantstring.followmsg)
                          : ShowDialogs.launchTwitter(
                              Constantstring.followmmtmtwitter);
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
                              Constantstring.followmmtminsta,
                              Constantstring.followmsg)
                          : ShowDialogs.launchInstagram(
                              Constantstring.followmmtminsta,
                              "merckmorethanamother");
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
                      Platform.isAndroid
                          ? ShowDialogs.followuslink(
                              Constantstring.followmmtmyoutube,
                              Constantstring.followmsg)
                          : ShowDialogs.youtubevideolink(
                              Constantstring.followmmtmyoutube);
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
                  // GestureDetector(
                  //   onTap: () async {
                  //     Platform.isAndroid
                  //         ? ShowDialogs.followuslink(
                  //             Constantstring.followflicker,
                  //             Constantstring.followmsg)
                  //         : ShowDialogs.launchURL(Constantstring.followflicker);
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
          child: getcallforapp(context)),
    );
  }

  Widget getcallforapp(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
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
                  GlobalLists.homecallforapp.length <= 0
                      ? Container(
                          child: Center(child: Container()),
                        )
                      : carouselSlider = CarouselSlider(
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
                                 

                                             if(product.pdfFile.contains("pdf"))
                                    {
 ShowDialogs.launchURL(
                                         GlobalLists.homeCallForAppPDFURL +
                                            product.pdfFile);
                                    }else
                                    {
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
                                        apiurl: API.watchcallmmtm,
                                        sharelink:
                                            Constantstring.sharecallforappmmtm,
                                        index: 1,
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
        GlobalLists.homecallforapp.length <= 0
            ? Container()
            : Positioned(
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
                                              apiurl: API.digitalmmtm,
                                              digitallink: Constantstring
                                                  .sharedigitalmmtm,
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
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ViewmoremmtmAmbassadar(
                                              apiurl: API.watchprogrammmtm,
                                              sharelink: Constantstring
                                                  .sharemmtmambassadarmmtm,
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


  goToPrevious() {
    callAppCarouselController.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToNext() {
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
        child: getdigitallib(context));
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
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: CustomHorizontalCard(
              index: 1,
              cardImage: "assets/newImages/ourvison.png",
              cardsubtitle: "Photo ",
              cardTitle: "Gallery  ",
              btnTitle: "View More",
              titleColor: Customcolor.pink_col,
              titleImg: "assets/newImages/flowers-3.png",
              onbtnTap: () {
                // getprogramgallery();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => GalleryProgram(
                              apiurl: API.programgallerymmtm,
                            )));
              },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
              heigthoflist: SizeConfig.blockSizeVertical * 34,
              onbtnTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            WatchmoreVideolibrary(
                              apiurl: API.watchvideommtm,
                              headertitle:
                                  'Merck Foundation "More Than A Mother" Movement Videos',
                              //    "Merck Foundation More Than A Mother Videos",
                              sharelink: Constantstring.sharewatchallvideommtm,
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
                              //         left: 0, right: 10, bottom: 10, top: 5),
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
                              //                     color: Colors.black87,
                              //                     fontSize: 14,
                              //                     fontWeight: FontWeight.w700),
                              //                 maxLines: 3,
                              //               ),
                              //             ),
                              //             SizedBox(
                              //               height: 5,
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
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 9),
                          width: SizeConfig.blockSizeHorizontal * 80,
                          child: Text(
                            GlobalLists.homevideolist[index].videoDesc,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                            maxLines: 3,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
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
              cardTitle: "Updates  ",
              btnTitle: "View More",
              titleColor: Customcolor.pink_col,
              heigthoflist: SizeConfig.blockSizeVertical * 38,
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
                              apiurl: API.watchmorelatestupmmtm,
                            )));
              },
              titleImg: "assets/newImages/flowers-3.png",
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
                    child: Column(
                      // shrinkWrap: true,
                      // physics: ScrollPhysics(),
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8, left: 0),
                          child: Container(
                            width: SizeConfig.blockSizeHorizontal * 86,
                            height: SizeConfig.blockSizeVertical * 27,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/newImages/placeholder_3.jpg',
                              image:
                                  "${GlobalLists.homeceomsgbaseurl + GlobalLists.homeceomsglist[index].image}",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
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
                        SizedBox(
                          height: 8,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      }
    }
    return listofwiget;
  }

  List<Widget> listbottomwidget() {
    listofbottomwiget.clear();
    for (int i = 0; i < typewidetofbottomsection.length; i++) {
      if (typewidetofbottomsection[i] == "media") {
        listofbottomwiget.add(
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: CustomHorizontalCard(
              index: 1,
              cardImage: "assets/newImages/mqdefault.png",
              cardsubtitle: "Merck Foundation In ",
              cardTitle: "Media  ",
              titleColor: Customcolor.pink_col,
              //  heigthoflist: SizeConfig.blockSizeVertical * 35,
              onbtnTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ViewmoreMedia(
                              apiurl: API.watchmediprogrammmtm,
                            )));
              },
              btnTitle: "View More",
              titleImg: "assets/newImages/flowers-3.png",
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
                            height: SizeConfig.blockSizeVertical * 25,
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
                          SizedBox(
                            height: 8,
                          )
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
      if (typewidetofbottomsection[i] == "testimonial") {
        listofbottomwiget.add(Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: CustomHorizontalCard(
            index: 1,
            cardImage: "assets/newImages/mqdefault.png",
            cardsubtitle: "Merck Foundation ",
            cardTitle: "Alumini Testimonials  ",
            titleColor: Customcolor.pink_col,
            heigthoflist: SizeConfig.blockSizeVertical * 40,
            onbtnTap: () {
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
            btnTitle: "View More",
            titleImg: "assets/newImages/flowers-3.png",
            list:
             ListView.builder(
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
                    child: 
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text("${GlobalLists.mmttestimoniallist.length.toString()}"),
                        Container(
                          width: SizeConfig.blockSizeHorizontal * 86,
                          height: SizeConfig.blockSizeVertical * 27,
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/newImages/placeholder_3.jpg',
                            image:
                                "${GlobalLists.mmttestimonialbaseurl + GlobalLists.mmttestimoniallist[index].image}",
                            fit: BoxFit.fill,
                          ),
                        ),
// Text(GlobalLists
//                              .mmttestimoniallist[index].testimonialName),
                            //  Text(GlobalLists
                            //   .mmttestimoniallist[index].departmentName)
                        SizedBox(
                           width: SizeConfig.blockSizeHorizontal * 86,
                          child: Html(
                            data: GlobalLists
                                .mmttestimoniallist[index].testimonialName,
                            style: {
                              "body": Style(
                                  fontSize: FontSize(14.0),
                                  color: Colors.black87,
                          
                                  //textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w500),
                              "tr": Customcolor.tableboderstyle(context),
                            },
                            
                          ),
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        SizedBox(
                           width: SizeConfig.blockSizeHorizontal * 86,
                          child: Html(
                            data: GlobalLists
                                .mmttestimoniallist[index].departmentName,
                            style: {
                              "body": Style(
                                  //  lineHeight: 1.0,
                                  fontSize: FontSize(14.0),
                                  color: Customcolor.colorBlue,
                          
                                  //textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w500),
                              "tr": Customcolor.tableboderstyle(context),
                            },
                                                 
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
           
          ),
        ));
      }
    }
    return listofbottomwiget;
  }

  List<Widget> tablist() {
    print("tablist");
    setState(() {
      listoftabwiget.clear();
      tabs.clear();

      // digitalLibrary(),
      // merckmorethanmother()
      for (int i = 0; i < typewidetofrightsection.length; i++) {
        if (typewidetofrightsection[i] == "call_for_app" &&
            GlobalLists.homecallforapp.length > 0) {
          tabs.add(
            new Tab(
              child: Callforapptext(),
            ),
          );

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
        encoding: APIManager.mmtmprogramurl,
      );
      print("response");
      print(response);
      if (response!.statusCode == 200) {
        var res = json.decode(response.body);
        print("ff");
        print(res);
        MmtmMainResponse homepageres = MmtmMainResponse.fromJson(res);
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

        print("sliderprogramsection");
        print(slidersection.length);

        Map<String, dynamic> section1 = homepageres.middleArea!;
        Map<String, dynamic> lastsection = homepageres.rightArea!;
        Map<String, dynamic> bottomsection = homepageres.bottomArea!;
        print(section1);
        print(section1['1']);
        print(res['middle_area'].keys);
        List<String> middleareakey = [];
        section1.keys.forEach((element) {
          middleareakey.add(element.toString());
        });
        print(middleareakey);
        for (int i = 0; i < section1.length; i++) {
          //  MiddleArea categoryKeys = section1[(i + 1).toString()];

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
              "gallery".toLowerCase()) {
            GlobalLists.homegallerybaseurl =
                homepageres.middleArea![middleareakey[i]]!.gallery!.baseUrl!;
            GlobalLists.homegallerylist =
                homepageres.middleArea![middleareakey[i]]!.gallery!.list!;
            print(GlobalLists.homegallerylist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "latest_updates".toLowerCase()) {
            //latest update
            GlobalLists.homeceomsgbaseurl =
                homepageres.middleArea![middleareakey[i]]!.latestUpdates!.baseUrl!;
            GlobalLists.homeceomsglist =
                homepageres.middleArea![middleareakey[i]]!.latestUpdates!.list!;
            print(GlobalLists.homeceomsglist.length);
          }
        }

        ///////right section
        List<String> rigthareakey = [];
        lastsection.keys.forEach((element) {
          rigthareakey.add(element.toString());
        });
        print(middleareakey);

        for (int i = 0; i < lastsection.length; i++) {
          //  MiddleArea categoryKeys = section1[(i + 1).toString()];
          //  print(categoryKeys.videos.type);
          dynamic rightsection = res['Right_area'][rigthareakey[i]];
          print("TKey: ${rightsection.keys.first}");
          var rightsectioncategoryname = rightsection.keys.first;

          setState(() {
            typewidetofrightsection.add(rightsectioncategoryname);
            _tabController = new TabController(
                vsync: this, length: typewidetofrightsection.length);
            print(typewidetofrightsection);
          });

          if (rightsectioncategoryname.toString().toLowerCase() ==
              "call_for_app".toLowerCase()) {
            for (int j = 0;
                j <
                    homepageres
                        .rightArea![rigthareakey[i]]!.callForApp!.list!.length;
                j++) {
              var enddate = new DateTime.utc(
                  homepageres.rightArea![rigthareakey[i]]!.callForApp!.list![j]
                      .eventEndDate!.year,
                  homepageres.rightArea![rigthareakey[i]]!.callForApp!.list![j]
                      .eventEndDate!.month,
                  homepageres.rightArea![rigthareakey[i]]!.callForApp!.list![j]
                      .eventEndDate!.day);

              if (_todaysDate.isBefore(enddate)) {
                GlobalLists.homecallforapp.add(
                    homepageres.rightArea![rigthareakey[i]]!.callForApp!.list![j]);
                print(GlobalLists.homecallforapp.length);
              }
            }
            // GlobalLists.homecallforapp =
            //     homepageres.rightArea[rigthareakey[i]].callForApp.list;
            GlobalLists.homeCallForAppBaseURL =
                homepageres.rightArea![rigthareakey[i]]!.callForApp!.baseUrl;
                   GlobalLists.homeCallForAppPDFURL =
                homepageres.rightArea![rigthareakey[i]]!.callForApp!.pdfUrl;
            print(GlobalLists.homecallforapp.length);
          }
          if (rightsectioncategoryname.toString().toLowerCase() ==
              "mmtm".toLowerCase()) {
            GlobalLists.homemmtm =
                homepageres.rightArea![rigthareakey[i]]!.mmtm!.list!;
            print(GlobalLists.homemmtm.length);
            GlobalLists.homeMMTMBaseURL =
                homepageres.rightArea![rigthareakey[i]]!.mmtm!.baseUrl;
          }
          if (rightsectioncategoryname.toString().toLowerCase() ==
              "digital_library".toLowerCase()) {
            GlobalLists.homedigitallib =
                homepageres.rightArea![rigthareakey[i]]!.digitalLibrary!.list!;
            GlobalLists.homeDigitalLibraryBaseURL =
                homepageres.rightArea![rigthareakey[i]]!.digitalLibrary!.baseUrl!;
                 GlobalLists.homeDigitalLibraryPdfURL =
                homepageres.rightArea![rigthareakey[i]]!.digitalLibrary!.pdfUrl;
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

          setState(() {
            typewidetofbottomsection.add(bottomectioncategoryname);

            print(typewidetofbottomsection);
          });

          if (bottomectioncategoryname.toString().toLowerCase() ==
              "media".toLowerCase()) {
            GlobalLists.mmtmmediabaseurl =
                homepageres.bottomArea![bottomareakey[i]]!.media!.baseUrl;
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
          isbottomSectionLoaded = true;
        });

        return response;
      } else {
        _tabController = new TabController(vsync: this, length: 0);
        isMiddleSectionLoaded = true;
        isbottomSectionLoaded = true;
        isrightSectionLoaded = true;
        ShowDialogs.showToast(GlobalLists.serverresp);
      }
    } else {
      _tabController = new TabController(vsync: this, length: 0);
      isMiddleSectionLoaded = true;
      isbottomSectionLoaded = true;
      isrightSectionLoaded = true;
      ShowDialogs.showToast("Please check internet connection");
    }
  }

 
  getprogramgallery() async {
    var status1 = await ConnectionDetector.checkInternetConnection();
    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(context, API.programgallerymmtm,
          (response) async {
        GalleryProgramResponse resp = response;

        print(response);
        print('Resp : $resp');
        Navigator.of(_keyLoader.currentContext!).pop();
        if (resp.success == "True".toLowerCase()) {
          print(resp.list);
          GlobalLists.programgallerybaseurl = resp.baseUrl!;
          GlobalLists.programgallerylist = resp.list!;
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


import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:merckfoundation22dec/model/MMTMSlider.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/customHorizontalCard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/model/mmtmContentResponse.dart';
import 'package:merckfoundation22dec/model/merckothervideo.dart';
import 'package:merckfoundation22dec/model/MMTMlatestupdateResponse.dart';
import 'package:merckfoundation22dec/model/mmtminmediaResponse.dart';

import 'package:flutter_html/flutter_html.dart';

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
  List _productsAvailable = [
    "assets/images/slider1.jpg",
    "assets/images/slider2.jpg",
    "assets/images/slider1.jpg",
    "assets/images/slider2.jpg"
  ];

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

  final List<Tab> tabs = <Tab>[
    new Tab(text: "Call for Application"),
    new Tab(text: "Digital Library"),
    new Tab(text: "Merck More Than A Mother Ambassadors")
  ];

  TabController _tabController;

  @override
  void initState() {
    getmmtmslider();
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
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
          // Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Dashboard(
                        index: 1,
                      )));
        },
        index: 2,
        title: "Our Programs",
        titleImg: "assets/newImages/our_programsLogo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          // shrinkWrap: true,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: GlobalLists.mmtmsliderlist.length <= 0
                  ? Container(
                      child: Center(child: Text(Constantstring.emptyData)),
                    )
                  : slider(context),
            ),
            SizedBox(
              height: 9,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  GlobalLists.mmtmcontentlist.length <= 0
                      ? Container(
                          child: Center(child: Text(Constantstring.emptyData)),
                        )
                      : Html(
                          data:
                              """${GlobalLists.mmtmcontentlist[0].pageContent} """,
                          onLinkTap: (url) {
                            print("Opening $url...");
                          },
                        ),
                  SizedBox(
                    height: 20,
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
                          child: TabBarView(
                              controller: _tabController,
                              children: [
                                callforApplication(),
                                digitalLibrary(),
                                merckmorethanmother()
                              ]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GlobalLists.mmtmvideoseclist.length <= 0
                      ? Container(
                          child: Center(child: Text(Constantstring.emptyData)),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CustomHorizontalCard(
                            index: 1,
                            cardImage: "assets/newImages/gallery.png",
                            cardTitle: "Our Videos  ",
                            titleColor: Customcolor.pink_col,
                            titleImg: "assets/newImages/flowers-3.png",
                            list: ListView.builder(
                              itemCount: GlobalLists.mmtmvideoseclist.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(right: 8, left: 10),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 86,
                                        child: FadeInImage.assetNetwork(
                                          placeholder:
                                              'assets/newImages/placeholder_3.jpg',
                                          image:
                                              "https://img.youtube.com/vi/${GlobalLists.mmtmvideoseclist[index].videoLink.substring(GlobalLists.mmtmvideoseclist[index].videoLink.length - 11)}/mqdefault.jpg",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10, bottom: 10),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: SizeConfig
                                                            .blockSizeHorizontal *
                                                        80,
                                                    child: Text(
                                                      GlobalLists
                                                          .mmtmvideoseclist[
                                                              index]
                                                          .videoDesc,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700),
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
                                );
                              },
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  GlobalLists.mmtmlatestupdatelist.length <= 0
                      ? Container(
                          child: Center(child: Text(Constantstring.emptyData)),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CustomHorizontalCard(
                            index: 1,
                            cardImage: "assets/newImages/ourvison.png",
                            cardTitle: "Latest Updates  ",
                            titleColor: Customcolor.pink_col,
                            titleImg: "assets/newImages/flowers-3.png",
                            list: ListView.builder(
                              itemCount:
                                  GlobalLists.mmtmlatestupdatelist.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(right: 8, left: 10),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 86,
                                        child: FadeInImage.assetNetwork(
                                          placeholder:
                                              'assets/newImages/placeholder_3.jpg',
                                          image:
                                              "${Constantstring.baseUrl + GlobalLists.mmtmlatestupdatelist[index].image}",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10, bottom: 10),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: SizeConfig
                                                            .blockSizeHorizontal *
                                                        80,
                                                    child: Text(
                                                      GlobalLists
                                                          .mmtmlatestupdatelist[
                                                              index]
                                                          .title,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700),
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
                                );
                              },
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  GlobalLists.mmtminmediaresp.length <= 0
                      ? Container(
                          child: Center(child: Text(Constantstring.emptyData)),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CustomHorizontalCard(
                            index: 1,
                            cardImage: "assets/newImages/mqdefault.png",
                            cardTitle: "Merck Foundation In Media  ",
                            titleColor: Customcolor.pink_col,
                            titleImg: "assets/newImages/flowers-3.png",
                            list: ListView.builder(
                              itemCount: GlobalLists.mmtminmediaresp.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(right: 8, left: 10),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 86,
                                        child: FadeInImage.assetNetwork(
                                          placeholder:
                                              'assets/newImages/placeholder_3.jpg',
                                          image:
                                              "${Constantstring.baseUrl + GlobalLists.mmtminmediaresp[index].image}",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10, bottom: 10),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: SizeConfig
                                                            .blockSizeHorizontal *
                                                        80,
                                                    child: Text(
                                                      GlobalLists
                                                          .mmtminmediaresp[
                                                              index]
                                                          .title,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700),
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
                                );
                              },
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          FormLabel(
                            text: "Alumini Testimonials",
                            labelColor: Customcolor.colorPink,
                            fontSize: 18,
                            fontweight: FontWeight.w700,
                            maxLines: 2,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Image.asset(
                            'assets/newImages/flowers-3.png',
                            width: 40,
                            height: 40,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Container(
                          height: 140,
                          child: ListView.builder(
                            itemCount: _imgarray.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
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
                                            top: 5,
                                            bottom: 3,
                                            left: 8,
                                            right: 8),
                                        child: Container(
                                          // height: 220,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            //color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                  _imgarray[index],
                                                )),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 12,
                                            ),
                                            FormLabel(
                                              text: "Dr.Nihad Salifu",
                                              labelColor: Customcolor.colorPink,
                                              fontSize: 17,
                                              fontweight: FontWeight.w700,
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            FormLabel(
                                              text:
                                                  "Paediatric Medical Oncology Fellow",
                                              labelColor: Colors.black87,
                                              fontSize: 13,
                                              fontweight: FontWeight.w600,
                                              maxLines: 2,
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            FormLabel(
                                              text:
                                                  "We believe that empowering women through education is an important factor in promoting the economic well-being of Africans.",
                                              labelColor: Colors.black54,
                                              fontSize: 13,
                                              fontweight: FontWeight.w500,
                                              maxLines: 5,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Center(
                        child: Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              "Read All",
                              style: TextStyle(
                                  color: Customcolor.colorBlue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
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
          ],
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
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              child: carouselSlider = CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  height: 200,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: GlobalLists.mmtmsliderlist.map((product) {
                  return new Builder(
                    builder: (BuildContext context) {
                      return new Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: SizeConfig.blockSizeHorizontal * 100,
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/newImages/placeholder_3.jpg',
                          image: Constantstring.baseUrl + product.image,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            new DotsIndicator(
              dotsCount: GlobalLists.mmtmsliderlist.length,
              position: double.parse("$_current"),
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeColor: Customcolor.colorPink,
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  getmmtmslider() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.merckmotherSlider,
        (response) async {
          MmtmSliderResponse resp = response;
          print(response);
          print('Resp : $resp');

          // Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.mmtmsliderlist = resp.data.list;
              Constantstring.baseUrl = resp.baseUrl;
              getmmtmcontent();
            });
          } else {
            ShowDialogs.showToast(resp.msg);
            Navigator.of(_keyLoader.currentContext).pop();
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

  getmmtmcontent() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      APIManager().apiRequest(
        context,
        API.merckmotherContent,
        (response) async {
          MmtmContentResponce resp = response;
          print(response);
          print('Resp : $resp');

          if (resp.success == "True") {
            setState(() {
              GlobalLists.mmtmcontentlist = resp.data.list;
              getVideosection();
            });
          } else {
            ShowDialogs.showToast(resp.msg);
            Navigator.of(_keyLoader.currentContext).pop();
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

  getVideosection() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      //  ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.merckmotherVideos,
        (response) async {
          MerckMotherVideosResponce resp = response;
          print(response);
          print('Resp : $resp');

          if (resp.success == "True") {
            setState(() {
              GlobalLists.mmtmvideoseclist = resp.data.list;
              getlatestupdate();
            });
          } else {
            ShowDialogs.showToast(resp.msg);

            Navigator.of(_keyLoader.currentContext).pop();
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

  getlatestupdate() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      //  ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.merckmotherLatestUpdates,
        (response) async {
          MmtMlatestupdateResponse resp = response;
          print(response);
          print('Resp : $resp');

          if (resp.success == "True") {
            setState(() {
              GlobalLists.mmtmlatestupdatelist = resp.data.list;
              Constantstring.baseUrl = resp.baseUrl;
              getmmtminmedia();
            });
          } else {
            ShowDialogs.showToast(resp.msg);
            Navigator.of(_keyLoader.currentContext).pop();
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

  getmmtminmedia() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      //  ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.merckmotherMedia,
        (response) async {
          MmtMinmediaResponse resp = response;
          print(response);
          print('Resp : $resp');

          Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.mmtminmediaresp = resp.data.list;
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

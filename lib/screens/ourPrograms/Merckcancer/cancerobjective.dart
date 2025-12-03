import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';

import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/model/CancerobjectiveResponse.dart'
    as cancer;
import 'package:http/http.dart' as http;
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'dart:convert';

import 'package:merckfoundation22dec/widget/slidercontainer.dart';

class CancerobjectiveDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CancerobjectiveDetailsState();
  }
}

class CancerobjectiveDetailsState extends State<CancerobjectiveDetails>
    with TickerProviderStateMixin {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  bool isMiddleSectionLoaded = false;
  int _current = 0;
  int _current1 = 0;
  List<Widget> listofwiget = [];
  List typewidetofrightsection = [];
  List<Widget> listoftabwiget = [];
  late CarouselSlider carouselSlider;

  final List<Tab> tabs = <Tab>[];
  TabController? _tabController;

  bool isrightSectionLoaded = false;
  List typewidet = [];
  bool expandClick = false;
  String expandedName = "Upcoming Events";

  final CarouselSliderController callAppCarouselController = CarouselSliderController();

  final CarouselController _controller = CarouselController();
  @override
  void initState() {
    getmmtmapi();
    // _tabController = new TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: InnerCustomAppBar(
        onTapval: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (BuildContext context) => Dashboard(
          //               index: 1,
          //             )));
          Navigator.pop(context);
        },
        index: 2,
        sharelink: Constantstring.cancerobjective,
        title: "Objective",
        titleImg: "assets/newImages/our_programsLogo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      //  bottomNavigationBar: Bottomcardlink(),
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: ListView(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    // Visibility(
                    //   visible: isrightSectionLoaded,
                    //   replacement: Column(
                    //     children: [
                    //       SizedBox(
                    //         height: 20,
                    //       ),
                    //       CircularProgressIndicator()
                    //     ],
                    //   ),
                    //   child: Container(
                    //     height: 450,
                    //     //color: Colors.amber,
                    //     child: Column(
                    //       children: [
                    //         TabBar(
                    //           isScrollable: true,
                    //           unselectedLabelColor: Colors.grey,
                    //           labelColor: Colors.black,
                    //           indicatorSize: TabBarIndicatorSize.tab,
                    //           indicator: new BubbleTabIndicator(
                    //             indicatorHeight: 35.0,
                    //             indicatorRadius: 5,
                    //             indicatorColor: Customcolor.pinkbg.withOpacity(0.4),
                    //             tabBarIndicatorSize: TabBarIndicatorSize.tab,
                    //           ),
                    //           tabs: tabs,
                    //           controller: _tabController,
                    //         ),
                    //         // Expanded(
                    //         //   flex: 3,
                    //         //   child: TabBarView(
                    //         //       physics: ScrollPhysics(),
                    //         //       controller: _tabController,
                    //         //       children: tablist()),
                    //         // ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 0, left: 0),
              //   child:
              //       Align(alignment: Alignment.bottomCenter, child: Bottomcardlink()

              //           // Image.asset(
              //           //   "assets/newImages/flowers_footer.png",
              //           //   height: 170,
              //           // ),
              //           ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(right: 0, left: 0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      "assets/newImages/flowers_footer.png",
                      height: 170,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 40,
              ),

              //  Align(
              //    alignment: Alignment.bottomCenter,
              //    child: Bottomcardlink())
            ],
          ),
          Align(alignment: Alignment.bottomCenter, child: Bottomcardlink())
        ],
      ),
      
    );
  }

  Future<http.Response?> getmmtmapi() async {
    print("mmtm api");
    print("cancerobjective");
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      var response = await APIManager.fetchget(
        encoding: APIManager.subprocancerobjtive,
      );
      print("response");
      print(response);
      if (response!.statusCode == 200) {
        var res = json.decode(response.body);
        print("ff");
        print(res);
        cancer.CancerobjectiveResponse homepageres =
            cancer.CancerobjectiveResponse.fromJson(res);
        print(homepageres);
        List<dynamic> section1 = homepageres.middleArea.the1.content.list;
        // Map<String, dynamic> lastsection = homepageres.rightArea;

        dynamic contentsection = homepageres.middleArea.the1.content.list;

        //  var middlecontentname1 = contentsection;
        // print(homepageres.middleArea.the1);
        // var middlecontentname = homepageres.middleArea.the1;

        // //print(middlecontentname1);
        setState(() {
          typewidet.add('content');

          print(typewidet);
        });
        GlobalLists.homecontentlist = homepageres.middleArea.the1.content.list;
       
        setState(() {
          isMiddleSectionLoaded = true;
          //  isrightSectionLoaded = true;
        });

        return response;
      } else {
        _tabController = new TabController(vsync: this, length: 0);
        setState(() {
          isMiddleSectionLoaded = true;

          //  isrightSectionLoaded = true;
        });
        ShowDialogs.showToast(GlobalLists.serverresp);
      }
    } else {
      _tabController = new TabController(vsync: this, length: 0);
      setState(() {
        isMiddleSectionLoaded = true;

        // isrightSectionLoaded = true;
      });

      ShowDialogs.showToast("Please check internet connection");
    }
  }

  List<Widget> tablist() {
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
          tabs.add(new Tab(
            child: Merckmtmtext(),
          ));
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

  Widget digitalLibraryLastSection() {
    return getdigitallib(context);
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
                  height: 400,
                  color: Colors.white,
                  child: carouselSlider = CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: false,
                        aspectRatio: 1,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        viewportFraction: 1.0,
                        //  height: SizeConfig.blockSizeVertical * 100,
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
                            //  crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  padding: EdgeInsets.only(top: 20),
                                  width: 240,
                                  height: 290,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: FadeInImage.assetNetwork(
                                    placeholder:
                                        'assets/newImages/placeholder_3.jpg',
                                    image: GlobalLists.homeMMTMBaseURL +
                                        product.photo,
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ),
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
                    carouselController: callAppCarouselController,
                  ),
                ),
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
                      goToPrevious();
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
                      goToNext();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 40),
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
  //                  // height: 470,
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

  goTocallPrevious() {
    callAppCarouselController.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goTocallNext() {
    callAppCarouselController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
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
                  height: 400,
                  color: Colors.white,
                  child: carouselSlider = CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: false,
                        aspectRatio: 1,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        viewportFraction: 1.0,
                        //  height: SizeConfig.blockSizeVertical * 100,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current1 = index;
                          });
                        }),
                    items: GlobalLists.homedigitallib.map((product) {
                      print(GlobalLists.homeDigitalLibraryBaseURL +
                          product.image);
                      return new Builder(
                        builder: (BuildContext context) {
                          return ListView(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            //  crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  padding: EdgeInsets.only(top: 20),
                                  width: 240,
                                  height: 290,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: FadeInImage.assetNetwork(
                                    placeholder:
                                        'assets/newImages/placeholder_3.jpg',
                                    image:
                                        GlobalLists.homeDigitalLibraryBaseURL +
                                            product.image,
                                    fit: BoxFit.fitHeight,
                                    height: 200,
                                  ),
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
                ),
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
                      goToPrevious();
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
                      goToNext();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 40),
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

  // goToPrevious() {
  //   _controller.previousPage(
  //       duration: Duration(milliseconds: 300), curve: Curves.ease);
  // }

  // goToNext() {
  //   _controller.nextPage(
  //       duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  // }
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



  List<Widget> list() {
    print("list");
    listofwiget.clear();
    for (int i = 0; i < typewidet.length; i++) {
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
    }
    return listofwiget;
  }
}

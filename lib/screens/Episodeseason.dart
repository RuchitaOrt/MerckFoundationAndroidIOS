import 'dart:convert';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:merckfoundation22dec/GalleryProgram.dart';
import 'package:merckfoundation22dec/model/GalleryProgram.dart';
import 'package:merckfoundation22dec/model/GetSeasonEpisodeResponse.dart';
import 'package:merckfoundation22dec/model/cncersubprogramcommunityawareness.dart';
import 'package:merckfoundation22dec/screens/EpisodeInformation.dart';
import 'package:merckfoundation22dec/screens/watchmorevideoepisode.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/customHorizontalCardepiside.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';

import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/utility/ResponsiveFlutter.dart';
import 'package:screenshot/screenshot.dart';
// import 'package:social_share_plugin/social_share_plugin.dart';

import 'package:url_launcher/url_launcher.dart';

class Merckepisodeseason extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MerckepisodeseasonState();
  }
}

class MerckepisodeseasonState extends State<Merckepisodeseason>
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
  // bool isrightSectionLoaded = false;
  bool isbottomSectionLoaded = false;
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
  final CarouselController callAppCarouselController = CarouselController();
   TabController? _tabController;

  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    // getmmtmslider();
    getseasonepisode();
    super.initState();
    //   _tabController = new TabController(vsync: this, length: 3);
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
          Navigator.pop(context);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (BuildContext context) => Dashboard(
          //               index: 1,
          //             )));
        },
        index: 2,
        sharelink: Constantstring.cancercommunityawareness,
        title:
            'Merck Foundation Presents \n"Our Africa by Merck Foundation" (TV Program)',
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
                //         ListView.builder(
                // shrinkWrap: true,
                // physics: ScrollPhysics(),
                // // physics:
                // //     AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                // scrollDirection: Axis.vertical,
                // itemCount: GlobalLists.seasonlistwithepisode.length,
                // itemBuilder: (context, index1) {
                //   return
                ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    // physics:
                    //     AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                    scrollDirection: Axis.vertical,
                    itemCount: GlobalLists.seasonlistwithepisode.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: CustomHorizontalCardEpisode(
                          index: 1,
                          cardImage: "assets/newImages/gallery.png",
                          cardsubtitle: GlobalLists.seasonlistwithepisode[index]
                              .list![0]['season_name'],
                          cardTitle: "",
                          btnTitle: "Watch More",
                          heigthoflist: SizeConfig.blockSizeVertical * 30,
                          onbtnTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        WatchmoreVideoEpisode(
                                          apiurl: API.getepisode_season_gallery,
                                          season: GlobalLists
                                              .seasonlistwithepisode[index]
                                              .list![0]['url'],
                                          title: GlobalLists
                                              .seasonlistwithepisode[index]
                                              .list![0]['season_name'],
                                        )));
                          },
                          titleColor: Customcolor.pink_col,
                          titleImg: "assets/newImages/flowers-3.png",
                          list: ListView.builder(
                            itemCount: GlobalLists
                                .seasonlistwithepisode[index].list!.length,
                            //GlobalLists.homevideolist.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index2) {
                              //      return Container();
                              return Container(
                                width: SizeConfig.blockSizeHorizontal * 70,
                                child: GestureDetector(
                                  onTap: () {
                                    var storykey = GlobalLists
                                        .seasonlistwithepisode[index]
                                        .list![index2]['video_link']!
                                        .substring(GlobalLists
                                                .seasonlistwithepisode[index]
                                                .list![index2]['video_link']!
                                                .length -
                                            11);
                                    ShowDialogs.youtubevideolink(
                                        "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8, left: 10),
                                        child: Stack(
                                          children: [
                                            Container(
                                              height:
                                                  SizeConfig.blockSizeVertical *
                                                      20,
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  80, //86,
                                              child: FadeInImage.assetNetwork(
                                                placeholder:
                                                    'assets/newImages/placeholder_3.jpg',
                                                image:
                                                    "https://img.youtube.com/vi/${GlobalLists.seasonlistwithepisode[index].list![index2]['video_link']!.substring(GlobalLists.seasonlistwithepisode[index].list![index2]['video_link']!.length - 11)}/mqdefault.jpg",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 20, top: 70),
                                                child: Center(
                                                    child: Image.asset(
                                                        "assets/newImages/pause.png")),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8, left: 10, top: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  49,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 7),
                                                child: Text(
                                                  GlobalLists
                                                          .seasonlistwithepisode[
                                                              index]
                                                          .list![index2]
                                                      ['episode_name']!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 3,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  // fontSize: 17,
                                                  // labelColor: Colors.white,
                                                  // fontweight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  EpisodeInformation(
                                                                    episodeid: GlobalLists
                                                                        .seasonlistwithepisode[
                                                                            index]
                                                                        .list![index2]['id'],
                                                                  )));
                                                      //  showDialog(

                                                      //             context: context,
                                                      //             builder: (BuildContext context) {
                                                      //                 return AlertDialog(
                                                      //                   contentPadding: EdgeInsets.all(0),
                                                      //                   title: Container(child: Row(
                                                      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      //                     children: [
                                                      //                       Padding(
                                                      //                         padding: const EdgeInsets.all(0),
                                                      //                         child: Text('Episode Information',style: TextStyle(color:Customcolor.colorBlue,fontSize: 20),),
                                                      //                       ),
                                                      //                        GestureDetector(
                                                      //                          onTap: ()
                                                      //                          {
                                                      //                            Navigator.pop(context);
                                                      //                          }
                                                      //                          ,
                                                      //                          child: Icon(Icons.close)),
                                                      //                     ],
                                                      //                   ),),
                                                      //                   content: ShowDialogs.setupAlertDialoadContainer(context),
                                                      //                 );
                                                      //             }
                                                      //         );
                                                    },
                                                    child: Icon(
                                                      Icons.info_rounded,
                                                      color:
                                                          Customcolor.colorBlue,
                                                    )),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                GestureDetector(
                                                    onTap: () {
                                                      ScreenshotController
                                                          screenshotController =
                                                          ScreenshotController();
                                                      double imgHeight = 50;
                                                      var sharelink = GlobalLists
                                                              .seasonlistwithepisode[
                                                                  index]
                                                              .list![index2]
                                                          ['video_link'];
                                                      showModalBottomSheet<
                                                          void>(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.vertical(
                                                                  top: Radius
                                                                      .circular(
                                                                          24.0)),
                                                        ),
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return Screenshot(
                                                            controller:
                                                                screenshotController,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top: 10,
                                                                        bottom:
                                                                            10),
                                                                    child:
                                                                        FormLabel(
                                                                      text:
                                                                          "Share",
                                                                      labelColor:
                                                                          Customcolor
                                                                              .pink_col,
                                                                      fontSize: ResponsiveFlutter.of(
                                                                              context)
                                                                          .fontSize(
                                                                              2.5),
                                                                      fontweight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top: 10,
                                                                        bottom:
                                                                            10),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        //
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () async {
                                                                            print("on tap fb");
                                                                            // await SocialSharePlugin.shareToFeedFacebookLink(
                                                                            //   quote: "",
                                                                            //   url: sharelink,
                                                                            //   onSuccess: (_) {
                                                                            //     print('FACEBOOK SUCCESS');
                                                                            //     return;
                                                                            //   },
                                                                            //   onCancel: () {
                                                                            //     print('FACEBOOK CANCELLED');
                                                                            //     return;
                                                                            //   },
                                                                            //   onError: (error) {
                                                                            //     print('FACEBOOK ERROR $error');
                                                                            //     return;
                                                                            //   },
                                                                            // );
                                                                            //changes6june
                                                                            ShowDialogs.shareToFacebook(sharelink!);
                              //                                                 ShowDialogs.launchFacebook(
                              //  sharelink,
                              //   "550280998481446");
                                                                          },
                                                                          child:
                                                                              Image.asset(
                                                                            "assets/newImages/facebooknew.png",
                                                                            height:
                                                                                imgHeight,
                                                                            width:
                                                                                imgHeight,
                                                                          ),
                                                                        ),

                                                                        SizedBox(
                                                                          width:
                                                                              7,
                                                                        ),
                                                                        GestureDetector(
                                                                          onTap:
                                                                              ()  {
                                                                                 ShowDialogs.shareToTwitter("Merck Foundation",sharelink!);
                              //                                                   ShowDialogs.launchTwitter(
                              // sharelink);
                                                                            // await SocialSharePlugin.shareToTwitterLink(
                                                                            //     text: "",
                                                                            //     url: sharelink,
                                                                            //     onSuccess: (_) {
                                                                            //       print('TWITTER SUCCESS');
                                                                            //       return;
                                                                            //     },
                                                                            //     onCancel: () {
                                                                            //       print('TWITTER CANCELLED');
                                                                            //       return;
                                                                            //     });
                                                                          },
                                                                          child:
                                                                              Image.asset(
                                                                            "assets/newImages/twitternew.png",
                                                                            height:
                                                                                imgHeight,
                                                                            width:
                                                                                imgHeight,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              7,
                                                                        ),
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () async {
                                                                            ShowDialogs.launchLinkdin(sharelink!);
                                                                          },
                                                                          child:
                                                                              Image.asset(
                                                                            "assets/newImages/linkedinnew.png",
                                                                            height:
                                                                                imgHeight,
                                                                            width:
                                                                                imgHeight,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              7,
                                                                        ),
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            ShowDialogs.launchWhatsappshare(sharelink!);

                                                                            // :
                                                                            //  SocialShare
                                                                            //     .shareWhatsapp(
                                                                            //     sharelink,
                                                                            //   ).then((data) {
                                                                            //     print(data);
                                                                            //   });
                                                                          },
                                                                          child:
                                                                              Image.asset(
                                                                            "assets/newImages/whatsappnew.png",
                                                                            height:
                                                                                imgHeight,
                                                                            width:
                                                                                imgHeight,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).whenComplete(() {});
                                                    },
                                                    child: Image.asset(
                                                      "assets/newImages/share.png",
                                                      width: 20,
                                                      height: 20,
                                                    )),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }),

                //}
                //),
                //

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
                // Bottomcardlink()
              ])),
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

  getseasonepisode() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      //  ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.get_season_episodes,
        (response) async {
          GetSeasonEpisodeResponse resp = response;
          print(response);
          print('Resp : $resp');
          setState(() {
            GlobalLists.seasonlistwithepisode.clear();
          });

          if (resp.success == "True") {
            setState(() {
              GlobalLists.seasonlistwithepisode = resp.data!.seasons!;
              print("Length of seasonn");
              print(GlobalLists.seasonlistwithepisode.length);
            });
          } else {
            ShowDialogs.showToast(resp.msg!);
          }
        },
        (error) {
          print('ERR msg is $error');
          //  Navigator.of(_keyLoader.currentContext).pop();
        },
      );
    } else {
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

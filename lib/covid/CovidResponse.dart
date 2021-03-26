import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/covid/childrenyouth.dart';
import 'package:merckfoundation22dec/covid/communitysupport.dart';
import 'package:merckfoundation22dec/covid/communitymedia.dart';
import 'package:merckfoundation22dec/covid/Healthcare.dart';
import 'package:merckfoundation22dec/mediascreen.dart/Detailpage.dart';
import 'package:merckfoundation22dec/model/newsLettersArticlesResp.dart';
import 'package:merckfoundation22dec/model/videoLibraryResponse.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/screens/watchmorevideolibray.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/customHorizontalCard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:screenshot/screenshot.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/mediascreen.dart/news.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flip_card/flip_card.dart';
import 'package:url_launcher/url_launcher.dart';

class Description {
  final String title;
  final String detail;

  Description({this.title, this.detail});
}

class Video {
  final String videoLink;
  final String videoDesc;

  Video({this.videoLink, this.videoDesc});
}

class Newsletter {
  final String imge;
  final String title;

  Newsletter({this.imge, this.title});
}

class CovidResponse extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CovidResponseState();
  }
}

class CovidResponseState extends State<CovidResponse>
    with TickerProviderStateMixin {
  AnimationController _controller;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  double imgHeight = 50;
  String _platformVersion = 'Unknown';
  List<Newsletter> newslist = [
    Newsletter(
        imge:
            "http://merckfoundation.org/mfindia/web/public/img/covid-news1.png",
        title:
            "Merck Foundation announce ‘Stay at Home’ Media Recognition Awards…"),
    Newsletter(
        imge:
            "http://merckfoundation.org/mfindia/web/public/img/covid-news2.png",
        title:
            "Message from Dr. Rasha Kelej on Community donations provided in…"),
    Newsletter(
        imge:
            "http://merckfoundation.org/mfindia/web/public/img/covid-news3.png",
        title:
            "Merck Foundation announce ‘Stay at Home’ Media Recognition Awards for…")
  ];
  List<Description> list = [
    Description(
        title: "Community Support:",
        detail:
            "Merck Foundation partners with African First Ladies to support livelihood of thousands of women and casual workers affected by Coronavirus lockdown."),
    Description(
        title: "Healthcare Capacity Building:",
        detail:
            "Merck Foundation started Coronavirus healthcare capacity building by providing online one-year diplomas and two-yea master’s degree in Respiratory Medicines and Acute Medicines for African Doctors"),
    Description(
        title: "Community Awareness through media Awards:",
        detail:
            "Merck Foundation announced, ‘Stay at Home’ Media Recognition Awards in Africa, Middle East, Asia & Latin America to raise awareness about Coronavirus."),
    Description(
        title: "Community awareness for Children and Youth:",
        detail:
            "Merck Foundation launched an inspiring storybook ‘Making the Right Choice’ in partnership with African First Ladies to sensitize children and youth about Coronavirus"),
  ];
  GlobalKey<FlipCardState> media = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> youth = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> communitysupport = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> health = GlobalKey<FlipCardState>();
  List videolist = [
    Video(
        videoLink: "https://www.youtube.com/embed/SvErYCf4Bz0",
        videoDesc: "Merck Foundation First Ladies Initiative - VC Summit 2020"),
    Video(
        videoLink: "https://www.youtube.com/embed/xEY_PFyAHoY",
        videoDesc:
            "President of Liberia, H. E. MR. GEORGE WEAH created song to raise awareness about Corona virus"),
    Video(
        videoLink: "https://www.youtube.com/embed/cUqvKZqJBik",
        videoDesc:
            "Merck Foundation in partnership with First Lady of Niger donate solidarity food kits in Niger"),
    Video(
        videoLink: "https://www.youtube.com/embed/Xp77FvNMvkk",
        videoDesc:
            "Corona awareness video by the First Lady of Liberia, H. E. CLAIRE WEAH"),
    Video(
        videoLink: "https://www.youtube.com/embed/tBcxh-w8sXQ",
        videoDesc:
            "H.E. MRS. FATOMATTOU BAH-BARROW raise awareness about Coronavirus prevention."),
    Video(
        videoLink: "https://www.youtube.com/embed/QcRCwEgDF5c",
        videoDesc:
            "“My White Army” Rasha Kelej ,11 Singers,11 Countries to support Coronavirus medical staff in Africa.")
  ];
  @override
  void initState() {
    super.initState();
    // getvideolibray();
    // getnewsletter();
    initPlatformState();

    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  Future<void> initPlatformState() async {
    String platformVersion;

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Customcolor.background,
        appBar: InnerCustomAppBar(
          onTapvalfilter: () {},
          onTapval: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Dashboard(
                          index: 0,
                        )));
          },
          index: 2,
          title: "COVID Response",
          titleImg: "assets/newImages/vision_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: ListView(
                shrinkWrap: true,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 8, top: 8, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Html(
                        //   data: """""",
                        //   onLinkTap: (url) {
                        //     print("Opening $url...");
                        //   },
                        // ),
                        FormLabel(
                          text:
                              "MERCK FOUNDATION RESPONSE TO COVID-19 PANDEMIC",
                          labelColor: Customcolor.violet_col,
                          fontSize: ResponsiveFlutter.of(context).fontSize(2),
                          fontweight: FontWeight.w400,
                          textAlignment: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        advertise(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _mediaaward(context),
                            _childrenyouth(context),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _communitysupport(context),
                            _healthcapacity(context),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        FormLabel(
                          text:
                              "Merck Foundation has raced to respond to the Coronavirus pandemic in partnership with 18 African First Ladies, Ministries of Health, Information and Education focusing on four main areas:",
                          labelColor: Colors.black,
                          fontSize: ResponsiveFlutter.of(context).fontSize(1.6),
                          fontweight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 320,
                          child: ListView.builder(
                              itemCount: list.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "${index + 1}" +
                                                ".  " +
                                                list[index].title,
                                            style: TextStyle(
                                              color: Customcolor.colorVoilet,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          TextSpan(
                                            text: list[index].detail,
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                );
                              }),
                        ),
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
                                            apiurl: API.covidvideo,
                                            headertitle:
                                                "MERCK FOUNDATION RESPONSE TO COVID-19 PANDEMIC",
                                          )));
                            },
                            titleColor: Customcolor.pink_col,
                            titleImg: "assets/newImages/flowers-3.png",
                            list: ListView.builder(
                              itemCount: videolist.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    var storykey = videolist[index]
                                        .videoLink
                                        .substring(
                                            videolist[index].videoLink.length -
                                                11);
                                    ShowDialogs.youtubevideolink(
                                        "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
                                    // _launchInWebViewWithJavaScript(
                                    //     "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8, left: 10),
                                    child: Stack(
                                      children: [
                                        Container(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  86,
                                          child: FadeInImage.assetNetwork(
                                            placeholder:
                                                'assets/newImages/placeholder_3.jpg',
                                            image:
                                                "https://img.youtube.com/vi/${videolist[index].videoLink.substring(videolist[index].videoLink.length - 11)}/mqdefault.jpg",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                bottom: 10),
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
                                                        videolist[index]
                                                            .videoDesc,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
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
                                              child: Image.asset(
                                                  "assets/newImages/pause.png")),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: CustomHorizontalCard(
                            index: 1,
                            cardImage: "assets/newImages/ourvison.png",
                            cardsubtitle: "Latest ",
                            cardTitle: "Update",
                            btnTitle: "View More",
                            titleColor: Customcolor.pink_col,
                            onbtnTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          NewsPage(
                                            apiurl: API.covidnews,
                                          )));
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (BuildContext context) =>
                              //             NewsPage(
                              //               apiurl: API.watchmorelatestupmmtm,
                              //             )));
                            },
                            titleImg: "assets/newImages/flowers-3.png",
                            list: ListView.builder(
                              itemCount: newslist.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (BuildContext context) =>
                                    //             Detailpage(
                                    //               indexIs: index,
                                    //               callfrom: 2,
                                    //             )));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8, left: 10),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 200,
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  86,
                                          child: FadeInImage.assetNetwork(
                                            placeholder:
                                                'assets/newImages/placeholder_3.jpg',
                                            image: newslist[index].imge,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                bottom: 10),
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
                                                        newslist[index].title,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
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
                        // Padding(
                        //   padding: const EdgeInsets.only(right: 0, left: 0),
                        //   child: Align(
                        //     alignment: Alignment.topRight,
                        //     child: Image.asset(
                        //       "assets/newImages/flowers_footer.png",
                        //       height: 170,
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // TextSpan(

            // ),
          ],
        ));
  }

  _mediaaward(context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left: 40.0, right: 10.0, top: 5.0, bottom: 0.0),
      color: Color(0x00000000),
      child: FlipCard(
        key: media,
        direction: FlipDirection.HORIZONTAL,
        speed: 500,
        onFlipDone: (status) {
          print(status);
          // if (status == false) {
          //   media.currentState.controller.reverse();
          // }
          if (status == false) {
            if (youth.currentState.isFront == false) {
              youth.currentState.toggleCard();
            }
            if (health.currentState.isFront == false) {
              health.currentState.toggleCard();
            }
            if (communitysupport.currentState.isFront == false) {
              communitysupport.currentState.toggleCard();
            }
          }
        },
        front: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/newImages/MF_Bubble_Image.png",
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
        back: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => CommunityMedia()));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Customcolor.baby_blue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(75),
                        ),
                        border: Border.all(
                            color: Color(0xFF9294b2).withOpacity(0.8),
                            width: 6),
                        gradient: new LinearGradient(
                          colors: [
                            const Color(0xFF455c9d),
                            const Color(0xFF9294b2),
                            // const Color(0xFFFFFFFF),
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          //stops: [0.0, 1.0],
                        )),
                    child: Center(
                        child: Text(
                      "Community awareness through Media awards",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    )))
              ],
            ),
          ),
        ),
      ),
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

  _childrenyouth(context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left: 5.0, right: 6.0, top: 20.0, bottom: 0.0),
      color: Color(0x00000000),
      child: FlipCard(
        key: youth,
        direction: FlipDirection.HORIZONTAL,
        speed: 500,
        onFlipDone: (status) {
          print(status);
          if (status == false) {
            if (media.currentState.isFront == false) {
              media.currentState.toggleCard();
            }
            if (health.currentState.isFront == false) {
              health.currentState.toggleCard();
            }
            if (communitysupport.currentState.isFront == false) {
              communitysupport.currentState.toggleCard();
            }
          }
        },
        front: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Image.asset(
                  "assets/newImages/MF_Bubble_Image.png",
                  width: 150,
                  height: 150,
                ),
              ),
            ],
          ),
        ),
        back: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Childrenyouth()));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Customcolor.baby_blue,
                          borderRadius: BorderRadius.all(Radius.circular(75)),
                          border: Border.all(
                              color: Color(0xFF9294b2).withOpacity(0.8),
                              width: 6),
                          gradient: new LinearGradient(
                            colors: [
                              const Color(0xFF455c9d),
                              const Color(0xFF9294b2),
                              // const Color(0xFFFFFFFF),
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            //stops: [0.0, 1.0],
                          )),
                      child: Center(
                          child: Text(
                        "Community awareness for Children and Youth",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.center,
                      ))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _communitysupport(context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 40.0, bottom: 0.0),
      color: Color(0x00000000),
      child: FlipCard(
        key: communitysupport,
        direction: FlipDirection.HORIZONTAL,
        speed: 500,
        onFlipDone: (status) {
          print(status);
          if (status == false) {
            if (youth.currentState.isFront == false) {
              youth.currentState.toggleCard();
            }
            if (health.currentState.isFront == false) {
              health.currentState.toggleCard();
            }
            if (media.currentState.isFront == false) {
              media.currentState.toggleCard();
            }
          }
        },
        front: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/newImages/MF_Bubble_Image.png",
                width: 150,
                height: 150,
              ),
            ],
          ),
        ),
        back: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Communitysupport()));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Customcolor.baby_blue,
                          borderRadius: BorderRadius.all(Radius.circular(75)),
                          border: Border.all(
                              color: Color(0xFF9294b2).withOpacity(0.8),
                              width: 6),
                          gradient: new LinearGradient(
                            colors: [
                              const Color(0xFF455c9d),
                              const Color(0xFF9294b2),
                              // const Color(0xFFFFFFFF),
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            //stops: [0.0, 1.0],
                          )),
                      child: Center(
                          child: Text(
                        "Community Support",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.center,
                      ))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _healthcapacity(context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 10.0),
      color: Color(0x00000000),
      child: FlipCard(
        key: health,
        direction: FlipDirection.HORIZONTAL,
        speed: 500,
        onFlipDone: (status) {
          print(status);
          if (status == false) {
            if (youth.currentState.isFront == false) {
              youth.currentState.toggleCard();
            }
            if (media.currentState.isFront == false) {
              media.currentState.toggleCard();
            }
            if (communitysupport.currentState.isFront == false) {
              communitysupport.currentState.toggleCard();
            }
          }
        },
        front: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/newImages/MF_Bubble_Image.png",
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
        back: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Healthcare()));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Customcolor.baby_blue,
                          borderRadius: BorderRadius.all(Radius.circular(75)),
                          border: Border.all(
                              color: Color(0xFF9294b2).withOpacity(0.8),
                              width: 6),
                          gradient: new LinearGradient(
                            colors: [
                              const Color(0xFF455c9d),
                              const Color(0xFF9294b2),
                              // const Color(0xFFFFFFFF),
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            //stops: [0.0, 1.0],
                          )),
                      child: Center(
                          child: Text(
                        "Health Care Capacity Building",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.center,
                      ))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget advertise() {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 5, bottom: 5),
      child: Material(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 5.0,
        // color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              // width: SizeConfig.blockSizeHorizontal * 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: new DecorationImage(
                  image: new AssetImage("assets/images/covid-bg.png"),
                  fit: BoxFit.fill,
                ),
              ),
              // height: 40.0,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, top: 20, right: 10, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FormLabel(
                            text:
                                'Merck Foundation Response to COVID-19 Pandemic',
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            labelColor: Colors.white,
                            fontweight: FontWeight.bold,
                          ),
                          // Container(
                          //   width: 120,
                          //   height: 30,
                          //   decoration: BoxDecoration(
                          //       color: Colors.amber,
                          //       borderRadius: BorderRadius.circular(5)),
                          //   child: Center(
                          //     child: FormLabel(
                          //       text: 'Know More',
                          //       fontSize:
                          //           ResponsiveFlutter.of(context).fontSize(2),
                          //       labelColor: Customcolor.colorBlue,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getvideolibray() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      // ShowDialogs.showLoadingDialog(context, _keyLoader);
      print(API.covidvideo);
      APIManager().apiRequest(
        context,
        API.covidvideo,
        (response) async {
          GetVideoLibraryResponse resp = response;
          print(response);
          print('Resp : $resp');

          //   Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.videolibrary = resp.data.list;
              print(GlobalLists.videolibrary.length);
            });
          } else {
            ShowDialogs.showToast(resp.msg);
          }
        },
        (error) {
          print('ERR msg is $error');
          //    Navigator.of(_keyLoader.currentContext).pop();
        },
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }

  getnewsletter() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      // ShowDialogs.showLoadingDialog(context, _keyLoader);
      print(API.covidnews);
      APIManager().apiRequest(
        context,
        API.covidnews,
        (response) async {
          NewsletterArticleResponse resp = response;
          print(response);
          print('Resp : $resp');

          //   Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.newsLettersList = resp.data.list;
              GlobalLists.homeceomsgbaseurl = resp.baseUrl;
              print(GlobalLists.newsLettersList.length);
            });
          } else {
            ShowDialogs.showToast(resp.msg);
          }
        },
        (error) {
          print('ERR msg is $error');
          //    Navigator.of(_keyLoader.currentContext).pop();
        },
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

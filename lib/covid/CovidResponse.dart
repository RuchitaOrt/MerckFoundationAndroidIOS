import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/covid/childrenyouth.dart';
import 'package:merckfoundation22dec/covid/communitysupport.dart';
import 'package:merckfoundation22dec/covid/communitymedia.dart';
import 'package:merckfoundation22dec/covid/Healthcare.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:screenshot/screenshot.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flip_card/flip_card.dart';

class Description {
  final String title;
  final String detail;

  Description({this.title, this.detail});
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
  @override
  void initState() {
    super.initState();
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
          title: "Covid Response",
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
                        )
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
                        borderRadius: BorderRadius.all(Radius.circular(75))),
                    child: Center(
                        child: Text(
                      "Community awareness through Media awards",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    )))
              ],
            ),
          ),
        ),
      ),
    );
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
                          borderRadius: BorderRadius.all(Radius.circular(75))),
                      child: Center(
                          child: Text(
                        "Community awareness for Children and Youth",
                        style: TextStyle(
                          fontSize: 12,
                        ),
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
      margin: EdgeInsets.only(left: 32.0, right: 32.0, top: 40.0, bottom: 0.0),
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
                          borderRadius: BorderRadius.all(Radius.circular(75))),
                      child: Center(
                          child: Text(
                        "Community Support",
                        style: TextStyle(
                          fontSize: 12,
                        ),
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
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Customcolor.baby_blue,
                          borderRadius: BorderRadius.all(Radius.circular(75))),
                      child: Center(
                          child: Text(
                        "Health Care Capacity Building",
                        style: TextStyle(
                          fontSize: 12,
                        ),
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
}

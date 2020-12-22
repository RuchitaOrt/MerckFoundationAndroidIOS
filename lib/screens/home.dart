import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:marquee/marquee.dart';
import 'package:merckfoundation22dec/widget/customcard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';

import 'package:responsive_flutter/responsive_flutter.dart';

import 'dart:math' as math;

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

class HomeState extends State<Home> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  CarouselSlider carouselSlider;
  int _current = 0;
  int _current1 = 0;
  int currentIndex = 0;

  List _productsAvailable = [
    "assets/images/slider1.jpg",
    "assets/images/slider2.jpg",
    "assets/images/slider1.jpg",
    "assets/images/slider2.jpg"
  ];
  List _productsAvailable1 = [
    "assets/images/slider1.jpg",
    "assets/images/slider2.jpg",
  ];
  AnimationController _controller;
  bool iscall = true;
  bool islibrary = false;
  bool ismeck = false;
  @override
  void initState() {
    super.initState();

    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        ShowDialogs.showConfirmDialog(
            context, "Exit", "Are you sure, want to exit?");
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            //  crossAxisAlignment: CrossAxisAlignment.start,
            shrinkWrap: true,
            children: [
              slider(context),
              _buildComplexMarquee(),
              SizedBox(
                height: 5,
              ),
              newSlider(context),
              CustomeCard(
                  cardTitle: "Message Form Dr.Rasha Kelej",
                  titleColor: Customcolor.colorPink,
                  subTitle: "Message Form Dr.Rasha Kelej (CEO)"),
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
                items: _productsAvailable.map((product) {
                  return new Builder(
                    builder: (BuildContext context) {
                      return new Container(
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(15),
                            // border: Border.all(
                            //   width: 1,
                            // ),
                            image: DecorationImage(
                                image: AssetImage(product), fit: BoxFit.cover)),
                        width: SizeConfig.blockSizeHorizontal * 100,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                color: Colors.white.withOpacity(0.3),
                                width: SizeConfig.blockSizeHorizontal * 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    FormLabel(
                                      text: "Educating Linda Program",
                                      labelColor: Customcolor.colorPink,
                                      fontSize: ResponsiveFlutter.of(context)
                                          .fontSize(1.9),
                                      fontweight: FontWeight.w600,
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    FormLabel(
                                      text:
                                          "Empowering Girls through Education",
                                      labelColor: Customcolor.colorBlue,
                                      fontSize: ResponsiveFlutter.of(context)
                                          .fontSize(1.2),
                                      fontweight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            new DotsIndicator(
              dotsCount: _productsAvailable.length,
              position: double.parse("$_current"),
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeColor: Customcolor.colorBlue,
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ],
        ),
      ],
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

  Widget _buildComplexMarquee() {
    return Container(
      height: 30,
      child: Marquee(
        text:
            'Call for Application-UNESCO MARS 2020          Savethe Date-Merck Foundation "Stay at home" Media recognization award 2020-online edtion for africa and latin america',
        style: TextStyle(
            fontWeight: FontWeight.normal, color: Customcolor.colorPink),
        scrollAxis: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        blankSpace: 20.0,
        velocity: 100.0,
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

  Widget newSlider(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              child: carouselSlider = CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  height: 350,
                  autoPlay: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current1 = index;
                    });
                  },
                ),
                items: _productsAvailable1.map((product) {
                  return new Builder(
                    builder: (BuildContext context) {
                      return new GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          4,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/logo_nav1.png"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            new DotsIndicator(
              dotsCount: _productsAvailable1.length,
              position: double.parse("$_current1"),
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeColor: Customcolor.colorBlue,
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

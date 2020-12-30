import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/ourProgramdetailsforStem.dart';

import 'package:merckfoundation22dec/screens/ourPrograms/ourprogramdetail.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class programclass {
  final String programname;
  final Color colors;

  programclass({this.programname, this.colors});
}

class Ourprogram extends StatefulWidget {
  @override
  _OurProgramState createState() => _OurProgramState();
}

class _OurProgramState extends State<Ourprogram> {
  TextStyle style = TextStyle(fontFamily: 'Roboto', fontSize: 16.0);
  bool checkedValue = false;
  CarouselSlider carouselSlider;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _current = 0;
  List _productsAvailable = [
    "assets/images/slider1.jpg",
    "assets/images/slider2.jpg",
    "assets/images/slider1.jpg",
    "assets/images/slider2.jpg"
  ];
  List<programclass> _productsAvailable1 = [
    programclass(
        programname: "Merck More Than A Mother", colors: Customcolor.text_blue),
    programclass(
        programname: "Merck Cancer Access Program",
        colors: Customcolor.colorLightGreen),
    programclass(
        programname:
            "Merck Capacity Advancement and Diabetes Blue Point Program",
        colors: Customcolor.baby_blue),
    programclass(
        programname: "Merck Foundation First Ladies Initiative Summit",
        colors: Customcolor.pink_col),
    programclass(
        programname: "Merck STEM Program", colors: Customcolor.colorVoilet),
    programclass(
        programname: "Educating Linda Program",
        colors: Customcolor.colorLightBlue),
    programclass(
        programname: "Merck Foundation Sustainability Initiative",
        colors: Customcolor.colorLightGreen),
    programclass(
        programname: "Merck Africa Asia Luminary",
        colors: Customcolor.colorGreen),
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: InnerCustomAppBar(
        onTapval: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Dashboard(
                        index: 0,
                      )));
        },
        index: 2,
        title: "Our Programs",
        titleImg: "assets/newImages/our_programsLogo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 90,
      ),
      body: Column(
      //  shrinkWrap: true,
        children: [
          slider(context),
          Expanded(
                      child: ListView(
              shrinkWrap: true,
              children: [
                oorprogram(),

                  SizedBox(
              height: 15,
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
    );
  }

  Widget oorprogram() {
    return Container(
      //   height: SizeConfig.blockSizeVertical * 100,
      child: AnimationLimiter(
        child: ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          // physics:
          //     AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          scrollDirection: Axis.vertical,
          itemCount: _productsAvailable1.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: -50.0,
                child: FadeInAnimation(
                  child: GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => OurProgram(
                                      indexpass: 0,
                                    )));
                      } else if (index == 4) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => OurProgramStem()));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 8, bottom: 8),
                      child: Container(
                        // padding: EdgeInsets.all(10),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: _productsAvailable1[index].colors,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                //spreadRadius: 2,
                                // blurRadius: 2,
                                offset: Offset(0, 3)
                                // changes position of shadow
                                ),
                          ],
                          //
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25, bottom: 25),
                              child: Container(
                                width: SizeConfig.blockSizeHorizontal * 75,
                                child: FormLabel(
                                  text: _productsAvailable1[index].programname,
                                  labelColor: Colors.white,
                                  fontSize:
                                      ResponsiveFlutter.of(context).fontSize(2),
                                  fontweight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 4,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget slider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: carouselSlider = CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1.0,
                    height: 180,
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
                              borderRadius: BorderRadius.circular(7),
                              image: DecorationImage(
                                  image: AssetImage(product),
                                  fit: BoxFit.cover)),
                          width: SizeConfig.blockSizeHorizontal * 100,
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 0, bottom: 10),
                                child: Container(
                                  color: Colors.white.withOpacity(0.5),
                                  width: SizeConfig.blockSizeHorizontal * 100,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 5, bottom: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        FormLabel(
                                          text:
                                              "Merck Capacity Advancement & Diabetes Blue Point Program",
                                          labelColor: Colors.black,
                                          fontSize:
                                              ResponsiveFlutter.of(context)
                                                  .fontSize(1.6),
                                          maxLines: 2,
                                          fontweight: FontWeight.w600,
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        FormLabel(
                                          text:
                                              "Building nationwide Diabetes Care Capacity",
                                          labelColor: Colors.black,
                                          fontSize:
                                              ResponsiveFlutter.of(context)
                                                  .fontSize(1.5),
                                          fontweight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
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
            ],
          ),
        ],
      ),
    );
  }
}

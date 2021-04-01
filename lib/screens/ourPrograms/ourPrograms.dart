import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/ourProgramdetailcancerlist.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/ourProgramdetailssevenlist.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/ourProgramdetailsforStem.dart';

import 'package:merckfoundation22dec/screens/ourPrograms/ourprogramdetail.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Ourprogramdetailafricaasia.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/model/HomepageResponse.dart';
import 'package:merckfoundation22dec/widget/slidercontainer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  List<dynamic> slidersection = [];
  List _productsAvailable = [];
  bool issliderSectionLoaded = false;
  List<programclass> _productsAvailable1 = [
    programclass(
        programname: "Merck Foundation More Than A Mother         ",
        colors: Customcolor.prog1),
    programclass(
        programname: "Merck Foundation Cancer Access Program     ",
        colors: Customcolor.prog2),
    programclass(
        programname:
            "Merck Foundation Capacity Advancement & Nationwide Diabetes Blue Points Program",
        colors: Customcolor.prog3),
    programclass(
        programname: "Merck Foundation First Ladies Initiative Summit",
        colors: Customcolor.prog4),
    programclass(
        programname: "Merck Foundation STEM Program                  ",
        colors: Customcolor.prog5),
    programclass(
        programname: "Merck Foundation Educating Linda Program",
        colors: Customcolor.prog6),
    programclass(
        programname: "Merck Foundation Sustainability Initiative   ",
        colors: Customcolor.prog7),
    programclass(
        programname: "Merck Foundation Africa Asia Luminary      ",
        colors: Customcolor.prog8),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gethomeapi();
  }

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
          // Navigator.pop(context);
        },
        index: 1,
        title: "Our Programs",
        titleImg: "assets/newImages/our_programsLogo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 90,
      ),
      body: Column(
        //  shrinkWrap: true,
        children: [
          Visibility(
            visible: issliderSectionLoaded,
            replacement: Center(child: CircularProgressIndicator()),
            child: slider(context),
          ),
          //   slider(context),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                oorprogram(),
                SizedBox(
                  height: 15,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 60, left: 60),
                //   child: Image.asset(
                //     "assets/newImages/flowers_footer.png",
                //   ),
                // ),


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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<http.Response> gethomeapi() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      print("home api");
      var response = await APIManager.fetchget(
        encoding: APIManager.homeurl,
      );
      print("response");
      print(response);
      if (response.statusCode == 200) {
        var res = json.decode(response.body);
        print("ff");
        print(res);
        HomepageResponse homepageres = HomepageResponse.fromJson(res);
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

        print("slidersection");
        print(slidersection.length);
        setState(() {
          issliderSectionLoaded = true;
        });

        return response;
      } else {
        ShowDialogs.showToast(GlobalLists.serverresp);

        setState(() {
          issliderSectionLoaded = true;
        });
      }
    } else {
      setState(() {
        issliderSectionLoaded = true;
      });

      ShowDialogs.showToast("Please check internet connection");
    }
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
                      } else if (index == 1) {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) => OurProgram(
                        //               indexpass: 1,
                        //             )));
                        //for cancer index is from 21 to 27
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    OurProgramcancerlist(
                                      indexpass: 21,
                                    )));
                      } else if (index == 2) {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) => OurProgram(
                        //               indexpass: 2,
                        //             )));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    OurProgramSevenlist(
                                      indexpass: 1,
                                    )));
                      } else if (index == 3) {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) => OurProgram(
                        //               indexpass: 12,
                        //             )));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    OurProgramSevenlist(
                                      indexpass: 2,
                                    )));
                      } else if (index == 6) {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) => OurProgram(
                        //               indexpass: 13,
                        //             )));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    OurProgramSevenlist(
                                      indexpass: 4,
                                    )));
                      } else if (index == 4) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    OurProgramStem()));
                      } else if (index == 5) {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) => OurProgram(
                        //               indexpass: 14,
                        //             )));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    OurProgramSevenlist(
                                      indexpass: 3,
                                    )));
                      } else if (index == 7) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    OurProgramAfrica()));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) =>
                        //             OurProgramSevenlist(
                        //               indexpass: 4,
                        //             )));
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
                              // padding: const EdgeInsets.only(
                              //     left: 16, right: 16, top: 25, bottom: 25),
                              padding: const EdgeInsets.only(
                                  left: 5, right: 8, top: 4, bottom: 4),
                              child: Container(
                                width: SizeConfig.blockSizeHorizontal * 80,
                                padding: const EdgeInsets.only(
                                    left: 5, right: 8, top: 4, bottom: 4),
                                // height: 28,
                                child: Center(
                                  child: FormLabel(
                                    text:
                                        _productsAvailable1[index].programname,
                                    labelColor: Colors.white,
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(1.9),
                                    fontweight: FontWeight.w500,
                                  ),
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
                        //  new Container(
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
}

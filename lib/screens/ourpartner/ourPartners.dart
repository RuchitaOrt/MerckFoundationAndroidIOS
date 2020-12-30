import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/screens/ourpartner/ourPartnerDetails.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class Ourpatner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OurpatnerState();
  }
}

class OurpatnerState extends State<Ourpatner> {
  @override
  Widget build(BuildContext context) {
    List paravalue = [
      "We are open to partner on programs that contribute to our goal of improving the health and wellbeing.",
      "We care for people living in underserved communities and want to advance their lives through science and technology.",
      "We are dedicated to sharing our expertise to jointly develop and implement those programs.",
    ];
    List imageAvailable = [
      "assets/images/img1.jpg",
      "assets/images/img2.jpg",
      "assets/images/img1.jpg",
      "assets/images/img2.jpg",
      "assets/images/img1.jpg"
    ];
    return Scaffold(
        backgroundColor: Customcolor.background,
        appBar: InnerCustomAppBar(
          onTapval: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Dashboard(index: 0,)));
          },
          index: 2,
          title: "Our Partners",
          titleImg: "assets/newImages/ourPartner_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            children: [
              // Container(
              //   height: 250,
              //   // color: Colors.grey.shade800,
              //   padding: EdgeInsets.all(16.0),
              //   child: Column(
              //     children: [
              //       Expanded(
              //         child: Swiper(
              //           fade: 0.0,
              //           itemBuilder: (BuildContext context, int index) {
              //             return Column(
              //               children: [
              //                 Expanded(
              //                   child: Card(
              //                     elevation: 5,
              //                     // color: Colors.red,
              //                     child: Column(
              //                       children: <Widget>[
              //                         Expanded(
              //                           child: Container(
              //                             // height: SizeConfig.blockSizeVertical * 40,
              //                             width: double.infinity,
              //                             decoration: BoxDecoration(
              //                                 borderRadius: BorderRadius.only(
              //                                     topLeft:
              //                                         Radius.circular(10.0),
              //                                     topRight:
              //                                         Radius.circular(10.0)),
              //                                 image: DecorationImage(
              //                                     image: AssetImage(
              //                                       imageAvailable[index],
              //                                     ),
              //                                     fit: BoxFit.fill)),
              //                           ),
              //                         ),
              //                         // Container(
              //                         //     padding: EdgeInsets.only(bottom: 20),
              //                         //     decoration: BoxDecoration(
              //                         //         color: Colors.white,
              //                         //         borderRadius: BorderRadius.only(
              //                         //             bottomLeft: Radius.circular(10.0),
              //                         //             bottomRight: Radius.circular(10.0))),
              //                         //     child: )
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             );
              //           },
              //           itemCount: imageAvailable.length,
              //           viewportFraction: 0.9,
              //           layout: SwiperLayout.TINDER,
              //           //  autoplay: true,
              //           scale: 0.8,
              //           //outer: true,
              //           itemWidth: 300.0,
              //           //itemHeight: 400,
              //           itemHeight: 250,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              ListView(
                shrinkWrap: true,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 8, bottom: 15),
                    child: Text(
                      "We know we can make a greater difference in people’s lives when working together with others. We cooperate with governments, academic institutions, global and local communities, donors, patient associations, international organizations and NGOs.",
                      style: TextStyle(
                          color: Customcolor.colorPink,
                          fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: paravalue.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                paravalue[index],
                                style: TextStyle(
                                  color: Customcolor.text_darkgrey,
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(1.9),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 90, right: 90, bottom: 20, top: 20),
                    child: FlatButton(
                      color: Customcolor.text_blue,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Customcolor.text_blue),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "View Partners",
                        style: TextStyle(color: Colors.white),
                      ),
                      minWidth: 38,
                      height: 40,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Ourpatnerdetail()));
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 60, left: 60, top: 20),
                    child: Image.asset(
                      "assets/newImages/flowers_footer.png",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

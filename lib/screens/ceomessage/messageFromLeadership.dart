import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/customappbar.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class MessagefromLeadership extends StatelessWidget {
  static final String path = "lib/src/pages/blog/article2.dart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Dashboard(
                        index: 0,
                      )));
        },
        2,
        height: 160,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FormLabel(
              text: "Message From Leadership Team",
              labelColor: Customcolor.colorPink,
              fontSize: ResponsiveFlutter.of(context).fontSize(2),
              fontweight: FontWeight.bold,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              height: 640,
              child: Swiper.children(
                autoplay: false,
                loop: true,
                control: SwiperControl(
                  padding: EdgeInsets.only(bottom: 400),
                  iconNext: Icons.arrow_forward_ios,
                  iconPrevious: Icons.arrow_back_ios,
                ),
                children: <Widget>[
                  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Stack(
                            children: <Widget>[
                              Container(
                                  height: 300,
                                  width: double.infinity,
                                  child: Image.asset(
                                      "assets/images/slider1.jpg",
                                      fit: BoxFit.cover)),
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    16.0, 250.0, 16.0, 16.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0)),
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Prof. Dr. Frank Stangenberg-Haverkamp",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.title,
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      "Chairman of Board of Trustees of Merck Foundation",
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      "Chairman of Executive Board and Family Board, E. Merck KG",
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 10.0),
                                    Divider(),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "We at Merck, the world’s oldest pharmaceutical and chemical company, know that acting responsibly is key for long-time entrepreneurial success. Therefore, we do a lot for the communities in which we operate in.\n\nI strongly believe that it is crucial to have a real economic transformation with a social dimension that will ensure not only all basic needs but quality of life for everyone. This can never be achieved except with capacity building and the empowerment of women and youth.\n\nThe size and complexity of the task is so large that no single organization can manage on its own, so integration of effort is necessary to realize our vision for a world where everyone can lead healthy and fulﬁlling lives. The private sector has an important role as partner with governments, academia and communities; it is time to take an action now.\n\nTherefore, we will consolidate many of our centrally driven corporate responsibility activities under one single roof: the Merck Foundation. This new philanthropic organization will allow us to considerably expand the scope, reach and effectiveness of our projects. It puts us in a better position to address some of the most pressing health, social and economic challenges of the 21st century.\n\nWe strongly believe that together we can make a signiﬁcant contribution towards the Sustainable Development Goals. With Merck Foundation, our long term commitment to the communities in which we operate will remain strong and consistent as it was throughout generations.",
                                      textAlign: TextAlign.justify,
                                    ),
                                    SizedBox(height: 10.0),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      })
                ],
              ),
            )
            // ListView.builder(
            //   physics: ScrollPhysics(),
            //   shrinkWrap: true,
            //   //   AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            //   //scrollDirection: Axis.horizontal,
            //   itemCount: 2,
            //   itemBuilder: (context, index) {
            //     return Container(
            //       child: Stack(
            //         children: <Widget>[
            //           Container(
            //               height: 300,
            //               width: double.infinity,
            //               child: Image.asset("assets/images/g1.jpg",
            //                   fit: BoxFit.cover)),
            //           Container(
            //             margin: EdgeInsets.fromLTRB(16.0, 250.0, 16.0, 16.0),
            //             decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 borderRadius: BorderRadius.circular(5.0)),
            //             padding: const EdgeInsets.all(16.0),
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: <Widget>[
            //                 Text(
            //                   "Prof. Dr. Frank Stangenberg-Haverkamp",
            //                   textAlign: TextAlign.center,
            //                   style: Theme.of(context).textTheme.title,
            //                 ),
            //                 SizedBox(height: 10.0),
            //                 Text(
            //                   "Chairman of Board of Trustees of Merck Foundation",
            //                   textAlign: TextAlign.center,
            //                 ),
            //                 SizedBox(height: 10.0),
            //                 Text(
            //                   "Chairman of Executive Board and Family Board, E. Merck KG",
            //                   textAlign: TextAlign.center,
            //                 ),
            //                 SizedBox(height: 10.0),
            //                 Divider(),
            //                 SizedBox(
            //                   height: 10.0,
            //                 ),
            //                 SizedBox(
            //                   height: 10.0,
            //                 ),
            //                 Text(
            //                   "We at Merck, the world’s oldest pharmaceutical and chemical company, know that acting responsibly is key for long-time entrepreneurial success. Therefore, we do a lot for the communities in which we operate in.\n\nI strongly believe that it is crucial to have a real economic transformation with a social dimension that will ensure not only all basic needs but quality of life for everyone. This can never be achieved except with capacity building and the empowerment of women and youth.\n\nThe size and complexity of the task is so large that no single organization can manage on its own, so integration of effort is necessary to realize our vision for a world where everyone can lead healthy and fulﬁlling lives. The private sector has an important role as partner with governments, academia and communities; it is time to take an action now.\n\nTherefore, we will consolidate many of our centrally driven corporate responsibility activities under one single roof: the Merck Foundation. This new philanthropic organization will allow us to considerably expand the scope, reach and effectiveness of our projects. It puts us in a better position to address some of the most pressing health, social and economic challenges of the 21st century.\n\nWe strongly believe that together we can make a signiﬁcant contribution towards the Sustainable Development Goals. With Merck Foundation, our long term commitment to the communities in which we operate will remain strong and consistent as it was throughout generations.",
            //                   textAlign: TextAlign.justify,
            //                 ),
            //                 SizedBox(height: 10.0),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

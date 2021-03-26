import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';

class Check extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CheckState();
  }
}

class CheckState extends State<Check> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: InnerCustomAppBar(
        onTapval: () {
            Navigator.pop(context);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (BuildContext context) => Dashboard(
          //               index: 0,
          //             )));
        },
        index: 2,
        title: "Message from\n LeadershipTeam",
        titleImg: "assets/newImages/flowers-1.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Swiper.children(
            physics: NeverScrollableScrollPhysics(),
            autoplay: false,
            loop: true,
            reverse: false,
            control: SwiperControl(
                padding: EdgeInsets.only(bottom: 530, left: 20, right: 20),
                iconNext: Icons.arrow_forward_ios,
                iconPrevious: Icons.arrow_back_ios,
                size: 20),
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    //   color: Colors.amber,
                    width: SizeConfig.blockSizeHorizontal * 100,
                    child: ListView(
                      // crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Center(
                            child: Container(
                                height: 200,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Image.asset(
                                  "assets/images/slider1.jpg",
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                        Container(
                          // margin:
                          //     EdgeInsets.fromLTRB(16.0, 250.0, 16.0, 16.0),
                          decoration: BoxDecoration(
                              color: Customcolor.background,
                              borderRadius: BorderRadius.circular(5.0)),
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Prof. Dr. Frank Stangenberg-Haverkamp",
                                  //textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Customcolor.pink_col,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700)),
                              SizedBox(height: 10.0),
                              Center(
                                child: Text(
                                    "Chairman of Board of Trustees of Merck Foundation",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Customcolor.colorBlue,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)),
                              ),
                              Center(
                                child: Text(
                                    "Chairman of Executive Board and Family Board, E. Merck KG",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Customcolor.colorBlue,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)),
                              ),
                              SizedBox(height: 10.0),
                              Divider(),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                  "We at Merck, the world’s oldest pharmaceutical and chemical company, know that acting responsibly is key for long-time entrepreneurial success. Therefore, we do a lot for the communities in which we operate in.\n\nI strongly believe that it is crucial to have a real economic transformation with a social dimension that will ensure not only all basic needs but quality of life for everyone. This can never be achieved except with capacity building and the empowerment of women and youth.\n\nThe size and complexity of the task is so large that no single organization can manage on its own, so integration of effort is necessary to realize our vision for a world where everyone can lead healthy and fulﬁlling lives. The private sector has an important role as partner with governments, academia and communities; it is time to take an action now.\n\nTherefore, we will consolidate many of our centrally driven corporate responsibility activities under one single roof: the Merck Foundation. This new philanthropic organization will allow us to considerably expand the scope, reach and effectiveness of our projects. It puts us in a better position to address some of the most pressing health, social and economic challenges of the 21st century.\n\nWe strongly believe that together we can make a signiﬁcant contribution towards the Sustainable Development Goals. With Merck Foundation, our long term commitment to the communities in which we operate will remain strong and consistent as it was throughout generations.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Customcolor.colorblack,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)),
                              SizedBox(height: 10.0),
                              SizedBox(
                                height: 15,
                              ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.only(right: 60, left: 60),
                              //   child: Image.asset(
                              //     "assets/newImages/flowers_footer.png",
                              //   ),
                              // ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.only(right: 0, left: 0),
                              //   child: Align(
                              //     alignment: Alignment.topRight,
                              //     child: Image.asset(
                              //       "assets/newImages/flowers_footer.png",
                              //       height: 170,
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          )),
    );
  }
}

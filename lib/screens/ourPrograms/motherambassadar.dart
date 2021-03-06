import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/customHorizontalCard.dart';

import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';

import 'package:responsive_flutter/responsive_flutter.dart';

class MotherAmbassadarDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MotherAmbassadarState();
  }
}

class MotherAmbassadarState extends State<MotherAmbassadarDetails> {
  List images = [
    "assets/newImages/img1.png",
    "assets/newImages/m3.png",
    "assets/newImages/cfa1.png"
  ];
  List paravalue = [
    "Breaking the Stigma around infertile couples in general and infertile women in particular.",
    "Empowering Girls and Women in Education in general and in STEM in particular.",
    "Improving access to quality & equitable healthcare solutions.",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: InnerCustomAppBar(
        onTapval: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Dashboard(
                        index: 1,
                      )));
        },
        index: 2,
        title: "Our Programs",
        titleImg: "assets/newImages/our_programsLogo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
        child: ListView(
          shrinkWrap: true,
          //  crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormLabel(
              text: "Merck More Than a Mother",
              labelColor: Customcolor.colorPink,
              fontweight: FontWeight.w700,
              fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
            ),
            SizedBox(
              height: 15,
            ),
            FormLabel(
              text: "Merck More Than a Mother Ambassadors",
              labelColor: Customcolor.text_blue,
              fontweight: FontWeight.w700,
              fontSize: ResponsiveFlutter.of(context).fontSize(1.9),
            ),
            SizedBox(
              height: 10,
            ),
            FormLabel(
              text:
                  "Merck Foundation works together with African First Ladies, who are the Ambassadors of Merck More Than a Mother, through Merck Foundation First Ladies Initiative (MFFLI). Through this platform, Merck Foundation together with First Ladies, ensures continuous improvement and exchange of variable aspects of different cultures in order to localize and/or standardize specific messages that can raise awareness and create a culture shift across Africa with regards to the below objectives:",
              labelColor: Customcolor.text_darkgrey,
              //fontweight: FontWeight.w500,
              fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
            ),
            SizedBox(
              height: 9,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: paravalue.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Icon(
                          Icons.circle,
                          size: 8,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          paravalue[index],
                          style: TextStyle(
                            color: Customcolor.text_darkgrey,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(1.8),
                            //             fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            FormLabel(
              text:
                  "So far, First Ladies of more than 18 Countries have partnered with Merck Foundation to lead and execute the initiatives in their respective countries as Merck More Than a Mother Ambassadors.",
              labelColor: Customcolor.text_darkgrey,
              //   fontweight: FontWeight.w500,
              fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
            ),
            SizedBox(
              height: 20,
            ),
            FormLabel(
              text:
                  "The Ambassadors of Merck More Than a Mother have their own social media campaign for their respective countries.",
              labelColor: Customcolor.text_darkgrey,
              // fontweight: FontWeight.w500,
              fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 340,
              // color: Colors.grey.shade800,
              //  padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: Swiper(
                      fade: 0.0,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Expanded(
                              child: Card(
                                elevation: 5,
                                color: Colors.transparent,
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        // height: SizeConfig.blockSizeVertical * 40,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  images[index],
                                                ),
                                                fit: BoxFit.fill)),
                                      ),
                                    ),
                                    // Container(
                                    //     padding: EdgeInsets.only(bottom: 20),
                                    //     decoration: BoxDecoration(
                                    //         color: Colors.white,
                                    //         borderRadius: BorderRadius.only(
                                    //             bottomLeft: Radius.circular(10.0),
                                    //             bottomRight: Radius.circular(10.0))),
                                    //     child: )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: images.length,
                      viewportFraction: 0.7,
                      layout: SwiperLayout.DEFAULT,

                      scale: 0.9,
                      //outer: true,
                      //  itemWidth: 300.0,
                      //itemHeight: 400,
                      //itemHeight: 300,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: 120,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    "Watch More",
                    style: TextStyle(
                        color: Customcolor.colorBlue,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CustomHorizontalCard(
                index: 1,
                cardImage: "assets/newImages/mqdefault1.png",
                cardTitle:
                    "Watch below some of the latest videos of Dr. Rasha kelej and first ladies of Africa. Ambassadars of Merck More than a Mother.  ",
                titleColor: Customcolor.pink_col,
                btnTitle: "Read All",
                titleImg: "assets/newImages/flowers-2.png",
                subTitle:
                    "Message Form Dr.Rasha Kelej, on the inauguration..."),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CustomHorizontalCard(
                  index: 1,
                  cardImage: "assets/newImages/award1.png",
                  cardTitle:
                      "Acknowledging the efforts of first ladies as Ambassadars of Merck More than a Mother.  ",
                  btnTitle: "Read More",
                  titleColor: Customcolor.pink_col,
                  titleImg: "assets/newImages/flowers-1.png",
                  subTitle:
                      "Message Form Dr.Rasha Kelej, on the inauguration..."),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 60, left: 60, top: 20),
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
            )
          ],
        ),
      ),
    );
  }
}

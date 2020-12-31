import 'package:flutter/material.dart';

import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';

import 'package:responsive_flutter/responsive_flutter.dart';

class OurActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OurActivityState();
  }
}

class OurActivityState extends State<OurActivity> {
  List listourObjective = [
    "expand professional capabilities in healthcare research and media.",
    "improve access to innovative and equitable healthcare solutions",
    "empower women and youth in education with a special focus on STEM (Science, Technology, Engineering and Mathematics).",
    "build advocacy to address health, social and economic challenges.",
    "raise awareness of disease prevention and early detection through access to information, health and change of mind-set."
  ];
  List _productsAvailable = [
    "assets/newImages/img3.jpg",
    "assets/newImages/img4.jpg",
    "assets/newImages/img3.jpg",
    "assets/newImages/img4.jpg",
    "assets/newImages/img3.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: InnerCustomAppBar(
        onTapval: () {
          Navigator.pop(context);
        },
        index: 2,
        title: "Our Activities",
        titleImg: "assets/newImages/vision_logo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child: ListView(
              shrinkWrap: true,
              //  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormLabel(
                  text: "Our Objectives",
                  labelColor: Customcolor.colorPink,
                  fontweight: FontWeight.w700,
                  fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
                ),
                SizedBox(
                  height: 15,
                ),
                FormLabel(
                  text:
                      "Together with its partners,the Merck foundation aims to:",
                  labelColor: Customcolor.text_darkgrey,
                  fontweight: FontWeight.w400,
                  fontSize: ResponsiveFlutter.of(context).fontSize(1.9),
                ),
                SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: listourObjective.length,
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
                              listourObjective[index],
                              style: TextStyle(
                                color: Customcolor.text_darkgrey,
                                fontSize:
                                    ResponsiveFlutter.of(context).fontSize(1.9),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                FormLabel(
                  text:
                      "The Merck Foundation focuses on activities that will contribute towards the Sustainable Development Goals (SDGs) as outlined by the United Nations.",
                  labelColor: Customcolor.text_darkgrey,
                  fontweight: FontWeight.w400,
                  fontSize: ResponsiveFlutter.of(context).fontSize(1.9),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
            child: FormLabel(
              text: "Our Activities",
              labelColor: Customcolor.colorPink,
              fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
              fontweight: FontWeight.w500,
            ),
          ),
          ouractivities(),
          Padding(
            padding:
                const EdgeInsets.only(right: 60, left: 60, top: 20, bottom: 20),
            child: Image.asset(
              "assets/newImages/flowers_footer.png",
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget ouractivities() {
    return Container(
        height: 190,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _productsAvailable.length,
            itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Container(
                    height: SizeConfig.blockSizeVertical * 20,
                    width: SizeConfig.blockSizeHorizontal * 86,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: AssetImage(_productsAvailable[index]),
                            fit: BoxFit.cover)),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FormLabel(
                                  text:
                                      "Merck Foundation Partners with Burundi \nfirst ladies to build health care capacity",
                                  fontSize: 14,
                                  textAlignment: TextAlign.start,
                                  labelColor: Colors.white,
                                  fontweight: FontWeight.w700,
                                  maxLines: 4,
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 85,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: FormLabel(
                                            text: 'Portuguese',
                                            fontSize:
                                                ResponsiveFlutter.of(context)
                                                    .fontSize(1.8),
                                            labelColor:
                                                Customcolor.text_darkblue,
                                            fontweight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Container(
                                        width: 60,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: FormLabel(
                                            text: 'French',
                                            fontSize:
                                                ResponsiveFlutter.of(context)
                                                    .fontSize(1.8),
                                            labelColor:
                                                Customcolor.text_darkblue,
                                            fontweight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Container(
                                        width: 70,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: FormLabel(
                                            text: 'English',
                                            fontSize:
                                                ResponsiveFlutter.of(context)
                                                    .fontSize(1.8),
                                            labelColor:
                                                Customcolor.text_darkblue,
                                            fontweight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )));
  }
}

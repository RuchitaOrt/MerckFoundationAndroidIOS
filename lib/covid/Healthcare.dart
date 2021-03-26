import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class Healthcare extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HealthcareState();
  }
}

class HealthcareState extends State<Healthcare> with TickerProviderStateMixin {
  AnimationController _controller;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  double imgHeight = 50;
  String _platformVersion = 'Unknown';

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
    return Scaffold(
        backgroundColor: Customcolor.background,
        appBar: InnerCustomAppBar(
          onTapvalfilter: () {},
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
          title: "Merck Foundation Healthcare Capacity Building",
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
                        left: 15, right: 15, top: 8, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Center(
                        //   child: FormLabel(
                        //     text: "Health Care Capacity Building",
                        //     labelColor: Customcolor.violet_col,
                        //     fontSize:
                        //         ResponsiveFlutter.of(context).fontSize(2.5),
                        //     fontweight: FontWeight.w600,
                        //     textAlignment: TextAlign.center,
                        //   ),
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        FormLabel(
                          text:
                              "Merck Foundation believes that building professional healthcare capacity is the right strategy to improve access to quality and equitable healthcare specially during this vicious pandemic.",
                          labelColor: Colors.black54,
                          fontSize: 14,
                          fontweight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FormLabel(
                          text:
                              "Therefore, Merck Foundation will strongly continue their current capacity advancement programs and will specially focus on building Coronavirus healthcare capacity through providing African and Asian medical postgraduates with one-year online diploma and two-year online Master degree in both of Respiratory Medicines and Acute Medicines at one of the UK Universities. This program is in partnership with African First Ladies, Ministers of Health and Academia across the two continents.",
                          labelColor: Colors.black54,
                          fontSize: 14,
                          fontweight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FormLabel(
                          text:
                              "Merck Foundation will be providing online scholarships for one-year diploma and two-year Master degree in several specialties such as: Diabetes, Cardiovascular Preventive Medicines, Endocrinology and Sexual and Reproductive Medicines.",
                          labelColor: Colors.black54,
                          fontSize: 14,
                          fontweight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FormLabel(
                          text:
                              "To apply for these scholarships, please email us on: submit@merck-foundation.com",
                          labelColor: Colors.black54,
                          fontSize: 14,
                          fontweight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FormLabel(
                          text: "CALL FOR APPLICATION",
                          labelColor: Colors.black54,
                          fontSize: 14,
                          fontweight: FontWeight.w500,
                          textAlignment: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Image.network(
                            "https://www.merck-foundation.com/servlet/rtaImage?eid=a2t1r000004YIDD&feoid=00Nw0000009EtWJ&refid=0EM1r000002ewVB",
                            height: 290,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: FormLabel(
                            text: "Download here",
                            labelColor: Colors.black54,
                            fontSize: 14,
                            fontweight: FontWeight.w500,
                            textAlignment: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FormLabel(
                          text:
                              "ELIGIBILITY CRITERIA & OVERVIEW OF ONE- YEAR ONLINE DIPLOMA IN ACUTE MEDICINE",
                          labelColor: Colors.black54,
                          fontSize: 14,
                          fontweight: FontWeight.w500,
                          textAlignment: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Image.network(
                            "https://www.merck-foundation.com/servlet/rtaImage?eid=a2t1r000004YIDD&feoid=00Nw0000009EtWJ&refid=0EM1r000002evsJ",
                            height: 290,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: FormLabel(
                            text: "Download here",
                            labelColor: Colors.black54,
                            fontSize: 14,
                            fontweight: FontWeight.w500,
                            textAlignment: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FormLabel(
                          text:
                              "ELIGIBILITY CRITERIA & OVERVIEW OF ONE- YEAR ONLINE DIPLOMA IN RESPIRATORY MEDICINE",
                          labelColor: Colors.black54,
                          fontSize: 14,
                          fontweight: FontWeight.w500,
                          textAlignment: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Image.network(
                            "https://www.merck-foundation.com/servlet/rtaImage?eid=a2t1r000004YIDD&feoid=00Nw0000009EtWJ&refid=0EM1r000002evtq",
                            height: 290,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: FormLabel(
                            text: "Download here",
                            labelColor: Colors.black54,
                            fontSize: 14,
                            fontweight: FontWeight.w500,
                            textAlignment: TextAlign.center,
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
}

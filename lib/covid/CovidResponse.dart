import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:screenshot/screenshot.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:flutter_html/flutter_html.dart';

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
                          labelColor: Customcolor.pink_col,
                          fontSize: ResponsiveFlutter.of(context).fontSize(2),
                          fontweight: FontWeight.w400,
                          textAlignment: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        advertise(),
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

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/ourPrograms.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class CommunityMedia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CommunityMediaState();
  }
}

class CommunityMediaState extends State<CommunityMedia>
    with TickerProviderStateMixin {
  AnimationController _controller;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  double imgHeight = 50;
  String _platformVersion = 'Unknown';
  List<programclass> _productsAvailable1 = [
    programclass(
        programname: "Southen African Countries",
        colors: Customcolor.violet_col),
    programclass(
        programname: "West African Countries",
        colors: Customcolor.colorLightGreen),
    programclass(
        programname: "East African Countries", colors: Customcolor.baby_blue),
    programclass(
        programname: "French Speaking African Countries",
        colors: Customcolor.pink_col),
    programclass(
        programname: "Portuguese Speaking African Countries",
        colors: Customcolor.colorVoilet),
    programclass(
        programname: "Arabic Speaking African Countries",
        colors: Customcolor.colorLightBlue),
    programclass(programname: "Ghana", colors: Customcolor.colorLightGreen),
    programclass(
        programname: "Democratic Republic of congo",
        colors: Customcolor.colorGreen),
    programclass(programname: "Mali", colors: Customcolor.colorGreen),
    programclass(
        programname: "Latin American Countries",
        colors: Customcolor.colorGreen),
    programclass(programname: "AsianCountries", colors: Customcolor.colorGreen),
  ];
  @override
  void initState() {
    super.initState();

    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
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
                    onTap: () {},
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
                                  left: 10, right: 10, top: 10, bottom: 10),
                              child: Container(
                                width: SizeConfig.blockSizeHorizontal * 80,
                                child: FormLabel(
                                  text: _productsAvailable1[index].programname,
                                  labelColor: Colors.white,
                                  fontSize:
                                      ResponsiveFlutter.of(context).fontSize(2),
                                  fontweight: FontWeight.bold,
                                ),
                              ),
                            ),
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
          title: "Covid",
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
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: FormLabel(
                            text: "Community Awareness through Media awards",
                            labelColor: Customcolor.violet_col,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.5),
                            fontweight: FontWeight.w600,
                            textAlignment: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FormLabel(
                          text:
                              "Merck Foundation announced the winners of Africa, Latin America and Asia “Stay at Home” Media Recognition Awards and welcome them to Merck Foundation Alumni.",
                          labelColor: Customcolor.pink_col,
                          fontSize: 14,
                          fontweight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FormLabel(
                          text: "Here is the list of winners:",
                          labelColor: Colors.black,
                          fontSize: 14,
                          fontweight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        oorprogram(),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Image.asset(
                            "assets/newImages/img1.png",
                            height: 290,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FormLabel(
                          text:
                              "Merck Foundation launched ‘Stay at Home’ Media Recognition Awards in partnership with African First Ladies of African First Ladies of Ghana, Nigeria, Democratic Republic of Congo (DRC), Malawi, Namibia, Niger, Guinea Conakry, Burundi, Central African Republic (C.A.R.), Chad, Zimbabwe, Zambia, The Gambia, Liberia and Congo Brazzaville, Angola, Mali, Mozambique for English, French, Portuguese and Arabic Speaking African countries.",
                          labelColor: Colors.black54,
                          fontSize: 14,
                          fontweight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FormLabel(
                          text:
                              "The awards have been also announced for Middle Eastern, Asian countries and in Spanish & Portuguese for Latin American Countries. The theme of the awards is ‘Raising Awareness on how to Stay Safe and Keep Physically and Mentally Healthy during Coronavirus Lockdown with the aim to separate facts from myths and misconceptions.'",
                          labelColor: Colors.black54,
                          fontSize: 14,
                          fontweight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Image.asset(
                            "assets/newImages/img1.png",
                            height: 290,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FormLabel(
                          text:
                              "Click here to download call for application for English Speaking African Countries",
                          labelColor: Colors.black54,
                          fontSize: 14,
                          fontweight: FontWeight.w500,
                          textAlignment: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // RichText(
                        //   textAlign: TextAlign.justify,
                        //   text: TextSpan(
                        //     children: [
                        //       TextSpan(
                        //         text: "Theme:",
                        //         style: TextStyle(
                        //           color: Colors.black,
                        //           fontSize: 14,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //       TextSpan(
                        //         text:
                        //             "‘Raising Awareness on how to Stay Safe and Keep Physically and Mentally Healthy during Coronavirus Lockdown with the aim to separate facts from myths and misconceptions.'",
                        //         style: TextStyle(
                        //           color: Colors.black54,
                        //           fontSize: 14,
                        //           fontWeight: FontWeight.w500,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        //need some text gere
                        Html(
                          data:
                              """<p><b>Theme:</b> ‘Raising Awareness on how to Stay Safe and Keep Physically and Mentally Healthy during Coronavirus Lockdown with the aim to separate facts from myths and misconceptions.'</p>
			<h5>Who can apply?</h5>
			<p>Journalists from print, online, radio and multimedia platforms.</p>
			<h5>Last date of submission:</h5>
			<p>Entries can be submitted till <b>30th June 2020.</b></p>
			<p>The last date of submission for Latin American Countries is <b>31st August 2020</b></p>
			<p>The last date of submission for Asian Countries is <b>31st August 2020 </b></p>
			<p>Submitted entries must be published in a public domain before the deadline.</p>
			<p>Please share the evidence through submitting link / scanned copy of the print copy with your submission.</p>
			<h5>How to apply?</h5>
			<p>Entries can be submitted via email to: <a href="mailto:info@merck-foundation.com">info@merck-foundation.com</a></p>
			Asian Countries and Latin America can submit applications on: <a href="mailto:submit@merck-foundation.com">submit@merck-foundation.com</a>  """,
                          onLinkTap: (url) {
                            print("Opening $url...");
                          },
                          // style: {
                          //   "body": Style(
                          //     fontSize: FontSize(
                          //         ResponsiveFlutter.of(context).fontSize(2.2)),
                          //     fontWeight: FontWeight.w600,
                          //     color: Customcolor.pink_col,
                          //   ),
                          // },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Image.asset(
                            "assets/newImages/img1.png",
                            height: 290,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FormLabel(
                          text:
                              "Click here to download call for application for English Speaking African Countries",
                          labelColor: Colors.black54,
                          fontSize: 14,
                          fontweight: FontWeight.w500,
                          textAlignment: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FormLabel(
                          text:
                              "Special awards will be selected for young emerging talents who are able to show outstanding potential through their submissions on regular basis.",
                          labelColor: Colors.black54,
                          fontSize: 14,
                          fontweight: FontWeight.w500,
                          textAlignment: TextAlign.start,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // FormLabel(
                        //   text:
                        //       "Special awards will be selected for young emerging talents who are able to show outstanding potential through their submissions on regular basis.",
                        //   labelColor: Colors.black54,
                        //   fontSize: 14,
                        //   fontweight: FontWeight.w500,
                        //   textAlignment: TextAlign.start,
                        // ),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "Merck Foundation together with its partners (The First Ladies of Africa and Journalist societies and Associations ) announce the calls for applications for the",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text:
                                    " ‘STAY AT HOME’ Media Recognition Awards ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "through a public press release address to African Media as well as through the Merck Foundation and partners’ website and social media channels.",
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
                          height: 20,
                        ),
                        Center(
                          child: Image.asset(
                            "assets/newImages/img1.png",
                            height: 290,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: FormLabel(
                            text:
                                "Click here to download call for application for Portuguese Speaking African Countries",
                            labelColor: Colors.black54,
                            fontSize: 14,
                            fontweight: FontWeight.w500,
                            textAlignment: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Image.asset(
                            "assets/newImages/img1.png",
                            height: 290,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: FormLabel(
                            text:
                                "Click here to Download Call for Application for Latin America English version",
                            labelColor: Colors.black54,
                            fontSize: 14,
                            fontweight: FontWeight.w500,
                            textAlignment: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Image.asset(
                            "assets/newImages/img1.png",
                            height: 290,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: FormLabel(
                            text:
                                "Click here to Download Call for Application for Latin America Spanish version",
                            labelColor: Colors.black54,
                            fontSize: 14,
                            fontweight: FontWeight.w500,
                            textAlignment: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Center(
                          child: Image.asset(
                            "assets/newImages/img1.png",
                            height: 290,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: FormLabel(
                            text:
                                "Click here to Download Call for Application for Latin America Portuguese version",
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
                          text: "“STAY at HOME” Media Recognition Committee:",
                          labelColor: Colors.black,
                          fontSize: 14,
                          fontweight: FontWeight.w500,
                          textAlignment: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FormLabel(
                          text:
                              "The committee is formed to select the winners in an unbiased manner, based on evaluating the quality of information included to sensitize the communities about about Coronavirus and sensitize communities how to stay safe and keep Healthy physical and Mentally during coronavirus lockdown or restricted movement in a way that regular community member can comprehend.",
                          labelColor: Colors.black54,
                          fontSize: 14,
                          fontweight: FontWeight.w500,
                          textAlignment: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Center(
                          child: Image.asset(
                            "assets/newImages/img1.png",
                            height: 290,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: FormLabel(
                            text:
                                "Click here to download call for application for Asian Countries",
                            labelColor: Colors.black54,
                            fontSize: 14,
                            fontweight: FontWeight.w500,
                            textAlignment: TextAlign.center,
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
//text goes here
                        Html(
                          data: """<h5>Selection Committee:</h5>

			<h5>Chaired by:</h5>
			<p>Dr. Rasha Kelej</p>
			<p>CEO of Merck Foundation and President of Merck More than a Mother</p>
					<h5>Members:</h5>
			<p>Leonard Saika</p>
			<p>Merck Foundation Program Senior Director</p>
				<p>Mehak Handa</p>
			<p>Merck Foundation Communication Manager</p>
			<p>Kanaga Janani Chandrasekaran</p>
			<p>Merck Foundation Community Awareness Coordinator</p>
			<p>Linda Aryeetey</p>
			<p>Merck Foundation Communication and Community Awareness Manager</p> """,
                          onLinkTap: (url) {
                            print("Opening $url...");
                          },
                          // style: {
                          //   "body": Style(
                          //     fontSize: FontSize(
                          //         ResponsiveFlutter.of(context).fontSize(2.2)),
                          //     fontWeight: FontWeight.w600,
                          //     color: Customcolor.pink_col,
                          //   ),
                          // },
                        ),
                        Center(
                          child: Image.asset(
                            "assets/newImages/img1.png",
                            height: 290,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: FormLabel(
                            text:
                                "Click here to download call for application for Middle Eastern Countries",
                            labelColor: Colors.black54,
                            fontSize: 14,
                            fontweight: FontWeight.w500,
                            textAlignment: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "Winners will be notified personally via email, followed by a press release for public announcement and on the Merck Foundation and partners website and social media channels ",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: "by the end of July 2020.",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
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
}

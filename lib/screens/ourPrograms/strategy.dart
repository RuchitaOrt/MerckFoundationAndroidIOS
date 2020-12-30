import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';

import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';

import 'package:responsive_flutter/responsive_flutter.dart';

class StrategyDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OurProgramstrategyState();
  }
}

class OurProgramstrategyState extends State<StrategyDetails> {
  List paravalue = [
    "Creating a culture shift to de-stigmatize infertility and to respect and appreciate infertile women in Africa.",
    "Raising awareness about infertility prevention, management and male infertility by integrating it into healthcare infrastructure that already exists, such as HIV, maternal health and mother and child programs.",
    "Education and training for African embryologists and fertility specialists since the lack of trained and skilled staff is a big challenge.",
    "Building advocacy and open dialogue and working closely with partners that are African First Ladies, Ministries of Health, Education, Information & Communication, Gender, Academia, Research Institutions, media and art in building healthcare capacity and addressing health, social & economic challenges in developing countries and under-served communities.",
    "Empowering infertile and childless women socially and economically through access to information, health and change of mindset and empower women who cannot be treated anymore, through starting a small business for them to enable them to lead independent and happier lives through Empowering Berna project."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: InnerCustomAppBar(
        onTapval: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Dashboard(index: 1,)));
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
              text: "Strategy",
              labelColor: Customcolor.text_blue,
              fontweight: FontWeight.w800,
              fontSize: ResponsiveFlutter.of(context).fontSize(2),
            ),
            SizedBox(
              height: 10,
            ),
            FormLabel(
              text:
                  "The Strategy of Merck More Than a Mother has been clearly define as below:",
              labelColor: Customcolor.text_blue,
              fontweight: FontWeight.w500,
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
    );
  }
}

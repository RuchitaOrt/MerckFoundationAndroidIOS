import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/customHorizontalCard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class MerckFertility extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MerckFertilityState();
  }
}

class MerckFertilityState extends State<MerckFertility> {
  List images = [
    "assets/images/slider1.jpg",
    "assets/images/slider2.jpg",
    "assets/images/slider1.jpg"
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
              text: "Merck Embryology & Fertility Training",
              labelColor: Customcolor.text_blue,
              fontweight: FontWeight.w600,
              fontSize: ResponsiveFlutter.of(context).fontSize(2),
            ),
            SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                  text: "Through ",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: ResponsiveFlutter.of(context).fontSize(1.9),
                    fontWeight: FontWeight.w400,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: "Merck More Than a Mother",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: ResponsiveFlutter.of(context).fontSize(2.0),
                          fontWeight: FontWeight.w700,
                        )),
                    TextSpan(
                        text:
                            " initiative, Merck Foundation has collaborated with Asian Fertility experts to establish a platform of Fertility and Embryology specialist in Africa and Asia.",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: ResponsiveFlutter.of(context).fontSize(1.9),
                          fontWeight: FontWeight.w400,
                        )),
                  ]),
            ),
            SizedBox(
              height: 15,
            ),
            RichText(
              text: TextSpan(
                  text: '${"Merck Fertility & Embryology Training Program"}',
                  style: TextStyle(
                    color: Customcolor.colorPink,
                    fontWeight: FontWeight.w500,
                    fontSize: ResponsiveFlutter.of(context).fontSize(2.0),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            " was launched in 2016 as part of Merck More Than a Mother. Under this program, Merck Foundation has been providing hands-on practical training to candidates from Africa and Asia, in partnership with the Indonesian Reproductive Science Institute (IRSI), Indonesia; International Institute for Training and Research in Reproductive Health (IIRRH), India; Manipal Academy of Higher Education (MAHE), India and Indira IVF Hospitals, India.",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: ResponsiveFlutter.of(context).fontSize(1.9),
                          fontWeight: FontWeight.w400,
                        )),
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            FormLabel(
              text:
                  "Through this program, Merck Foundation is making history in many African and Asian countries where they never had fertility specialists or specialized fertility clinics before ‘Merck More Than a Mother’ intervention, to train the first fertility specialists such as; in Sierra Leone, Liberia, The Gambia, Niger, Chad, Guinea, Ethiopia, Myanmar and Uganda.",
              labelColor: Colors.black87,
              fontweight: FontWeight.w400,
              fontSize: ResponsiveFlutter.of(context).fontSize(1.9),
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                  text: "So far, ",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: ResponsiveFlutter.of(context).fontSize(2.0),
                    fontWeight: FontWeight.w400,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "Merck Foundation has provided for more than 180+ candidates, clinical and practical training for fertility specialists and embryologists in more than 35 countries across Africa and Asia",
                      style: TextStyle(
                        color: Customcolor.colorPink,
                        fontWeight: FontWeight.w500,
                        fontSize: ResponsiveFlutter.of(context).fontSize(2.0),
                      ),
                    ),
                    TextSpan(
                        text:
                            " such as: Bangladesh, Benin, Burkina Faso, Burundi, Cameroon, Chad, CAR, Cote D'IVOIRE, DRC, Congo Brazzaville, Ethiopia, Ghana, Guinea, Kenya, Malaysia, Liberia, Mali, Myanmar, Namibia, Nepal, Nigeria, Niger, Philippines, Russia, Rwanda, Senegal, Sierra Leone, Sri Lanka, The Gambia, Togo, Tanzania, Uganda, Zambia & Zimbabwe.",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: ResponsiveFlutter.of(context).fontSize(2.0),
                          fontWeight: FontWeight.w400,
                        )),
                  ]),
            ),
            SizedBox(
              height: 10,
            ),
            FormLabel(
              text:
                  "There is an increasing need for knowledge in the treatment and management of fertility issues at primary care level with increasing in the demand for fertility services and IVF treatment in the hands of the specialist with time. Hence Merck Foundation has introduced 1 Year Online Postgraduate Diploma in Sexual & Reproductive Medicine to advance the knowledge of healthcare professionals in sexual and reproductive medicine that will facilitate decision-making in unpredictable and/or complex situations at primary care level",
              labelColor: Colors.black87,
              fontweight: FontWeight.w400,
              fontSize: ResponsiveFlutter.of(context).fontSize(1.9),
            ),
            SizedBox(
              height: 20,
            ),
            FormLabel(
              text:
                  "Eligibility criteria & overview of one- year online diploma in sexual & reproductive medicine",
              labelColor: Customcolor.colorPink,
              fontweight: FontWeight.w600,
              fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset(
              "assets/newImages/poster_4.png",
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset(
              "assets/newImages/poster_6.png",
            ),
            SizedBox(
              height: 20,
            ),
            FormLabel(
              text:
                  "Eligibility criteria & overview of one- year online diploma in sexual & reproductive medicine",
              labelColor: Customcolor.colorPink,
              fontweight: FontWeight.w600,
              fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset(
              "assets/newImages/poster_6.png",
            ),
            SizedBox(
              height: 20,
            ),
            FormLabel(
              text:
                  "Eligibility criteria & overview of one- year online diploma in sexual & reproductive medicine",
              labelColor: Customcolor.colorPink,
              fontweight: FontWeight.w600,
              fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset(
              "assets/newImages/poster_6.png",
            ),
            SizedBox(
              height: 20,
            ),
            CustomHorizontalCard(
                index: 1,
                cardImage: "assets/newImages/gallery.png",
                cardTitle:
                    "Watch below some of the latest videos of Dr. Rasha kelej and first ladies of Africa. Ambassadars of Merck More than a Mother",
                titleColor: Customcolor.colorPink,
                titleImg: "assets/newImages/flowers-3.png",
                subTitle:
                    "Message Form Dr.Rasha Kelej, on the inauguration..."),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                FormLabel(
                  text: "Alumini Testimonials",
                  labelColor: Customcolor.colorPink,
                  fontSize: 18,
                  fontweight: FontWeight.w700,
                  maxLines: 2,
                ),
                SizedBox(
                  width: 7,
                ),
                Image.asset(
                  'assets/newImages/flowers-3.png',
                  width: 40,
                  height: 40,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Container(
                height: 140,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 0, right: 8),
                      child: Container(
                        height: SizeConfig.blockSizeVertical * 15,
                        width: SizeConfig.blockSizeHorizontal * 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, bottom: 3, left: 8, right: 8),
                              child: Container(
                                // height: 220,
                                width: 100,
                                decoration: BoxDecoration(
                                  //color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        "assets/newImages/message.png",
                                      )),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 12,
                                  ),
                                  FormLabel(
                                    text: "Dr.Nihad Salifu",
                                    labelColor: Customcolor.colorPink,
                                    fontSize: 17,
                                    fontweight: FontWeight.w700,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  FormLabel(
                                    text: "Paediatric Medical Oncology Fellow",
                                    labelColor: Colors.black87,
                                    fontSize: 13,
                                    fontweight: FontWeight.w600,
                                    maxLines: 2,
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  FormLabel(
                                    text:
                                        "We believe that empowering women through education is an important factor in promoting the economic well-being of Africans.",
                                    labelColor: Colors.black54,
                                    fontSize: 13,
                                    fontweight: FontWeight.w500,
                                    maxLines: 5,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 9,
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

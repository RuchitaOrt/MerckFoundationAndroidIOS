import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:merckfoundation22dec/widget/customHorizontalCard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class Merckstemprogram extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MerckstemprogramState();
  }
}

class MerckstemprogramState extends State<Merckstemprogram> {
  int _current = 0;
  List _productsAvailable = [
    "assets/images/slider1.jpg",
    "assets/images/slider2.jpg",
    "assets/images/slider1.jpg",
    "assets/images/slider2.jpg"
  ];
  CarouselSlider carouselSlider;

  bool iscall = true;
  bool islibrary = false;
  bool ismeck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InnerCustomAppBar(
        onTapval: () {
          Navigator.pop(context);
        },
        index: 2,
        title: "Our Programs",
        titleImg: "assets/newImages/flowers-1.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: ListView(
          shrinkWrap: true,
          //  crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: slider(context),
            ),
            SizedBox(
              height: 9,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: FormLabel(
                text: "Merck Stem Program",
                labelColor: Customcolor.colorPink,
                fontweight: FontWeight.w700,
                fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: FormLabel(
                text:
                    "Together we empower women and youth in science and technology",
                labelColor: Customcolor.text_blue,
                fontweight: FontWeight.w500,
                fontSize: ResponsiveFlutter.of(context).fontSize(2),
              ),
            ),
            SizedBox(
              height: 9,
            ),
            Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 20,
                ),
                child: FormLabel(
                  text:
                      "We believe that empowering women through education is an important factor in promoting the economic well-being of Africans. Many literatures have shown that there are strong links between educating women and girls and positive outcomes for economic empowerment, social mobility and maternal health. It is also believed that women’s unemployment in a nation’s workforce is a waste of valuable human capital that has a negative impact on economic prosperity and national development.",
                  labelColor: Customcolor.text_darkgrey,
                  fontSize: ResponsiveFlutter.of(context).fontSize(2.0),
                )),
            Padding(
                padding: const EdgeInsets.only(left: 15, right: 20, top: 18),
                child: FormLabel(
                  text:
                      "Our STEM program (Science, Technology, Engineering and Mathematics) partners with global and local institutions and organizations to empower women and young people in the areas of science and technology. We see education as an important factor in promoting economic well-being in Africa.",
                  labelColor: Customcolor.text_darkgrey,
                  fontSize: ResponsiveFlutter.of(context).fontSize(2.0),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: FormLabel(
                text:
                    "As a part of Merck Foundation STEM Program for women and youth",
                labelColor: Customcolor.text_blue,
                fontweight: FontWeight.w500,
                fontSize: ResponsiveFlutter.of(context).fontSize(2),
              ),
            ),
            SizedBox(
              height: 9,
            ),
            Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 20,
                ),
                child: FormLabel(
                  text:
                      "We believe that empowering women through education is an important factor in promoting the economic well-being of Africans. Many literatures have shown that there are strong links between educating women and girls and positive outcomes for economic empowerment, social mobility and maternal health. It is also believed that women’s unemployment in a nation’s workforce is a waste of valuable human capital that has a negative impact on economic prosperity and national development.",
                  labelColor: Customcolor.text_darkgrey,
                  fontSize: ResponsiveFlutter.of(context).fontSize(2.0),
                )),
            Padding(
                padding: const EdgeInsets.only(left: 15, right: 20, top: 18),
                child: FormLabel(
                  text:
                      "Our STEM program (Science, Technology, Engineering and Mathematics) partners with global and local institutions and organizations to empower women and young people in the areas of science and technology. We see education as an important factor in promoting economic well-being in Africa.",
                  labelColor: Customcolor.text_darkgrey,
                  fontSize: ResponsiveFlutter.of(context).fontSize(2.0),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Wrap(
                      runAlignment: WrapAlignment.center,
                      alignment: WrapAlignment.start,
                      spacing: 5.0,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              iscall = true;
                              islibrary = false;
                              ismeck = false;
                            });
                          },
                          child: Chip(
                            backgroundColor: iscall
                                ? Customcolor.pinkbg.withOpacity(0.2)
                                : Colors.transparent,
                            label: Text("Call for Application",
                                style: TextStyle(
                                    color: iscall ? Colors.black : Colors.grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14)),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Customcolor.pink_col),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              iscall = false;
                              islibrary = true;
                              ismeck = false;
                            });
                          },
                          child: Chip(
                              backgroundColor: islibrary
                                  ? Customcolor.pinkbg.withOpacity(0.2)
                                  : Colors.transparent,
                              label: Text("Digital Library",
                                  style: TextStyle(
                                      color: islibrary
                                          ? Colors.black
                                          : Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14)),
                              shape: islibrary
                                  ? RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Customcolor.pink_col),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)))
                                  : null),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              iscall = false;
                              islibrary = false;
                              ismeck = true;
                            });
                          },
                          child: Chip(
                              backgroundColor: ismeck
                                  ? Customcolor.pinkbg.withOpacity(0.2)
                                  : Colors.transparent,
                              label: Text(
                                  "Merck More Than A Mother Ambassadors",
                                  style: TextStyle(
                                      color:
                                          ismeck ? Colors.black : Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14)),
                              shape: ismeck
                                  ? RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Customcolor.pink_col),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)))
                                  : null),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Material(
                elevation: 5.0,
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      iscall
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Text(
                                  "Upcoming Events",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                )),
                                Image.asset(
                                  "assets/newImages/expand_more.png",
                                  width: 30,
                                  height: 30,
                                )
                              ],
                            )
                          : Container(),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        margin: EdgeInsets.all(10.0),
                        height: 340,
                        child: iscall
                            ? Swiper.children(
                                autoplay: false,
                                loop: true,
                                // pagination: SwiperPagination(
                                //   margin: EdgeInsets.only(
                                //     right: 25.0,
                                //   ),
                                //   builder: DotSwiperPaginationBuilder(
                                //       color: Colors.grey),
                                // ),
                                control: SwiperControl(
                                    iconNext: Icons.arrow_forward_ios,
                                    iconPrevious: Icons.arrow_back_ios,
                                    size: 20),
                                children: <Widget>[
                                  Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                            right: 40.0,
                                            left: 30,
                                          ),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              child: Image.asset(
                                                "assets/newImages/cfa1.png",
                                                height: 300,
                                                fit: BoxFit.fill,
                                              ))),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text("UNESCO-MARS 2020",
                                          style: TextStyle(
                                            fontSize: 17,
                                          ))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                            right: 40.0,
                                            left: 30,
                                          ),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              child: Image.asset(
                                                "assets/newImages/cfa1.png",
                                                height: 300,
                                                fit: BoxFit.fill,
                                              ))),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text("UNESCO-MARS 2020",
                                          style: TextStyle(
                                            fontSize: 17,
                                          ))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                            right: 40.0,
                                            left: 30,
                                          ),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              child: Image.asset(
                                                "assets/newImages/cfa1.png",
                                                height: 300,
                                                fit: BoxFit.fill,
                                              ))),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text("UNESCO-MARS 2020",
                                          style: TextStyle(
                                            fontSize: 17,
                                          ))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                            right: 40.0,
                                            left: 30,
                                          ),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              child: Image.asset(
                                                "assets/newImages/cfa1.png",
                                                height: 300,
                                                fit: BoxFit.fill,
                                              ))),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text("UNESCO-MARS 2020",
                                          style: TextStyle(
                                            fontSize: 17,
                                          ))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                            right: 40.0,
                                            left: 30,
                                          ),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              child: Image.asset(
                                                "assets/newImages/cfa1.png",
                                                height: 300,
                                                fit: BoxFit.fill,
                                              ))),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text("UNESCO-MARS 2020",
                                          style: TextStyle(
                                            fontSize: 17,
                                          ))
                                    ],
                                  ),
                                ],
                              )
                            :
                            //http://ortlx.com/demo/merck-foundation/demo1/img/cta1.jpg

                            islibrary
                                ? Swiper.children(
                                    autoplay: false,
                                    loop: true,
                                    // pagination: SwiperPagination(
                                    //   margin: EdgeInsets.only(
                                    //     right: 25.0,
                                    //   ),
                                    //   builder: DotSwiperPaginationBuilder(
                                    //       color: Colors.grey),
                                    // ),
                                    control: SwiperControl(
                                      iconNext: Icons.arrow_forward_ios,
                                      iconPrevious: Icons.arrow_back_ios,
                                    ),
                                    children: <Widget>[
                                      Column(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(
                                                right: 40.0,
                                                left: 30,
                                              ),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  child: Image.asset(
                                                    "assets/newImages/cfa1.png",
                                                    height: 300,
                                                    fit: BoxFit.fill,
                                                  ))),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text("UNESCO-MARS 2020",
                                              style: TextStyle(
                                                fontSize: 17,
                                              ))
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(
                                                right: 40.0,
                                                left: 30,
                                              ),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  child: Image.asset(
                                                    "assets/newImages/cfa1.png",
                                                    height: 300,
                                                    fit: BoxFit.fill,
                                                  ))),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text("UNESCO-MARS 2020",
                                              style: TextStyle(
                                                fontSize: 17,
                                              ))
                                        ],
                                      ),
                                    ],
                                  )
                                : Swiper.children(
                                    autoplay: false,
                                    loop: true,
                                    control: SwiperControl(
                                        iconNext: Icons.arrow_forward_ios,
                                        iconPrevious: Icons.arrow_back_ios,
                                        size: 20),
                                    children: <Widget>[
                                      Column(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(
                                                right: 40.0,
                                                left: 30,
                                              ),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  child: Image.asset(
                                                    "assets/newImages/cfa1.png",
                                                    height: 300,
                                                    fit: BoxFit.fill,
                                                  ))),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text("UNESCO-MARS 2020",
                                              style: TextStyle(
                                                fontSize: 17,
                                              ))
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(
                                                right: 40.0,
                                                left: 30,
                                              ),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  child: Image.asset(
                                                    "assets/newImages/cfa1.png",
                                                    height: 300,
                                                    fit: BoxFit.fill,
                                                  ))),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text("UNESCO-MARS 2020",
                                              style: TextStyle(
                                                fontSize: 17,
                                              ))
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(
                                                right: 40.0,
                                                left: 30,
                                              ),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  child: Image.asset(
                                                    "assets/newImages/cfa1.png",
                                                    height: 300,
                                                    fit: BoxFit.fill,
                                                  ))),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text("UNESCO-MARS 2020",
                                              style: TextStyle(
                                                fontSize: 17,
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: CustomHorizontalCard(
                  index: 1,
                  cardImage: "assets/newImages/gallery.png",
                  cardTitle: "Our Videos",
                  titleColor: Customcolor.text_blue,
                  titleImg: "assets/newImages/flowers-3.png",
                  subTitle:
                      "Message Form Dr.Rasha Kelej, on the inauguration..."),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: CustomHorizontalCard(
                  index: 1,
                  cardImage: "assets/newImages/gallery.png",
                  cardTitle: "Photo Gallery",
                  titleColor: Customcolor.text_blue,
                  titleImg: "assets/newImages/flowers-3.png",
                  subTitle:
                      "Message Form Dr.Rasha Kelej, on the inauguration..."),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: CustomHorizontalCard(
                  index: 1,
                  cardImage: "assets/newImages/gallery.png",
                  cardTitle: "Our Newsletters",
                  titleColor: Customcolor.text_blue,
                  titleImg: "assets/newImages/flowers-3.png",
                  subTitle:
                      "Message Form Dr.Rasha Kelej, on the inauguration..."),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
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
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Container(
                    height: 140,
                    child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        text:
                                            "Paediatric Medical Oncology Fellow",
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
                Center(
                  child: Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "Read All",
                        style: TextStyle(
                            color: Customcolor.colorBlue,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
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

  Widget slider(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              child: carouselSlider = CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  height: 200,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: _productsAvailable.map((product) {
                  return new Builder(
                    builder: (BuildContext context) {
                      return new Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(product), fit: BoxFit.cover)),
                        width: SizeConfig.blockSizeHorizontal * 100,
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            new DotsIndicator(
              dotsCount: _productsAvailable.length,
              position: double.parse("$_current"),
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeColor: Customcolor.colorPink,
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

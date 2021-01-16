import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';

class Ouraward extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ourawardState();
  }
}

class ourawardState extends State<Ouraward> {
  List awardlist = [
    "Stay At Home Media Recognization Awards 2020",
    "Merck more than a mother Recognization Awards",
    "Merck more than a mother Fashion Award"
  ];
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

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
                          index: 0,
                        )));
          },
          index: 1,
          title: "Our Awards",
          titleImg: "assets/nsewImages/news_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        body: ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: [
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              itemCount: awardlist.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 6),
                  child: GestureDetector(
                    onTap: () {},
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 0, left: 10, right: 10, top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              awardlist[index],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Customcolor.pink_col,
                                  fontSize:
                                      ResponsiveFlutter.of(context).fontSize(2),
                                  fontWeight: FontWeight.w500),
                              maxLines: 4,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 110,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Text(
                                        "Read More",
                                        style: TextStyle(
                                            color: Customcolor.text_darkblue,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  "assets/images/trophy.png",
                                  width: 70,
                                  height: 70,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 60, right: 60, top: 20, bottom: 10),
              child: Image.asset(
                "assets/newImages/flowers_footer.png",
              ),
            ),
          ],
        ));
  }
}

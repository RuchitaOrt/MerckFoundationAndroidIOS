import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';

class NewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewsState();
  }
}

class NewsState extends State<NewsPage> {
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
          title: "News Article",
          titleImg: "assets/newImages/news_logo.png",
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
              itemCount: 7,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 6),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8, left: 10, right: 10, top: 8),
                      child: Column(
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRect(
                                child: Image.asset(
                                  "assets/images/slider1.jpg",
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "Jackline Mwende, Merck More Than A Mother Heroine from Kenya shares her story",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Customcolor.colorblack,
                                          fontSize:
                                              ResponsiveFlutter.of(context)
                                                  .fontSize(1.8),
                                          fontWeight: FontWeight.w500),
                                      maxLines: 4,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
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

// Padding(
//                 padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
//                 child: Stack(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         left: 30,
//                       ),
//                       child: Card(
//                        // height: 100,
//                         // decoration: BoxDecoration(
//                         //     color: Colors.grey[100],
//                         //     border:
//                         //         Border.all(width: 1, color: Colors.grey[200])),

//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5)
//                         ),
//                         elevation: 5,
//                         child: Container(
//                           height: 100,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 50),
//                             child: Center(
//                               child: Text(
//                                 "Jackline Mwende, Merck More Than A Mother Heroine from Kenya shares her story Jackline Mwende, Merck More Than A Mother Heroine",
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: ResponsiveFlutter.of(context)
//                                         .fontSize(1.8),
//                                     fontWeight: FontWeight.w300),
//                                 maxLines: 4,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 17),
//                       child: Container(
//                         height: 70,
//                         width: 70,

//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(0),
//                             image: DecorationImage(
//                                 image: AssetImage("assets/images/g1.jpg"))),
//                         // child: Image.asset("assets/images/g.png", ),
//                       ),
//                     ),
//                   ],
//                 ),

//                 // Row(
//                 //   children: [
//                 //     Image.asset(
//                 //         "assets/images/g1.jpg",
//                 //         height: 80,width: 80,
//                 //         fit: BoxFit.fill,
//                 //       ),

//                 //       SizedBox(
//                 //         width: 20,
//                 //       ),

//                 //    Expanded(
//                 //                     child: Text(
//                 //                       "Jackline Mwende, Merck More Than A Mother Heroine from Kenya shares her story",
//                 //                       overflow: TextOverflow.ellipsis,
//                 //                       style: TextStyle(
//                 //                           color: Colors.black54,
//                 //                           fontSize: ResponsiveFlutter.of(context)
//                 //                               .fontSize(1.8),
//                 //                           fontWeight: FontWeight.w500),
//                 //                       maxLines: 2,
//                 //                     ),
//                 //    ),

//                 //   ],
//                 // ),
//              // );

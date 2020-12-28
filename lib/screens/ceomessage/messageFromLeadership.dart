import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:merckfoundation22dec/widget/sizeConfig.dart';

class PagewiseListViewExample extends StatelessWidget {
  static const int PAGE_SIZE = 5;

  @override
  Widget build(BuildContext context) {
    return PagewiseListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        pageSize: PAGE_SIZE,
        itemBuilder: this._itemBuilder,
        pageFuture: (pageIndex) =>
            BackendService.getPosts(pageIndex * PAGE_SIZE, PAGE_SIZE));
  }

  Widget _itemBuilder(context, PostModel entry, _) {
    return Container(
      width: SizeConfig.blockSizeHorizontal * 100,
      child: ListView(
        children: [
          Container(
              height: 300,
              width: double.infinity,
              child:
                  Image.asset("assets/images/slider1.jpg", fit: BoxFit.cover)),
          Container(
            // margin:
            //     EdgeInsets.fromLTRB(16.0, 250.0, 16.0, 16.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Prof. Dr. Frank Stangenberg-Haverkamp",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 10.0),
                Text(
                  "Chairman of Board of Trustees of Merck Foundation",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0),
                Text(
                  "Chairman of Executive Board and Family Board, E. Merck KG",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0),
                Divider(),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "We at Merck, the world’s oldest pharmaceutical and chemical company, know that acting responsibly is key for long-time entrepreneurial success. Therefore, we do a lot for the communities in which we operate in.\n\nI strongly believe that it is crucial to have a real economic transformation with a social dimension that will ensure not only all basic needs but quality of life for everyone. This can never be achieved except with capacity building and the empowerment of women and youth.\n\nThe size and complexity of the task is so large that no single organization can manage on its own, so integration of effort is necessary to realize our vision for a world where everyone can lead healthy and fulﬁlling lives. The private sector has an important role as partner with governments, academia and communities; it is time to take an action now.\n\nTherefore, we will consolidate many of our centrally driven corporate responsibility activities under one single roof: the Merck Foundation. This new philanthropic organization will allow us to considerably expand the scope, reach and effectiveness of our projects. It puts us in a better position to address some of the most pressing health, social and economic challenges of the 21st century.\n\nWe strongly believe that together we can make a signiﬁcant contribution towards the Sustainable Development Goals. With Merck Foundation, our long term commitment to the communities in which we operate will remain strong and consistent as it was throughout generations.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BackendService {
  static Future<List<PostModel>> getPosts(offset, limit) async {
    final responseBody = (await http.get(
            'http://jsonplaceholder.typicode.com/posts?_start=$offset&_limit=$limit'))
        .body;

    // The response body is an array of items
    return PostModel.fromJsonList(json.decode(responseBody));
  }

  static Future<List<ImageModel>> getImages(offset, limit) async {
    final responseBody = (await http.get(
            'http://jsonplaceholder.typicode.com/photos?_start=$offset&_limit=$limit'))
        .body;

    // The response body is an array of items.
    return ImageModel.fromJsonList(json.decode(responseBody));
  }
}

class PostModel {
  String title;
  String body;

  PostModel.fromJson(obj) {
    this.title = obj['title'];
    this.body = obj['body'];
  }

  static List<PostModel> fromJsonList(jsonList) {
    return jsonList.map<PostModel>((obj) => PostModel.fromJson(obj)).toList();
  }
}

class ImageModel {
  String title;
  String id;
  String thumbnailUrl;

  ImageModel.fromJson(obj) {
    this.title = obj['title'];
    this.id = obj['id'].toString();
    this.thumbnailUrl = obj['thumbnailUrl'];
  }

  static List<ImageModel> fromJsonList(jsonList) {
    return jsonList.map<ImageModel>((obj) => ImageModel.fromJson(obj)).toList();
  }
}

class Messs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(height: 900, child: PagewiseListViewExample()),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:merckfoundation22dec/screens/dashboard.dart';
// import 'package:merckfoundation22dec/widget/customappbar.dart';
// import 'package:merckfoundation22dec/widget/customcolor.dart';
// import 'package:merckfoundation22dec/widget/formLabel.dart';
// import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
// import 'package:responsive_flutter/responsive_flutter.dart';

// class MessagefromLeadership extends StatelessWidget {
//   static final String path = "lib/src/pages/blog/article2.dart";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: InnerCustomAppBar(
//         onTapval: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (BuildContext context) => Dashboard(
//                         index: 0,
//                       )));
//         },
//         index: 2,
//         title: "Our Programs",
//         titleImg: "assets/newImages/flowers-1.png",
//         trallingImg1: "assets/newImages/share.png",
//         trallingImg2: "assets/newImages/search.png",
//         height: 85,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             FormLabel(
//               text: "Message From Leadership Team",
//               labelColor: Customcolor.colorPink,
//               fontSize: ResponsiveFlutter.of(context).fontSize(2),
//               fontweight: FontWeight.bold,
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Container(
//               margin: EdgeInsets.all(10.0),
//               height: 640,
//               child: ListView.builder(
//                   //scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) {
//                 return Container(
//                   child: Stack(
//                     children: <Widget>[
//                       Container(
//                           height: 300,
//                           width: double.infinity,
//                           child: Image.asset("assets/images/slider1.jpg",
//                               fit: BoxFit.cover)),
//                       Container(
//                         // margin:
//                         //     EdgeInsets.fromLTRB(16.0, 250.0, 16.0, 16.0),
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(5.0)),
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text(
//                               "Prof. Dr. Frank Stangenberg-Haverkamp",
//                               textAlign: TextAlign.center,
//                               style: Theme.of(context).textTheme.title,
//                             ),
//                             SizedBox(height: 10.0),
//                             Text(
//                               "Chairman of Board of Trustees of Merck Foundation",
//                               textAlign: TextAlign.center,
//                             ),
//                             SizedBox(height: 10.0),
//                             Text(
//                               "Chairman of Executive Board and Family Board, E. Merck KG",
//                               textAlign: TextAlign.center,
//                             ),
//                             SizedBox(height: 10.0),
//                             Divider(),
//                             SizedBox(
//                               height: 10.0,
//                             ),
//                             SizedBox(
//                               height: 10.0,
//                             ),
//                             Text(
//                               "We at Merck, the world’s oldest pharmaceutical and chemical company, know that acting responsibly is key for long-time entrepreneurial success. Therefore, we do a lot for the communities in which we operate in.\n\nI strongly believe that it is crucial to have a real economic transformation with a social dimension that will ensure not only all basic needs but quality of life for everyone. This can never be achieved except with capacity building and the empowerment of women and youth.\n\nThe size and complexity of the task is so large that no single organization can manage on its own, so integration of effort is necessary to realize our vision for a world where everyone can lead healthy and fulﬁlling lives. The private sector has an important role as partner with governments, academia and communities; it is time to take an action now.\n\nTherefore, we will consolidate many of our centrally driven corporate responsibility activities under one single roof: the Merck Foundation. This new philanthropic organization will allow us to considerably expand the scope, reach and effectiveness of our projects. It puts us in a better position to address some of the most pressing health, social and economic challenges of the 21st century.\n\nWe strongly believe that together we can make a signiﬁcant contribution towards the Sustainable Development Goals. With Merck Foundation, our long term commitment to the communities in which we operate will remain strong and consistent as it was throughout generations.",
//                               textAlign: TextAlign.justify,
//                             ),
//                             SizedBox(height: 10.0),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               }),
//             )
//             // ListView.builder(
//             //   physics: ScrollPhysics(),
//             //   shrinkWrap: true,
//             //   //   AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
//             //   //scrollDirection: Axis.horizontal,
//             //   itemCount: 2,
//             //   itemBuilder: (context, index) {
//             //     return Container(
//             //       child: Stack(
//             //         children: <Widget>[
//             //           Container(
//             //               height: 300,
//             //               width: double.infinity,
//             //               child: Image.asset("assets/images/g1.jpg",
//             //                   fit: BoxFit.cover)),
//             //           Container(
//             //             margin: EdgeInsets.fromLTRB(16.0, 250.0, 16.0, 16.0),
//             //             decoration: BoxDecoration(
//             //                 color: Colors.white,
//             //                 borderRadius: BorderRadius.circular(5.0)),
//             //             padding: const EdgeInsets.all(16.0),
//             //             child: Column(
//             //               crossAxisAlignment: CrossAxisAlignment.start,
//             //               children: <Widget>[
//             //                 Text(
//             //                   "Prof. Dr. Frank Stangenberg-Haverkamp",
//             //                   textAlign: TextAlign.center,
//             //                   style: Theme.of(context).textTheme.title,
//             //                 ),
//             //                 SizedBox(height: 10.0),
//             //                 Text(
//             //                   "Chairman of Board of Trustees of Merck Foundation",
//             //                   textAlign: TextAlign.center,
//             //                 ),
//             //                 SizedBox(height: 10.0),
//             //                 Text(
//             //                   "Chairman of Executive Board and Family Board, E. Merck KG",
//             //                   textAlign: TextAlign.center,
//             //                 ),
//             //                 SizedBox(height: 10.0),
//             //                 Divider(),
//             //                 SizedBox(
//             //                   height: 10.0,
//             //                 ),
//             //                 SizedBox(
//             //                   height: 10.0,
//             //                 ),
//             //                 Text(
//             //                   "We at Merck, the world’s oldest pharmaceutical and chemical company, know that acting responsibly is key for long-time entrepreneurial success. Therefore, we do a lot for the communities in which we operate in.\n\nI strongly believe that it is crucial to have a real economic transformation with a social dimension that will ensure not only all basic needs but quality of life for everyone. This can never be achieved except with capacity building and the empowerment of women and youth.\n\nThe size and complexity of the task is so large that no single organization can manage on its own, so integration of effort is necessary to realize our vision for a world where everyone can lead healthy and fulﬁlling lives. The private sector has an important role as partner with governments, academia and communities; it is time to take an action now.\n\nTherefore, we will consolidate many of our centrally driven corporate responsibility activities under one single roof: the Merck Foundation. This new philanthropic organization will allow us to considerably expand the scope, reach and effectiveness of our projects. It puts us in a better position to address some of the most pressing health, social and economic challenges of the 21st century.\n\nWe strongly believe that together we can make a signiﬁcant contribution towards the Sustainable Development Goals. With Merck Foundation, our long term commitment to the communities in which we operate will remain strong and consistent as it was throughout generations.",
//             //                   textAlign: TextAlign.justify,
//             //                 ),
//             //                 SizedBox(height: 10.0),
//             //               ],
//             //             ),
//             //           ),
//             //         ],
//             //       ),
//             //     );
//             //   },
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

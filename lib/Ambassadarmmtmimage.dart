import 'dart:io';

import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:merckfoundation22dec/utility/ResponsiveFlutter.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';

import 'widget/botttomlink.dart';
//TODO:
//index == 0 (MiddleArea from getHomeAPI -> View More in Photo Gallery)

class AmbassadarmmtmImagePage extends StatefulWidget {
  List<dynamic>? photosList;
  int? index;
  dynamic baseURL;
  dynamic appBarTitle;

  AmbassadarmmtmImagePage({Key? key, this.photosList, this.index, this.baseURL})
      : super(key: key);
  @override
  _PhotoGalleryPageState createState() => _PhotoGalleryPageState();
}

class _PhotoGalleryPageState extends State<AmbassadarmmtmImagePage> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InnerCustomAppBar(
        onTapval: () {
          Navigator.pop(context);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (BuildContext context) => Dashboard(
          //               index: 0,
          //             )));
        },
        index: 1,
        title: 'Merck Foundation "More Than A Mother" Ambassadors',
        titleImg: "assets/newImages/news_logo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      backgroundColor: Customcolor.background,
      body: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          GridView.count(
              primary: false,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              padding: const EdgeInsets.all(5),
              crossAxisSpacing: 0,
              mainAxisSpacing: 2,
              crossAxisCount: 2,
              childAspectRatio: 0.85,
              children: widget.photosList!.map((photo) {
                // if (widget.index == 0) {
                print(widget.baseURL + photo.photo);
                return GestureDetector(
                  onTap: () {
                    ShowDialogs.showImageDialog(
                      context: context,
                      image: widget.baseURL + photo.photo,
                      description: photo.photoDescription,
                    );
                  },
                  child: Card(
                    color: Colors.white,
                    elevation: 10,
                    // height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: SizeConfig.blockSizeVertical * 18,
                          margin: EdgeInsets.all(5),
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/newImages/placeholder_3.jpg',
                            image: widget.baseURL + photo.photo,
                            fit: BoxFit.fill,
                            height: SizeConfig.blockSizeVertical * 18,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          photo.photoDescription,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(1.4),
                              fontWeight: FontWeight.w500),
                          maxLines: 3,
                        ),
                        SizedBox(
                          height: 2,
                        )
                      ],
                    ),
                  ),
                  // photoWidget(
                  //     imageurl: widget.baseURL + photo.photo,
                  //     title: photo.photoDescription,
                  //     categpryID: photo.photoCategoryId),
                );
              }).toList()),
          SizedBox(
            height: 10,
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
          ),
          Bottomcardlink(),
        ],
      ),
    );
  }

  // Widget photoWidget({String imageurl, String title, String categpryID}) {
  //   return GestureDetector(
  //     onTap: () {
  //       // getphotodetail(categpryID);
  //     },
  //     child: Card(
  //       color: Colors.white,
  //       elevation: 10,
  //       // height: 300,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Container(
  //             height: 160,
  //             margin: EdgeInsets.all(5),
  //             child: FadeInImage.assetNetwork(
  //               placeholder: 'assets/newImages/placeholder_3.jpg',
  //               image: imageurl,
  //               fit: BoxFit.fill,
  //               height: 160,
  //             ),
  //           ),
  //           SizedBox(
  //             height: 5,
  //           ),
  //           Text(
  //             title,
  //             textAlign: TextAlign.center,
  //             overflow: TextOverflow.ellipsis,
  //             style: TextStyle(
  //                 color: Colors.black,
  //                 fontSize: ResponsiveFlutter.of(context).fontSize(1.4),
  //                 fontWeight: FontWeight.w500),
  //             maxLines: 3,
  //           ),
  //           SizedBox(
  //             height: 10,
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

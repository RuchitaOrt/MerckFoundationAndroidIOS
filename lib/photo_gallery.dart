import 'dart:io';

import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/model/our_gallery_detail_response.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/screens/our_gallery_detail.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';

//TODO:
//index == 0 (MiddleArea from getHomeAPI -> View More in Photo Gallery)

class PhotoGalleryPage extends StatefulWidget {
  List<dynamic> photosList;
  int index;
  String baseURL;
  String appBarTitle;

  PhotoGalleryPage({Key key, this.photosList, this.index, this.baseURL})
      : super(key: key);
  @override
  _PhotoGalleryPageState createState() => _PhotoGalleryPageState();
}

class _PhotoGalleryPageState extends State<PhotoGalleryPage> {
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
        index: 2,
        sharelink: Constantstring.photogalleryviewall,
        title: "Photo Gallery",
        titleImg: "assets/newImages/news_logo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      backgroundColor: Customcolor.background,
      body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(5),
          crossAxisSpacing: 0,
          mainAxisSpacing: 2,
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          children: widget.photosList.map((photo) {
            if (widget.index == 0) {
              print(widget.baseURL + photo.photo);
              return photoWidget(
                  imageurl: widget.baseURL + photo.photo,
                  title: photo.photoCatgName,
                  categpryID: photo.photoCategoryId);
            }
          }).toList()),
    );
  }

  Widget photoWidget({String imageurl, String title, String categpryID}) {
    return GestureDetector(
      onTap: () {
        getphotodetail(categpryID);
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
              //  height: 160,
              width: SizeConfig.blockSizeHorizontal * 100,
              height: SizeConfig.blockSizeVertical * 19,
              margin: EdgeInsets.all(5),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/newImages/placeholder_3.jpg',
                image: imageurl,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: ResponsiveFlutter.of(context).fontSize(1.4),
                  fontWeight: FontWeight.w500),
              maxLines: 2,
            ),
            SizedBox(
              height: 2,
            )
          ],
        ),
      ),
    );
  }

  getphotodetail(String categoryID) async {
    var status1 = await ConnectionDetector.checkInternetConnection();
    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);
      final json = {
        'category_id': categoryID,
      };
      print(json);
      APIManager().apiRequest(context, API.ourgallerydetail, (response) async {
        OurGalleryDetailsResponse resp = response;
        print(response);
        print('Resp : $resp');
        Navigator.of(_keyLoader.currentContext).pop();
        if (resp.success == "True".toLowerCase()) {
          setState(() {
            print(resp.list);
            // GlobalLists.awarddetallisting[0].title
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => OurGalleryDetailsPage(
                          categoryID: categoryID,
                          galleryDetailsResponse: resp,
                        )));
          });
        } else {
          ShowDialogs.showToast(resp.msg);
        }
      }, (error) {
        print('ERR msg is $error');
        Navigator.of(_keyLoader.currentContext).pop();
      }, jsonval: json);
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

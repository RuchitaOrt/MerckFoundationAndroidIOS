import 'dart:io';

import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';

// ignore: must_be_immutable
class GalleryProgram extends StatefulWidget {
  final List<dynamic> photosList;

  final String baseURL;
  String appBarTitle;

  GalleryProgram({Key key, this.photosList, this.baseURL}) : super(key: key);
  @override
  _GalleryProgramState createState() => _GalleryProgramState();
}

class _GalleryProgramState extends State<GalleryProgram> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  @override
  void initState() {
    // TODO: implement initState
    print(widget.photosList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        childAspectRatio: Platform.isIOS ? 0.86 : 0.8,
        children: List.generate(widget.photosList.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 2.0),
            child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(1),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    ShowDialogs.showImageDialog(
                      context: context,
                      image: widget.baseURL + widget.photosList[index].photo,
                      description: widget.photosList[index].photoDescription,
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    width: SizeConfig.blockSizeHorizontal * 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: SizeConfig.blockSizeHorizontal * 100,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              // border: Border.all(
                              //   width: 1,
                              // ),
                              image: new DecorationImage(
                                image: new NetworkImage(widget.baseURL +
                                    widget.photosList[index].photo),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            widget.photosList[index].photoDescription,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize:
                                    ResponsiveFlutter.of(context).fontSize(1.4),
                                fontWeight: FontWeight.w500),
                            maxLines: 3,
                          ),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                )),
          );
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videoplayer.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';

class Stories extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StoriesState();
  }
}

class StoriesState extends State<Stories> {
  List _productsAvailable = [
    "assets/images/slider1.jpg",
    "assets/images/slider1.jpg",
    "assets/images/slider2.jpg",
    "assets/images/slider1.jpg",
    "assets/images/slider1.jpg"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  InnerCustomAppBar(
        onTapval: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Dashboard(index: 0,)));
        },
        index: 1,
        title: "Video Library",
        titleImg: "assets/newImages/flowers-1.png",
        trallingImg1: "assets/newImages/share.png",
       trallingImg2: "assets/newImages/search.png",

       
        height: 85,
      ),
        backgroundColor: Customcolor.background,
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5),
                child: FormLabel(
                  text: "Our Stories",
                  labelColor: Customcolor.colorblack,
                  fontSize: ResponsiveFlutter.of(context).fontSize(2),
                  maxLines: 2,
                  fontweight: FontWeight.w800,
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(_productsAvailable.length, (index) {
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          VideoPlayer()));
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
                                      width:
                                          SizeConfig.blockSizeHorizontal * 100,
                                      height: 120,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          // border: Border.all(
                                          //   width: 1,
                                          // ),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  _productsAvailable[index]),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                  // FormLabel(
                                  //   text:
                                  //       "Jackline Mwende, Merck More Than A Mother Heroine from Kenya shares her story",
                                  //   labelColor: Customcolor.colorBlue,
                                  //   fontfamily: 'Roboto',
                                  //   fontweight: FontWeight.w700,
                                  //   //   overflow: TextOverflow.ellipsis,
                                  //   fontSize:
                                  //       ResponsiveFlutter.of(context).fontSize(1.7),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      "Jackline Mwende, Merck More Than A Mother Heroine from Kenya shares her story",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                              ResponsiveFlutter.of(context)
                                                  .fontSize(1.4),
                                          fontWeight: FontWeight.w500),
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    );
                  }),
                ),
              ),
            ],
          ),
        ));
  }
}

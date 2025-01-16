import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videoplayer.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:merckfoundation22dec/widget/slidercontainer.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/filterdrawer.dart';

class Videofilter extends StatefulWidget {
  final String apptitle;
  final int filterindex;
  const Videofilter({Key key, this.apptitle, this.filterindex})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return VideofilterState();
  }
}

class VideofilterState extends State<Videofilter> {
  List _productsAvailable = [
    "assets/images/slider1.jpg",
    "assets/images/slider1.jpg",
    "assets/images/slider2.jpg",
    "assets/images/slider1.jpg",
    "assets/images/slider1.jpg",
    "assets/images/slider1.jpg",
    "assets/images/slider1.jpg",
  ];

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  final GlobalKey<ScaffoldState> _scaffoldKey1 = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey1,
        endDrawer: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Colors.white, primaryColor: Colors.white),
          child: AppDrawerfilter(
            index: widget.filterindex,
          ),
        ),
        appBar: InnerCustomAppBar(
          onTapvalfilter: () {
            print("videokk");
            // _scaffoldKey1.currentState.openDrawer();
            _scaffoldKey1.currentState.openEndDrawer();
          },
          onTapval: () {
            Navigator.pop(context);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => Dashboard(
            //               index: 0,
            //             )));
          },
          //index: 1,
          index: 2,
          forfilterindes: 4,
          trallingImg1: "assets/newImages/share.png",
          sharelink: widget.filterindex == 1
              ? Constantstring.sharevideolibrary
              : widget.filterindex == 2
                  ? Constantstring.sharestories
                  : widget.filterindex == 3
                      ? Constantstring.sharemerckmedia
                      : Constantstring.sharestories,
          // forfilterindes: 3,
          title: widget.apptitle,
          titleImg: "assets/newImages/ourstoriesLogo.png",
         // trallingImg1: "assets/newImages/filter.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        backgroundColor: Customcolor.background,
        body: Stack(
          children: [
            ListView(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalLists.filterdatalisting.length <= 0
                    ? Container(
                        child: Center(child: Text(Constantstring.emptyData)),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                      child: GridView.count(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          crossAxisCount: 2,
                          childAspectRatio: 0.9,
                          children: List.generate(
                              GlobalLists.filterdatalisting.length, (index) {
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
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (BuildContext context) =>
                                      //             VideoPlayer(
                                      //               videoUrl: GlobalLists
                                      //                   .filterdatalisting[index]
                                      //                   .videoLink,
                                      //             )));
                                      var storykey = GlobalLists
                                          .filterdatalisting[index].videoLink
                                          .substring(GlobalLists
                                                  .filterdatalisting[index]
                                                  .videoLink
                                                  .length -
                                              11);
                                      ShowDialogs.youtubevideolink(
                                          "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          color: Colors.transparent,
                                          width:
                                              SizeConfig.blockSizeHorizontal * 50,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Container(
                                                  width: SizeConfig
                                                          .blockSizeHorizontal *
                                                      100,
                                                  height:
                                                      SizeConfig.blockSizeVertical *
                                                          15,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(5),
                                                    // border: Border.all(
                                                    //   width: 1,
                                                    // ),
                                                    image: new DecorationImage(
                                                      image: new NetworkImage(
                                                          'https://img.youtube.com/vi/${GlobalLists.filterdatalisting[index].videoLink.substring(GlobalLists.filterdatalisting[index].videoLink.length - 11)}/mqdefault.jpg'),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Text(
                                                  GlobalLists
                                                      .filterdatalisting[index]
                                                      .videoDesc,
                                                  textAlign: TextAlign.center,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize:
                                                          ResponsiveFlutter.of(
                                                                  context)
                                                              .fontSize(1.4),
                                                      fontWeight: FontWeight.w500),
                                                  maxLines: 3,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                            ],
                                          ),
                                        ),
                                        PauseImage()
                                      ],
                                    ),
                                  )),
                            );
                          }),
                        ),
                    ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 60, right: 60, top: 20, bottom: 10),
                //   child: Image.asset(
                //     "assets/newImages/flowers_footer.png",
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 0, left: 0),
                //   child: Align(
                //     alignment: Alignment.topRight,
                //     child: Image.asset(
                //       "assets/newImages/flowers_footer.png",
                //       height: 170,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // )


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
                      height: 40,
                    ),
                  
              ],
            ),
          Align(alignment: Alignment.bottomCenter,
          child:   Bottomcardlink(),)
          
          ],
        ));
  }
}

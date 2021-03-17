import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/filterdrawer.dart';
import 'package:url_launcher/url_launcher.dart';

class WatchmoreVideolibrary extends StatefulWidget {
  final List<dynamic> videoList;

  final String baseURL;

  const WatchmoreVideolibrary({Key key, this.videoList, this.baseURL})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return VideolibraryState();
  }
}

class VideolibraryState extends State<WatchmoreVideolibrary> {
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
            index: 1,
          ),
        ),
        appBar: InnerCustomAppBar(
          onTapvalfilter: () {
            print("videokk");
            // _scaffoldKey1.currentState.openDrawer();
            _scaffoldKey1.currentState.openEndDrawer();
          },
          onTapval: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Dashboard(
                          index: 0,
                        )));
          },
          index: 2,
          forfilterindes: 3,
          title: "Videos",
          titleImg: "assets/newImages/ourstoriesLogo.png",
          trallingImg1: "assets/newImages/filter.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        backgroundColor: Customcolor.background,
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ListView(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5),
                child: FormLabel(
                  text: "Videos",
                  labelColor: Customcolor.colorblack,
                  fontSize: ResponsiveFlutter.of(context).fontSize(2),
                  maxLines: 2,
                  fontweight: FontWeight.w800,
                ),
              ),
              GlobalLists.videolibrary.length <= 0
                  ? Container(
                      child: Center(child: Text(Constantstring.emptyData)),
                    )
                  : GridView.count(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      children: List.generate(widget.videoList.length, (index) {
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
                                  //                   .videolibrary[index]
                                  //                   .videoLink,
                                  //             )));
                                  var storykey = widget
                                      .videoList[index].videoLink
                                      .substring(widget.videoList[index]
                                              .videoLink.length -
                                          11);
                                  _launchInWebViewWithJavaScript(
                                      "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  width: SizeConfig.blockSizeHorizontal * 50,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  100,
                                          height: 120,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // border: Border.all(
                                            //   width: 1,
                                            // ),
                                            image: new DecorationImage(
                                              image: new NetworkImage(
                                                  'https://img.youtube.com/vi/${widget.videoList[index].videoLink.substring(widget.videoList[index].videoLink.length - 11)}/mqdefault.jpg'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          widget.videoList[index].videoDesc,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  ResponsiveFlutter.of(context)
                                                      .fontSize(1.4),
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
              // Padding(
              //   padding: const EdgeInsets.only(
              //       left: 60, right: 60, top: 20, bottom: 10),
              //   child: Image.asset(
              //     "assets/newImages/flowers_footer.png",
              //   ),
              // ),
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
              )
            ],
          ),
        ));
  }

  Future<void> _launchInWebViewWithJavaScript(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}

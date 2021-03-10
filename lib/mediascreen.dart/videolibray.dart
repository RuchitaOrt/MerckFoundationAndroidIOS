import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videoplayer.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/model/videoLibraryResponse.dart';
import 'package:merckfoundation22dec/widget/filterdrawer.dart';
import 'package:merckfoundation22dec/model/CountrylistResponse.dart';
import 'package:merckfoundation22dec/model/CategorylistResponse.dart';
import 'package:url_launcher/url_launcher.dart';

class Videolibrary extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VideolibraryState();
  }
}

class VideolibraryState extends State<Videolibrary> {
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

    getvideolibray();
    getcountrylist();
    getcategorylist();
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
          title: "Video Library",
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
                  text: "Video Library",
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
                      children: List.generate(GlobalLists.videolibrary.length,
                          (index) {
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
                                  var storykey = GlobalLists
                                      .videolibrary[index].videoLink
                                      .substring(GlobalLists.videolibrary[index]
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
                                                  'https://img.youtube.com/vi/${GlobalLists.videolibrary[index].videoLink.substring(GlobalLists.videolibrary[index].videoLink.length - 11)}/mqdefault.jpg'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          GlobalLists
                                              .videolibrary[index].videoDesc,
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

  getvideolibray() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.videoLibrary,
        (response) async {
          GetVideoLibraryResponse resp = response;
          print(response);
          print('Resp : $resp');

          Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.videolibrary = resp.data.list;
            });
          } else {
            ShowDialogs.showToast(resp.msg);
          }
        },
        (error) {
          print('ERR msg is $error');
          Navigator.of(_keyLoader.currentContext).pop();
        },
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }

  getcountrylist() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      // ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.countrylist,
        (response) async {
          CountrylistResponse resp = response;
          print(response);
          print('Resp : $resp');

          //  Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.countrylisting = resp.data.list;
            });
          } else {
            ShowDialogs.showToast(resp.msg);
          }
        },
        (error) {
          print('ERR msg is $error');
          // Navigator.of(_keyLoader.currentContext).pop();
        },
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
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

  getcategorylist() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      // ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.categoryList,
        (response) async {
          CategorylistResponse resp = response;
          print(response);
          print('Resp : $resp');

          //  Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.categorylisting = resp.data.list;
            });
          } else {
            ShowDialogs.showToast(resp.msg);
          }
        },
        (error) {
          print('ERR msg is $error');
          // Navigator.of(_keyLoader.currentContext).pop();
        },
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

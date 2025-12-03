import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videoplayer.dart';
import 'package:merckfoundation22dec/model/getStoriesResponse.dart';
import 'package:merckfoundation22dec/model/videoLibraryResponse.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:merckfoundation22dec/widget/slidercontainer.dart';
import 'package:merckfoundation22dec/utility/ResponsiveFlutter.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/filterdrawer.dart';
import 'package:merckfoundation22dec/model/CountrylistResponse.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:merckfoundation22dec/model/CategorylistResponse.dart';
import 'package:merckfoundation22dec/model/getStoriesResponse.dart'
    as storiesResp;

class Stories extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StoriesState();
  }
}

class StoriesState extends State<Stories> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final GlobalKey<ScaffoldState> _scaffoldKey1 = new GlobalKey<ScaffoldState>();
  ScrollController _sc = new ScrollController();
  late GetStoriesResponse resp;
  int totalcount = 10;
  int page = 10;
  int offset = 0;
  bool _isLoading = true;
  late double ratio;
  @override
  void initState() {
    // TODO: implement initState
    GlobalLists.storiesList.clear();
    getStories();
    getcountrylist();
    getcategorylist();
    _sc = new ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    //   print("scroll");
    if (_sc.position.extentAfter < 50) {
      if (!_isLoading && totalcount > GlobalLists.storiesList.length) {
        // getNewsLetteranArticles();
        setState(() {
          _isLoading = true;
        });
        Future.delayed(const Duration(seconds: 2), () {
// Here you can write your code

          setState(() {
            // Here you can write your code for open new view
            _isLoading = false;
            if (resp.success == "True") {
              setState(() {
                print("here");
                // list = new List();
                // list = resp.data.list;
                //totalcount 10

                for (int i = offset; i < totalcount; i++) {
                  setState(() {
                    GlobalLists.storiesList.add(storiesResp.ListElement(
                        id: resp.data!.list![i].id,
                        videoDesc: resp.data!.list![i].videoDesc,
                        videoLink: resp.data!.list![i].videoLink,
                        countryId: resp.data!.list![i].countryId,
                        categoryId: resp.data!.list![i].categoryId,
                        year: resp.data!.list![i].status));
                  });

                  // GlobalLists.newsLettersList.add(resp.data.list);
                }

                offset = totalcount;
                int remem = resp.data!.list!.length - totalcount;
                print("remem");
                print(remem);
                if (remem < 10) {
                  totalcount = totalcount + remem;
                } else {
                  totalcount = totalcount + 10;
                }
                // // GlobalLists.newsLettersList = resp.data.list;
                // Constantstring.baseUrl = resp.baseUrl;
                print("-----------------------------------");
                print(totalcount);
                //    print(GlobalLists.newsLettersList.length);
              });

              setState(() {
                _isLoading = false;
              });
            } else {
              ShowDialogs.showToast(resp.msg!);
              setState(() {
                _isLoading = false;
              });
            }
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ratio = MediaQuery.of(context).size.width /
        (MediaQuery.of(context).size.height / 1.3);
    return Scaffold(
        key: _scaffoldKey1,
        endDrawer: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Colors.white, primaryColor: Colors.white),
          child: AppDrawerfilter(
            index: 2,
          ),
        ),
        appBar: InnerCustomAppBar(
          onTapvalfilter: () {
            print("videokk");
            // _scaffoldKey1.currentState.openDrawer();
            _scaffoldKey1.currentState!.openEndDrawer();
          },
          onTapval: () {
            //  Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Dashboard(
                          index: 0,
                        )));
          },
          index: 2,
          forfilterindes: 4,
          sharelink: Constantstring.sharestories,
          title: "Stories",
          titleImg: "assets/newImages/ourstoriesLogo.png",
          trallingImg1: "assets/newImages/share.png",
          //trallingImg1: "assets/newImages/filter.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        backgroundColor: Customcolor.background,
        body: ListView(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          controller: _sc,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5),
            //   child: FormLabel(
            //     text: "Our Stories",
            //     labelColor: Customcolor.colorblack,
            //     fontSize: ResponsiveFlutter.of(context).fontSize(2),
            //     maxLines: 2,
            //     fontweight: FontWeight.w800,
            //   ),
            // ),
            (GlobalLists.storiesList.length == 0 && _isLoading)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : (GlobalLists.storiesList.length == 0 && _isLoading == false)
                    ? Center(
                        child: Container(
                          child: Center(child: Text(Constantstring.emptyData)),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ListView(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          children: [
                            GridView.builder(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                //controller: _sc,
                                // crossAxisCount: 2,
                                // childAspectRatio: 0.8,
                                itemCount: GlobalLists.storiesList.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.88,
                                ),
                                itemBuilder: (BuildContext context, index) {
                                  // if (GlobalLists.storiesList.length - 1 == index &&
                                  //     _isLoading) {
                                  //   return Center(
                                  //     child: CircularProgressIndicator(),
                                  //   );
                                  // } else {
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
                                          onTap: () async {
                                            print('tabb in youtube');
                                            var storykey = GlobalLists
                                                .storiesList[index].videoLink!
                                                .substring(GlobalLists
                                                        .storiesList[index]
                                                        .videoLink!
                                                        .length -
                                                    11);
                                            ShowDialogs.youtubevideolink(
                                                "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
                                            // var response = await FlutterShareMe()
                                            //     .openinsta(
                                            //         url:
                                            //             'https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1',
                                            //         msg: "Youtube");
                                            // _launchInWebViewWithJavaScript(
                                            //     "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
                                          },
                                          child: Container(
                                            color: Colors.transparent,
                                            width:
                                                SizeConfig.blockSizeHorizontal *
                                                    50,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        width: SizeConfig
                                                                .blockSizeHorizontal *
                                                            100,
                                                        height: SizeConfig
                                                                .blockSizeVertical *
                                                            15,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          // border: Border.all(
                                                          //   width: 1,
                                                          // ),
                                                          image:
                                                              new DecorationImage(
                                                            image: new NetworkImage(
                                                                'https://img.youtube.com/vi/${GlobalLists.storiesList[index].videoLink!.substring(GlobalLists.storiesList[index].videoLink!.length - 11)}/mqdefault.jpg'),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      PauseImage()
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text(
                                                    GlobalLists
                                                        .storiesList[index]
                                                        .videoDesc!,
                                                    textAlign: TextAlign.center,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize:
                                                            ResponsiveFlutter
                                                                    .of(context)
                                                                .fontSize(1.4),
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    maxLines: 3,
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                              ],
                                            ),
                                          ),
                                        )),
                                  );
                                  //}
                                }
                                // children: List.generate(
                                //     GlobalLists.storiesList.length, (index) {
                                //   return Padding(
                                //     padding: const EdgeInsets.only(right: 2.0),
                                //     child: Card(
                                //         elevation: 2,
                                //         shape: RoundedRectangleBorder(
                                //           borderRadius: BorderRadius.all(
                                //             Radius.circular(1),
                                //           ),
                                //         ),
                                //         child: GestureDetector(
                                //           onTap: () {
                                //             var storykey = GlobalLists
                                //                 .storiesList[index].videoLink
                                //                 .substring(GlobalLists
                                //                         .storiesList[index]
                                //                         .videoLink
                                //                         .length -
                                //                     11);
                                //             _launchInWebViewWithJavaScript(
                                //                 "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
                                //           },
                                //           child: Container(
                                //             color: Colors.transparent,
                                //             width:
                                //                 SizeConfig.blockSizeHorizontal * 50,
                                //             child: Column(
                                //               mainAxisAlignment:
                                //                   MainAxisAlignment.start,
                                //               crossAxisAlignment:
                                //                   CrossAxisAlignment.start,
                                //               children: <Widget>[
                                //                 Padding(
                                //                   padding:
                                //                       const EdgeInsets.all(8.0),
                                //                   child: Container(
                                //                     width: SizeConfig
                                //                             .blockSizeHorizontal *
                                //                         100,
                                //                     height: 120,
                                //                     decoration: BoxDecoration(
                                //                       borderRadius:
                                //                           BorderRadius.circular(5),
                                //                       // border: Border.all(
                                //                       //   width: 1,
                                //                       // ),
                                //                       image: new DecorationImage(
                                //                         image: new NetworkImage(
                                //                             'https://img.youtube.com/vi/${GlobalLists.storiesList[index].videoLink.substring(GlobalLists.storiesList[index].videoLink.length - 11)}/mqdefault.jpg'),
                                //                         fit: BoxFit.cover,
                                //                       ),
                                //                     ),
                                //                   ),
                                //                 ),
                                //                 Padding(
                                //                   padding:
                                //                       const EdgeInsets.all(4.0),
                                //                   child: Text(
                                //                     GlobalLists.storiesList[index]
                                //                         .videoDesc,
                                //                     textAlign: TextAlign.center,
                                //                     overflow: TextOverflow.ellipsis,
                                //                     style: TextStyle(
                                //                         color: Colors.black,
                                //                         fontSize:
                                //                             ResponsiveFlutter.of(
                                //                                     context)
                                //                                 .fontSize(1.4),
                                //                         fontWeight:
                                //                             FontWeight.w500),
                                //                     maxLines: 3,
                                //                   ),
                                //                 ),
                                //                 SizedBox(height: 5),
                                //               ],
                                //             ),
                                //           ),
                                //         )),
                                //   );
                                // }),
                                ),
                            _isLoading
                                ? Center(
                                    child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: CircularProgressIndicator(),
                                  ))
                                : Container()
                          ],
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
        ));
  }

  getStories() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      //ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.getStories,
        (response) async {
          resp = response;
          print(response);
          print('Resp : $resp');

          //   Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              print("here");
              if (resp.data!.list!.length < 10) {
                for (int i = offset; i < resp.data!.list!.length; i++) {
                  setState(() {
                    GlobalLists.storiesList.add(storiesResp.ListElement(
                        id: resp.data!.list![i].id,
                        videoDesc: resp.data!.list![i].videoDesc,
                        videoLink: resp.data!.list![i].videoLink,
                        countryId: resp.data!.list![i].countryId,
                        categoryId: resp.data!.list![i].categoryId,
                        year: resp.data!.list![i].status));
                  });
                }
              } else {
                for (int i = offset; i < totalcount; i++) {
                  setState(() {
                    GlobalLists.storiesList.add(storiesResp.ListElement(
                        id: resp.data!.list![i].id,
                        videoDesc: resp.data!.list![i].videoDesc,
                        videoLink: resp.data!.list![i].videoLink,
                        countryId: resp.data!.list![i].countryId,
                        categoryId: resp.data!.list![i].categoryId,
                        year: resp.data!.list![i].status));
                  });
                }
              }

              offset = totalcount;
              int remem = resp.data!.list!.length - totalcount;
              print("remem");
              print(remem);
              if (remem < 10) {
                totalcount = totalcount + remem;
              } else {
                totalcount = totalcount + 10;
              }

              print(totalcount);
              print(GlobalLists.storiesList.length);
            });

            setState(() {
              _isLoading = false;
            });
          } else {
            setState(() {
              _isLoading = false;
            });
            ShowDialogs.showToast(resp.msg!);
          }
        },
        (error) {
          print('ERR msg is $error');
          setState(() {
            _isLoading = false;
          });
          //    Navigator.of(_keyLoader.currentContext).pop();
        },
      );
    } else {
      setState(() {
        _isLoading = false;
      });
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
              GlobalLists.countrylisting = resp.data!.list!;
            });
          } else {
            ShowDialogs.showToast(resp.msg!);
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

  // Future<void> _launchInWebViewWithJavaScript(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(
  //       url,
  //       forceSafariVC: true,
  //       forceWebView: true,
  //       enableJavaScript: true,
  //     );
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

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
              GlobalLists.categorylisting = resp.data!.list!;
            });
          } else {
            ShowDialogs.showToast(resp.msg!);
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

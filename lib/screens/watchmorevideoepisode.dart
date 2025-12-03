import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';


import 'package:merckfoundation22dec/model/GetEpisodeSeasonwiseResponse.dart';
import 'package:merckfoundation22dec/model/newsLettersArticlesResp.dart';
import 'package:merckfoundation22dec/screens/EpisodeInformation.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/utility/ResponsiveFlutter.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/mediascreen.dart/Detailpage.dart';
import 'package:screenshot/screenshot.dart';

class WatchmoreVideoEpisode extends StatefulWidget {
  final dynamic apiurl;
  final dynamic season;
  final dynamic title;
  const WatchmoreVideoEpisode({Key? key, this.apiurl, this.season, this.title})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return WatchmoreVideoEpisodeState();
  }
}

class WatchmoreVideoEpisodeState extends State<WatchmoreVideoEpisode> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  // List<ListElement> list = [];
  ScrollController _sc = new ScrollController();
  late GetEpisodeSeasonwiseResponse resp;
  int totalcount = 10;
  int page = 10;
  int offset = 0;
  bool _isLoading = true;
  List _productsAvailable = [
    "assets/newImages/img3.jpg",
    "assets/newImages/img4.jpg",
    "assets/newImages/leader1.png",
    "assets/newImages/leader2.png",
    "assets/newImages/img3.jpg",
    "assets/newImages/leader1.png",
    "assets/newImages/leader2.png",
  ];

  @override
  void initState() {
    // TODO: implement initState
    GlobalLists.seasonwiseepisodeList.clear();
    getepisodeseasonwise(widget.apiurl, widget.season);

    //  _sc = new ScrollController()..addListener(_scrollListener);
    super.initState();
  }

//   void _scrollListener() {
//     if (_sc.position.extentAfter < 50) {
//       if (!_isLoading && totalcount > GlobalLists.seasonwiseepisodeList.length) {

//         setState(() {
//           _isLoading = true;
//         });
//         Future.delayed(const Duration(seconds: 2), () {
// // Here you can write your code

//           setState(() {
//             // Here you can write your code for open new view
//             _isLoading = false;
//             if (resp.success == "True") {
//               setState(() {
//                 print("here");
//                 // list = new List();
//                 // list = resp.data.list;
//                 //totalcount 10

//                 for (int i = offset; i < totalcount; i++) {
//                   setState(() {
//                     GlobalLists.seasonwiseepisodeList.add(ListElement(
//                         image: resp.data.list[i].image,
//                         title: resp.data.list[i].title,
//                         id: resp.data.list[i].id,
//                         shortDescription: resp.data.list[i].shortDescription,
//                         details: resp.data.list[i].details,
//                         detailPageUrl: resp.data.list[i].detailPageUrl));
//                   });

//                 }

//                 offset = totalcount;
//                 int remem = resp.data.list.length - totalcount;
//                 print("remem");
//                 print(remem);
//                 if (remem < 10) {
//                   totalcount = totalcount + remem;
//                 } else {
//                   totalcount = totalcount + 10;
//                 }

//                 Constantstring.baseUrl = resp.baseUrl;
//                 print("-----------------------------------");
//                 print(totalcount);
//                 print(GlobalLists.seasonwiseepisodeList.length);
//               });

//               setState(() {
//                 _isLoading = false;
//               });
//             } else {
//               ShowDialogs.showToast(resp.msg);
//               setState(() {
//                 _isLoading = false;
//               });
//             }
//           });
//         });
//       }
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Customcolor.background,
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
          sharelink: Constantstring.sharenewsletter,
          title: widget.title,
          titleImg: "assets/newImages/news_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        body: ListView(
          shrinkWrap: true,
          controller: _sc,
          physics: ScrollPhysics(),
          children: [
            SizedBox(
              height: 10,
            ),
            // (GlobalLists.seasonwiseepisodeList.length == 0 && _isLoading)
            //     ? Center(
            //         child: CircularProgressIndicator(),
            //       )
            //     : (GlobalLists.seasonwiseepisodeList.length == 0
            //     // &&
            //     //         _isLoading == false
            //             )
            //         ? Center(
            //             child: Container(
            //               child: Center(child: Text(Constantstring.emptyData)),
            //             ),
            //           )
            //         :
            ListView.builder(
              itemCount: GlobalLists.seasonwiseepisodeList.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                // if (GlobalLists.seasonwiseepisodeList.length - 1 == index &&
                //     _isLoading) {
                //   return Center(
                //     child: CircularProgressIndicator(),
                //   );
                // } else {

                return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 6),
                  child: GestureDetector(
                    onTap: () {
                      var storykey = GlobalLists
                          .seasonwiseepisodeList[index].videoLink!
                          .substring(GlobalLists.seasonwiseepisodeList[index]
                                  .videoLink!.length -
                              11);
                      ShowDialogs.youtubevideolink(
                          "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
                    },
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8, left: 5, right: 5, top: 8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8, left: 10),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80, //86,
                                          child: FadeInImage.assetNetwork(
                                            placeholder:
                                                'assets/newImages/placeholder_3.jpg',
                                            image:
                                                "https://img.youtube.com/vi/${GlobalLists.seasonwiseepisodeList[index].videoLink!.substring(GlobalLists.seasonwiseepisodeList[index].videoLink!.length - 11)}/mqdefault.jpg",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 25, top: 25),
                                            child: Center(
                                                child: Image.asset(
                                              "assets/newImages/pause.png",
                                              width: 25,
                                              height: 25,
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // ClipRect(
                                //   child: FadeInImage.assetNetwork(
                                //     placeholder:
                                //         'assets/newImages/placeholder_3.jpg',
                                //     image:
                                //      Constantstring.baseUrl +
                                //         GlobalLists
                                //             .seasonwiseepisodeList[index]
                                //             .videoLink,
                                //     fit: BoxFit.cover,
                                //     height: 80,
                                //     width: 80,
                                //   ),
                                // ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        GlobalLists.seasonwiseepisodeList[index]
                                            .episodeName!,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Customcolor.colorblack,
                                            fontSize:
                                                ResponsiveFlutter.of(context)
                                                    .fontSize(1.8),
                                            fontWeight: FontWeight.w500),
                                        maxLines: 4,
                                      ),
                                      //                     Html(
                                      //   data:GlobalLists.seasonwiseepisodeList[index].episodeBrief,

                                      //       onLinkTap:(url) {
                                      //     print("Opening $url...");
                                      //     ShowDialogs.launchURL(url);
                                      //   },
                                      //   style: {
                                      //     "body": Style(textAlign: TextAlign.start,
                                      //      fontSize: FontSize.small,
                                      // fontWeight: FontWeight.w400),
                                      //     "tr": Customcolor.tableboderstyle(context),
                                      //   },

                                      // ),
                                    ],
                                  ),
                                ),
//                                              Row(children: [
// GestureDetector(
//   onTap: ()
//   {
//      showDialog(

//                 context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     contentPadding: EdgeInsets.all(0),
//                     title: Container(child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(0),
//                           child: Text('Episode Information',style: TextStyle(color:Customcolor.colorBlue,fontSize: 20),),
//                         ),
//                          GestureDetector(
//                            onTap: ()
//                            {
//                              Navigator.pop(context);
//                            }
//                            ,
//                            child: Icon(Icons.close)),
//                       ],
//                     ),),
//                     content: ShowDialogs.setupAlertDialoadContainer(context),
//                   );
//                 }
//             );
//   }
//   ,
//   child: Icon(Icons.info_rounded,color: Customcolor.colorBlue,size: 20,)),
// SizedBox(width: 5,),
//                 Image.asset("assets/newImages/share.png",width: 20,height: 20,),
//                 SizedBox(width: 5,),
//               ],),
                                PopupMenuButton<String>(
                                  onSelected: (String val) {
                                    print(val);
                                    handleClick(val, index);
                                  },
                                  //  onSelected: handleClick,
                                  itemBuilder: (BuildContext context) {
                                    return {'Episode Information', 'Share'}
                                        .map((String choice) {
                                      return PopupMenuItem<String>(
                                        value: choice,
                                        child: Text(choice),
                                      );
                                    }).toList();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
                // }
              },
            ),

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
          ],
        ));
  }

  void handleClick(String valu1, int value) {
    switch (valu1) {
      case 'Episode Information':
        print('Hello');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => EpisodeInformation(
                      showbrief:
                          GlobalLists.seasonwiseepisodeList[value].showBrief,
                      episodebrief:
                          GlobalLists.seasonwiseepisodeList[value].episodeBrief,
                      guestinfo:
                          GlobalLists.seasonwiseepisodeList[value].guestInfo,
                      credits: GlobalLists.seasonwiseepisodeList[value].credits,
                      relatednews:
                          GlobalLists.seasonwiseepisodeList[value].relatedNews,
                      photid: GlobalLists
                          .seasonwiseepisodeList[value].photosGalleryIds,
                      episodeid: GlobalLists.seasonwiseepisodeList[value].id,
                    )));
        // showDialog(

        //           context: context,
        //           builder: (BuildContext context) {
        //             return AlertDialog(
        //               contentPadding: EdgeInsets.all(0),
        //               title: Container(child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Padding(
        //                     padding: const EdgeInsets.all(0),
        //                     child: Text('Episode Information',style: TextStyle(color:Customcolor.colorBlue,fontSize: 20),),
        //                   ),
        //                    GestureDetector(
        //                      onTap: ()
        //                      {
        //                        Navigator.pop(context);
        //                      }
        //                      ,
        //                      child: Icon(Icons.close)),
        //                 ],
        //               ),),
        //               content: ShowDialogs.setupAlertDialoadContainer(context),
        //             );
        //           }
        //       );
        break;
      case 'Share':
        ScreenshotController screenshotController = ScreenshotController();
        double imgHeight = 50;
        var sharelink = GlobalLists.seasonwiseepisodeList[value].videoLink;
        showModalBottomSheet<void>(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
          ),
          context: context,
          builder: (BuildContext context) {
            return Screenshot(
              controller: screenshotController,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: FormLabel(
                        text: "Share",
                        labelColor: Customcolor.pink_col,
                        fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
                        fontweight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //
                          GestureDetector(
                            onTap: ()  {
                              print("on tap fb");
                              //changes 6june
                               ShowDialogs.shareToFacebook(sharelink!);
                              //  ShowDialogs.launchFacebook(
                              //  sharelink,
                              //   "550280998481446");
                              // await SocialSharePlugin.shareToFeedFacebookLink(
                              //   quote: "",
                              //   url: sharelink,
                              //   onSuccess: (_) {
                              //     print('FACEBOOK SUCCESS');
                              //     return;
                              //   },
                              //   onCancel: () {
                              //     print('FACEBOOK CANCELLED');
                              //     return;
                              //   },
                              //   onError: (error) {
                              //     print('FACEBOOK ERROR $error');
                              //     return;
                              //   },
                              // );
                            },
                            child: Image.asset(
                              "assets/newImages/facebooknew.png",
                              height: imgHeight,
                              width: imgHeight,
                            ),
                          ),

                          SizedBox(
                            width: 7,
                          ),
                          GestureDetector(
                            onTap: ()  {
                              //changes 6june
                              ShowDialogs.shareToTwitter("Merck Foundation",sharelink!);
                              //   ShowDialogs.launchTwitter(
                              // sharelink);
                              // await SocialSharePlugin.shareToTwitterLink(
                              //     text: "",
                              //     url: sharelink,
                              //     onSuccess: (_) {
                              //       print('TWITTER SUCCESS');
                              //       return;
                              //     },
                              //     onCancel: () {
                              //       print('TWITTER CANCELLED');
                              //       return;
                              //     });
                            },
                            child: Image.asset(
                              "assets/newImages/twitternew.png",
                              height: imgHeight,
                              width: imgHeight,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          GestureDetector(
                            onTap: () async {
                              ShowDialogs.launchLinkdin(sharelink!);
                            },
                            child: Image.asset(
                              "assets/newImages/linkedinnew.png",
                              height: imgHeight,
                              width: imgHeight,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          GestureDetector(
                            onTap: () {
                              ShowDialogs.launchWhatsappshare(sharelink!);

                              // :
                              //  SocialShare
                              //     .shareWhatsapp(
                              //     sharelink,
                              //   ).then((data) {
                              //     print(data);
                              //   });
                            },
                            child: Image.asset(
                              "assets/newImages/whatsappnew.png",
                              height: imgHeight,
                              width: imgHeight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ).whenComplete(() {});

        break;
    }
  }

  getepisodeseasonwise(dynamic api, String season) async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      dynamic jsonbody = "/${season}";
//ShowDialogs.showLoadingDialog(context, _keyLoader);
      setState(() {
        _isLoading = true;
      });
      APIManager().apiRequest(context, api, (response) async {
        setState(() {
          GetEpisodeSeasonwiseResponse resp = response;
          GlobalLists.seasonwiseepisodeList = resp.episodes!;
        });

        //48

        //        Navigator.of(_keyLoader.currentContext).pop();
//commented here
        // if (resp.success == "True") {
        //   setState(() {
        //     print("here");
        //     // list = new List();
        //     // list = resp.data.list;
        //     //totalcount 10
        //     if (resp.data.list.length < 10) {
        //       for (int i = offset; i < resp.data.list.length; i++) {
        //         setState(() {
        //           GlobalLists.seasonwiseepisodeList.add(ListElement(
        //               image: resp.data.list[i].image,
        //               title: resp.data.list[i].title,
        //               id: resp.data.list[i].id,
        //               shortDescription: resp.data.list[i].shortDescription,
        //               details: resp.data.list[i].details,
        //               detailPageUrl: resp.data.list[i].detailPageUrl));
        //         });

        //       }
        //     } else {
        //       for (int i = offset; i < totalcount; i++) {
        //         setState(() {
        //           GlobalLists.seasonwiseepisodeList.add(ListElement(
        //               image: resp.data.list[i].image,
        //               title: resp.data.list[i].title,
        //               id: resp.data.list[i].id,
        //               shortDescription: resp.data.list[i].shortDescription,
        //               details: resp.data.list[i].details,
        //               detailPageUrl: resp.data.list[i].detailPageUrl));
        //         });

        //       }
        //     }

        //     offset = totalcount;
        //     int remem = resp.data.list.length - totalcount;
        //     print("remem");
        //     print(remem);
        //     if (remem < 10) {
        //       totalcount = totalcount + remem;
        //     } else {
        //       totalcount = totalcount + 10;
        //     }

        //     Constantstring.baseUrl = resp.baseUrl;
        //     print("-----------------------------------");
        //     print(totalcount);
        //     print(GlobalLists.seasonwiseepisodeList.length);
        //   });

        //   setState(() {
        //     _isLoading = false;
        //   });
        // } else {
        //   ShowDialogs.showToast(resp.msg);
        //   setState(() {
        //     _isLoading = false;
        //   });
        // }
      }, (error) {
        setState(() {
          _isLoading = false;
        });

        print('ERR msg is $error');
        //  Navigator.of(_keyLoader.currentContext).pop();
      }, path: jsonbody);
    } else {
      setState(() {
        _isLoading = false;
      });
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

// import 'dart:convert';

// import 'package:flutter/material.dart';

// import 'package:merckfoundation22dec/utility/APIManager.dart';
// import 'package:merckfoundation22dec/utility/GlobalLists.dart';
// import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
// import 'package:merckfoundation22dec/widget/customcolor.dart';
// import 'package:merckfoundation22dec/widget/formLabel.dart';
// import 'package:merckfoundation22dec/widget/showdailog.dart';
// import 'package:merckfoundation22dec/widget/sizeConfig.dart';
// import 'package:merckfoundation22dec/widget/slidercontainer.dart';
// import 'package:merckfoundation22dec/utility/ResponsiveFlutter.dart';
// import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
// import 'package:merckfoundation22dec/screens/dashboard.dart';
// import 'package:merckfoundation22dec/widget/filterdrawer.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:merckfoundation22dec/model/AmbassadarVideoviewall.dart';
// import 'package:http/io_client.dart';
// import 'dart:io';

// import 'package:http/http.dart' as http;

// //ambassadar,empowering berna,local song,encology,fellowship,community,merck patient
// class WatchmoreVideoEpisode extends StatefulWidget {
//   final String categoryid;
//   final dynamic api;
//   final String type;
//   final String headertitle;

//   const WatchmoreVideoEpisode(
//       {Key key, this.categoryid, this.api, this.type, this.headertitle})
//       : super(key: key);
//   @override
//   State<StatefulWidget> createState() {
//     return WatchmoreVideoEpisodeState();
//   }
// }

// class WatchmoreVideoEpisodeState extends State<WatchmoreVideoEpisode> {
//   final GlobalKey<State> _keyLoader = new GlobalKey<State>();

//   ScrollController _sc = new ScrollController();
//   AmbassdarvideoResponse resp;
//   int totalcount = 10;
//   int page = 10;
//   int offset = 0;
//   bool _isLoading = true;
//   final GlobalKey<ScaffoldState> _scaffoldKey1 = new GlobalKey<ScaffoldState>();
//   @override
//   void initState() {
//     // TODO: implement initState

//     super.initState();
//     GlobalLists.videoviewmoreambasdarslist.clear();
//     ambasssadarvideoviewmore(widget.categoryid, widget.api, widget.type);
//     _sc = new ScrollController()..addListener(_scrollListener);
//   }

//   void _scrollListener() {
//     //   print("scroll");
//     if (_sc.position.extentAfter < 50) {
//       if (!_isLoading &&
//           totalcount > GlobalLists.videoviewmoreambasdarslist.length) {
//         // getNewsLetteranArticles();
//         setState(() {
//           _isLoading = true;
//         });
//         Future.delayed(const Duration(seconds: 2), () {
// // Here you can write your code

//           setState(() {
//             // Here you can write your code for open new view
//             _isLoading = false;
//             if (resp.success == true) {
//               setState(() {
//                 print("here");
//                 // list = new List();
//                 // list = resp.data.list;
//                 //totalcount 10

//                 setState(() {
//                   for (int i = offset; i < totalcount; i++) {
//                     setState(() {
//                       GlobalLists.videoviewmoreambasdarslist.add(ListElement(
//                           id: resp.list[i].id,
//                           videoDesc: resp.list[i].videoDesc,
//                           videoLink: resp.list[i].videoLink,
//                           countryId: resp.list[i].countryId,
//                           categoryId: resp.list[i].categoryId,
//                           year: resp.list[i].status));
//                     });
//                   }
//                 });

//                 // GlobalLists.newsLettersList.add(resp.data.list);

//                 offset = totalcount;
//                 int remem = resp.list.length - totalcount;
//                 print("remem");
//                 print(remem);
//                 if (remem < 10) {
//                   totalcount = totalcount + remem;
//                 } else {
//                   totalcount = totalcount + 10;
//                 }
//                 // // GlobalLists.newsLettersList = resp.data.list;
//                 // Constantstring.baseUrl = resp.baseUrl;
//                 print("-----------------------------------");
//                 print(totalcount);
//                 //    print(GlobalLists.newsLettersList.length);
//               });

//               setState(() {
//                 _isLoading = false;
//               });
//             } else {
//               //ShowDialogs.showToast(resp.msg);
//               setState(() {
//                 _isLoading = false;
//               });
//             }
//           });
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         key: _scaffoldKey1,
//         // endDrawer: Theme(
//         //   data: Theme.of(context)
//         //       .copyWith(canvasColor: Colors.white, primaryColor: Colors.white),
//         //   child: AppDrawerfilter(
//         //     index: 1,
//         //   ),
//         // ),
//         appBar: InnerCustomAppBar(
//           // onTapvalfilter: () {
//           //   print("videokk");
//           //   // _scaffoldKey1.currentState.openDrawer();
//           //   _scaffoldKey1.currentState.openEndDrawer();
//           // },
//           onTapval: () {
//             Navigator.pop(context);
//             // Navigator.push(
//             //     context,
//             //     MaterialPageRoute(
//             //         builder: (BuildContext context) => Dashboard(
//             //               index: 0,
//             //             )));
//           },
//           index: 1,
//           // forfilterindes: 3,
//           title: widget.headertitle,
//           titleImg: "assets/newImages/ourstoriesLogo.png",
//           trallingImg1: "assets/newImages/share.png",
//           trallingImg2: "assets/newImages/search.png",

//           height: 85,
//         ),
//         backgroundColor: Customcolor.background,
//         body: Padding(
//           padding: const EdgeInsets.only(left: 10, right: 10),
//           child: ListView(
//             physics: ScrollPhysics(),
//             shrinkWrap: true,
//             controller: _sc,
//             //crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               (GlobalLists.videoviewmoreambasdarslist.length == 0 && _isLoading)
//                   ? Center(
//                       child: CircularProgressIndicator(),
//                     )
//                   : (GlobalLists.videoviewmoreambasdarslist.length == 0 &&
//                           _isLoading == false)
//                       ? Center(
//                           child: Container(
//                             child:
//                                 Center(child: Text(Constantstring.emptyData)),
//                           ),
//                         )
//                       : ListView(
//                           shrinkWrap: true,
//                           physics: ScrollPhysics(),
//                           children: [
//                             GridView.count(
//                               shrinkWrap: true,
//                               physics: ScrollPhysics(),
//                               crossAxisCount: 2,
//                               childAspectRatio: 0.95,
//                               children: List.generate(
//                                   GlobalLists.videoviewmoreambasdarslist.length,
//                                   (index) {
//                                 // if (GlobalLists.videoviewmoreambasdarslist.length -
//                                 //             1 ==
//                                 //         index &&
//                                 //     _isLoading) {
//                                 //   return Center(
//                                 //     child: CircularProgressIndicator(),
//                                 //   );
//                                 // } else {
//                                 return Padding(
//                                   padding: const EdgeInsets.only(right: 2.0),
//                                   child: Card(
//                                       elevation: 2,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.all(
//                                           Radius.circular(1),
//                                         ),
//                                       ),
//                                       child: GestureDetector(
//                                         onTap: () {
//                                           var storykey = GlobalLists
//                                               .videoviewmoreambasdarslist[index]
//                                               .videoLink
//                                               .substring(GlobalLists
//                                                       .videoviewmoreambasdarslist[
//                                                           index]
//                                                       .videoLink
//                                                       .length -
//                                                   11);
//                                           ShowDialogs.youtubevideolink(
//                                               "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
//                                           // _launchInWebViewWithJavaScript(
//                                           //     "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
//                                         },
//                                         child: Stack(
//                                           children: [
//                                             Container(
//                                               color: Colors.transparent,
//                                               width: SizeConfig
//                                                       .blockSizeHorizontal *
//                                                   50,
//                                               child: Column(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.start,
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: <Widget>[
//                                                   Padding(
//                                                     padding:
//                                                         const EdgeInsets.all(
//                                                             8.0),
//                                                     child: Container(
//                                                       width: SizeConfig
//                                                               .blockSizeHorizontal *
//                                                           100,
//                                                       height: SizeConfig
//                                                               .blockSizeVertical *
//                                                           15,
//                                                       decoration: BoxDecoration(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(5),
//                                                         // border: Border.all(
//                                                         //   width: 1,
//                                                         // ),
//                                                         image:
//                                                             new DecorationImage(
//                                                           image: new NetworkImage(
//                                                               'https://img.youtube.com/vi/${GlobalLists.videoviewmoreambasdarslist[index].videoLink.substring(GlobalLists.videoviewmoreambasdarslist[index].videoLink.length - 11)}/mqdefault.jpg'),
//                                                           fit: BoxFit.cover,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                     Padding(
//                             padding: const EdgeInsets.only(right: 8, left: 10),
//                             child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 width: SizeConfig.blockSizeHorizontal*17,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 7),
//                   child: Text(
//                     "Episode ${index}",
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 2,
//                     style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.black87,
//                         fontWeight: FontWeight.w500),
//                     // fontSize: 17,
//                     // labelColor: Colors.white,
//                     // fontweight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               Row(children: [
// GestureDetector(
//   onTap: ()
//   {
//      showDialog(

//                 context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     contentPadding: EdgeInsets.all(0),
//                     title: Container(child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(0),
//                           child: Text('Episode Information',style: TextStyle(color:Customcolor.colorBlue,fontSize: 20),),
//                         ),
//                          GestureDetector(
//                            onTap: ()
//                            {
//                              Navigator.pop(context);
//                            }
//                            ,
//                            child: Icon(Icons.close)),
//                       ],
//                     ),),
//                     content: ShowDialogs.setupAlertDialoadContainer(context),
//                   );
//                 }
//             );
//   }
//   ,
//   child: Icon(Icons.info_rounded,color: Customcolor.colorBlue,size: 20,)),
// SizedBox(width: 5,),
//                 Image.asset("assets/newImages/share.png",width: 20,height: 20,),
//                 SizedBox(width: 5,),
//               ],)
//             ],
//           ),
//                           ),
//                                                   // Padding(
//                                                   //   padding:
//                                                   //       const EdgeInsets.all(
//                                                   //           4.0),
//                                                   //   child: Text(
//                                                   //     GlobalLists
//                                                   //         .videoviewmoreambasdarslist[
//                                                   //             index]
//                                                   //         .videoDesc,
//                                                   //     textAlign:
//                                                   //         TextAlign.center,
//                                                   //     overflow:
//                                                   //         TextOverflow.ellipsis,
//                                                   //     style: TextStyle(
//                                                   //         color: Colors.black,
//                                                   //         fontSize:
//                                                   //             ResponsiveFlutter
//                                                   //                     .of(
//                                                   //                         context)
//                                                   //                 .fontSize(
//                                                   //                     1.4),
//                                                   //         fontWeight:
//                                                   //             FontWeight.w500),
//                                                   //     maxLines: 3,
//                                                   //   ),
//                                                   // ),
//                                                   SizedBox(height: 5),
//                                                 ],
//                                               ),
//                                             ),
//                                             PauseImage()
//                                           ],
//                                         ),
//                                       )),
//                                 );
//                                 //}
//                               }),
//                             ),
//                             _isLoading
//                                 ? Center(
//                                     child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 10, bottom: 10),
//                                     child: CircularProgressIndicator(),
//                                   ))
//                                 : Container()
//                           ],
//                         ),
//               // Padding(
//               //   padding: const EdgeInsets.only(
//               //       left: 60, right: 60, top: 20, bottom: 10),
//               //   child: Image.asset(
//               //     "assets/newImages/flowers_footer.png",
//               //   ),
//               // ),
//               // Padding(
//               //   padding: const EdgeInsets.only(right: 0, left: 0),
//               //   child: Align(
//               //     alignment: Alignment.topRight,
//               //     child: Image.asset(
//               //       "assets/newImages/flowers_footer.png",
//               //       height: 170,
//               //     ),
//               //   ),
//               // ),
//               // SizedBox(
//               //   height: 10,
//               // )
//             ],
//           ),
//         ));
//   }

//   ambasssadarvideoviewmore(
//       String categoryid, dynamic api, String bodydata) async {
//     var status = await ConnectionDetector.checkInternetConnection();
//     dynamic bodyData;
//     if (status) {
//       if (bodydata == "ambassadar") {
//         bodyData = {
//           'category_id': categoryid,
//         };
//       } else {
//         bodyData = {
//           'catg_id': categoryid,
//         };
//       }

// //APIManager.ambasadarvideoapi
//       // String body = json.encode(bodyData);
//       print(bodyData);
//       var response = await fetchPostWithBodyResponse(
//         api,
//         bodyData,
//       );

//       var res = json.decode(response.body);
//       print("res");
//       print(res);
//       resp = ambassdarvideoResponseFromJson(response.body);
//       if (response.statusCode == 200) {
//         if (res['success'] == true) {
//           // GlobalLists.videoviewmoreambasdarslist = resp.list;
//           if (resp.list.length < 10) {
//             for (int i = offset; i < resp.list.length; i++) {
//               setState(() {
//                 GlobalLists.videoviewmoreambasdarslist.add(ListElement(
//                     id: resp.list[i].id,
//                     videoDesc: resp.list[i].videoDesc,
//                     videoLink: resp.list[i].videoLink,
//                     countryId: resp.list[i].countryId,
//                     categoryId: resp.list[i].categoryId,
//                     year: resp.list[i].status));
//               });
//             }
//           } else {
//             for (int i = offset; i < totalcount; i++) {
//               setState(() {
//                 GlobalLists.videoviewmoreambasdarslist.add(ListElement(
//                     id: resp.list[i].id,
//                     videoDesc: resp.list[i].videoDesc,
//                     videoLink: resp.list[i].videoLink,
//                     countryId: resp.list[i].countryId,
//                     categoryId: resp.list[i].categoryId,
//                     year: resp.list[i].status));
//               });
//             }
//           }

//           offset = totalcount;
//           int remem = resp.list.length - totalcount;
//           print("remem");
//           print(remem);
//           if (remem < 10) {
//             totalcount = totalcount + remem;
//           } else {
//             totalcount = totalcount + 10;
//           }

//           print(totalcount);

//           setState(() {
//             _isLoading = false;
//           });
//         } else {
//           setState(() {
//             _isLoading = false;
//             ShowDialogs.showToast(res['msg']);
//           });
//         }
//       } else {
//         _isLoading = false;
//         ShowDialogs.showToast("Server Not Responding");
//       }
//     } else {
//       setState(() {
//         _isLoading = false;
//         ShowDialogs.showToast("Please check Internet Connection.");
//       });
//     }
//   }

//   Future<void> _launchInWebViewWithJavaScript(String url) async {
//     if (await canLaunch(url)) {
//       await launch(
//         url,
//         forceSafariVC: true,
//         forceWebView: true,
//         enableJavaScript: true,
//       );
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   Future<http.Response> fetchPostWithBodyResponse(
//       String url, dynamic body) async {
//     IOClient ioClient = new IOClient();

//     HttpClient client = new HttpClient();

//     ioClient = new IOClient(client);
//     final response = await ioClient.post(url, body: body);
//     print('pit stop');
//     return response;
//   }
// }

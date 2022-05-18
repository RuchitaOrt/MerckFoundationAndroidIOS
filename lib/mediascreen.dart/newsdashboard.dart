import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/mediascreen.dart/Detailpage.dart';
import 'package:merckfoundation22dec/model/viewmorehomeceoResponse.dart';
import 'dart:convert';

class NewsPageDashboard extends StatefulWidget {
  final dynamic apiurl;

  const NewsPageDashboard({Key key, this.apiurl}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return NewsState();
  }
}

class NewsState extends State<NewsPageDashboard> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  // List<ListElement> list = [];
  ScrollController _sc = new ScrollController();
  Viewmorehomeceo resp;
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
  int pagenoforceo = 1;
  int totallengthofceo;
  @override
  void initState() {
    GlobalLists.homeceoList.clear();
    getNewsLetteranArticles(pagenoforceo);
    // TODO: implement initState
    // GlobalLists.newsLettersList.clear();
    // getNewsLetteranArticles(widget.apiurl);
    // this._gpageetMoreData(page);
//     super.initState();
    // _sc.addListener(() {
    //   // if (_sc.position.pixels == _sc.position.maxScrollExtent) {
    //   //   print(page);
    //   //   if (page < totalcount) {
    //   //     getNewsLetteranArticles();
    //   //   }
    //   // }
    //   getNewsLetteranArticles();
    // });
    _sc = new ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_sc.position.extentAfter < 50) {
      if (!_isLoading) {
        setState(() {
          pagenoforceo = pagenoforceo + 1;
        });
        if (GlobalLists.homeceoList.length < totallengthofceo) {
          getNewsLetteranArticles(pagenoforceo);
        }
      }
//       if (!_isLoading && totalcount > GlobalLists.newsLettersList.length) {
//         // getNewsLetteranArticles();
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
//                     GlobalLists.newsLettersList.add(ListElement(
//                         image: resp.data.list[i].image,
//                         title: resp.data.list[i].title,
//                         id: resp.data.list[i].id,
//                         shortDescription: resp.data.list[i].shortDescription,
//                         details: resp.data.list[i].details,
//                         detailPageUrl: resp.data.list[i].detailPageUrl));
//                   });

//                   // GlobalLists.newsLettersList.add(resp.data.list);

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
//                 // // GlobalLists.newsLettersList = resp.data.list;
//                 Constantstring.baseUrl = resp.baseUrl;
//                 print("-----------------------------------");
//                 print(totalcount);
//                 print(GlobalLists.newsLettersList.length);
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Customcolor.background,
        appBar: InnerCustomAppBar(
          onTapval: () {
            // Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Dashboard(
                          index: 0,
                        )));
          },
          index: 2,
          sharelink: Constantstring.sharenewsletter,
          title: "Articles",
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
            (GlobalLists.homeceoList.length == 0 && _isLoading)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : (GlobalLists.homeceoList.length == 0 && _isLoading == false)
                    ? Center(
                        child: Container(
                          child: Center(child: Text(Constantstring.emptyData)),
                        ),
                      )
                    : ListView.builder(
                        itemCount:
                            GlobalLists.homeceoList.length == totallengthofceo
                                ? GlobalLists.homeceoList.length
                                : GlobalLists.homeceoList.length + 1,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          if (index == GlobalLists.homeceoList.length) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, bottom: 6),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Detailpage(
                                                indexIs: index,
                                                callfrom: 3,
                                              )));
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
                                        bottom: 8, left: 10, right: 10, top: 8),
                                    child: Column(
                                      children: [
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ClipRect(
                                              child: FadeInImage.assetNetwork(
                                                placeholder:
                                                    'assets/newImages/placeholder_3.jpg',
                                                image: Constantstring.baseUrl +
                                                    GlobalLists
                                                        .homeceoList[index]
                                                        .image,
                                                fit: BoxFit.cover,
                                                height: 80,
                                                width: 80,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Html(
                                                    data: GlobalLists
                                                        .homeceoList[index]
                                                        .title,
                                                    style: {
                                                      "body": Style(
                                                          fontSize:
                                                              FontSize(17.0),
                                                          color: Customcolor
                                                              .colorblack,
                                                          //textAlign: TextAlign.center,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                               "tr": Customcolor.tableboderstyle(),
                                                    },
                                                  ),
                                                  // Text(
                                                  //   GlobalLists
                                                  //       .homeceoList[index]
                                                  //       .title,
                                                  //   overflow:
                                                  //       TextOverflow.ellipsis,
                                                  //   style: TextStyle(
                                                  //       color: Customcolor
                                                  //           .colorblack,
                                                  //       fontSize:
                                                  //           ResponsiveFlutter
                                                  //                   .of(context)
                                                  //               .fontSize(1.8),
                                                  //       fontWeight:
                                                  //           FontWeight.w500),
                                                  //   maxLines: 4,
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
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

  Future getNewsLetteranArticles(int pageno) async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
//ShowDialogs.showLoadingDialog(context, _keyLoader);
      setState(() {
        _isLoading = true;
      });
      print("hi");
      var response = await APIManager.fetchget(
        encoding: APIManager.mediaarticle + "/${pageno.toString()}",
      );
      print(APIManager.mediaarticle + "/${pageno.toString()}");
      print(response);
      // APIManager().apiRequest(
      //   context,
      //   api,
      //   (response) async {
      var res = json.decode(response.body);
      resp = Viewmorehomeceo.fromJson(res);
      print(resp.data.list.length);
      // print(resp);
      // print(resp.data.list.length); //48

      // //        Navigator.of(_keyLoader.currentContext).pop();
      setState(() {
        _isLoading = false;
      });
      if (resp.success == "True") {
        Constantstring.baseUrl = resp.baseUrl;
        setState(() {
          totallengthofceo = resp.objectCount;
        });
        for (int i = 0; i < resp.data.list.length; i++) {
          ListElement element = resp.data.list[i];
          setState(() {
            GlobalLists.homeceoList.add(element);
          });
        }
      } else {
        ShowDialogs.showToast("Server Not Responding");
      }
      //   setState(() {
      //     print("here");
      //     // list = new List();
      //     // list = resp.data.list;
      //     //totalcount 10
      //     if (resp.data.list.length < 10) {
      //       for (int i = offset; i < resp.data.list.length; i++) {
      //         setState(() {
      //           GlobalLists.newsLettersList.add(ListElement(
      //               image: resp.data.list[i].image,
      //               title: resp.data.list[i].title,
      //               id: resp.data.list[i].id,
      //               shortDescription: resp.data.list[i].shortDescription,
      //               details: resp.data.list[i].details,
      //               detailPageUrl: resp.data.list[i].detailPageUrl));
      //         });

      //         // GlobalLists.newsLettersList.add(resp.data.list);

      //       }
      //     } else {
      //       for (int i = offset; i < totalcount; i++) {
      //         setState(() {
      //           GlobalLists.newsLettersList.add(ListElement(
      //               image: resp.data.list[i].image,
      //               title: resp.data.list[i].title,
      //               id: resp.data.list[i].id,
      //               shortDescription: resp.data.list[i].shortDescription,
      //               details: resp.data.list[i].details,
      //               detailPageUrl: resp.data.list[i].detailPageUrl));
      //         });

      //         // GlobalLists.newsLettersList.add(resp.data.list);

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
      //     // // GlobalLists.newsLettersList = resp.data.list;
      //     Constantstring.baseUrl = resp.baseUrl;
      //     print("-----------------------------------");
      //     print(totalcount);
      //     print(GlobalLists.newsLettersList.length);
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
      // },
      // (error) {
      //   setState(() {
      //     _isLoading = false;
      //   });

      //   print('ERR msg is $error');
      //   //  Navigator.of(_keyLoader.currentContext).pop();
      // },
      //);
    } else {
      setState(() {
        _isLoading = false;
      });
      ShowDialogs.showToast("Please check internet connection");
    }
  }
//   getNewsLetteranArticles(dynamic api) async {
//     var status1 = await ConnectionDetector.checkInternetConnection();

//     if (status1) {
// //ShowDialogs.showLoadingDialog(context, _keyLoader);
//       setState(() {
//         _isLoading = true;
//       });
//       APIManager().apiRequest(
//         context,
//         api,
//         (response) async {
//           resp = response;
//           print(resp);
//           print(resp.data.list.length); //48

//           //        Navigator.of(_keyLoader.currentContext).pop();

//           if (resp.success == "True") {
//             setState(() {
//               print("here");
//               // list = new List();
//               // list = resp.data.list;
//               //totalcount 10
//               if (resp.data.list.length < 10) {
//                 for (int i = offset; i < resp.data.list.length; i++) {
//                   setState(() {
//                     GlobalLists.newsLettersList.add(ListElement(
//                         image: resp.data.list[i].image,
//                         title: resp.data.list[i].title,
//                         id: resp.data.list[i].id,
//                         shortDescription: resp.data.list[i].shortDescription,
//                         details: resp.data.list[i].details,
//                         detailPageUrl: resp.data.list[i].detailPageUrl));
//                   });

//                   // GlobalLists.newsLettersList.add(resp.data.list);

//                 }
//               } else {
//                 for (int i = offset; i < totalcount; i++) {
//                   setState(() {
//                     GlobalLists.newsLettersList.add(ListElement(
//                         image: resp.data.list[i].image,
//                         title: resp.data.list[i].title,
//                         id: resp.data.list[i].id,
//                         shortDescription: resp.data.list[i].shortDescription,
//                         details: resp.data.list[i].details,
//                         detailPageUrl: resp.data.list[i].detailPageUrl));
//                   });

//                   // GlobalLists.newsLettersList.add(resp.data.list);

//                 }
//               }

//               offset = totalcount;
//               int remem = resp.data.list.length - totalcount;
//               print("remem");
//               print(remem);
//               if (remem < 10) {
//                 totalcount = totalcount + remem;
//               } else {
//                 totalcount = totalcount + 10;
//               }
//               // // GlobalLists.newsLettersList = resp.data.list;
//               Constantstring.baseUrl = resp.baseUrl;
//               print("-----------------------------------");
//               print(totalcount);
//               print(GlobalLists.newsLettersList.length);
//             });

//             setState(() {
//               _isLoading = false;
//             });
//           } else {
//             ShowDialogs.showToast(resp.msg);
//             setState(() {
//               _isLoading = false;
//             });
//           }
//         },
//         (error) {
//           setState(() {
//             _isLoading = false;
//           });

//           print('ERR msg is $error');
//           //  Navigator.of(_keyLoader.currentContext).pop();
//         },
//       );
//     } else {
//       setState(() {
//         _isLoading = false;
//       });
//       ShowDialogs.showToast("Please check internet connection");
//     }
//   }
}

import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/model/getNewsRelease.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';

import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';

import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:merckfoundation22dec/model/getNewsRelease.dart' as newsRelease;

class NewsRelease extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewsReleaseState();
  }
}

class NewsReleaseState extends State<NewsRelease> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  ScrollController _sc = new ScrollController();
  NewsreleaseResponse resp;
  int totalcount = 10;
  int page = 10;
  int offset = 0;
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    GlobalLists.newsReleaseList.clear();
    getNewsRelease();
    _sc = new ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  _launchURL(String urlIs) async {
    var url = urlIs;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _scrollListener() {
    if (_sc.position.extentAfter < 50) {
      if (!_isLoading && totalcount > GlobalLists.newsReleaseList.length) {
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
                    GlobalLists.newsReleaseList.add(newsRelease.ListElement(
                        title: resp.data.list[i].title,
                        id: resp.data.list[i].id,
                        pdfFile: resp.data.list[i].pdfFile,
                        appImg: resp.data.list[i].appImg,
                        eventType: resp.data.list[i].eventType,
                        eventYear: resp.data.list[i].eventYear));
                  });

                  // GlobalLists.newsLettersList.add(resp.data.list);

                }

                offset = totalcount;
                int remem = resp.data.list.length - totalcount;
                print("remem");
                print(remem);
                if (remem < 10) {
                  totalcount = totalcount + remem;
                } else {
                  totalcount = totalcount + 10;
                }
                // // GlobalLists.newsLettersList = resp.data.list;
                Constantstring.baseUrl = resp.baseUrl;
                print("-----------------------------------");
                print(totalcount);
                print(GlobalLists.newsReleaseList.length);
              });

              setState(() {
                _isLoading = false;
              });
            } else {
              ShowDialogs.showToast(resp.msg);
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
          index: 2,
          sharelink: Constantstring.sharenewsrelease,
          title: "News Release",
          titleImg: "assets/newImages/newsarticle_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        body: Stack(
          children: [
            ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              controller: _sc,
              children: [
                (GlobalLists.newsReleaseList.length == 0 && _isLoading)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : (GlobalLists.newsReleaseList.length == 0 &&
                            _isLoading == false)
                        ? Center(
                            child: Container(
                              child:
                                  Center(child: Text(Constantstring.emptyData)),
                            ),
                          )
                        : ListView.builder(
                            itemCount: GlobalLists.newsReleaseList.length,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              if (GlobalLists.newsReleaseList.length - 1 ==
                                      index &&
                                  _isLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 6),
                                  child: Card(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 8,
                                          bottom: 8),
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              print(Constantstring.baseUrl +
                                                  GlobalLists
                                                      .newsReleaseList[index]
                                                      .pdfFile);
                                              _launchURL(Constantstring
                                                      .baseUrl +
                                                  GlobalLists
                                                      .newsReleaseList[index]
                                                      .pdfFile);
                                            },
                                            child: Row(
                                              // mainAxisAlignment: MainAxisAlignment.start,
                                              //crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ClipRect(
                                                  child: Image.asset(
                                                    "assets/newImages/pdf.png",
                                                    height: 80,
                                                    width: 80,
                                                  ),

                                                  // FadeInImage.assetNetwork(
                                                  //   placeholder:
                                                  //       'assets/newImages/placeholder_3.jpg',
                                                  //   image:  Constantstring.baseUrl+GlobalLists
                                                  //       .newsReleaseList[index].appImg,
                                                  //   fit: BoxFit.cover,
                                                  //   height: 80,
                                                  //   width: 80,
                                                  // ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    GlobalLists
                                                        .newsReleaseList[index]
                                                        .title,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize:
                                                            ResponsiveFlutter
                                                                    .of(context)
                                                                .fontSize(1.8),
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    maxLines: 4,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                            }),
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
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Padding(
            //     padding: const EdgeInsets.only(
            //         left: 90, right: 90, bottom: 20),
            //     child: FlatButton(
            //       color: Customcolor.text_blue,
            //       shape: RoundedRectangleBorder(
            //           side: BorderSide(color: Customcolor.text_blue)),
            //       child: Text(
            //         "Media Enquiries",
            //         style: TextStyle(color: Colors.white),
            //       ),
            //       minWidth: 40,
            //       onPressed: () {},
            //     ),
            //   ),
            // ),
          ],
        ));
  }

  static Future<bool> enquirySMDialog(BuildContext context) async {
    bool status = await showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          title: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Customcolor.colorBlue,
            ),
            child: Center(
              child: Text(
                "For Media Enquiry",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Container(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Text(
                    "Contact",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Ms. Mehak Handa',
                    style: TextStyle(
                        color: Customcolor.colorBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text('+91 93196 06669',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w400))
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                        child: Text(' mehak.handa@external.merckgroup.com',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w400)))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Ms. Ekta Pal',
                    style: TextStyle(
                        color: Customcolor.colorBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(' ektapalconsultant@gmail.com',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w400))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Ms. Linda Aryeetey',
                    style: TextStyle(
                        color: Customcolor.colorBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text('+233 26 474 6400',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w400))
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(' audrey5aryeetey@gmail.com',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w400))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          // actions: <Widget>[
          //   // usually buttons at the bottom of the dialog
          //   new FlatButton(
          //     child: new Text("Close"),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ],
        );
      },
    );

    return status;
  }

  getNewsRelease() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      //  ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.newsRelease,
        (response) async {
          resp = response;
          print(resp);

          //  Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              // GlobalLists.newsReleaseList = resp.data.list;
              Constantstring.baseUrl = resp.baseUrl;
              if (resp.data.list.length < 10) {
                for (int i = offset; i < resp.data.list.length; i++) {
                  setState(() {
                    GlobalLists.newsReleaseList.add(newsRelease.ListElement(
                        title: resp.data.list[i].title,
                        id: resp.data.list[i].id,
                        pdfFile: resp.data.list[i].pdfFile,
                        appImg: resp.data.list[i].appImg,
                        eventType: resp.data.list[i].eventType,
                        eventYear: resp.data.list[i].eventYear));
                  });

                  // GlobalLists.newsLettersList.add(resp.data.list);

                }
              } else {
                for (int i = offset; i < totalcount; i++) {
                  setState(() {
                    GlobalLists.newsReleaseList.add(newsRelease.ListElement(
                        title: resp.data.list[i].title,
                        id: resp.data.list[i].id,
                        pdfFile: resp.data.list[i].pdfFile,
                        appImg: resp.data.list[i].appImg,
                        eventType: resp.data.list[i].eventType,
                        eventYear: resp.data.list[i].eventYear));
                  });

                  // GlobalLists.newsLettersList.add(resp.data.list);

                }
              }

              offset = totalcount;
              int remem = resp.data.list.length - totalcount;
              print("remem");
              print(remem);
              if (remem < 10) {
                totalcount = totalcount + remem;
              } else {
                totalcount = totalcount + 10;
              }
              // // GlobalLists.newsLettersList = resp.data.list;
              Constantstring.baseUrl = resp.baseUrl;
              print("-----------------------------------");
              print(totalcount);
              print(GlobalLists.newsLettersList.length);
            });

            setState(() {
              _isLoading = false;
            });
          } else {
            setState(() {
              _isLoading = false;
            });
            ShowDialogs.showToast(resp.msg);
          }
        },
        (error) {
          setState(() {
            _isLoading = false;
          });
          print('ERR msg is $error');
          //  Navigator.of(_keyLoader.currentContext).pop();
        },
      );
    } else {
      setState(() {
        _isLoading = false;
      });
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

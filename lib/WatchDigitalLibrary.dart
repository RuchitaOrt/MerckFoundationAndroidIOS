import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/model/digitalProgramResponse.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class WatchDigitalLibrary extends StatefulWidget {
  String appBarTitle;
  final dynamic apiurl;
  final String digitallink;

  WatchDigitalLibrary({
    Key key,
    this.apiurl,
    this.digitallink,
  }) : super(key: key);
  @override
  _DigitalLibraryState createState() => _DigitalLibraryState();
}

class _DigitalLibraryState extends State<WatchDigitalLibrary> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  DigitalProgramResponse resp;

  ScrollController _sc = new ScrollController();

  int totalcount = 10;
  int page = 10;
  int offset = 0;
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    GlobalLists.digitallibraryviewlist.clear();
    getprogramdigitallib(widget.apiurl);
    _sc = new ScrollController()..addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InnerCustomAppBar(
        onTapval: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (BuildContext context) => Dashboard(
          //               index: 0,
          //             )));
          Navigator.pop(context);
        },
        index: 2,
        sharelink: widget.digitallink,
        title: "Digital Library",
        titleImg: "assets/newImages/news_logo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      backgroundColor: Customcolor.background,
      body: Stack(
        children: [
          ListView(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            controller: _sc,
            children: [
              (GlobalLists.digitallibraryviewlist.length == 0 && _isLoading)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : (GlobalLists.digitallibraryviewlist.length == 0 &&
                          _isLoading == false)
                      ? Center(
                          child: Container(
                            child: Center(child: Text(Constantstring.emptyData)),
                          ),
                        )
                      : ListView(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          children: [
                            GridView.count(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              padding: const EdgeInsets.all(5),
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 2,
                              crossAxisCount: 2,
                              childAspectRatio: 0.9,
                              children: List.generate(
                                  GlobalLists.digitallibraryviewlist.length,
                                  (index) {
                                // if (GlobalLists.digitallibraryviewlist.length - 1 ==
                                //         index &&
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
                                        onTap: () {
                                          _launchURL(GlobalLists
                                                  .programdigitalcontentbaseurl +
                                              GlobalLists
                                                  .digitallibraryviewlist[index]
                                                  .document);
                                        },
                                        child: Container(
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
                                                          16,
                                                  // width:
                                                  //     SizeConfig.blockSizeHorizontal *
                                                  //         100,
                                                  // height: 150,

                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(5),
                                                    // border: Border.all(
                                                    //   width: 1,
                                                    // ),
                                                    image: new DecorationImage(
                                                      image: new NetworkImage(GlobalLists
                                                              .programdigitalcontentbaseurl +
                                                          GlobalLists
                                                              .digitallibraryviewlist[
                                                                  index]
                                                              .image),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Center(
                                                  child: Text(
                                                    GlobalLists
                                                        .digitallibraryviewlist[
                                                            index]
                                                        .title,
                                                    textAlign: TextAlign.center,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize:
                                                            ResponsiveFlutter.of(
                                                                    context)
                                                                .fontSize(1.4),
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    maxLines: 3,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                            ],
                                          ),
                                        ),
                                      )),
                                );
                                // }
                              }),
                            ),
                            _isLoading
                                ? Center(
                                    child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 10, bottom: 10),
                                    child: CircularProgressIndicator(),
                                  ))
                                : Container()
                          ],
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
                    height: 40,
                  ),
                 
     

            ],
          ),

           Align(
             alignment: Alignment.bottomCenter,
   child: Bottomcardlink()),
        ],

          

      ),
    );
  }

  void _scrollListener() {
    //   print("scroll");
    if (_sc.position.extentAfter < 50) {
      if (!_isLoading &&
          totalcount > GlobalLists.digitallibraryviewlist.length) {
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
                if (resp.list.length < 10) {
                  for (int i = offset; i < resp.list.length; i++) {
                    setState(() {
                      GlobalLists.digitallibraryviewlist.add(ListClass(
                          id: resp.list[i].id,
                          categoryType: resp.list[i].categoryType,
                          title: resp.list[i].title,
                          image: resp.list[i].image,
                          document: resp.list[i].document));
                    });

                    // GlobalLists.newsLettersList.add(resp.data.list);

                  }
                } else {
                  for (int i = offset; i < totalcount; i++) {
                    setState(() {
                      GlobalLists.digitallibraryviewlist.add(ListClass(
                          id: resp.list[i].id,
                          categoryType: resp.list[i].categoryType,
                          title: resp.list[i].title,
                          image: resp.list[i].image,
                          document: resp.list[i].document));
                    });

                    // GlobalLists.newsLettersList.add(resp.data.list);

                  }
                }

                offset = totalcount;
                int remem = resp.list.length - totalcount;
                print("remem");
                print(remem);
                if (remem < 10) {
                  totalcount = totalcount + remem;
                } else {
                  totalcount = totalcount + 10;
                }
                // // GlobalLists.newsLettersList = resp.data.list;
                GlobalLists.programdigitalcontentbaseurl = resp.baseUrl;
                print("-----------------------------------");
                print(totalcount);
                //    print(GlobalLists.newsLettersList.length);
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

  _launchURL(String urlIs) async {
    var url = urlIs;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  getprogramdigitallib(dynamic api) async {
    var status1 = await ConnectionDetector.checkInternetConnection();
    if (status1) {
      print(api);
      // ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(context, api, (response) async {
        resp = response;
        print("i am here");
        print(response);
        print('Resp : $resp');
        // Navigator.of(_keyLoader.currentContext).pop();
        if (resp.success == "True") {
          print(resp.list);
          GlobalLists.programdigitalcontentbaseurl = resp.baseUrl;
          setState(() {
            print("here");
            if (resp.list.length < 10) {
              for (int i = offset; i < resp.list.length; i++) {
                setState(() {
                  GlobalLists.digitallibraryviewlist.add(ListClass(
                      id: resp.list[i].id,
                      categoryType: resp.list[i].categoryType,
                      title: resp.list[i].title,
                      image: resp.list[i].image,
                      document: resp.list[i].document));
                });
              }
            } else {
              for (int i = offset; i < totalcount; i++) {
                setState(() {
                  GlobalLists.digitallibraryviewlist.add(ListClass(
                      id: resp.list[i].id,
                      categoryType: resp.list[i].categoryType,
                      title: resp.list[i].title,
                      image: resp.list[i].image,
                      document: resp.list[i].document));
                });
              }
            }

            offset = totalcount;
            int remem = resp.list.length - totalcount;
            print("remem");
            print(remem);
            if (remem < 10) {
              totalcount = totalcount + remem;
            } else {
              totalcount = totalcount + 10;
            }

            print(totalcount);
          });

          setState(() {
            _isLoading = false;
          });
          // GlobalLists.programgallerylist = resp.list;
          // print(GlobalLists.programgallerylist);
          // GlobalLists.awarddetallisting[0].title

          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (BuildContext context) => GalleryProgram(
          //               baseURL: GlobalLists.programgallerybaseurl,
          //               photosList: GlobalLists.programgallerylist,
          //             )));
        } else {
          ShowDialogs.showToast(resp.msg);
          setState(() {
            _isLoading = false;
          });
        }
      }, (error) {
        print('ERR msg is $error');
        setState(() {
          _isLoading = false;
        });
        //  Navigator.of(_keyLoader.currentContext).pop();
      }, jsonval: json);
    } else {
      setState(() {
        _isLoading = false;
      });
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

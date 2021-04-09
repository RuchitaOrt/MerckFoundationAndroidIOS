import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:merckfoundation22dec/widget/slidercontainer.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/filterdrawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:merckfoundation22dec/model/AmbassadarVideoviewall.dart';
import 'package:http/io_client.dart';
import 'dart:io';

import 'package:http/http.dart' as http;

//ambassadar,empowering berna,local song,encology,fellowship,community,merck patient
class WatchmoreVideoambassdar extends StatefulWidget {
  final String categoryid;
  final dynamic api;
  final String type;
  final String headertitle;

  const WatchmoreVideoambassdar(
      {Key key, this.categoryid, this.api, this.type, this.headertitle})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return VideolibraryState();
  }
}

class VideolibraryState extends State<WatchmoreVideoambassdar> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  ScrollController _sc = new ScrollController();
  AmbassdarvideoResponse resp;
  int totalcount = 10;
  int page = 10;
  int offset = 0;
  bool _isLoading = true;
  final GlobalKey<ScaffoldState> _scaffoldKey1 = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    GlobalLists.videoviewmoreambasdarslist.clear();
    ambasssadarvideoviewmore(widget.categoryid, widget.api, widget.type);
    _sc = new ScrollController()..addListener(_scrollListener);
  }

  void _scrollListener() {
    //   print("scroll");
    if (_sc.position.extentAfter < 50) {
      if (!_isLoading &&
          totalcount > GlobalLists.videoviewmoreambasdarslist.length) {
        // getNewsLetteranArticles();
        setState(() {
          _isLoading = true;
        });
        Future.delayed(const Duration(seconds: 2), () {
// Here you can write your code

          setState(() {
            // Here you can write your code for open new view
            _isLoading = false;
            if (resp.success == true) {
              setState(() {
                print("here");
                // list = new List();
                // list = resp.data.list;
                //totalcount 10

                setState(() {
                  for (int i = offset; i < totalcount; i++) {
                    setState(() {
                      GlobalLists.videoviewmoreambasdarslist.add(ListElement(
                          id: resp.list[i].id,
                          videoDesc: resp.list[i].videoDesc,
                          videoLink: resp.list[i].videoLink,
                          countryId: resp.list[i].countryId,
                          categoryId: resp.list[i].categoryId,
                          year: resp.list[i].status));
                    });
                  }
                });

                // GlobalLists.newsLettersList.add(resp.data.list);

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
                // Constantstring.baseUrl = resp.baseUrl;
                print("-----------------------------------");
                print(totalcount);
                //    print(GlobalLists.newsLettersList.length);
              });

              setState(() {
                _isLoading = false;
              });
            } else {
              //ShowDialogs.showToast(resp.msg);
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
        key: _scaffoldKey1,
        // endDrawer: Theme(
        //   data: Theme.of(context)
        //       .copyWith(canvasColor: Colors.white, primaryColor: Colors.white),
        //   child: AppDrawerfilter(
        //     index: 1,
        //   ),
        // ),
        appBar: InnerCustomAppBar(
          // onTapvalfilter: () {
          //   print("videokk");
          //   // _scaffoldKey1.currentState.openDrawer();
          //   _scaffoldKey1.currentState.openEndDrawer();
          // },
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
          // forfilterindes: 3,
          title: widget.headertitle,
          titleImg: "assets/newImages/ourstoriesLogo.png",
          trallingImg1: "assets/newImages/share.png",
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
            (GlobalLists.videoviewmoreambasdarslist.length == 0 && _isLoading)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : (GlobalLists.videoviewmoreambasdarslist.length == 0 &&
                        _isLoading == false)
                    ? Center(
                        child: Container(
                          child:
                              Center(child: Text(Constantstring.emptyData)),
                        ),
                      )
                    : Padding(
                       padding: const EdgeInsets.only(left: 10, right: 10),
                      child: ListView(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          children: [
                            GridView.count(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              crossAxisCount: 2,
                              childAspectRatio: 0.9,
                              children: List.generate(
                                  GlobalLists.videoviewmoreambasdarslist.length,
                                  (index) {
                                // if (GlobalLists.videoviewmoreambasdarslist.length -
                                //             1 ==
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
                                          var storykey = GlobalLists
                                              .videoviewmoreambasdarslist[index]
                                              .videoLink
                                              .substring(GlobalLists
                                                      .videoviewmoreambasdarslist[
                                                          index]
                                                      .videoLink
                                                      .length -
                                                  11);
                                          ShowDialogs.youtubevideolink(
                                              "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
                                          // _launchInWebViewWithJavaScript(
                                          //     "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
                                        },
                                        child: Stack(
                                          children: [
                                            Container(
                                              color: Colors.transparent,
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  50,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      width: SizeConfig
                                                              .blockSizeHorizontal *
                                                          100,
                                                      height: SizeConfig
                                                              .blockSizeVertical *
                                                          15,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        // border: Border.all(
                                                        //   width: 1,
                                                        // ),
                                                        image:
                                                            new DecorationImage(
                                                          image: new NetworkImage(
                                                              'https://img.youtube.com/vi/${GlobalLists.videoviewmoreambasdarslist[index].videoLink.substring(GlobalLists.videoviewmoreambasdarslist[index].videoLink.length - 11)}/mqdefault.jpg'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Text(
                                                      GlobalLists
                                                          .videoviewmoreambasdarslist[
                                                              index]
                                                          .videoDesc,
                                                      textAlign:
                                                          TextAlign.center,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              ResponsiveFlutter
                                                                      .of(
                                                                          context)
                                                                  .fontSize(
                                                                      1.4),
                                                          fontWeight:
                                                              FontWeight.w500),
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
                                //}
                              }),
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
                  height: 10,
                ),
                Bottomcardlink(),
          ],
        ));
  }

  ambasssadarvideoviewmore(
      String categoryid, dynamic api, String bodydata) async {
    var status = await ConnectionDetector.checkInternetConnection();
    dynamic bodyData;
    if (status) {
      if (bodydata == "ambassadar") {
        bodyData = {
          'category_id': categoryid,
        };
      } else {
        bodyData = {
          'catg_id': categoryid,
        };
      }

//APIManager.ambasadarvideoapi
      // String body = json.encode(bodyData);
      print(bodyData);
      var response = await fetchPostWithBodyResponse(
        api,
        bodyData,
      );

      var res = json.decode(response.body);
      print("res");
      print(res);
      resp = ambassdarvideoResponseFromJson(response.body);
      if (response.statusCode == 200) {
        if (res['success'] == true) {
          // GlobalLists.videoviewmoreambasdarslist = resp.list;
          if (resp.list.length < 10) {
            for (int i = offset; i < resp.list.length; i++) {
              setState(() {
                GlobalLists.videoviewmoreambasdarslist.add(ListElement(
                    id: resp.list[i].id,
                    videoDesc: resp.list[i].videoDesc,
                    videoLink: resp.list[i].videoLink,
                    countryId: resp.list[i].countryId,
                    categoryId: resp.list[i].categoryId,
                    year: resp.list[i].status));
              });
            }
          } else {
            for (int i = offset; i < totalcount; i++) {
              setState(() {
                GlobalLists.videoviewmoreambasdarslist.add(ListElement(
                    id: resp.list[i].id,
                    videoDesc: resp.list[i].videoDesc,
                    videoLink: resp.list[i].videoLink,
                    countryId: resp.list[i].countryId,
                    categoryId: resp.list[i].categoryId,
                    year: resp.list[i].status));
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

          setState(() {
            _isLoading = false;
          });
        } else {
          setState(() {
            _isLoading = false;
            ShowDialogs.showToast(res['msg']);
          });
        }
      } else {
        _isLoading = false;
        ShowDialogs.showToast("Server Not Responding");
      }
    } else {
      setState(() {
        _isLoading = false;
        ShowDialogs.showToast("Please check Internet Connection.");
      });
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

  Future<http.Response> fetchPostWithBodyResponse(
      String url, dynamic body) async {
    IOClient ioClient = new IOClient();

    HttpClient client = new HttpClient();

    ioClient = new IOClient(client);
    final response = await ioClient.post(url, body: body);
    print('pit stop');
    return response;
  }
}

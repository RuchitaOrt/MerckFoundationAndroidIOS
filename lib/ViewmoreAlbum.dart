import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/model/CreategallerymobileResponse.dart';
import 'package:merckfoundation22dec/model/CreategallerymobileResponse.dart';

import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';

import 'package:merckfoundation22dec/model/CreategallerymobileResponse.dart'
    as album;
import 'package:http/io_client.dart';
import 'dart:io';

import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class ViewmoreAlbum extends StatefulWidget {
  final dynamic apiurl;
  String appBarTitle;
  final dynamic sharelink;
  final dynamic albumurl;
  final dynamic albumtitle;

  ViewmoreAlbum(
      {Key key, this.apiurl, this.sharelink, this.albumurl, this.albumtitle})
      : super(key: key);
  @override
  _viewmoremmtmaState createState() => _viewmoremmtmaState();
}

class _viewmoremmtmaState extends State<ViewmoreAlbum> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  ScrollController _sc = new ScrollController();
  CreategallerymobileResponse resp;
  int totalcount = 10;
  int page = 10;
  int offset = 0;
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    GlobalLists.viewmorealbum.clear();
    getalbum(widget.albumurl, widget.apiurl);
    _sc = new ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    //   print("scroll");
    if (_sc.position.extentAfter < 50) {
      if (!_isLoading && totalcount > GlobalLists.viewmorealbum.length) {
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
                    GlobalLists.viewmorealbum.add(album.ListElement(
                      id: resp.list[i].id,
                      photo: resp.list[i].photo,
                      photoCategoryId: resp.list[i].photoCategoryId,
                      photoDescription: resp.list[i].photoDescription,
                    ));
                  });

                  // GlobalLists.newsLettersList.add(resp.data.list);

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
                Constantstring.baseUrl = resp.baseUrl;
                print("-----------------------------------");
                print(totalcount);
                //    print(GlobalLists.newsLettersList.length);
              });

              setState(() {
                _isLoading = false;
              });
            } else {
              // ShowDialogs.showToast(resp.msg);
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
        sharelink: widget.sharelink,
        title: widget.albumtitle,
        titleImg: "assets/newImages/news_logo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      backgroundColor: Customcolor.background,
      body: ListView(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        controller: _sc,
        children: [
          (GlobalLists.viewmorealbum.length == 0 && _isLoading)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : (GlobalLists.viewmorealbum.length == 0 && _isLoading == false)
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
                              GlobalLists.viewmorealbum.length, (index) {
                            // if (GlobalLists.viewmoremmtmlist.length - 1 == index &&
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
                                      ShowDialogs.showImageDialog(
                                        context: context,
                                        image: Constantstring.baseUrl +
                                            GlobalLists
                                                .viewmorealbum[index].photo,
                                        description: GlobalLists
                                            .viewmorealbum[index]
                                            .photoDescription,
                                      );
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
                                              // width:
                                              //     SizeConfig.blockSizeHorizontal *
                                              //         100,
                                              // height: 150,
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  100,
                                              height:
                                                  SizeConfig.blockSizeVertical *
                                                      16,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                // border: Border.all(
                                                //   width: 1,
                                                // ),
                                                image: new DecorationImage(
                                                  image: new NetworkImage(
                                                      Constantstring.baseUrl +
                                                          GlobalLists
                                                              .viewmorealbum[
                                                                  index]
                                                              .photo),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              GlobalLists.viewmorealbum[index]
                                                  .photoDescription,
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
        ],
      ),
    );
  }

  getalbum(String albumid, dynamic api) async {
    var status = await ConnectionDetector.checkInternetConnection();
    dynamic bodyData;
    if (status) {
      bodyData = {
        'album_url': albumid,
      };

//APIManager.ambasadarvideoapi
      // String body = json.encode(bodyData);
      print(api);
      print(bodyData);
      var response = await fetchPostWithBodyResponse(
        api,
        bodyData,
      );

      var res = json.decode(response.body);
      print("res");
      print(res);
      resp = creategallerymobileResponseFromJson(response.body);
      if (response.statusCode == 200) {
        if (res['success'] == "true") {
          Constantstring.baseUrl = resp.baseUrl;
          // GlobalLists.videoviewmoreambasdarslist = resp.list;
          if (resp.list.length < 10) {
            for (int i = offset; i < resp.list.length; i++) {
              setState(() {
                GlobalLists.viewmorealbum.add(album.ListElement(
                  id: resp.list[i].id,
                  photo: resp.list[i].photo,
                  photoCategoryId: resp.list[i].photoCategoryId,
                  photoDescription: resp.list[i].photoDescription,
                ));
              });
            }
          } else {
            for (int i = offset; i < totalcount; i++) {
              setState(() {
                GlobalLists.viewmorealbum.add(album.ListElement(
                  id: resp.list[i].id,
                  photo: resp.list[i].photo,
                  photoCategoryId: resp.list[i].photoCategoryId,
                  photoDescription: resp.list[i].photoDescription,
                ));
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

  Future<http.Response> fetchPostWithBodyResponse(
      String url, dynamic body) async {
    IOClient ioClient = new IOClient();

    HttpClient client = new HttpClient();

    ioClient = new IOClient(client);
    final response = await ioClient.post(url, body: body);
    print('pit stop');
    return response;
  }
  // getalbum(String album) async {
  //   var status1 = await ConnectionDetector.checkInternetConnection();
  //   if (status1) {
  //     ShowDialogs.showLoadingDialog(context, _keyLoader);
  //     final json = {
  //       'album_url': album,
  //     };
  //     print(json);
  //     APIManager().apiRequest(context, API.creategallerymobile,
  //         (response) async {
  //       resp = response;
  //       print(response);
  //       print('Resp : $resp');
  //       //   Navigator.of(_keyLoader.currentContext).pop();
  //       if (resp.success == "True".toLowerCase()) {
  //         setState(() {
  //           print("here");
  //           if (resp.list.length < 10) {
  //             for (int i = offset; i < resp.list.length; i++) {
  //               setState(() {
  //                 GlobalLists.viewmorealbum.add(album.ListElement(
  //                   id: resp.list[i].id,
  //                   photo: resp.list[i].photo,
  //                   photoCategoryId: resp.list[i].photoCategoryId,
  //                   photoDescription: resp.list[i].photoDescription,
  //                 ));
  //               });
  //             }
  //           } else {
  //             for (int i = offset; i < totalcount; i++) {
  //               setState(() {
  //                 GlobalLists.viewmorealbum.add(album.ListElement(
  //                   id: resp.list[i].id,
  //                   photo: resp.list[i].photo,
  //                   photoCategoryId: resp.list[i].photoCategoryId,
  //                   photoDescription: resp.list[i].photoDescription,
  //                 ));
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
  //           print(GlobalLists.storiesList.length);
  //         });

  //         setState(() {
  //           _isLoading = false;
  //         });
  //       } else {
  //         ShowDialogs.showToast(resp.msg);
  //       }
  //     }, (error) {
  //       print('ERR msg is $error');
  //       Navigator.of(_keyLoader.currentContext).pop();
  //     }, jsonval: json);
  //   } else {
  //     ShowDialogs.showToast("Please check internet connection");
  //   }
  // }
}

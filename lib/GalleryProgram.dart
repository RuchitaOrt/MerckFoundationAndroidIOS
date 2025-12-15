import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:merckfoundation22dec/utility/ResponsiveFlutter.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/model/GalleryProgram.dart';
import 'dart:convert';

// ignore: must_be_immutable
class GalleryProgram extends StatefulWidget {
  final List<dynamic>? photosList;

  final dynamic baseURL;
  final dynamic apiurl;
  dynamic appBarTitle;

  GalleryProgram({Key? key, this.photosList, this.baseURL, this.apiurl})
      : super(key: key);
  @override
  _GalleryProgramState createState() => _GalleryProgramState();
}

class _GalleryProgramState extends State<GalleryProgram> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  ScrollController _sc = new ScrollController();
  late GalleryProgramResponse resp;
  int totalcount = 10;
  int page = 10;
  int offset = 0;
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    GlobalLists.programgallerylist.clear();
    getprogramgallery(widget.apiurl);
    _sc = new ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    //   print("scroll");
    if (_sc.position.extentAfter < 50) {
      if (!_isLoading && totalcount > GlobalLists.programgallerylist.length) {
        // getNewsLetteranArticles();
        setState(() {
          _isLoading = true;
        });
        Future.delayed(const Duration(seconds: 2), () {
// Here you can write your code

          setState(() {
            // Here you can write your code for open new view
            _isLoading = false;
            if (resp.success == "True".toLowerCase()) {
              setState(() {
                print("here");
                // list = new List();
                // list = resp.data.list;
                //totalcount 10

                for (int i = offset; i < totalcount; i++) {
                  setState(() {
                    GlobalLists.programgallerylist.add(ListElement(
                      id: resp.list![i].id,
                      photo: resp.list![i].photo,
                      photoCategoryId: resp.list![i].photoCategoryId,
                      photoDescription: resp.list![i].photoDescription,
                    ));
                  });

                  // GlobalLists.newsLettersList.add(resp.data.list);
                }

                offset = totalcount;
                int remem = resp.list!.length - totalcount;
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
        index: 1,
        title: "Photo Gallery",
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
              (GlobalLists.programgallerylist.length == 0 && _isLoading)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : (GlobalLists.programgallerylist.length == 0 &&
                          _isLoading == false)
                      ? Center(
                          child: Container(
                            child:
                                Center(child: Text(Constantstring.emptyData)),
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
                                  GlobalLists.programgallerylist.length,
                                  (index) {
                                // if (GlobalLists.programgallerylist.length - 1 ==
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
                                          ShowDialogs.showImageDialog(
                                            context: context,
                                            image: GlobalLists
                                                    .programgallerybaseurl +
                                                GlobalLists
                                                    .programgallerylist[index]
                                                    .photo,
                                            description: GlobalLists
                                                .programgallerylist[index]
                                                .photoDescription,
                                          );
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
                                                child: Container(
                                                  width: SizeConfig
                                                          .blockSizeHorizontal *
                                                      100,
                                                  height: SizeConfig
                                                          .blockSizeVertical *
                                                      14,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    // border: Border.all(
                                                    //   width: 1,
                                                    // ),
                                                    image: new DecorationImage(
                                                      image: new NetworkImage(
                                                          GlobalLists
                                                                  .programgallerybaseurl +
                                                              GlobalLists
                                                                  .programgallerylist[
                                                                      index]
                                                                  .photo),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Center(
                                                  child: Text(
                                                    GlobalLists
                                                        .programgallerylist[
                                                            index]
                                                        .photoDescription,
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
                                              ),
                                              //SizedBox(height: 5),
                                            ],
                                          ),
                                        ),
                                      )),
                                );
                                //  }
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
          Align(alignment: Alignment.bottomCenter, child: Bottomcardlink()),
        ],
      ),
    );
  }

  getprogramgallery(dynamic api) async {
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
        if (resp.success == "True".toLowerCase()) {
          print(resp.list);
          GlobalLists.programgallerybaseurl = resp.baseUrl!;
          setState(() {
            print("here");
            if (resp.list!.length < 10) {
              for (int i = offset; i < resp.list!.length; i++) {
                setState(() {
                  GlobalLists.programgallerylist.add(ListElement(
                    id: resp.list![i].id,
                    photo: resp.list![i].photo,
                    photoCategoryId: resp.list![i].photoCategoryId,
                    photoDescription: resp.list![i].photoDescription,
                  ));
                });
              }
            } else {
              for (int i = offset; i < totalcount; i++) {
                setState(() {
                  GlobalLists.programgallerylist.add(ListElement(
                    id: resp.list![i].id,
                    photo: resp.list![i].photo,
                    photoCategoryId: resp.list![i].photoCategoryId,
                    photoDescription: resp.list![i].photoDescription,
                  ));
                });
              }
            }

            offset = totalcount;
            int remem = resp.list!.length - totalcount;
            print("remem");
            print(remem);
            if (remem < 10) {
              totalcount = totalcount + remem;
            } else {
              totalcount = totalcount + 10;
            }

            print(totalcount);
            print(GlobalLists.programgallerylist.length);
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
          ShowDialogs.showToast(resp.msg!);
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

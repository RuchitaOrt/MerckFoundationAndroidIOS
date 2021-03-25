import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videoplayer.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/model/ourPartnerResponse.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';

import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:merckfoundation22dec/model/ourPartnerObjectivesResp.dart'
    as objective;

class Ourpatnerdetail extends StatefulWidget {
  const Ourpatnerdetail({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return OurpatnerdetailState();
  }
}

class OurpatnerdetailState extends State<Ourpatnerdetail> {
  ScrollController _sc = new ScrollController();
  OurpartnerResponse resp;
  int totalcount = 10;
  int page = 10;
  int offset = 0;
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOurPartnerObjectives();
    GlobalLists.ourPartnerList.clear();
    getOurPartnerData();
    _sc = new ScrollController()..addListener(_scrollListener);
  }

  void _scrollListener() {
    //   print("scroll");
    if (_sc.position.extentAfter < 50) {
      if (!_isLoading && totalcount > GlobalLists.ourPartnerList.length) {
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
                    GlobalLists.ourPartnerList.add(ListElement(
                        id: resp.data.list[i].id,
                        title: resp.data.list[i].title,
                        webUrl: resp.data.list[i].webUrl,
                        image: resp.data.list[i].image));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Customcolor.background,
        appBar: InnerCustomAppBar(
          onTapval: () {
            Navigator.pop(context);
          },
          index: 2,
          title: "Our Partners",
          titleImg: "assets/newImages/ourPartner_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            controller: _sc,
            children: [
              GlobalLists.ourPartnerObjectives.length <= 0
                  ? Container(
                      child: Center(child: Container()),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 8, bottom: 15),
                      child: Html(
                        data:
                            """${GlobalLists.ourPartnerObjectives[0].pageContent} """,
                        onLinkTap: (url) {
                          print("Opening $url...");
                        },
                      ),
                    ),
              SizedBox(
                height: 15,
              ),
              (GlobalLists.ourPartnerList.length == 0 && _isLoading)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : (GlobalLists.ourPartnerList.length == 0 &&
                          _isLoading == false)
                      ? Center(
                          child: Container(
                            child:
                                Center(child: Text(Constantstring.emptyData)),
                          ),
                        )
                      : GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 0.9,
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          children: List.generate(
                              GlobalLists.ourPartnerList.length, (index) {
                            if (GlobalLists.ourPartnerList.length - 1 ==
                                    index &&
                                _isLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.only(right: 2.0),
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (BuildContext context) =>
                                    //             VideoPlayer(
                                    //               videoUrl: GlobalLists
                                    //                   .ourPartnerList[index]
                                    //                   .webUrl,
                                    //             )));

                                    ShowDialogs.launchURL(GlobalLists
                                        .ourPartnerList[index].webUrl);
                                  },
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 50,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  90,
                                              height: 130,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                // image: DecorationImage(
                                                //     image: AssetImage(
                                                //         _productsAvailable[index].image),
                                                //     fit: BoxFit.cover),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(18.0),
                                                child: FadeInImage.assetNetwork(
                                                  placeholder:
                                                      'assets/newImages/placeholder_3.jpg',
                                                  image: Constantstring
                                                          .baseUrl +
                                                      GlobalLists
                                                          .ourPartnerList[index]
                                                          .image,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(
                                                  GlobalLists
                                                      .ourPartnerList[index]
                                                      .title,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Customcolor
                                                        .text_darkblue,
                                                    fontSize:
                                                        ResponsiveFlutter.of(
                                                                context)
                                                            .fontSize(1.6),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 3,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              );
                            }
                          }),
                        ),
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
        ));
  }

  getOurPartnerData() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      //ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.ourPartner,
        (response) async {
          resp = response;
          print(response);
          print('Resp : $resp');
          //  GlobalLists.ourPartnerList.clear();
          // Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              print("here");
              Constantstring.baseUrl = resp.baseUrl;
              if (resp.data.list.length < 10) {
                for (int i = offset; i < resp.data.list.length; i++) {
                  setState(() {
                    GlobalLists.ourPartnerList.add(ListElement(
                        id: resp.data.list[i].id,
                        title: resp.data.list[i].title,
                        webUrl: resp.data.list[i].webUrl,
                        image: resp.data.list[i].image));
                  });
                }
              } else {
                for (int i = offset; i < totalcount; i++) {
                  setState(() {
                    GlobalLists.ourPartnerList.add(ListElement(
                        id: resp.data.list[i].id,
                        title: resp.data.list[i].title,
                        webUrl: resp.data.list[i].webUrl,
                        image: resp.data.list[i].image));
                  });
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

              print(totalcount);
              print(GlobalLists.ourPartnerList.length);
            });

            setState(() {
              _isLoading = false;
            });
          } else {
            ShowDialogs.showToast(resp.msg);
          }
        },
        (error) {
          print('ERR msg is $error');
          //  Navigator.of(_keyLoader.currentContext).pop();
        },
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }

  getOurPartnerObjectives() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      //  ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.ourPartnerObjectives,
        (response) async {
          objective.OurpartnerobjectiveResponse resp = response;
          print(response);
          print('Resp : $resp');
          GlobalLists.ourPartnerObjectives.clear();
          //    Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.ourPartnerObjectives = resp.data.list;
            });
          } else {
            ShowDialogs.showToast(resp.msg);
          }
        },
        (error) {
          print('ERR msg is $error');
          //  Navigator.of(_keyLoader.currentContext).pop();
        },
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

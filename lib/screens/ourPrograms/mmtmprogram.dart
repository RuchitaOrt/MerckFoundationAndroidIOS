import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:merckfoundation22dec/model/mmtmResponse.dart' as mmtm;

class MMTMProgram extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MMTMProgramState();
  }
}

class MMTMProgramState extends State<MMTMProgram> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  ScrollController _sc = new ScrollController();
  mmtm.GetMmtmResponse resp;
  int totalcount = 10;
  int page = 10;
  int offset = 0;
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    GlobalLists.mmtmlist.clear();
    getmmtm();
    _sc = new ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    //   print("scroll");
    if (_sc.position.extentAfter < 50) {
      if (!_isLoading && totalcount > GlobalLists.mmtmlist.length) {
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
                    GlobalLists.mmtmlist.add(mmtm.Datum(
                        id: resp.data[i].id,
                        videoDesc: resp.data[i].videoDesc,
                        videoLink: resp.data[i].videoLink,
                        countryId: resp.data[i].countryId,
                        categoryId: resp.data[i].categoryId,
                        year: resp.data[i].status));
                  });

                  // GlobalLists.newsLettersList.add(resp.data.list);

                }

                offset = totalcount;
                int remem = resp.data.length - totalcount;
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
        appBar: InnerCustomAppBar(
          onTapval: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Dashboard(
                          index: 1,
                        )));
          },
          index: 1,
          title: "Merck Foundation More Than A Mother Videos",
          titleImg: "assets/newImages/ourstoriesLogo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        backgroundColor: Customcolor.background,
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ListView(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            controller: _sc,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (GlobalLists.mmtmlist.length == 0 && _isLoading)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : (GlobalLists.mmtmlist.length == 0 && _isLoading == false)
                      ? Center(
                          child: Container(
                            child:
                                Center(child: Text(Constantstring.emptyData)),
                          ),
                        )
                      : GridView.count(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          crossAxisCount: 2,
                          childAspectRatio: 0.9,
                          children: List.generate(GlobalLists.mmtmlist.length,
                              (index) {
                            if (GlobalLists.mmtmlist.length - 1 == index &&
                                _isLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
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
                                            .mmtmlist[index].videoLink
                                            .substring(GlobalLists
                                                    .mmtmlist[index]
                                                    .videoLink
                                                    .length -
                                                11);
                                        ShowDialogs.youtubevideolink(
                                            "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
                                        // _launchInWebViewWithJavaScript(
                                        //     "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (BuildContext context) =>
                                        //             VideoPlayer(
                                        //               videoUrl: GlobalLists
                                        //                   .mmtmlist[index].videoLink,
                                        //             )));
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        width:
                                            SizeConfig.blockSizeHorizontal * 50,
                                        child: ListView(
                                          shrinkWrap: true,
                                          physics: ScrollPhysics(),
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          // crossAxisAlignment:
                                          //     CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
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
                                                        'https://img.youtube.com/vi/${GlobalLists.mmtmlist[index].videoLink.substring(GlobalLists.mmtmlist[index].videoLink.length - 11)}/mqdefault.jpg'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                GlobalLists
                                                    .mmtmlist[index].videoDesc,
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
                                            SizedBox(height: 5),
                                          ],
                                        ),
                                      ),
                                    )),
                              );
                            }
                          }),
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
            ],
          ),
        ));
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

  getmmtm() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      // ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.mmtmprogram,
        (response) async {
          resp = response;
          print(response);
          print('Resp : $resp');

          //    Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            // setState(() {
            //   GlobalLists.mmtmlist = resp.data;
            // });
            setState(() {
              print("here");
              if (resp.data.length < 10) {
                for (int i = offset; i < resp.data.length; i++) {
                  setState(() {
                    GlobalLists.mmtmlist.add(mmtm.Datum(
                        id: resp.data[i].id,
                        videoDesc: resp.data[i].videoDesc,
                        videoLink: resp.data[i].videoLink,
                        countryId: resp.data[i].countryId,
                        categoryId: resp.data[i].categoryId,
                        year: resp.data[i].status));
                  });
                }
              } else {
                for (int i = offset; i < totalcount; i++) {
                  setState(() {
                    GlobalLists.mmtmlist.add(mmtm.Datum(
                        id: resp.data[i].id,
                        videoDesc: resp.data[i].videoDesc,
                        videoLink: resp.data[i].videoLink,
                        countryId: resp.data[i].countryId,
                        categoryId: resp.data[i].categoryId,
                        year: resp.data[i].status));
                  });
                }
              }

              offset = totalcount;
              int remem = resp.data.length - totalcount;
              print("remem");
              print(remem);
              if (remem < 10) {
                totalcount = totalcount + remem;
              } else {
                totalcount = totalcount + 10;
              }

              print(totalcount);
              print(GlobalLists.mmtmlist.length);
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
          //     Navigator.of(_keyLoader.currentContext).pop();
        },
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

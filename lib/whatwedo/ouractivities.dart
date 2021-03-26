import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:merckfoundation22dec/model/ourActivitiesObjectiveResp.dart';
import 'package:merckfoundation22dec/model/ourActivitiesResponse.dart'
    as listdata;
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';

import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';

import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/whatwedo/ouractivtydetail.dart';

class OurActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OurActivityState();
  }
}

class OurActivityState extends State<OurActivity> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  ScrollController _sc = new ScrollController();
  listdata.OurActivityResponse resp;
  int totalcount = 10;
  int page = 10;
  int offset = 0;
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    getActivitiesObjectives();
    GlobalLists.ourActivitiesData.clear();

    getActivitiesData();
    _sc = new ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    //   print("scroll");
    if (_sc.position.extentAfter < 50) {
      if (!_isLoading && totalcount > GlobalLists.ourActivitiesData.length) {
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
                    GlobalLists.ourActivitiesData.add(listdata.ListElement(
                        id: resp.data.list[i].id,
                        title: resp.data.list[i].title,
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
        title: "Our Activities",
        sharelink: Constantstring.shareouractivity,
        titleImg: "assets/newImages/vision_logo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      body: ListView(
        shrinkWrap: true,
        controller: _sc,
        physics: ScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child: ListView(
              shrinkWrap: true,
              //  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                GlobalLists.ourActivitiesObjectives.length <= 0
                    ? Container(
                        child: Center(child: Text(Constantstring.emptyData)),
                      )
                    : Html(
                        data:
                            """${GlobalLists.ourActivitiesObjectives[0].pageContent} """,
                        onLinkTap: (url) {
                          print("Opening $url...");
                        },
                        // style: {
                        //   "body": Style(
                        //     fontSize: FontSize(
                        //         ResponsiveFlutter.of(context).fontSize(2.2)),
                        //     fontWeight: FontWeight.w600,
                        //     color: Customcolor.pink_col,
                        //   ),
                        // },
                      ),
                SizedBox(
                  height: 15,
                ),
                // FormLabel(
                //   text:
                //       "The Merck Foundation focuses on activities that will contribute towards the Sustainable Development Goals (SDGs) as outlined by the United Nations.",
                //   labelColor: Customcolor.text_darkgrey,
                //   fontweight: FontWeight.w400,
                //   fontSize: ResponsiveFlutter.of(context).fontSize(1.9),
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
            child: FormLabel(
              text: "Our Activities",
              labelColor: Customcolor.colorPink,
              fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
              fontweight: FontWeight.w500,
            ),
          ),
          (GlobalLists.ourActivitiesData.length == 0 && _isLoading)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : (GlobalLists.ourActivitiesData.length == 0 &&
                      _isLoading == false)
                  ? Center(
                      child: Container(
                        child: Center(child: Text(Constantstring.emptyData)),
                      ),
                    )
                  : GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                          GlobalLists.ourActivitiesData.length, (index) {
                        if (GlobalLists.ourActivitiesData.length - 1 == index &&
                            _isLoading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.only(right: 5.0, left: 5),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            OurActivtyDetail(
                                              activtydetaill: GlobalLists
                                                  .ourActivitiesData[index]
                                                  .details,
                                              activtytitle: GlobalLists
                                                  .ourActivitiesData[index]
                                                  .title,
                                            )));
                              },
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: Container(
                                    width: SizeConfig.blockSizeHorizontal * 50,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: FadeInImage.assetNetwork(
                                              placeholder:
                                                  'assets/newImages/placeholder_3.jpg',
                                              image: Constantstring.baseUrl +
                                                  GlobalLists
                                                      .ourActivitiesData[index]
                                                      .image,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              GlobalLists
                                                  .ourActivitiesData[index]
                                                  .title,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color:
                                                    Customcolor.text_darkblue,
                                                fontSize: ResponsiveFlutter.of(
                                                        context)
                                                    .fontSize(1.6),
                                                fontWeight: FontWeight.w500,
                                              ),
                                              overflow: TextOverflow.ellipsis,
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
          // GlobalLists.ourActivitiesData.length <= 0
          //     ? Container(
          //         child: Center(child: Text(Constantstring.emptyData)),
          //       )
          //     : ouractivities(),
          // Padding(
          //   padding:
          //       const EdgeInsets.only(right: 60, left: 60, top: 20, bottom: 20),
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
          )
        ],
      ),
    );
  }

  Widget ouractivities() {
    return Container(
        height: 190,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: GlobalLists.ourActivitiesData.length,
            itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  OurActivtyDetail(
                                    activtydetaill: GlobalLists
                                        .ourActivitiesData[index].details,
                                    activtytitle: GlobalLists
                                        .ourActivitiesData[index].title,
                                  )));
                    },
                    child: Container(
                      height: SizeConfig.blockSizeVertical * 20,
                      width: SizeConfig.blockSizeHorizontal * 86,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 86,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/newImages/placeholder_3.jpg',
                              image: Constantstring.baseUrl +
                                  GlobalLists.ourActivitiesData[index].image,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 80,
                                        child: Text(
                                          GlobalLists
                                              .ourActivitiesData[index].title,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                          maxLines: 3,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(left: 0),
                                      //   child: Row(
                                      //     children: [
                                      //       Container(
                                      //         width: 85,
                                      //         height: 30,
                                      //         decoration: BoxDecoration(
                                      //             color: Colors.amber,
                                      //             borderRadius:
                                      //                 BorderRadius.circular(5)),
                                      //         child: Center(
                                      //           child: FormLabel(
                                      //             text: 'Portuguese',
                                      //             fontSize:
                                      //                 ResponsiveFlutter.of(
                                      //                         context)
                                      //                     .fontSize(1.8),
                                      //             labelColor:
                                      //                 Customcolor.text_darkblue,
                                      //             fontweight: FontWeight.w400,
                                      //           ),
                                      //         ),
                                      //       ),
                                      //       SizedBox(
                                      //         width: 4,
                                      //       ),
                                      //       Container(
                                      //         width: 60,
                                      //         height: 30,
                                      //         decoration: BoxDecoration(
                                      //             color: Colors.amber,
                                      //             borderRadius:
                                      //                 BorderRadius.circular(5)),
                                      //         child: Center(
                                      //           child: FormLabel(
                                      //             text: 'French',
                                      //             fontSize:
                                      //                 ResponsiveFlutter.of(
                                      //                         context)
                                      //                     .fontSize(1.8),
                                      //             labelColor:
                                      //                 Customcolor.text_darkblue,
                                      //             fontweight: FontWeight.w400,
                                      //           ),
                                      //         ),
                                      //       ),
                                      //       SizedBox(
                                      //         width: 4,
                                      //       ),
                                      //       Container(
                                      //         width: 70,
                                      //         height: 30,
                                      //         decoration: BoxDecoration(
                                      //             color: Colors.amber,
                                      //             borderRadius:
                                      //                 BorderRadius.circular(5)),
                                      //         child: Center(
                                      //           child: FormLabel(
                                      //             text: 'English',
                                      //             fontSize:
                                      //                 ResponsiveFlutter.of(
                                      //                         context)
                                      //                     .fontSize(1.8),
                                      //             labelColor:
                                      //                 Customcolor.text_darkblue,
                                      //             fontweight: FontWeight.w400,
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }

  getActivitiesObjectives() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      // ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.ourActivitiesObjectives,
        (response) async {
          OurActivityObjectiveResponse resp = response;
          print(response);
          print('Resp : $resp');

          if (resp.success == "True") {
            setState(() {
              GlobalLists.ourActivitiesObjectives = resp.data.list;
            });
          } else {
            ShowDialogs.showToast(resp.msg);
            //   Navigator.of(_keyLoader.currentContext).pop();
          }
        },
        (error) {
          print('ERR msg is $error');
          //   Navigator.of(_keyLoader.currentContext).pop();
        },
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }

  getActivitiesData() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      //  ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.ourActivities,
        (response) async {
          resp = response;
          print(response);
          print('Resp : $resp');

          // Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            Constantstring.baseUrl = resp.baseUrl;

            if (resp.data.list.length < 10) {
              for (int i = offset; i < resp.data.list.length; i++) {
                setState(() {
                  GlobalLists.ourActivitiesData.add(listdata.ListElement(
                      id: resp.data.list[i].id,
                      title: resp.data.list[i].title,
                      image: resp.data.list[i].image));
                });
              }
            } else {
              for (int i = offset; i < totalcount; i++) {
                setState(() {
                  GlobalLists.ourActivitiesData.add(listdata.ListElement(
                      id: resp.data.list[i].id,
                      title: resp.data.list[i].title,
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
            //  print(GlobalLists.ourPartnerList.length);

            setState(() {
              _isLoading = false;
            });
          } else {
            ShowDialogs.showToast(resp.msg);
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

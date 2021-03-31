import 'dart:convert';
import 'dart:io';

import 'package:adv_fab/adv_fab.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/ViewmoreAlbum.dart';
import 'package:merckfoundation22dec/model/stemsubmenuprogramlist.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Merckstemprogram.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/StemInnerPages.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/drawerWidget.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class OurProgramStem extends StatefulWidget {
  OurProgramStem(
      {Key key, this.title, this.indexpass, this.innertitle, this.innerdetail})
      : super(key: key);

  final String title;
  final int indexpass;
  final String innertitle;
  final String innerdetail;

  @override
  _MyHomePageState createState() => _MyHomePageState(this.indexpass);
}

Map<String, bool> expansionState = Map();

class _MyHomePageState extends State<OurProgramStem> {
  final int indexpass;
  AdvFabController mabialaFABController;

  // var expansionList = [
  //   "4th Edition of UNESCO-MARS",
  // ];
  void closeOpenExpansionList(expansionName) {
    GlobalLists.stemprogramlistsubmenu.forEach((name) {
      if (name != expansionName) expansionState[name.menuName] = false;
    });
    setState(() {
      if (!expansionState[expansionName]) expansionState[expansionName] = true;
    });
  }

  bool useAsFloatingActionButton = true;

  _MyHomePageState(this.indexpass);
  @override
  void initState() {
    super.initState();

    getstemprogram();
    mabialaFABController = AdvFabController();
  }

  setData() {
    GlobalLists.stemprogramlistsubmenu.forEach((name) {
      expansionState.putIfAbsent(name.menuName, () => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AdvFabBottomBarBody(
          screens: <Widget>[
            widget.indexpass == 2
                ? StemInnerPages(
                    title: widget.innertitle,
                    details: widget.innerdetail,
                  )
                : Merckstemprogram()
          ],
          controller: mabialaFABController,
        ),

        ///[SEtting up the floating action button]
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: AdvFab(
            showLogs: true,
            floatingActionButtonExpendedWidth: 80,
            onFloatingActionButtonTapped: () {
              mabialaFABController.setExpandedWidgetConfiguration(
                showLogs: true,
                heightToExpandTo: 44,
                expendedBackgroundColor: Customcolor.programyellow,
                withChild: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    width: (MediaQuery.of(context).size.width) * 50,

                    ///[IMPORTANT]: the height percentage shall be less than [heightToExpandTo]
                    ///in the next line we use 20%
                    height: 330,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              mabialaFABController
                                  .setExpandedWidgetConfiguration(
                                showLogs: true,
                                heightToExpandTo: 60,
                                expendedBackgroundColor:
                                    Customcolor.programyellow,
                                withChild: Container(
                                  width:
                                      (MediaQuery.of(context).size.width) * 50,

                                  ///[IMPORTANT]: the height percentage shall be less than [heightToExpandTo]
                                  ///in the next line we use 20%
                                  height: 330,
                                  child: ListView(
                                    shrinkWrap: true,
                                    // crossAxisAlignment:
                                    //     CrossAxisAlignment.start,
                                    children: <Widget>[
                                      GestureDetector(
                                          onTap: () {},
                                          child: Align(
                                              alignment: Alignment.topRight,
                                              child: Icon(
                                                Icons.close,
                                                color: Customcolor.colorBlue,
                                              ))),
                                      Expanded(
                                          flex: 5,
                                          child: Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: ListView(
                                              shrinkWrap: true,
                                              //  crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ListView.builder(
                                                  itemCount: GlobalLists
                                                      .stemprogramlistsubmenu
                                                      .length,
                                                  shrinkWrap: true,
                                                  physics: ScrollPhysics(),
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 5,
                                                              left: 4,
                                                              right: 4),
                                                      child: Column(
                                                        children: [
                                                          GlobalLists
                                                                      .stemprogramlistsubmenu[
                                                                          index]
                                                                      .children
                                                                      .length ==
                                                                  0
                                                              ? Column(
                                                                  // mainAxisAlignment:
                                                                  //     MainAxisAlignment.start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    FormLabel(
                                                                      text: GlobalLists
                                                                          .stemprogramlistsubmenu[
                                                                              index]
                                                                          .menuName,
                                                                      labelColor:
                                                                          Customcolor
                                                                              .text_darkblue,
                                                                      fontweight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize: ResponsiveFlutter.of(
                                                                              context)
                                                                          .fontSize(
                                                                              1.8),
                                                                      textAlignment:
                                                                          TextAlign
                                                                              .start,
                                                                    ),
                                                                    Divider(
                                                                      color: Colors
                                                                          .black,
                                                                    )
                                                                  ],
                                                                )
                                                              : Container(
                                                                  width: SizeConfig
                                                                          .blockSizeHorizontal *
                                                                      100,
                                                                  color: GlobalLists
                                                                              .stemprogramlistsubmenu[
                                                                                  index]
                                                                              .children
                                                                              .length ==
                                                                          0
                                                                      ? Colors
                                                                          .transparent
                                                                      : Color(
                                                                          0xffC1DEA4),
                                                                  child: Theme(
                                                                    data: Theme.of(
                                                                            context)
                                                                        .copyWith(
                                                                      dividerColor:
                                                                          Colors
                                                                              .transparent,
                                                                    ),
                                                                    child:
                                                                        ExpansionTile(
                                                                      backgroundColor: GlobalLists.stemprogramlistsubmenu[index].children.length == 0
                                                                          ? Colors
                                                                              .transparent
                                                                          : Color(
                                                                              0xffC1DEA4),
                                                                      // trailing: null,
                                                                      tilePadding:
                                                                          EdgeInsets.all(
                                                                              0.0),
                                                                      key:
                                                                          GlobalKey(),
                                                                      initiallyExpanded: expansionState[GlobalLists
                                                                          .stemprogramlistsubmenu[
                                                                              index]
                                                                          .menuName],
                                                                      title:
                                                                          Container(
                                                                        // color: Color(0xffC1DEA4),
                                                                        //  padding: EdgeInsets.zero,
                                                                        child:
                                                                            FormLabel(
                                                                          text: GlobalLists
                                                                              .stemprogramlistsubmenu[index]
                                                                              .menuName,
                                                                          labelColor:
                                                                              Customcolor.text_darkblue,
                                                                          fontweight:
                                                                              FontWeight.w600,
                                                                          fontSize:
                                                                              ResponsiveFlutter.of(context).fontSize(1.8),
                                                                        ),
                                                                      ),
                                                                      onExpansionChanged:
                                                                          ((newState) {
                                                                        expansionState[GlobalLists
                                                                            .stemprogramlistsubmenu[index]
                                                                            .menuName] = newState;
                                                                        if (newState)
                                                                          closeOpenExpansionList(GlobalLists
                                                                              .stemprogramlistsubmenu[index]
                                                                              .menuName);
                                                                      }),
                                                                      children: <
                                                                          Widget>[
                                                                        GlobalLists.stemprogramlistsubmenu[index].children.length !=
                                                                                0
                                                                            ? ListView.builder(
                                                                                itemCount: GlobalLists.stemprogramlistsubmenu[index].children.length,
                                                                                shrinkWrap: true,
                                                                                physics: ScrollPhysics(),
                                                                                itemBuilder: (BuildContext context, int indexchildren) {
                                                                                  return Padding(
                                                                                    padding: const EdgeInsets.only(left: 8, right: 8, bottom: 6),
                                                                                    child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        GestureDetector(
                                                                                            onTap: () {},
                                                                                            child: FormLabel(
                                                                                              text: GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuName,
                                                                                              labelColor: Customcolor.text_darkblue,
                                                                                              fontweight: FontWeight.w600,
                                                                                              fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                                                                                            )),
                                                                                        Divider(
                                                                                          color: Colors.black,
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              )
                                                                            : Container(),
// ;                                                  Divider(
//                                                     color:
//                                                         Customcolor.colorBlue,
//                                                   ),
//                                                   SizedBox(
//                                                     height: 5,
//                                                   ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              );
                              mabialaFABController.isCollapsed
                                  ? mabialaFABController.expandFAB()
                                  : mabialaFABController.collapseFAB();
                            },
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.close,
                                  color: Customcolor.colorBlue,
                                ))),
                        //here need to do code
                        Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: ListView(
                                shrinkWrap: true,
                                //  crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListView.builder(
                                    itemCount: GlobalLists
                                        .stemprogramlistsubmenu.length,
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 5, left: 4, right: 4),
                                        child: Column(
                                          children: [
                                            GlobalLists
                                                        .stemprogramlistsubmenu[
                                                            index]
                                                        .children
                                                        .length ==
                                                    0
                                                ? GestureDetector(
                                                    onTap: () {
                                                      if (GlobalLists
                                                          .stemprogramlistsubmenu[
                                                              index]
                                                          .menuUrl
                                                          .contains(".pdf")) {
                                                        print("pdf");
                                                        ShowDialogs.launchURL(
                                                            GlobalLists
                                                                .stemprogramlistsubmenu[
                                                                    index]
                                                                .menuUrl);
                                                      } else if (GlobalLists
                                                          .stemprogramlistsubmenu[
                                                              index]
                                                          .menuUrl
                                                          .contains(".png")) {
                                                        print("pdf");
                                                        ShowDialogs.launchURL(
                                                            GlobalLists
                                                                .stemprogramlistsubmenu[
                                                                    index]
                                                                .menuUrl);
                                                      } else if (GlobalLists
                                                          .stemprogramlistsubmenu[
                                                              index]
                                                          .menuUrl
                                                          .contains(".jpg")) {
                                                        print("pdf");
                                                        ShowDialogs.launchURL(
                                                            GlobalLists
                                                                .stemprogramlistsubmenu[
                                                                    index]
                                                                .menuUrl);
                                                      } else if (GlobalLists
                                                          .stemprogramlistsubmenu[
                                                              index]
                                                          .menuUrl
                                                          .contains(".jpeg")) {
                                                        print("pdf");
                                                        ShowDialogs.launchURL(
                                                            GlobalLists
                                                                .stemprogramlistsubmenu[
                                                                    index]
                                                                .menuUrl);
                                                      } else {
                                                        print("detail");
                                                        getsteminnerapi(GlobalLists
                                                            .stemprogramlistsubmenu[
                                                                index]
                                                            .menuUrl);
                                                      }
                                                    },
                                                    child: Column(
                                                      // mainAxisAlignment:
                                                      //     MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        FormLabel(
                                                          text: GlobalLists
                                                              .stemprogramlistsubmenu[
                                                                  index]
                                                              .menuName,
                                                          labelColor: Customcolor
                                                              .text_darkblue,
                                                          fontweight:
                                                              FontWeight.w600,
                                                          fontSize:
                                                              ResponsiveFlutter
                                                                      .of(
                                                                          context)
                                                                  .fontSize(
                                                                      1.8),
                                                          textAlignment:
                                                              TextAlign.start,
                                                        ),
                                                        Divider(
                                                          color: Colors.black,
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                : Container(
                                                    width: SizeConfig
                                                            .blockSizeHorizontal *
                                                        100,
                                                    color: GlobalLists
                                                                .stemprogramlistsubmenu[
                                                                    index]
                                                                .children
                                                                .length ==
                                                            0
                                                        ? Colors.transparent
                                                        : Color(0xffC1DEA4),
                                                    child: Theme(
                                                      data: Theme.of(context)
                                                          .copyWith(
                                                        dividerColor:
                                                            Colors.transparent,
                                                      ),
                                                      child: ExpansionTile(
                                                        backgroundColor: GlobalLists
                                                                    .stemprogramlistsubmenu[
                                                                        index]
                                                                    .children
                                                                    .length ==
                                                                0
                                                            ? Colors.transparent
                                                            : Color(0xffC1DEA4),
                                                        // trailing: null,
                                                        tilePadding:
                                                            EdgeInsets.all(0.0),
                                                        key: GlobalKey(),
                                                        initiallyExpanded:
                                                            expansionState[
                                                                GlobalLists
                                                                    .stemprogramlistsubmenu[
                                                                        index]
                                                                    .menuName],
                                                        title: Container(
                                                          // color: Color(0xffC1DEA4),
                                                          //  padding: EdgeInsets.zero,
                                                          child: FormLabel(
                                                            text: GlobalLists
                                                                .stemprogramlistsubmenu[
                                                                    index]
                                                                .menuName,
                                                            labelColor: Customcolor
                                                                .text_darkblue,
                                                            fontweight:
                                                                FontWeight.w600,
                                                            fontSize:
                                                                ResponsiveFlutter.of(
                                                                        context)
                                                                    .fontSize(
                                                                        1.8),
                                                          ),
                                                        ),
                                                        onExpansionChanged:
                                                            ((newState) {
                                                          expansionState[GlobalLists
                                                              .stemprogramlistsubmenu[
                                                                  index]
                                                              .menuName] = newState;
                                                          if (newState)
                                                            closeOpenExpansionList(
                                                                GlobalLists
                                                                    .stemprogramlistsubmenu[
                                                                        index]
                                                                    .menuName);
                                                        }),
                                                        children: <Widget>[
                                                          GlobalLists
                                                                      .stemprogramlistsubmenu[
                                                                          index]
                                                                      .children
                                                                      .length !=
                                                                  0
                                                              ? ListView
                                                                  .builder(
                                                                  itemCount: GlobalLists
                                                                      .stemprogramlistsubmenu[
                                                                          index]
                                                                      .children
                                                                      .length,
                                                                  shrinkWrap:
                                                                      true,
                                                                  physics:
                                                                      ScrollPhysics(),
                                                                  itemBuilder:
                                                                      (BuildContext
                                                                              context,
                                                                          int indexchildren) {
                                                                    return Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              8,
                                                                          right:
                                                                              8,
                                                                          bottom:
                                                                              6),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          GestureDetector(
                                                                              onTap: () {
                                                                                if (GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl.contains(".pdf")) {
                                                                                  print("pdf");
                                                                                  ShowDialogs.launchURL(GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl);
                                                                                } else if (GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl.contains(".png")) {
                                                                                  print("pdf");
                                                                                  ShowDialogs.launchURL(GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl);
                                                                                } else if (GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl.contains(".jpg")) {
                                                                                  print("pdf");
                                                                                  ShowDialogs.launchURL(GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl);
                                                                                } else if (GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl.contains(".jpeg")) {
                                                                                  print("pdf");
                                                                                  ShowDialogs.launchURL(GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl);
                                                                                } else if (GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuName.contains("Photos")) {
                                                                                  print("call api here");
                                                                                  String menuurl = GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl;
                                                                                  print(menuurl.split('http://merckfoundation.org/mfindia/web/public/Merck_Events_Gallery/'));
                                                                                  List<String> replacemenu = menuurl.split('http://merckfoundation.org/mfindia/web/public/Merck_Events_Gallery/');
                                                                                  print(replacemenu.toString());
                                                                                  String firstreplace = replacemenu.toString();
                                                                                  String first = firstreplace.replaceAll('[', "");
                                                                                  String seconfreplace = first.toString();
                                                                                  String second = seconfreplace.replaceAll(',', "");
                                                                                  String thirdreplace = second.toString();
                                                                                  String pageurl = thirdreplace.replaceAll(']', "");
                                                                                  print(pageurl);
                                                                                  Navigator.push(
                                                                                      context,
                                                                                      MaterialPageRoute(
                                                                                          builder: (BuildContext context) => ViewmoreAlbum(
                                                                                                apiurl: APIManager.viewmorealbum,
                                                                                                albumtitle: pageurl,
                                                                                                sharelink: GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl,
                                                                                                albumurl: pageurl.trim(),
                                                                                              )));
                                                                                } else {
                                                                                  print("detail");
                                                                                  getsteminnerapi(GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl);
                                                                                }
                                                                              },
                                                                              child: FormLabel(
                                                                                text: GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuName,
                                                                                labelColor: Customcolor.text_darkblue,
                                                                                fontweight: FontWeight.w600,
                                                                                fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                                                                              )),
                                                                          Divider(
                                                                            color:
                                                                                Colors.black,
                                                                          )
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                )
                                                              : Container(),
// ;                                                  Divider(
//                                                     color:
//                                                         Customcolor.colorBlue,
//                                                   ),
//                                                   SizedBox(
//                                                     height: 5,
//                                                   ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              );
              mabialaFABController.isCollapsed
                  ? mabialaFABController.expandFAB()
                  : mabialaFABController.collapseFAB();
            },
            floatingActionButtonIcon: Icons.menu,

            floatingActionButtonIconColor: Customcolor.colorBlue,
            navigationBarIconActiveColor: Colors.pink,
            navigationBarIconInactiveColor: Colors.pink[200].withOpacity(0.6),
            collapsedColor: Customcolor.programyellow,
            // useAsFloatingSpaceBar: useFloatingSpaceBar,
            useAsFloatingActionButton: useAsFloatingActionButton,
            //useAsNavigationBar: useNavigationBar,
            controller: mabialaFABController,
            animationDuration: Duration(milliseconds: 150),
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  getstemprogram() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      //  ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.stemprogramlist,
        (response) async {
          StemsubmenuprogramlistResponse resp = response;
          print(response);
          print('Resp : $resp');

          // Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.stemprogramlistsubmenu = resp.data.list;
              print("stemlength");
              print(GlobalLists.stemprogramlistsubmenu.length);
              setData();
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

  Future<http.Response> fetchPostWithBodyResponse(
      String url, dynamic body) async {
    IOClient ioClient = new IOClient();

    HttpClient client = new HttpClient();

    ioClient = new IOClient(client);
    final response = await ioClient.post(url, body: body);
    print('pit stop');
    return response;
  }

  getsteminnerapi(String menuurl) async {
    var status = await ConnectionDetector.checkInternetConnection();

    if (status) {
      dynamic bodyData = {
        'page_url': menuurl,
      };

      // String body = json.encode(bodyData);
      print(bodyData);
      var response = await fetchPostWithBodyResponse(
        APIManager.steminnerpages,
        bodyData,
      );
      print(APIManager.steminnerpages);
      print(bodyData);
      var res = json.decode(response.body);
      print("res");
      print(res);
      //1-video 2-News_Release 3-Article 4-Events 5-Testimonials 6-Photo  7-Media 8-ceomeaasage 9-award
      if (response.statusCode == 200) {
        if (res['success'] == true) {
          print("here it is");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => OurProgramStem(
                        indexpass: 2,
                        innertitle: res['list']['p_name'],
                        innerdetail: res['list']['p_details'],
                      )
                  //  StemInnerPages(
                  //       title: res['list']['p_name'],
                  //       details: res['list']['p_details'],
                  //     )
                  ));
        } else {
          setState(() {
            ShowDialogs.showToast(res['msg']);
          });
          //showErrorDialog(context, message: "Something went wrong!");
        }
      } else {
        ShowDialogs.showToast("Server Not Responding");
      }
    } else {
      setState(() {
        ShowDialogs.showToast("Please check Internet Connection.");
      });
    }
  }
}

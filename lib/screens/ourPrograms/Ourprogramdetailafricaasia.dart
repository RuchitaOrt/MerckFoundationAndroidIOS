import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:adv_fab/adv_fab.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/ViewmoreAlbum.dart';
import 'package:merckfoundation22dec/model/our_gallery_detail_response.dart';
import 'package:merckfoundation22dec/model/stemsubmenuprogramlist.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/AfricaAsiaLuminar.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/StemInnerPages.dart';
import 'package:merckfoundation22dec/screens/our_gallery_detail.dart';
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
import 'package:url_launcher/url_launcher.dart';

import '../../mediascreen.dart/Detailpage.dart';
import '../../mediascreen.dart/perticulart_details.dart';

class OurProgramAfrica extends StatefulWidget {
  OurProgramAfrica(
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

class _MyHomePageState extends State<OurProgramAfrica> {
  final int indexpass;
  AdvFabController mabialaFABController;

  var expansionList2 = [
    "About 6th Edition of Merck Foundation Africa Asia Luminary",
  ];

  bool useAsFloatingActionButton = true;

  _MyHomePageState(this.indexpass);
  @override
  void initState() {
    print('advvvvvvvvvvvvvvvvvv');
    super.initState();
    getafricarogram();
    mabialaFABController = AdvFabController();
    //  setData();
    // setData1();
    // setData2();
  }

  setData() {
    GlobalLists.stemprogramlistsubmenu.forEach((name) {
      expansionState.putIfAbsent(name.menuName, () => false);
    });
  }

  void closeOpenExpansionList(expansionName) {
    GlobalLists.stemprogramlistsubmenu.forEach((name) {
      if (name != expansionName) expansionState[name.menuName] = false;
    });
    setState(() {
      if (!expansionState[expansionName]) expansionState[expansionName] = true;
    });
  }

  // setData1() {
  //   expansionList1.forEach((name) {
  //     expansionState.putIfAbsent(name, () => false);
  //   });
  // }

  // setData2() {
  //   expansionList2.forEach((name) {
  //     expansionState.putIfAbsent(name, () => false);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AdvFabBottomBarBody(
          screens: <Widget>[
            widget.indexpass == 3
                ? StemInnerPages(
                    title: widget.innertitle,
                    details: widget.innerdetail,
                  )
                : MerckAfricaasialuminar()
          ],
          controller: mabialaFABController,
        ),
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
                    height: Platform.isAndroid
                        ? 330
                        : SizeConfig.blockSizeVertical * 40,
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
                                  height: Platform.isAndroid
                                      ? 330
                                      : SizeConfig.blockSizeVertical * 40,
                                  child: ListView(
                                    shrinkWrap: true,
                                    // crossAxisAlignment:
                                    //     CrossAxisAlignment.start,
                                    children: <Widget>[
                                      GestureDetector(
                                          onTap: () {},
                                          child: Align(
                                              alignment: Alignment.topRight,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10, top: 10),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Customcolor.colorBlue,
                                                ),
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
                                                                      : index % 3 ==
                                                                              0
                                                                          ? Color(
                                                                              0xffA9E2FC)
                                                                          : index % 3 == 1
                                                                              ? Color(0xffC1DEA4)
                                                                              : index % 3 == 2
                                                                                  ? Color(0xffE0C0CB)
                                                                                  : Color(0xffC1DEA4),
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
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(right: 10, top: 10),
                                  child: Icon(
                                    Icons.close,
                                    color: Customcolor.colorBlue,
                                  ),
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
                                                      mabialaFABController
                                                          .collapseFAB();
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
                                                      } else if (GlobalLists
                                                              .stemprogramlistsubmenu[
                                                                  index]
                                                              .menuUrl ==
                                                          "Photos") {
                                                        print("call api here");
                                                        String menuurl = GlobalLists
                                                            .stemprogramlistsubmenu[
                                                                index]
                                                            .menuUrl;
                                                        //
                                                        List<String> splits =
                                                            menuurl.split('/');
                                                        print("last elemt");
                                                        print(splits[
                                                            splits.length - 1]);
                                                        String pageurl = splits[
                                                            splits.length - 1];

                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    ViewmoreAlbum(
                                                                      apiurl: APIManager
                                                                          .viewmorealbum,
                                                                      albumtitle:
                                                                          pageurl,
                                                                      sharelink: GlobalLists
                                                                          .stemprogramlistsubmenu[
                                                                              index]
                                                                          .menuUrl,
                                                                      albumurl:
                                                                          pageurl
                                                                              .trim(),
                                                                    )));
                                                      } else if (GlobalLists
                                                              .stemprogramlistsubmenu[
                                                                  index]
                                                              .menuName ==
                                                          "Photo") {
                                                        print("call api here");
                                                        String menuurl = GlobalLists
                                                            .stemprogramlistsubmenu[
                                                                index]
                                                            .menuUrl;
                                                        //
                                                        List<String> splits =
                                                            menuurl.split('/');
                                                        print("last elemt");
                                                        print(splits[
                                                            splits.length - 1]);
                                                        String pageurl = splits[
                                                            splits.length - 1];

                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    ViewmoreAlbum(
                                                                      apiurl: APIManager
                                                                          .viewmorealbum,
                                                                      albumtitle:
                                                                          pageurl,
                                                                      sharelink: GlobalLists
                                                                          .stemprogramlistsubmenu[
                                                                              index]
                                                                          .menuUrl,
                                                                      albumurl:
                                                                          pageurl
                                                                              .trim(),
                                                                    )));
                                                      } else if (GlobalLists
                                                              .stemprogramlistsubmenu[
                                                                  index]
                                                              .menuName ==
                                                          "Photo Gallery") {
                                                        print("call api here");
                                                        String menuurl = GlobalLists
                                                            .stemprogramlistsubmenu[
                                                                index]
                                                            .menuUrl;

                                                        List<String> splits =
                                                            menuurl.split('/');
                                                        print("last elemt");
                                                        print(splits[
                                                            splits.length - 1]);
                                                        String pageurl = splits[
                                                            splits.length - 1];
                                                        print(pageurl);
                                                        getphotodetail(pageurl);
                                                      } else {
                                                        print("detail3");
                                                        print(
                                                            "details ${GlobalLists.stemprogramlistsubmenu[index].menuUrl}");
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
                                                        : index % 3 == 0
                                                            ? Color(0xffA9E2FC)
                                                            : index % 3 == 1
                                                                ? Color(
                                                                    0xffC1DEA4)
                                                                : index % 3 == 2
                                                                    ? Color(
                                                                        0xffE0C0CB)
                                                                    : Color(
                                                                        0xffC1DEA4),
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
                                                            : index % 3 == 0
                                                                ? Color(
                                                                    0xffA9E2FC)
                                                                : index % 3 == 1
                                                                    ? Color(
                                                                        0xffC1DEA4)
                                                                    : index % 3 ==
                                                                            2
                                                                        ? Color(
                                                                            0xffE0C0CB)
                                                                        : Color(
                                                                            0xffC1DEA4),

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
                                                                                print('15-01');
                                                                                mabialaFABController.collapseFAB();
                                                                                if (GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl.contains(".pdf")) {
                                                                                  print("pdf");
                                                                                  ShowDialogs.launchURL(GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl);
                                                                                } else if (GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl.contains(".png")) {
                                                                                  ShowDialogs.launchURL(GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl);
                                                                                } else if (GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl.contains(".jpg")) {
                                                                                  ShowDialogs.launchURL(GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl);
                                                                                } else if (GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl.contains(".jpeg")) {
                                                                                  ShowDialogs.launchURL(GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl);
                                                                                } else if (GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuName == "Photos") {
                                                                                  print("call api here");
                                                                                  String menuurl = GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl;
                                                                                  List<String> splits = menuurl.split('/');
                                                                                  print("last elemt");
                                                                                  print(splits[splits.length - 1]);
                                                                                  String pageurl = splits[splits.length - 1];

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
                                                                                } else if (GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuName == "Photo") {
                                                                                  print("call api here");
                                                                                  String menuurl = GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl;
                                                                                  //
                                                                                  List<String> splits = menuurl.split('/');
                                                                                  print("last elemt");
                                                                                  print(splits[splits.length - 1]);
                                                                                  String pageurl = splits[splits.length - 1];

                                                                                  Navigator.push(
                                                                                      context,
                                                                                      MaterialPageRoute(
                                                                                          builder: (BuildContext context) => ViewmoreAlbum(
                                                                                                apiurl: APIManager.viewmorealbum,
                                                                                                albumtitle: pageurl,
                                                                                                sharelink: GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl,
                                                                                                albumurl: pageurl.trim(),
                                                                                              )));
                                                                                } else if (GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuName == "Photo Gallery") {
                                                                                  print("photo gallery");
                                                                                  String menuurl = GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl;

                                                                                  List<String> splits = menuurl.split('/');
                                                                                  print("last elemt");
                                                                                  print(splits[splits.length - 1]);
                                                                                  String pageurl = splits[splits.length - 1];
                                                                                  print(pageurl);
                                                                                  getphotodetail(pageurl);
                                                                                } else if (GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl.contains("Photo-Gallery")) {
                                                                                  print("inside in photo");
                                                                                  String menuurl = GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl;

                                                                                  List<String> splits = menuurl.split('/');

                                                                                  print(splits[splits.length - 1]);
                                                                                  String pageurl = splits[splits.length - 1];
                                                                                  print("pageurl $pageurl");
                                                                                  getphotoapi(pageurl);
                                                                                } else if (GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl.contains("news-articles")) {
                                                                                  print("inside in news-articles");
                                                                                  String menuurl = GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl;

                                                                                  List<String> splits = menuurl.split('/');

                                                                                  print(splits[splits.length - 1]);
                                                                                  String pageurl = splits[splits.length - 1];
                                                                                  print("pageurl $pageurl");

                                                                                  newletter(pageurl);
                                                                                } else if (GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl.contains("facebook.com")) {
                                                                                  String menuurl = GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl;

                                                                                  print("inside In facebook $menuurl");

                                                                                  _launchFacebookUrl(menuurl);
                                                                                } else {
                                                                                  print("detail15-01 ${GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl}");
                                                                                  getsteminnerapi(GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl);
                                                                                }
                                                                                // if (GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl.contains(".pdf")) {
                                                                                //   print("pdf");
                                                                                //   ShowDialogs.launchURL(GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl);
                                                                                // } else {
                                                                                //   print("detail");
                                                                                //   getsteminnerapi(GlobalLists.stemprogramlistsubmenu[index].children[indexchildren].menuUrl);
                                                                                // }
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
//
        );
  }

  getphotodetail(String categoryID) async {
    var status1 = await ConnectionDetector.checkInternetConnection();
    if (status1) {
      print("here");
      //  ShowDialogs.showLoadingDialog(context, _keyLoader);
      final json = {'category_id': categoryID, 'type': "2"};
      print(json);
      APIManager().apiRequest(context, API.ourgallerydetail, (response) async {
        OurGalleryDetailsResponse resp = response;
        print(response);
        print('Resp : $resp');
        print(API.ourgallerydetail);
        //  Navigator.of(_keyLoader.currentContext).pop();
        if (resp.success == "True".toLowerCase()) {
          setState(() {
            print(resp.list);
            // GlobalLists.awarddetallisting[0].title
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => OurGalleryDetailsPage(
                          categoryID: categoryID,
                          galleryDetailsResponse: resp,
                        )));
          });
        } else {
          ShowDialogs.showToast(resp.msg);
        }
      }, (error) {
        print('ERR msg is $error');
        ShowDialogs.showToast("Server Not Responding");
        //  Navigator.of(_keyLoader.currentContext).pop();
      }, jsonval: json);
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }

  getafricarogram() async {
    print('getafricarogram');
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      //  ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.africaprogramlist,
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
    Uri uri = Uri.parse(url);

    ioClient = new IOClient(client);
    final response = await ioClient.post(uri, body: body);
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

      print("bodyData $bodyData");
      var response = await fetchPostWithBodyResponse(
        APIManager.steminnerpages,
        bodyData,
      );
      print(APIManager.steminnerpages);
      var res = json.decode(response.body);
      print("res");
      print(" res $res");
      //1-video 2-News_Release 3-Article 4-Events 5-Testimonials 6-Photo  7-Media 8-ceomeaasage 9-award
      if (response.statusCode == 200) {
        if (res['success'] == true) {
          print("here it is");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => OurProgramAfrica(
                      indexpass: 3,
                      innertitle: res['list']['p_name'],
                      innerdetail: res['list']['p_details'])

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

  newletter(String menuurl) async {
    var status = await ConnectionDetector.checkInternetConnection();

    if (status) {
      dynamic bodyData = {
        'page_url': menuurl,
      };

      // String body = json.encode(bodyData);

      print("bodyData $bodyData");
      var response = await fetchPostWithBodyResponse(
        APIManager.ariclwpages,
        bodyData,
      );
      print(APIManager.ariclwpages);
      var res = json.decode(response.body);
      print("res");
      print(" resc ${res['data']["id"]}");
      var id = res['data']["id"];
      id = int.parse(id);
      print(" rescheck $id");

      //1-video 2-News_Release 3-Article 4-Events 5-Testimonials 6-Photo  7-Media 8-ceomeaasage 9-award
      if (response.statusCode == 200) {
        if (res['status'] == true) {
          print("here it is");

          if (res["data"]["id"] != null) {
            print('checkkksd');
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Perticulardetails(
                        details: res["data"]["details"],
                        image: res["data"]["image"],
                        title: res["data"]["title"],
                      )),
            );
          } else {
            print('id is null');
          }
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

  getphotoapi(String menuurl) async {
    var status = await ConnectionDetector.checkInternetConnection();

    if (status) {
      dynamic bodyData = {
        'album_url': menuurl,
      };

      // String body = json.encode(bodyData);

      print("bodyData $bodyData");
      var response = await fetchPostWithBodyResponse(
        APIManager.viewmorealbum,
        bodyData,
      );
      print(APIManager.viewmorealbum);
      var res = json.decode(response.body);
      print("res");
      print(" res $res");
      //1-video 2-News_Release 3-Article 4-Events 5-Testimonials 6-Photo  7-Media 8-ceomeaasage 9-award
      if (response.statusCode == 200) {
        if (res['success'] == "true") {
          print("here it is");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ViewmoreAlbum(
                        apiurl: APIManager.viewmorealbum,
                        albumtitle: menuurl,
                        sharelink:
                            GlobalLists.stemprogramlistsubmenu[0].menuUrl,
                        albumurl: menuurl.trim(),
                      ))

              //  StemInnerPages(
              //       title: res['list']['p_name'],
              //       details: res['list']['p_details'],
              //     )
              );

          print(res['list']);
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

  void _launchFacebookUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

import 'package:adv_fab/adv_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:merckfoundation22dec/model/GetAwardResponse.dart';
import 'package:merckfoundation22dec/model/OurawarddetailResponse.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class OurAwardDetail extends StatefulWidget {
  final List detaill;
  final dynamic pageurl;
  final dynamic awardid;
  final dynamic year;

  const OurAwardDetail(
      {Key key, this.detaill, this.pageurl, this.awardid, this.year})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return OurActivtyDetailState();
  }
}

class OurActivtyDetailState extends State<OurAwardDetail> {
  AdvFabController mabialaFABController;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  var expansionList2 = [
    "About 6th Edition of Merck Foundation Africa Asia Luminary",
  ];

  bool useAsFloatingActionButton = true;
  @override
  void initState() {
    print('year ---');
    print("insude In Film Award");
    // TODO: implement initState
    super.initState();
    GlobalLists.awardsubtypelisting.clear();
    getawardlisting(widget.pageurl, widget.awardid, widget.year);
    mabialaFABController = AdvFabController();
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
          sharelink: Constantstring.shareawarddetailpage + widget.pageurl,
          title: widget.detaill[0].title,
          titleImg: "assets/newImages/leadership_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        floatingActionButton: GlobalLists.awardsubtypelisting.length > 0
            ? Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: AdvFab(
                  showLogs: true,
                  floatingActionButtonExpendedWidth: 80,
                  onFloatingActionButtonTapped: () {
                    mabialaFABController.setExpandedWidgetConfiguration(
                      showLogs: true,
                      heightToExpandTo: 50,
                      expendedBackgroundColor: Customcolor.programyellow,
                      withChild: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, left: 8, right: 8, bottom: 20),
                        child: Container(
                          width: (MediaQuery.of(context).size.width) * 70,

                          ///[IMPORTANT]: the height percentage shall be less than [heightToExpandTo]
                          ///in the next line we use 20%
                          height: 330,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              GestureDetector(
                                  onTap: () {
                                    print("on trap");
                                    mabialaFABController
                                        .setExpandedWidgetConfiguration(
                                      showLogs: true,
                                      heightToExpandTo: 80,
                                      expendedBackgroundColor:
                                          Customcolor.programyellow,
                                      withChild: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: (MediaQuery.of(context)
                                                  .size
                                                  .width) *
                                              70,

                                          ///[IMPORTANT]: the height percentage shall be less than [heightToExpandTo]
                                          ///in the next line we use 20%
                                          height: 330,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              GestureDetector(
                                                  onTap: () {},
                                                  child: Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 10,
                                                                top: 10),
                                                        child: Icon(
                                                          Icons.close,
                                                          color: Customcolor
                                                              .colorBlue,
                                                        ),
                                                      ))),
                                              Expanded(
                                                //   flex: 5,
                                                child: ListView.builder(
                                                  padding: EdgeInsets.all(0),
                                                  physics:
                                                      BouncingScrollPhysics(),
                                                  itemCount: GlobalLists
                                                      .awardsubtypelisting
                                                      .length,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        print(
                                                            'year ---${GlobalLists.awardsubtypelisting[index].year}');
                                                        mabialaFABController
                                                            .collapseFAB();
                                                        getawarddetail(
                                                            GlobalLists
                                                                .awardsubtypelisting[
                                                                    index]
                                                                .url,
                                                            GlobalLists
                                                                .awardsubtypelisting[
                                                                    index]
                                                                .awardId
                                                                .toString(),
                                                            GlobalLists
                                                                .awardsubtypelisting[
                                                                    index]
                                                                .year
                                                                .toString());
                                                      },
                                                      child: Container(
                                                        color:
                                                            Colors.transparent,
                                                        child: Column(
                                                          children: [
                                                            FormLabel(
                                                              text:
                                                                  "Awards ${GlobalLists.awardsubtypelisting[index].year}",
                                                              //  GlobalLists.awardsubtypelisting[index].title,
                                                              labelColor:
                                                                  Customcolor
                                                                      .text_darkblue,
                                                              fontweight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  ResponsiveFlutter.of(
                                                                          context)
                                                                      .fontSize(
                                                                          1.8),
                                                            ),

                                                            SizedBox(
                                                              height: 5,
                                                            ),

                                                            Container(
                                                              width: SizeConfig
                                                                      .blockSizeHorizontal *
                                                                  80,
                                                              height: 1.0,
                                                              color: Customcolor
                                                                  .text_darkblue,
                                                            )
                                                            // Divider(
                                                            //   color:
                                                            //       Customcolor.colorBlue,
                                                            // )
                                                          ],
                                                        ),

                                                        //height: (MediaQuery.of(context).size.height/100)*9,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
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
                                        padding: const EdgeInsets.only(
                                            right: 10, top: 10),
                                        child: Icon(
                                          Icons.close,
                                          color: Customcolor.colorBlue,
                                        ),
                                      ))),
                              Expanded(
                                flex: 5,
                                child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount:
                                      GlobalLists.awardsubtypelisting.length,
                                  scrollDirection: Axis.vertical,
                                  padding: EdgeInsets.zero,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          print(
                                              'year ---${GlobalLists.awardsubtypelisting[index].year}');
                                          mabialaFABController.collapseFAB();
                                          getawarddetail(
                                              GlobalLists
                                                  .awardsubtypelisting[index]
                                                  .url,
                                              GlobalLists
                                                  .awardsubtypelisting[index]
                                                  .awardId,
                                              GlobalLists
                                                  .awardsubtypelisting[index]
                                                  .year);
                                        },
                                        child: Container(
                                          color: Colors.transparent,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              FormLabel(
                                                text:
                                                    "Awards ${GlobalLists.awardsubtypelisting[index].year}"
                                                // GlobalLists.awardsubtypelisting[index].title,
                                                ,
                                                labelColor:
                                                    Customcolor.text_darkblue,
                                                fontweight: FontWeight.w600,
                                                fontSize: ResponsiveFlutter.of(
                                                        context)
                                                    .fontSize(1.8),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
                                                    80,
                                                height: 1.0,
                                                color:
                                                    Customcolor.text_darkblue,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
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
                  navigationBarIconInactiveColor:
                      Colors.pink[200].withOpacity(0.6),
                  collapsedColor: Customcolor.programyellow,
                  // useAsFloatingSpaceBar: useFloatingSpaceBar,
                  useAsFloatingActionButton: useAsFloatingActionButton,
                  //useAsNavigationBar: useNavigationBar,
                  controller: mabialaFABController,
                  animationDuration: Duration(milliseconds: 150),
                ),
              )
            : Container(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: HtmlWidget("${widget.detaill[0].pageContent}")

                  //  Html(
                  //   data: """${widget.detaill[0].pageContent} """,
                  //   onLinkTap: (url, renderContext, attributes, element) {
                  //     print("Opening $url...");
                  //     ShowDialogs.launchURL(url);
                  //   },
                  //   style: {
                  //     "body": Style(textAlign: TextAlign.start),
                  //     "tr": Customcolor.tableboderstyle(context),
                  //   },
                  // ),

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
                height: 10,
              ),
              Bottomcardlink(),
            ],
          ),
        ));
  }

  getawardlisting(String pageurl, String awardid, String Year) async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      //    ShowDialogs.showLoadingDialog(context, _keyLoader);
      //   final json = {
      // String  page_url= "${pageurl}/";
      // };
      // print(json);
      String page_url = "${awardid}";
      APIManager().apiRequest(context, API.get_awards, (response) async {
        GetAwardResponse resp = response;
        print(response);
        print('Resp : $resp');

        //  Navigator.of(_keyLoader.currentContext).pop();

        if (resp.status == true) {
          setState(() {
            GlobalLists.awardsubtypelisting = resp.awardsList;
            // GlobalLists.awarddetallisting[0].title
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => OurAwardDetail(
            //               detaill: GlobalLists.awarddetallisting,
            //               pageurl: pageurl,
            //             )));
          });
        } else {
          ShowDialogs.showToast(resp.message);
        }
      }, (error) {
        print('ERR msg is $error');
        Navigator.of(_keyLoader.currentContext).pop();
      }, path: page_url);
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }

  getawarddetail(String pageurl, String award, String year) async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);
      final json = {'page_url': pageurl, 'year': year};
      print(json);
      APIManager().apiRequest(context, API.ourawarddetail, (response) async {
        OurawarddetailResponse resp = response;
        print(response);
        print('Resp : $resp');

        Navigator.of(_keyLoader.currentContext).pop();

        if (resp.success == "True") {
          setState(() {
            GlobalLists.awarddetallisting = resp.data.list;

            // print(
            // "GlobalLists.awarddetallisting${GlobalLists.awarddetallisting[0}");
            // GlobalLists.awarddetallisting[0].title
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => OurAwardDetail(
                          detaill: GlobalLists.awarddetallisting,
                          pageurl: pageurl,
                          awardid: award,
                          year: year,
                        )));
          });
        } else {
          ShowDialogs.showToast(resp.msg);
        }
      }, (error) {
        print('ERR msg is $error');
        Navigator.of(_keyLoader.currentContext).pop();
      }, jsonval: json);
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

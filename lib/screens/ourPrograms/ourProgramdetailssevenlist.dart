import 'package:adv_fab/adv_fab.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Educatinglinda.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Merckcapabilityadvancement.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Merckstemprogram.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Mercksubstantionalinitiative.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Ourprogramdetailafricaasia.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/firstladiesinitiativesummit.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/ourProgramdetailsforStem.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/ourprogramdetail.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class OurProgramSevenlist extends StatefulWidget {
  OurProgramSevenlist({Key key, this.title, this.indexpass}) : super(key: key);

  final String title;
  final int indexpass;

  @override
  _MyHomePageState createState() => _MyHomePageState(this.indexpass);
}

Map<String, bool> expansionState = Map();

class _MyHomePageState extends State<OurProgramSevenlist> {
  final int indexpass;
  AdvFabController mabialaFABController;

  var expansionList = [
    "4th Edition of UNESCO-MARS",
  ];
  void closeOpenExpansionList(expansionName) {
    expansionList.forEach((name) {
      if (name != expansionName) expansionState[name] = false;
    });
    setState(() {
      if (!expansionState[expansionName]) expansionState[expansionName] = true;
    });
  }

  List programvalue = [
    "Merck More Than A Mother",
    "Merck Cancer Access Program",
    "Merck Capacity Advancement and Diabetes Blue Point Program",
    "Merck Foundation First Ladies Initiative Summit",
    "Merck STEM Program",
    "Educating Linda Program",
    "Merck Foundation Sustainability Initiative",
    "Merck Africa Asia LuminaryLocal Songs and Children Stories",
  ];

  bool useAsFloatingActionButton = true;

  _MyHomePageState(this.indexpass);
  @override
  void initState() {
    super.initState();
    mabialaFABController = AdvFabController();
    setData();
  }

  setData() {
    expansionList.forEach((name) {
      expansionState.putIfAbsent(name, () => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AdvFabBottomBarBody(
          screens: <Widget>[
            widget.indexpass == 1
                ? MerckCapabilityadvancement()
                : widget.indexpass == 2
                    ? FirstLadiesInitiativeDetails()
                    : widget.indexpass == 3
                        ? EducatingLinda()
                        : widget.indexpass == 4
                            ? MerckSubstantional()
                            : Container()
          ],
          controller: mabialaFABController,
        ),

        ///[SEtting up the floating action button]
        // floatingActionButton: AdvFab(
        //   showLogs: true,
        //   floatingActionButtonExpendedWidth: 80,
        //   onFloatingActionButtonTapped: () {
        //     mabialaFABController.setExpandedWidgetConfiguration(
        //       showLogs: true,
        //       heightToExpandTo: 44,
        //       expendedBackgroundColor: Customcolor.programyellow,
        //       withChild: Padding(
        //         padding: const EdgeInsets.all(0.0),
        //         child: Container(
        //           width: (MediaQuery.of(context).size.width) * 50,

        //           ///[IMPORTANT]: the height percentage shall be less than [heightToExpandTo]
        //           ///in the next line we use 20%
        //           height: 330,
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: <Widget>[
        //               GestureDetector(
        //                   onTap: () {
        //                     mabialaFABController.setExpandedWidgetConfiguration(
        //                       showLogs: true,
        //                       heightToExpandTo: 80,
        //                       expendedBackgroundColor:
        //                           Customcolor.programyellow,
        //                       withChild: Container(
        //                         width: (MediaQuery.of(context).size.width) * 50,

        //                         ///[IMPORTANT]: the height percentage shall be less than [heightToExpandTo]
        //                         ///in the next line we use 20%
        //                         height: 330,
        //                         child: ListView(
        //                           shrinkWrap: true,
        //                           // crossAxisAlignment:
        //                           //     CrossAxisAlignment.start,
        //                           children: <Widget>[
        //                             GestureDetector(
        //                                 onTap: () {},
        //                                 child: Align(
        //                                     alignment: Alignment.topRight,
        //                                     child: Icon(
        //                                       Icons.close,
        //                                       color: Customcolor.colorBlue,
        //                                     ))),
        //                             Expanded(
        //                                 flex: 5,
        //                                 child: Padding(
        //                                   padding: const EdgeInsets.all(0.0),
        //                                   child: Column(
        //                                     crossAxisAlignment:
        //                                         CrossAxisAlignment.start,
        //                                     children: [
        //                                       SizedBox(
        //                                         height: 5,
        //                                       ),
        //                                       FormLabel(
        //                                         text:
        //                                             "Merck More Than A Mother",
        //                                         labelColor:
        //                                             Customcolor.text_darkblue,
        //                                         fontweight: FontWeight.w600,
        //                                         fontSize: ResponsiveFlutter.of(
        //                                                 context)
        //                                             .fontSize(1.8),
        //                                       ),
        //                                       Divider(
        //                                         color: Customcolor.colorBlue,
        //                                       ),
        //                                       SizedBox(
        //                                         height: 5,
        //                                       ),
        //                                       FormLabel(
        //                                         text:
        //                                             "Merck Cancer Access Program",
        //                                         labelColor:
        //                                             Customcolor.text_darkblue,
        //                                         fontweight: FontWeight.w600,
        //                                         fontSize: ResponsiveFlutter.of(
        //                                                 context)
        //                                             .fontSize(1.8),
        //                                       ),
        //                                       Divider(
        //                                         color: Customcolor.colorBlue,
        //                                       ),
        //                                       SizedBox(
        //                                         height: 5,
        //                                       ),
        //                                       FormLabel(
        //                                         text:
        //                                             "Merck Capacity Advancement and Diabetes Blue Point Program",
        //                                         labelColor:
        //                                             Customcolor.text_darkblue,
        //                                         fontweight: FontWeight.w600,
        //                                         fontSize: ResponsiveFlutter.of(
        //                                                 context)
        //                                             .fontSize(1.8),
        //                                       ),
        //                                       Divider(
        //                                         color: Customcolor.colorBlue,
        //                                       ),
        //                                       SizedBox(
        //                                         height: 5,
        //                                       ),
        //                                       FormLabel(
        //                                         text:
        //                                             "Merck Foundation First Ladies Initiative Summit",
        //                                         labelColor:
        //                                             Customcolor.text_darkblue,
        //                                         fontweight: FontWeight.w600,
        //                                         fontSize: ResponsiveFlutter.of(
        //                                                 context)
        //                                             .fontSize(1.8),
        //                                       ),
        //                                       Divider(
        //                                         color: Customcolor.colorBlue,
        //                                       ),
        //                                       SizedBox(
        //                                         height: 8,
        //                                       ),
        //                                       FormLabel(
        //                                         text: "Merck STEM Program",
        //                                         labelColor:
        //                                             Customcolor.text_darkblue,
        //                                         fontweight: FontWeight.w600,
        //                                         fontSize: ResponsiveFlutter.of(
        //                                                 context)
        //                                             .fontSize(1.8),
        //                                       ),
        //                                       Divider(
        //                                         color: Customcolor.colorBlue,
        //                                       ),
        //                                       SizedBox(
        //                                         height: 8,
        //                                       ),
        //                                       FormLabel(
        //                                         text: "Educating Linda Program",
        //                                         labelColor:
        //                                             Customcolor.text_darkblue,
        //                                         fontweight: FontWeight.w600,
        //                                         fontSize: ResponsiveFlutter.of(
        //                                                 context)
        //                                             .fontSize(1.8),
        //                                       ),
        //                                       Divider(
        //                                         color: Customcolor.colorBlue,
        //                                       ),
        //                                       SizedBox(
        //                                         height: 8,
        //                                       ),
        //                                       FormLabel(
        //                                         text:
        //                                             "Merck Foundation Sustainability Initiative",
        //                                         labelColor:
        //                                             Customcolor.text_darkblue,
        //                                         fontweight: FontWeight.w600,
        //                                         fontSize: ResponsiveFlutter.of(
        //                                                 context)
        //                                             .fontSize(1.8),
        //                                       ),
        //                                       Divider(
        //                                         color: Customcolor.colorBlue,
        //                                       ),
        //                                       SizedBox(
        //                                         height: 8,
        //                                       ),
        //                                       FormLabel(
        //                                         text:
        //                                             "Merck Africa Asia Luminary",
        //                                         labelColor:
        //                                             Customcolor.text_darkblue,
        //                                         fontweight: FontWeight.w600,
        //                                         fontSize: ResponsiveFlutter.of(
        //                                                 context)
        //                                             .fontSize(1.8),
        //                                       ),
        //                                       Divider(
        //                                         color: Customcolor.colorBlue,
        //                                       ),
        //                                       SizedBox(
        //                                         height: 8,
        //                                       ),
        //                                     ],
        //                                   ),
        //                                 ))
        //                           ],
        //                         ),
        //                       ),
        //                     );
        //                     mabialaFABController.isCollapsed
        //                         ? mabialaFABController.expandFAB()
        //                         : mabialaFABController.collapseFAB();
        //                   },
        //                   child: Align(
        //                       alignment: Alignment.topRight,
        //                       child: Icon(
        //                         Icons.close,
        //                         color: Customcolor.colorBlue,
        //                       ))),
        //               Expanded(
        //                   flex: 5,
        //                   child: Padding(
        //                     padding: const EdgeInsets.all(0.0),
        //                     child: Column(
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: [
        //                         SizedBox(
        //                           height: 5,
        //                         ),
        //                         FormLabel(
        //                           text: "Merck More Than A Mother",
        //                           labelColor: Customcolor.text_darkblue,
        //                           fontweight: FontWeight.w600,
        //                           fontSize: ResponsiveFlutter.of(context)
        //                               .fontSize(1.8),
        //                         ),
        //                         Divider(
        //                           color: Customcolor.colorBlue,
        //                         ),
        //                         SizedBox(
        //                           height: 5,
        //                         ),
        //                         FormLabel(
        //                           text: "Merck Cancer Access Program",
        //                           labelColor: Customcolor.text_darkblue,
        //                           fontweight: FontWeight.w600,
        //                           fontSize: ResponsiveFlutter.of(context)
        //                               .fontSize(1.8),
        //                         ),
        //                         Divider(
        //                           color: Customcolor.colorBlue,
        //                         ),
        //                         SizedBox(
        //                           height: 5,
        //                         ),
        //                         FormLabel(
        //                           text:
        //                               "Merck Capacity Advancement and Diabetes Blue Point Program",
        //                           labelColor: Customcolor.text_darkblue,
        //                           fontweight: FontWeight.w600,
        //                           fontSize: ResponsiveFlutter.of(context)
        //                               .fontSize(1.8),
        //                         ),
        //                         Divider(
        //                           color: Customcolor.colorBlue,
        //                         ),
        //                         SizedBox(
        //                           height: 5,
        //                         ),
        //                         FormLabel(
        //                           text:
        //                               "Merck Foundation First Ladies Initiative Summit",
        //                           labelColor: Customcolor.text_darkblue,
        //                           fontweight: FontWeight.w600,
        //                           fontSize: ResponsiveFlutter.of(context)
        //                               .fontSize(1.8),
        //                         ),
        //                         Divider(
        //                           color: Customcolor.colorBlue,
        //                         ),
        //                         SizedBox(
        //                           height: 8,
        //                         ),
        //                         FormLabel(
        //                           text: "Merck STEM Program",
        //                           labelColor: Customcolor.text_darkblue,
        //                           fontweight: FontWeight.w600,
        //                           fontSize: ResponsiveFlutter.of(context)
        //                               .fontSize(1.8),
        //                         ),
        //                         Divider(
        //                           color: Customcolor.colorBlue,
        //                         ),
        //                         SizedBox(
        //                           height: 8,
        //                         ),
        //                         FormLabel(
        //                           text: "Educating Linda Program",
        //                           labelColor: Customcolor.text_darkblue,
        //                           fontweight: FontWeight.w600,
        //                           fontSize: ResponsiveFlutter.of(context)
        //                               .fontSize(1.8),
        //                         ),
        //                         Divider(
        //                           color: Customcolor.colorBlue,
        //                         ),
        //                         SizedBox(
        //                           height: 8,
        //                         ),
        //                         FormLabel(
        //                           text:
        //                               "Merck Foundation Sustainability Initiative",
        //                           labelColor: Customcolor.text_darkblue,
        //                           fontweight: FontWeight.w600,
        //                           fontSize: ResponsiveFlutter.of(context)
        //                               .fontSize(1.8),
        //                         ),
        //                         Divider(
        //                           color: Customcolor.colorBlue,
        //                         ),
        //                         SizedBox(
        //                           height: 8,
        //                         ),
        //                         FormLabel(
        //                           text: "Merck Africa Asia Luminary",
        //                           labelColor: Customcolor.text_darkblue,
        //                           fontweight: FontWeight.w600,
        //                           fontSize: ResponsiveFlutter.of(context)
        //                               .fontSize(1.8),
        //                         ),
        //                         Divider(
        //                           color: Customcolor.colorBlue,
        //                         ),
        //                         SizedBox(
        //                           height: 8,
        //                         ),
        //                       ],
        //                     ),
        //                   ))
        //             ],
        //           ),
        //         ),
        //       ),
        //     );
        //     mabialaFABController.isCollapsed
        //         ? mabialaFABController.expandFAB()
        //         : mabialaFABController.collapseFAB();
        //   },
        //   floatingActionButtonIcon: Icons.menu,

        //   floatingActionButtonIconColor: Customcolor.colorBlue,
        //   navigationBarIconActiveColor: Colors.pink,
        //   navigationBarIconInactiveColor: Colors.pink[200].withOpacity(0.6),
        //   collapsedColor: Customcolor.programyellow,
        //   // useAsFloatingSpaceBar: useFloatingSpaceBar,
        //   useAsFloatingActionButton: useAsFloatingActionButton,
        //   //useAsNavigationBar: useNavigationBar,
        //   controller: mabialaFABController,
        //   animationDuration: Duration(milliseconds: 150),
        // )
        // This trailing comma makes auto-formatting nicer for build methods.

        floatingActionButton: AdvFab(
          showLogs: true,
          floatingActionButtonExpendedWidth: 80,
          onFloatingActionButtonTapped: () {
            mabialaFABController.setExpandedWidgetConfiguration(
              showLogs: true,
              heightToExpandTo: 50,
              expendedBackgroundColor: Customcolor.programyellow,
              withChild: Padding(
                padding: const EdgeInsets.all(8.0),
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
                            mabialaFABController.setExpandedWidgetConfiguration(
                              showLogs: true,
                              heightToExpandTo: 50,
                              expendedBackgroundColor:
                                  Customcolor.programyellow,
                              withChild: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width:
                                      (MediaQuery.of(context).size.width) * 70,

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
                                              alignment: Alignment.topRight,
                                              child: Icon(
                                                Icons.close,
                                                color: Customcolor.colorBlue,
                                              ))),
                                      Expanded(
                                        //   flex: 5,
                                        child: ListView.builder(
                                          padding: EdgeInsets.all(0),
                                          physics: BouncingScrollPhysics(),
                                          itemCount: programvalue.length,
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return GestureDetector(
                                              onTap: () {
                                                if (index == 0) {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              OurProgram(
                                                                indexpass: 0,
                                                              )));
                                                } else if (index == 1) {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              OurProgram(
                                                                indexpass: 1,
                                                              )));
                                                } else if (index == 2) {
                                                  // Navigator.push(
                                                  //     context,
                                                  //     MaterialPageRoute(
                                                  //         builder: (BuildContext context) => OurProgram(
                                                  //               indexpass: 2,
                                                  //             )));
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              OurProgramSevenlist(
                                                                indexpass: 1,
                                                              )));
                                                } else if (index == 3) {
                                                  // Navigator.push(
                                                  //     context,
                                                  //     MaterialPageRoute(
                                                  //         builder: (BuildContext context) => OurProgram(
                                                  //               indexpass: 12,
                                                  //             )));
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              OurProgramSevenlist(
                                                                indexpass: 2,
                                                              )));
                                                } else if (index == 6) {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              OurProgram(
                                                                indexpass: 13,
                                                              )));
                                                } else if (index == 4) {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              OurProgramStem()));
                                                } else if (index == 5) {
                                                  // Navigator.push(
                                                  //     context,
                                                  //     MaterialPageRoute(
                                                  //         builder: (BuildContext context) => OurProgram(
                                                  //               indexpass: 14,
                                                  //             )));
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              OurProgramSevenlist(
                                                                indexpass: 3,
                                                              )));
                                                } else if (index == 7) {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              OurProgramAfrica()));
                                                  // Navigator.push(
                                                  //     context,
                                                  //     MaterialPageRoute(
                                                  //         builder: (BuildContext context) =>
                                                  //             OurProgramSevenlist(
                                                  //               indexpass: 4,
                                                  //             )));
                                                }
                                              },
                                              child: Container(
                                                color: Colors.transparent,
                                                child: Column(
                                                  children: [
                                                    FormLabel(
                                                      text: programvalue[index],
                                                      labelColor: Customcolor
                                                          .text_darkblue,
                                                      fontweight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          ResponsiveFlutter.of(
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
                              child: Icon(
                                Icons.close,
                                color: Customcolor.colorBlue,
                              ))),
                      Expanded(
                        flex: 5,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: programvalue.length,
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.zero,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  if (index == 0) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                OurProgram(
                                                  indexpass: 0,
                                                )));
                                  } else if (index == 1) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                OurProgram(
                                                  indexpass: 1,
                                                )));
                                  } else if (index == 2) {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (BuildContext context) => OurProgram(
                                    //               indexpass: 2,
                                    //             )));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                OurProgramSevenlist(
                                                  indexpass: 1,
                                                )));
                                  } else if (index == 3) {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (BuildContext context) => OurProgram(
                                    //               indexpass: 12,
                                    //             )));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                OurProgramSevenlist(
                                                  indexpass: 2,
                                                )));
                                  } else if (index == 6) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                OurProgram(
                                                  indexpass: 13,
                                                )));
                                  } else if (index == 4) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                OurProgramStem()));
                                  } else if (index == 5) {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (BuildContext context) => OurProgram(
                                    //               indexpass: 14,
                                    //             )));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                OurProgramSevenlist(
                                                  indexpass: 3,
                                                )));
                                  } else if (index == 7) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                OurProgramAfrica()));
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (BuildContext context) =>
                                    //             OurProgramSevenlist(
                                    //               indexpass: 4,
                                    //             )));
                                  }
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FormLabel(
                                        text: programvalue[index],
                                        labelColor: Customcolor.text_darkblue,
                                        fontweight: FontWeight.w600,
                                        fontSize: ResponsiveFlutter.of(context)
                                            .fontSize(1.8),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 80,
                                        height: 1.0,
                                        color: Customcolor.text_darkblue,
                                      )
                                    ],
                                  ),

                                  //height: (MediaQuery.of(context).size.height/100)*9,
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
          navigationBarIconInactiveColor: Colors.pink[200].withOpacity(0.6),
          collapsedColor: Customcolor.programyellow,
          // useAsFloatingSpaceBar: useFloatingSpaceBar,
          useAsFloatingActionButton: useAsFloatingActionButton,
          //useAsNavigationBar: useNavigationBar,
          controller: mabialaFABController,
          animationDuration: Duration(milliseconds: 150),
        ));
  }
}

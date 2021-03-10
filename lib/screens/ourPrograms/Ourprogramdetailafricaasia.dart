import 'package:adv_fab/adv_fab.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/AfricaAsiaLuminar.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/drawerWidget.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class OurProgramAfrica extends StatefulWidget {
  OurProgramAfrica({Key key, this.title, this.indexpass}) : super(key: key);

  final String title;
  final int indexpass;

  @override
  _MyHomePageState createState() => _MyHomePageState(this.indexpass);
}

Map<String, bool> expansionState = Map();

class _MyHomePageState extends State<OurProgramAfrica> {
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
          screens: <Widget>[MerckAfricaasialuminar()],
          controller: mabialaFABController,
        ),

        ///[SEtting up the floating action button]
        floatingActionButton: AdvFab(
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
                            mabialaFABController.setExpandedWidgetConfiguration(
                              showLogs: true,
                              heightToExpandTo: 60,
                              expendedBackgroundColor:
                                  Customcolor.programyellow,
                              withChild: Container(
                                width: (MediaQuery.of(context).size.width) * 50,

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
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 5,
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Container(
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
                                                    100,
                                                color: Color(0xffC1DEA4),
                                                child: Theme(
                                                  data: Theme.of(context)
                                                      .copyWith(
                                                    dividerColor:
                                                        Colors.transparent,
                                                  ),
                                                  child: ExpansionTile(
                                                    backgroundColor:
                                                        Color(0xffC1DEA4),
                                                    tilePadding:
                                                        EdgeInsets.all(0.0),
                                                    key: GlobalKey(),
                                                    initiallyExpanded:
                                                        expansionState[
                                                            '4th Edition of UNESCO-MARS'],
                                                    title: Container(
                                                      // color: Color(0xffC1DEA4),
                                                      child: FormLabel(
                                                        text:
                                                            "4th Edition of UNESCO-MARS",
                                                        labelColor: Customcolor
                                                            .text_darkblue,
                                                        fontweight:
                                                            FontWeight.w600,
                                                        fontSize:
                                                            ResponsiveFlutter
                                                                    .of(context)
                                                                .fontSize(1.8),
                                                      ),
                                                    ),
                                                    onExpansionChanged:
                                                        ((newState) {
                                                      expansionState[
                                                              '4th Edition of UNESCO-MARS'] =
                                                          newState;
                                                      if (newState)
                                                        closeOpenExpansionList(
                                                            '4th Edition of UNESCO-MARS');
                                                    }),
                                                    children: <Widget>[
                                                      FormLabel(
                                                        text:
                                                            "4th Edition- UNESCO MARS Scientific book",
                                                        labelColor: Customcolor
                                                            .text_darkblue,
                                                        fontweight:
                                                            FontWeight.w600,
                                                        fontSize:
                                                            ResponsiveFlutter
                                                                    .of(context)
                                                                .fontSize(1.8),
                                                      ),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Divider(
                                                        color:
                                                            Color(0xff83A23B),
                                                      ),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      FormLabel(
                                                        text:
                                                            "Scientific & Steering Committee        ",
                                                        labelColor: Customcolor
                                                            .text_darkblue,
                                                        fontweight:
                                                            FontWeight.w600,
                                                        fontSize:
                                                            ResponsiveFlutter
                                                                    .of(context)
                                                                .fontSize(1.8),
                                                      ),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Divider(
                                                        color:
                                                            Color(0xff83A23B),
                                                      ),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      FormLabel(
                                                        text:
                                                            "About 4th Edition of UNESCO Merck Africa Research Summit",
                                                        labelColor: Customcolor
                                                            .text_darkblue,
                                                        fontweight:
                                                            FontWeight.w600,
                                                        fontSize:
                                                            ResponsiveFlutter
                                                                    .of(context)
                                                                .fontSize(1.8),
                                                      ),
                                                      SizedBox(
                                                        height: 6,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    bottom: 8, top: 8),
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
                                                    100,
                                                color: Customcolor.stemskyblue,
                                                child: FormLabel(
                                                  text:
                                                      "3rd Edition of UNESCO-MARS",
                                                  labelColor:
                                                      Customcolor.text_darkblue,
                                                  fontweight: FontWeight.w600,
                                                  fontSize:
                                                      ResponsiveFlutter.of(
                                                              context)
                                                          .fontSize(1.8),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    bottom: 8, top: 8),
                                                width: SizeConfig
                                                        .blockSizeHorizontal *
                                                    100,
                                                color: Color(0xffE0C0CB),
                                                child: FormLabel(
                                                  text:
                                                      "5th Edition of UNESCO-Merck Africa Research Summit",
                                                  labelColor:
                                                      Customcolor.text_darkblue,
                                                  fontweight: FontWeight.w600,
                                                  fontSize:
                                                      ResponsiveFlutter.of(
                                                              context)
                                                          .fontSize(1.8),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
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
                      Expanded(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: ListView(
                              shrinkWrap: true,
                              //  crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: SizeConfig.blockSizeHorizontal * 100,
                                  color: Color(0xffC1DEA4),
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                      dividerColor: Colors.transparent,
                                    ),
                                    child: ExpansionTile(
                                      backgroundColor: Color(0xffC1DEA4),
                                      tilePadding: EdgeInsets.all(0.0),
                                      key: GlobalKey(),
                                      initiallyExpanded: expansionState[
                                          '4th Edition of UNESCO-MARS'],
                                      title: Container(
                                        // color: Color(0xffC1DEA4),
                                        child: FormLabel(
                                          text: "4th Edition of UNESCO-MARS",
                                          labelColor: Customcolor.text_darkblue,
                                          fontweight: FontWeight.w600,
                                          fontSize:
                                              ResponsiveFlutter.of(context)
                                                  .fontSize(1.8),
                                        ),
                                      ),
                                      onExpansionChanged: ((newState) {
                                        expansionState[
                                                '4th Edition of UNESCO-MARS'] =
                                            newState;
                                        if (newState)
                                          closeOpenExpansionList(
                                              '4th Edition of UNESCO-MARS');
                                      }),
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: FormLabel(
                                            text:
                                                "4th Edition- UNESCO MARS Scientific book",
                                            labelColor:
                                                Customcolor.text_darkblue,
                                            fontweight: FontWeight.w600,
                                            fontSize:
                                                ResponsiveFlutter.of(context)
                                                    .fontSize(1.8),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Divider(
                                          color: Color(0xff83A23B),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: FormLabel(
                                            text:
                                                "Scientific & Steering Committee       ",
                                            labelColor:
                                                Customcolor.text_darkblue,
                                            fontweight: FontWeight.w600,
                                            fontSize:
                                                ResponsiveFlutter.of(context)
                                                    .fontSize(1.8),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Divider(
                                          color: Color(0xff83A23B),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        FormLabel(
                                          text:
                                              "About 4th Edition of UNESCO Merck Africa Research Summit",
                                          labelColor: Customcolor.text_darkblue,
                                          fontweight: FontWeight.w600,
                                          fontSize:
                                              ResponsiveFlutter.of(context)
                                                  .fontSize(1.8),
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 8, top: 8),
                                  width: SizeConfig.blockSizeHorizontal * 100,
                                  color: Customcolor.stemskyblue,
                                  child: FormLabel(
                                    text: "3rd Edition of UNESCO-MARS",
                                    labelColor: Customcolor.text_darkblue,
                                    fontweight: FontWeight.w600,
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(1.8),
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 8, top: 8),
                                  width: SizeConfig.blockSizeHorizontal * 100,
                                  color: Color(0xffE0C0CB),
                                  child: FormLabel(
                                    text:
                                        "5th Edition of UNESCO-Merck Africa Research Summit",
                                    labelColor: Customcolor.text_darkblue,
                                    fontweight: FontWeight.w600,
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(1.8),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
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
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
    // return Scaffold(
    //     body: AdvFabBottomBarBody(
    //       screens: <Widget>[MerckAfricaasialuminar()],
    //       controller: mabialaFABController,
    //     ),

    //     ///[SEtting up the floating action button]
    //     floatingActionButton: AdvFab(
    //       showLogs: true,
    //       floatingActionButtonExpendedWidth: 80,
    //       onFloatingActionButtonTapped: () {
    //         mabialaFABController.setExpandedWidgetConfiguration(
    //           showLogs: true,
    //           heightToExpandTo: 44,
    //           expendedBackgroundColor: Customcolor.programyellow,
    //           withChild: Padding(
    //             padding: const EdgeInsets.all(0.0),
    //             child: Container(
    //               width: (MediaQuery.of(context).size.width) * 50,

    //               ///[IMPORTANT]: the height percentage shall be less than [heightToExpandTo]
    //               ///in the next line we use 20%
    //               height: 330,
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: <Widget>[
    //                   GestureDetector(
    //                       onTap: () {
    //                         mabialaFABController.setExpandedWidgetConfiguration(
    //                           showLogs: true,
    //                           heightToExpandTo: 60,
    //                           expendedBackgroundColor:
    //                               Customcolor.programyellow,
    //                           withChild: Container(
    //                             width: (MediaQuery.of(context).size.width) * 50,

    //                             ///[IMPORTANT]: the height percentage shall be less than [heightToExpandTo]
    //                             ///in the next line we use 20%
    //                             height: 330,
    //                             child: ListView(
    //                               shrinkWrap: true,
    //                               // crossAxisAlignment:
    //                               //     CrossAxisAlignment.start,
    //                               children: <Widget>[
    //                                 GestureDetector(
    //                                     onTap: () {},
    //                                     child: Align(
    //                                         alignment: Alignment.topRight,
    //                                         child: Icon(
    //                                           Icons.close,
    //                                           color: Customcolor.colorBlue,
    //                                         ))),
    //                                 Expanded(
    //                                     flex: 5,
    //                                     child: Padding(
    //                                       padding: const EdgeInsets.all(0.0),
    //                                       child: Column(
    //                                         crossAxisAlignment:
    //                                             CrossAxisAlignment.start,
    //                                         children: [
    //                                           SizedBox(
    //                                             height: 8,
    //                                           ),
    //                                           Container(
    //                                             width: SizeConfig
    //                                                     .blockSizeHorizontal *
    //                                                 100,
    //                                             color: Color(0xffC1DEA4),
    //                                             child: Theme(
    //                                               data: Theme.of(context)
    //                                                   .copyWith(
    //                                                 dividerColor:
    //                                                     Colors.transparent,
    //                                               ),
    //                                               child: ExpansionTile(
    //                                                 backgroundColor:
    //                                                     Color(0xffC1DEA4),
    //                                                 tilePadding:
    //                                                     EdgeInsets.all(0.0),
    //                                                 key: GlobalKey(),
    //                                                 initiallyExpanded:
    //                                                     expansionState[
    //                                                         '8th Edition of Merck Foundation Africa Asia Luminary'],
    //                                                 title: Container(
    //                                                   // color: Color(0xffC1DEA4),
    //                                                   child: FormLabel(
    //                                                     text:
    //                                                         "4th Edition of UNESCO-MARS",
    //                                                     labelColor: Customcolor
    //                                                         .text_darkblue,
    //                                                     fontweight:
    //                                                         FontWeight.w600,
    //                                                     fontSize:
    //                                                         ResponsiveFlutter
    //                                                                 .of(context)
    //                                                             .fontSize(1.8),
    //                                                   ),
    //                                                 ),
    //                                                 onExpansionChanged:
    //                                                     ((newState) {
    //                                                   expansionState[
    //                                                           '4th Edition of UNESCO-MARS'] =
    //                                                       newState;
    //                                                   if (newState)
    //                                                     closeOpenExpansionList(
    //                                                         '4th Edition of UNESCO-MARS');
    //                                                 }),
    //                                                 children: <Widget>[
    //                                                   FormLabel(
    //                                                     text:
    //                                                         "4th Edition- UNESCO MARS Scientific book",
    //                                                     labelColor: Customcolor
    //                                                         .text_darkblue,
    //                                                     fontweight:
    //                                                         FontWeight.w600,
    //                                                     fontSize:
    //                                                         ResponsiveFlutter
    //                                                                 .of(context)
    //                                                             .fontSize(1.8),
    //                                                   ),
    //                                                   SizedBox(
    //                                                     height: 4,
    //                                                   ),
    //                                                   Divider(
    //                                                     color:
    //                                                         Color(0xff83A23B),
    //                                                   ),
    //                                                   SizedBox(
    //                                                     height: 4,
    //                                                   ),
    //                                                   FormLabel(
    //                                                     text:
    //                                                         "Scientific & Steering Committee        ",
    //                                                     labelColor: Customcolor
    //                                                         .text_darkblue,
    //                                                     fontweight:
    //                                                         FontWeight.w600,
    //                                                     fontSize:
    //                                                         ResponsiveFlutter
    //                                                                 .of(context)
    //                                                             .fontSize(1.8),
    //                                                   ),
    //                                                   SizedBox(
    //                                                     height: 4,
    //                                                   ),
    //                                                   Divider(
    //                                                     color:
    //                                                         Color(0xff83A23B),
    //                                                   ),
    //                                                   SizedBox(
    //                                                     height: 4,
    //                                                   ),
    //                                                   FormLabel(
    //                                                     text:
    //                                                         "About 4th Edition of UNESCO Merck Africa Research Summit",
    //                                                     labelColor: Customcolor
    //                                                         .text_darkblue,
    //                                                     fontweight:
    //                                                         FontWeight.w600,
    //                                                     fontSize:
    //                                                         ResponsiveFlutter
    //                                                                 .of(context)
    //                                                             .fontSize(1.8),
    //                                                   ),
    //                                                   SizedBox(
    //                                                     height: 6,
    //                                                   ),
    //                                                 ],
    //                                               ),
    //                                             ),
    //                                           ),
    //                                           SizedBox(
    //                                             height: 2,
    //                                           ),
    //                                           Container(
    //                                             padding: EdgeInsets.only(
    //                                                 bottom: 8, top: 8),
    //                                             width: SizeConfig
    //                                                     .blockSizeHorizontal *
    //                                                 100,
    //                                             color: Customcolor.stemskyblue,
    //                                             child: FormLabel(
    //                                               text:
    //                                                   "7th Edition of Merck Foundation Africa Asia Luminary",
    //                                               labelColor:
    //                                                   Customcolor.text_darkblue,
    //                                               fontweight: FontWeight.w600,
    //                                               fontSize:
    //                                                   ResponsiveFlutter.of(
    //                                                           context)
    //                                                       .fontSize(1.8),
    //                                             ),
    //                                           ),
    //                                           SizedBox(
    //                                             height: 2,
    //                                           ),
    //                                           Container(
    //                                             padding: EdgeInsets.only(
    //                                                 bottom: 8, top: 8),
    //                                             width: SizeConfig
    //                                                     .blockSizeHorizontal *
    //                                                 100,
    //                                             color: Color(0xffE0C0CB),
    //                                             child: FormLabel(
    //                                               text:
    //                                                   "6th Edition of Merck Foundation Africa Asia Luminary 2019 Accra,Ghana",
    //                                               labelColor:
    //                                                   Customcolor.text_darkblue,
    //                                               fontweight: FontWeight.w600,
    //                                               fontSize:
    //                                                   ResponsiveFlutter.of(
    //                                                           context)
    //                                                       .fontSize(1.8),
    //                                             ),
    //                                           ),
    //                                           SizedBox(
    //                                             height: 5,
    //                                           ),
    //                                         ],
    //                                       ),
    //                                     ))
    //                               ],
    //                             ),
    //                           ),
    //                         );
    //                         mabialaFABController.isCollapsed
    //                             ? mabialaFABController.expandFAB()
    //                             : mabialaFABController.collapseFAB();
    //                       },
    //                       child: Align(
    //                           alignment: Alignment.topRight,
    //                           child: Icon(
    //                             Icons.close,
    //                             color: Customcolor.colorBlue,
    //                           ))),
    //                   Expanded(
    //                       flex: 5,
    //                       child: Padding(
    //                         padding: const EdgeInsets.all(0.0),
    //                         child: ListView(
    //                           shrinkWrap: true,
    //                           //  crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             SizedBox(
    //                               height: 5,
    //                             ),
    //                             FormLabel(
    //                               text:
    //                                   "About 5th Edition of UNESCO-Merck Africa Research Summit",
    //                               labelColor: Customcolor.text_darkblue,
    //                               fontweight: FontWeight.w600,
    //                               fontSize: ResponsiveFlutter.of(context)
    //                                   .fontSize(1.8),
    //                             ),
    //                             Divider(
    //                               color: Customcolor.colorBlue,
    //                             ),
    //                             SizedBox(
    //                               height: 5,
    //                             ),
    //                             FormLabel(
    //                               text: "Call for Application - Apply Now",
    //                               labelColor: Customcolor.text_darkblue,
    //                               fontweight: FontWeight.w600,
    //                               fontSize: ResponsiveFlutter.of(context)
    //                                   .fontSize(1.8),
    //                             ),
    //                             Divider(
    //                               color: Customcolor.colorBlue,
    //                             ),
    //                             SizedBox(
    //                               height: 5,
    //                             ),
    //                             FormLabel(
    //                               text: "Scientific & Steering Committee",
    //                               labelColor: Customcolor.text_darkblue,
    //                               fontweight: FontWeight.w600,
    //                               fontSize: ResponsiveFlutter.of(context)
    //                                   .fontSize(1.8),
    //                             ),
    //                             SizedBox(
    //                               height: 8,
    //                             ),
    //                             Container(
    //                               width: SizeConfig.blockSizeHorizontal * 100,
    //                               color: Color(0xffC1DEA4),
    //                               child: Theme(
    //                                 data: Theme.of(context).copyWith(
    //                                   dividerColor: Colors.transparent,
    //                                 ),
    //                                 child: ExpansionTile(
    //                                   backgroundColor: Color(0xffC1DEA4),
    //                                   tilePadding: EdgeInsets.all(0.0),
    //                                   key: GlobalKey(),
    //                                   initiallyExpanded: expansionState[
    //                                       '4th Edition of UNESCO-MARS'],
    //                                   title: Container(
    //                                     // color: Color(0xffC1DEA4),
    //                                     child: FormLabel(
    //                                       text: "4th Edition of UNESCO-MARS",
    //                                       labelColor: Customcolor.text_darkblue,
    //                                       fontweight: FontWeight.w600,
    //                                       fontSize:
    //                                           ResponsiveFlutter.of(context)
    //                                               .fontSize(1.8),
    //                                     ),
    //                                   ),
    //                                   onExpansionChanged: ((newState) {
    //                                     expansionState[
    //                                             '4th Edition of UNESCO-MARS'] =
    //                                         newState;
    //                                     if (newState)
    //                                       closeOpenExpansionList(
    //                                           '4th Edition of UNESCO-MARS');
    //                                   }),
    //                                   children: <Widget>[
    //                                     Align(
    //                                       alignment: Alignment.topLeft,
    //                                       child: FormLabel(
    //                                         text:
    //                                             "4th Edition- UNESCO MARS Scientific book",
    //                                         labelColor:
    //                                             Customcolor.text_darkblue,
    //                                         fontweight: FontWeight.w600,
    //                                         fontSize:
    //                                             ResponsiveFlutter.of(context)
    //                                                 .fontSize(1.8),
    //                                       ),
    //                                     ),
    //                                     SizedBox(
    //                                       height: 4,
    //                                     ),
    //                                     Divider(
    //                                       color: Color(0xff83A23B),
    //                                     ),
    //                                     SizedBox(
    //                                       height: 4,
    //                                     ),
    //                                     Align(
    //                                       alignment: Alignment.topLeft,
    //                                       child: FormLabel(
    //                                         text:
    //                                             "Scientific & Steering Committee       ",
    //                                         labelColor:
    //                                             Customcolor.text_darkblue,
    //                                         fontweight: FontWeight.w600,
    //                                         fontSize:
    //                                             ResponsiveFlutter.of(context)
    //                                                 .fontSize(1.8),
    //                                       ),
    //                                     ),
    //                                     SizedBox(
    //                                       height: 4,
    //                                     ),
    //                                     Divider(
    //                                       color: Color(0xff83A23B),
    //                                     ),
    //                                     SizedBox(
    //                                       height: 4,
    //                                     ),
    //                                     FormLabel(
    //                                       text:
    //                                           "About 4th Edition of UNESCO Merck Africa Research Summit",
    //                                       labelColor: Customcolor.text_darkblue,
    //                                       fontweight: FontWeight.w600,
    //                                       fontSize:
    //                                           ResponsiveFlutter.of(context)
    //                                               .fontSize(1.8),
    //                                     ),
    //                                     SizedBox(
    //                                       height: 6,
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ),
    //                             ),
    //                             SizedBox(
    //                               height: 2,
    //                             ),
    //                             Container(
    //                               padding: EdgeInsets.only(bottom: 8, top: 8),
    //                               width: SizeConfig.blockSizeHorizontal * 100,
    //                               color: Customcolor.stemskyblue,
    //                               child: FormLabel(
    //                                 text: "3rd Edition of UNESCO-MARS",
    //                                 labelColor: Customcolor.text_darkblue,
    //                                 fontweight: FontWeight.w600,
    //                                 fontSize: ResponsiveFlutter.of(context)
    //                                     .fontSize(1.8),
    //                               ),
    //                             ),
    //                             SizedBox(
    //                               height: 2,
    //                             ),
    //                             Container(
    //                               padding: EdgeInsets.only(bottom: 8, top: 8),
    //                               width: SizeConfig.blockSizeHorizontal * 100,
    //                               color: Color(0xffE0C0CB),
    //                               child: FormLabel(
    //                                 text:
    //                                     "5th Edition of UNESCO-Merck Africa Research Summit",
    //                                 labelColor: Customcolor.text_darkblue,
    //                                 fontweight: FontWeight.w600,
    //                                 fontSize: ResponsiveFlutter.of(context)
    //                                     .fontSize(1.8),
    //                               ),
    //                             ),
    //                             SizedBox(
    //                               height: 5,
    //                             ),
    //                           ],
    //                         ),
    //                       ))
    //                 ],
    //               ),
    //             ),
    //           ),
    //         );
    //         mabialaFABController.isCollapsed
    //             ? mabialaFABController.expandFAB()
    //             : mabialaFABController.collapseFAB();
    //       },
    //       floatingActionButtonIcon: Icons.menu,

    //       floatingActionButtonIconColor: Customcolor.colorBlue,
    //       navigationBarIconActiveColor: Colors.pink,
    //       navigationBarIconInactiveColor: Colors.pink[200].withOpacity(0.6),
    //       collapsedColor: Customcolor.programyellow,
    //       // useAsFloatingSpaceBar: useFloatingSpaceBar,
    //       useAsFloatingActionButton: useAsFloatingActionButton,
    //       //useAsNavigationBar: useNavigationBar,
    //       controller: mabialaFABController,
    //       animationDuration: Duration(milliseconds: 150),
    //     )
    //     // This trailing comma makes auto-formatting nicer for build methods.
    //     );
  }
}

import 'package:adv_fab/adv_fab.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Merckxanceraccess.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Merckcancer/cancerobjective.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Merckcancer/MerckFellowship.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Merckcancer/MerckCancerPatient.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Merckcancer/Merckcancercommunityawareness.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Merckcancer/socialmedia.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/screens/watchmorevideolibray.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';

class OurProgramcancerlist extends StatefulWidget {
  OurProgramcancerlist({Key key, this.title, this.indexpass}) : super(key: key);

  final String title;
  final int indexpass;

  @override
  _MyHomePageState createState() => _MyHomePageState(this.indexpass);
}

Map<String, bool> expansionState = Map();

class _MyHomePageState extends State<OurProgramcancerlist> {
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
    "Objectives",
    "Merck Oncology Fellowship Program",
    "Merck More Than a Patient",
    "Merck Community Awareness",
    "Videos",
    "Social Media",
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
          screens: <Widget>[MerckCanceraccess()],
          controller: mabialaFABController,
        ),
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
                                              onTap: () {},
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
                                                CancerobjectiveDetails()));
                                  } else if (index == 1) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                MerckFellowship()));
                                  } else if (index == 2) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                MerckCancerPatient()));
                                  } else if (index == 3) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Merckcancercommunityawareness()));
                                  } else if (index == 4) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                WatchmoreVideolibrary(
                                                  apiurl: API.watchvideocancer,
                                                )));
                                  } else if (index == 5) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                SocialMedia()));
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

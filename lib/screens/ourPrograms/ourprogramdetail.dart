import 'package:adv_fab/adv_fab.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Merckmorethanamother.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Merckstemprogram.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Merckxanceraccess.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/aboutMerckMother.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/empoweringberna.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/fertilityPrograms.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/firstladiesinitiativesummit.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/localSogsandChildrenStories.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/mmtmprogram.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/motherambassadar.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/strategy.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Merckcapabilityadvancement.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Mercksubstantionalinitiative.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Communityawaeness.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Educatinglinda.dart';
import 'package:merckfoundation22dec/screens/watchmorevideolibray.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class OurProgram extends StatefulWidget {
  OurProgram({Key key, this.title, this.indexpass}) : super(key: key);

  final String title;
  final int indexpass;

  @override
  _MyHomePageState createState() => _MyHomePageState(this.indexpass);
}

class _MyHomePageState extends State<OurProgram> {
  final int indexpass;
  AdvFabController mabialaFABController;

  bool useAsFloatingActionButton = true;
  List programvalue = [
    "About Merck More Than A Mother",
    "Strategy",
    "Merck Foundation More Than a Mother Ambassadors",
    "Merck Foundation Fertility and Embryology Training Program",
    "Merck Foundation Community Awareness and Awards Program",
    "Empowering Berna",
    "Local Songs and Children Stories",
    "Videos"
  ];

  List programvalueforStem = [
    "About Merck More Than A Mother",
    "Strategy",
    "Merck More Than a Mother Ambassadors",
    "Merck Fertility and Embryology Training Program",
    "Community Awareness and Awards Program",
    "Empowering Berna",
    "Local Songs and Children Stories",
    "Videos"
  ];

  _MyHomePageState(this.indexpass);
  @override
  void initState() {
    super.initState();
    mabialaFABController = AdvFabController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AdvFabBottomBarBody(
          screens: <Widget>[
            indexpass == 0
                ? OurProgramDetails()
                : indexpass == 1
                    ? MerckCanceraccess()
                    : indexpass == 2
                        ? MerckCapabilityadvancement()
                        : indexpass == 4
                            ? Merckstemprogram()
                            : indexpass == 5
                                ? EmpoweringBerna()
                                : indexpass == 9
                                    ? StrategyDetails()
                                    : indexpass == 10
                                        ? MotherAmbassadarDetails()
                                        : indexpass == 11
                                            ? MerckFertility()
                                            : indexpass == 12
                                                ? FirstLadiesInitiativeDetails()
                                                : indexpass == 7
                                                    ?
                                                    // MMTMProgram()
                                                    //same api that is call frpm mmtm video view more
                                                    WatchmoreVideolibrary(
                                                        apiurl:
                                                            API.watchvideommtm,
                                                      )
                                                    : indexpass == 6
                                                        ? LocalSongsandChildrenStories()
                                                        : indexpass == 8
                                                            ? AboutMerckMother()
                                                            : indexpass == 13
                                                                ? MerckSubstantional()
                                                                : indexpass ==
                                                                        14
                                                                    ? EducatingLinda()
                                                                    : indexpass ==
                                                                            15
                                                                        ? CommunityAwareness()
                                                                        : Container()
          ],
          controller: mabialaFABController,
        ),

        ///[SEtting up the floating action button]
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
                                            return Container(
                                              child: Column(
                                                children: [
                                                  FormLabel(
                                                    text: programvalue[index],
                                                    labelColor: Customcolor
                                                        .text_darkblue,
                                                    fontweight: FontWeight.w600,
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
                                    //aboutmerckmorethanmother
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                OurProgram(
                                                  indexpass: 8,
                                                )));
                                  } else if (index == 1) {
                                    //strategy
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                OurProgram(
                                                  indexpass: 9,
                                                )));
                                  } else if (index == 2) {
                                    //MotherAmbassadarDetails
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                OurProgram(
                                                  indexpass: 10,
                                                )));
                                  } else if (index == 3) {
                                    //fertility
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                OurProgram(
                                                  indexpass: 11,
                                                )));
                                  } else if (index == 4) {
                                    //community
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                OurProgram(
                                                  indexpass: 15,
                                                )));
                                  } else if (index == 5) {
                                    //empowring berna
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                OurProgram(
                                                  indexpass: 5,
                                                )));
                                  } else if (index == 6) {
                                    //Local songs
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                OurProgram(
                                                  indexpass: 6,
                                                )));
                                  } else if (index == 7) {
                                    //video
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                OurProgram(
                                                  indexpass: 7,
                                                )));
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
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

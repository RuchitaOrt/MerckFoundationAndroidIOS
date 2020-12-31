import 'package:adv_fab/adv_fab.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Merckmorethanamother.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Merckstemprogram.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/fertilityPrograms.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/motherambassadar.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/strategy.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
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
    "Merck More Than a Mother Ambassadors",
    "Merck Fertility and Embryology Training Program",
    "Community Awareness and Awards Program",
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
                : indexpass == 4
                    ? Merckstemprogram()
                    : indexpass == 9
                        ? StrategyDetails()
                        : indexpass == 10
                            ? MotherAmbassadarDetails()
                            : indexpass == 11
                                ? MerckFertility()
                                : Container()
          ],
          controller: mabialaFABController,
        ),

        ///[SEtting up the floating action button]
        floatingActionButton: AdvFab(
          showLogs: true,
          floatingActionButtonExpendedWidth: 70,
          onFloatingActionButtonTapped: () {
            mabialaFABController.setExpandedWidgetConfiguration(
              showLogs: true,
              heightToExpandTo: 50,
              expendedBackgroundColor: Customcolor.cardbg,
              withChild: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: (MediaQuery.of(context).size.width) * 50,

                  ///[IMPORTANT]: the height percentage shall be less than [heightToExpandTo]
                  ///in the next line we use 20%
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            mabialaFABController.setExpandedWidgetConfiguration(
                              showLogs: true,
                              heightToExpandTo: 50,
                              expendedBackgroundColor: Customcolor.cardbg,
                              withChild: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width:
                                      (MediaQuery.of(context).size.width) * 50,

                                  ///[IMPORTANT]: the height percentage shall be less than [heightToExpandTo]
                                  ///in the next line we use 20%
                                  height: 350,
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
                                        flex: 5,
                                        child: ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          itemCount: programvalue.length,
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                              child: Container(
                                                child: Column(
                                                  children: [
                                                    FormLabel(
                                                      text: programvalue[index],
                                                      labelColor:
                                                          Customcolor.text_blue,
                                                      fontweight:
                                                          FontWeight.w500,
                                                      fontSize:
                                                          ResponsiveFlutter.of(
                                                                  context)
                                                              .fontSize(1.8),
                                                    ),
                                                    Divider(
                                                      color:
                                                          Customcolor.colorBlue,
                                                    )
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
                                    //strategy
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                OurProgram(
                                                  indexpass: 9,
                                                )));
                                  } else if (index == 2) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                OurProgram(
                                                  indexpass: 10,
                                                )));
                                  } else if (index == 3) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                OurProgram(
                                                  indexpass: 11,
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
                                        labelColor: Customcolor.text_blue,
                                        fontweight: FontWeight.w500,
                                        fontSize: ResponsiveFlutter.of(context)
                                            .fontSize(1.6),
                                      ),
                                      Divider(
                                        color: Customcolor.colorBlue,
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
          collapsedColor: Customcolor.cardbg,
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

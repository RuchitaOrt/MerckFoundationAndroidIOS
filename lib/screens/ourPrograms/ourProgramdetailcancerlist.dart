// import 'package:adv_fab/adv_fab.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Merckxanceraccess.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Merckcancer/cancerobjective.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Merckcancer/MerckFellowship.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Merckcancer/MerckCancerPatient.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Merckcancer/Merckcancercommunityawareness.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Merckcancer/socialmedia.dart';
import 'package:merckfoundation22dec/widget/CustomAdvFab.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:merckfoundation22dec/utility/ResponsiveFlutter.dart';
import 'package:merckfoundation22dec/screens/watchmorevideolibray.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';

class OurProgramcancerlist extends StatefulWidget {
  OurProgramcancerlist({Key? key, this.title, this.indexpass})
      : super(key: key);

  final String? title;
  final int? indexpass;

  @override
  _MyHomePageState createState() => _MyHomePageState(this.indexpass!);
}

Map<String, bool> expansionState = Map();

class _MyHomePageState extends State<OurProgramcancerlist> {
  
  final int indexpass;
  // AdvFabController mabialaFABController;

  var expansionList = [
    "4th Edition of UNESCO-MARS",
  ];
  void closeOpenExpansionList(expansionName) {
    expansionList.forEach((name) {
      if (name != expansionName) expansionState[name] = false;
    });
    setState(() {
      if (!expansionState[expansionName]!) expansionState[expansionName] = true;
    });
  }

  List programvalue = [
    "Objectives",
    "Merck Foundation Oncology Fellowship Program",
    "Merck Foundation More Than a Patient",
    "Merck Foundation Community Awareness",
    "Videos",
    "Social Media",
  ];

  bool useAsFloatingActionButton = true;

  _MyHomePageState(this.indexpass);
  final GlobalKey<CustomAdvFabState> fabKey = GlobalKey<CustomAdvFabState>();

  @override
  void initState() {
    super.initState();
    // mabialaFABController = AdvFabController();
    setData();
  }
// @override
// void didChangeDependencies() {
//   super.didChangeDependencies();
//   // _isExpanded = false; // Always reset on rebuild
//   fabKey.currentState?.collapse();
// }
  setData() {
    expansionList.forEach((name) {
      expansionState.putIfAbsent(name, () => false);
    });
  }

  //for cancer index is from 21 to 27
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //16june2025
        body: widget.indexpass == 21
            ? MerckCanceraccess()
            : widget.indexpass == 22
                ? CancerobjectiveDetails()
                : widget.indexpass == 23
                    ? MerckFellowship()
                    : widget.indexpass == 24
                        ? MerckCancerPatient()
                        : widget.indexpass == 25
                            ? Merckcancercommunityawareness()
                            : widget.indexpass == 26
                                ? WatchmoreVideolibrary(
                                    apiurl: API.watchvideocancer,
                                    headertitle:
                                        "Merck Foundation Cancer Access Program Videos",
                                    sharelink: Constantstring
                                        .sharewatchallvideovideocancer,
                                  )
                                : widget.indexpass == 27
                                    ? SocialMedia()
                                    : Container(),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: CustomAdvFab(
              key: fabKey,
              icon: Icons.menu,
              
              iconColor: Customcolor.text_darkblue,
              backgroundColor: Customcolor.programyellow,
              expandedContent: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: programvalue.length,
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                         fabKey.currentState?.collapse();
                        
                        if (index == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      OurProgramcancerlist(
                                        indexpass: 22,
                                      )
                                  //CancerobjectiveDetails()
                                  )).then((onValue){
               fabKey.currentState?.collapse();
               setState(() {});
                                  });
                        } else if (index == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      OurProgramcancerlist(
                                        indexpass: 23,
                                      )
                                  //   MerckFellowship()
                                  )).then((onValue){
               fabKey.currentState?.collapse();
                setState(() {});
                                  })
                                 ;
                        } else if (index == 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      OurProgramcancerlist(
                                        indexpass: 24,
                                      )
                                  // MerckCancerPatient()
                                  )).then((onValue){
               fabKey.currentState?.collapse();
                setState(() {});
                                  });
                        } else if (index == 3) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      OurProgramcancerlist(
                                        indexpass: 25,
                                      )
                                  //  Merckcancercommunityawareness()
                                  )).then((onValue){
               fabKey.currentState?.collapse();
                setState(() {});
                                  });
                        } else if (index == 4) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      OurProgramcancerlist(
                                        indexpass: 26,
                                      ))).then((onValue){
               fabKey.currentState?.collapse();
                setState(() {});
                                  });
                        } else if (index == 5) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      OurProgramcancerlist(
                                        indexpass: 27,
                                      )
                                  //SocialMedia()
                                  )).then((onValue){
               fabKey.currentState?.collapse();
                setState(() {});
                                  });
                        }
                      
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FormLabel(
                              text: programvalue[index],
                              labelColor: Customcolor.text_darkblue,
                              fontweight: FontWeight.w600,
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(1.8),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: SizeConfig.blockSizeHorizontal * 80,
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
              )),
        )
        // body: AdvFabBottomBarBody(
        //   screens: <Widget>[
        //     widget.indexpass == 21
        //         ? MerckCanceraccess()
        //         : widget.indexpass == 22
        //             ? CancerobjectiveDetails()
        //             : widget.indexpass == 23
        //                 ? MerckFellowship()
        //                 : widget.indexpass == 24
        //                     ? MerckCancerPatient()
        //                     : widget.indexpass == 25
        //                         ? Merckcancercommunityawareness()
        //                         : widget.indexpass == 26
        //                             ? WatchmoreVideolibrary(
        //                                 apiurl: API.watchvideocancer,
        //                                 headertitle:
        //                                     "Merck Foundation Cancer Access Program Videos",
        //                                 sharelink: Constantstring
        //                                     .sharewatchallvideovideocancer,
        //                               )
        //                             : widget.indexpass == 27
        //                                 ? SocialMedia()
        //                                 : Container()
        //   ],
        //   controller: mabialaFABController,
        // ),
        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.only(bottom: 40),
        //   child: AdvFab(
        //     showLogs: true,
        //     floatingActionButtonExpendedWidth: 80,
        //     onFloatingActionButtonTapped: () {
        //       mabialaFABController.setExpandedWidgetConfiguration(
        //         showLogs: true,
        //         heightToExpandTo: 50,
        //         expendedBackgroundColor: Customcolor.programyellow,
        //         withChild: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Container(
        //             width: (MediaQuery.of(context).size.width) * 70,

        //             ///[IMPORTANT]: the height percentage shall be less than [heightToExpandTo]
        //             ///in the next line we use 20%
        //             height: 330,
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: <Widget>[
        //                 GestureDetector(
        //                     onTap: () {
        //                       mabialaFABController
        //                           .setExpandedWidgetConfiguration(
        //                         showLogs: true,
        //                         heightToExpandTo: 50,
        //                         expendedBackgroundColor:
        //                             Customcolor.programyellow,
        //                         withChild: Padding(
        //                           padding: const EdgeInsets.all(8.0),
        //                           child: Container(
        //                             width: (MediaQuery.of(context).size.width) *
        //                                 70,

        //                             ///[IMPORTANT]: the height percentage shall be less than [heightToExpandTo]
        //                             ///in the next line we use 20%
        //                             height: 330,
        //                             child: Column(
        //                               crossAxisAlignment:
        //                                   CrossAxisAlignment.start,
        //                               children: <Widget>[
        //                                 GestureDetector(
        //                                     onTap: () {},
        //                                     child: Align(
        //                                         alignment: Alignment.topRight,
        //                                         child: Padding(
        //                                           padding:
        //                                               const EdgeInsets.only(
        //                                                   right: 10, top: 10),
        //                                           child: Icon(
        //                                             Icons.close,
        //                                             color:
        //                                                 Customcolor.colorBlue,
        //                                           ),
        //                                         ))),
        //                                 Expanded(
        //                                   //   flex: 5,
        //                                   child: ListView.builder(
        //                                     padding: EdgeInsets.all(0),
        //                                     physics: BouncingScrollPhysics(),
        //                                     itemCount: programvalue.length,
        //                                     scrollDirection: Axis.vertical,
        //                                     itemBuilder: (BuildContext context,
        //                                         int index) {
        //                                       return GestureDetector(
        //                                         onTap: () {},
        //                                         child: Container(
        //                                           color: Colors.transparent,
        //                                           child: Column(
        //                                             children: [
        //                                               FormLabel(
        //                                                 text:
        //                                                     programvalue[index],
        //                                                 labelColor: Customcolor
        //                                                     .text_darkblue,
        //                                                 fontweight:
        //                                                     FontWeight.w600,
        //                                                 fontSize:
        //                                                     ResponsiveFlutter
        //                                                             .of(context)
        //                                                         .fontSize(1.8),
        //                                               ),

        //                                               SizedBox(
        //                                                 height: 5,
        //                                               ),

        //                                               Container(
        //                                                 width: SizeConfig
        //                                                         .blockSizeHorizontal *
        //                                                     80,
        //                                                 height: 1.0,
        //                                                 color: Customcolor
        //                                                     .text_darkblue,
        //                                               )
        //                                               // Divider(
        //                                               //   color:
        //                                               //       Customcolor.colorBlue,
        //                                               // )
        //                                             ],
        //                                           ),

        //                                           //height: (MediaQuery.of(context).size.height/100)*9,
        //                                         ),
        //                                       );
        //                                     },
        //                                   ),
        //                                 )
        //                               ],
        //                             ),
        //                           ),
        //                         ),
        //                       );
        //                       mabialaFABController.isCollapsed
        //                           ? mabialaFABController.expandFAB()
        //                           : mabialaFABController.collapseFAB();
        //                     },
        //                     child: Align(
        //                         alignment: Alignment.topRight,
        //                         child: Padding(
        //                           padding:
        //                               const EdgeInsets.only(right: 10, top: 10),
        //                           child: Icon(
        //                             Icons.close,
        //                             color: Customcolor.colorBlue,
        //                           ),
        //                         ))),
        //                 Expanded(
        //                   flex: 5,
        //                   child: ListView.builder(
        //                     physics: BouncingScrollPhysics(),
        //                     itemCount: programvalue.length,
        //                     scrollDirection: Axis.vertical,
        //                     padding: EdgeInsets.zero,
        //                     itemBuilder: (BuildContext context, int index) {
        //                       return Padding(
        //                         padding: const EdgeInsets.all(8.0),
        //                         child: GestureDetector(
        //                           onTap: () {
        //                             mabialaFABController.collapseFAB();
        //                             if (index == 0) {
        //                               Navigator.push(
        //                                   context,
        //                                   MaterialPageRoute(
        //                                       builder: (BuildContext context) =>
        //                                           OurProgramcancerlist(
        //                                             indexpass: 22,
        //                                           )
        //                                       //CancerobjectiveDetails()
        //                                       ));
        //                             } else if (index == 1) {
        //                               Navigator.push(
        //                                   context,
        //                                   MaterialPageRoute(
        //                                       builder: (BuildContext context) =>
        //                                           OurProgramcancerlist(
        //                                             indexpass: 23,
        //                                           )
        //                                       //   MerckFellowship()
        //                                       ));
        //                             } else if (index == 2) {
        //                               Navigator.push(
        //                                   context,
        //                                   MaterialPageRoute(
        //                                       builder: (BuildContext context) =>
        //                                           OurProgramcancerlist(
        //                                             indexpass: 24,
        //                                           )
        //                                       // MerckCancerPatient()
        //                                       ));
        //                             } else if (index == 3) {
        //                               Navigator.push(
        //                                   context,
        //                                   MaterialPageRoute(
        //                                       builder: (BuildContext context) =>
        //                                           OurProgramcancerlist(
        //                                             indexpass: 25,
        //                                           )
        //                                       //  Merckcancercommunityawareness()
        //                                       ));
        //                             } else if (index == 4) {
        //                               Navigator.push(
        //                                   context,
        //                                   MaterialPageRoute(
        //                                       builder: (BuildContext context) =>
        //                                           OurProgramcancerlist(
        //                                             indexpass: 26,
        //                                           )));
        //                             } else if (index == 5) {
        //                               Navigator.push(
        //                                   context,
        //                                   MaterialPageRoute(
        //                                       builder: (BuildContext context) =>
        //                                           OurProgramcancerlist(
        //                                             indexpass: 27,
        //                                           )
        //                                       //SocialMedia()
        //                                       ));
        //                             }
        //                           },
        //                           child: Container(
        //                             color: Colors.transparent,
        //                             child: Column(
        //                               crossAxisAlignment:
        //                                   CrossAxisAlignment.start,
        //                               children: [
        //                                 FormLabel(
        //                                   text: programvalue[index],
        //                                   labelColor: Customcolor.text_darkblue,
        //                                   fontweight: FontWeight.w600,
        //                                   fontSize:
        //                                       ResponsiveFlutter.of(context)
        //                                           .fontSize(1.8),
        //                                 ),
        //                                 SizedBox(
        //                                   height: 5,
        //                                 ),
        //                                 Container(
        //                                   width:
        //                                       SizeConfig.blockSizeHorizontal *
        //                                           80,
        //                                   height: 1.0,
        //                                   color: Customcolor.text_darkblue,
        //                                 )
        //                               ],
        //                             ),

        //                             //height: (MediaQuery.of(context).size.height/100)*9,
        //                           ),
        //                         ),
        //                       );
        //                     },
        //                   ),
        //                 )
        //               ],
        //             ),
        //           ),
        //         ),
        //       );
        //       mabialaFABController.isCollapsed
        //           ? mabialaFABController.expandFAB()
        //           : mabialaFABController.collapseFAB();
        //     },
        //     floatingActionButtonIcon: Icons.menu,

        //     floatingActionButtonIconColor: Customcolor.colorBlue,
        //     navigationBarIconActiveColor: Colors.pink,
        //     navigationBarIconInactiveColor: Colors.pink[200].withOpacity(0.6),
        //     collapsedColor: Customcolor.programyellow,
        //     // useAsFloatingSpaceBar: useFloatingSpaceBar,
        //     useAsFloatingActionButton: useAsFloatingActionButton,
        //     //useAsNavigationBar: useNavigationBar,
        //     controller: mabialaFABController,
        //     animationDuration: Duration(milliseconds: 150),
        //   ),
        // )
        );
  }
}

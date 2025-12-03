// import 'package:adv_fab/adv_fab.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Educatinglinda.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Ourprogramdetailafricaasia.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/firstladiesinitiativesummit.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/ourProgramdetailsforStem.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/ourProgramdetailsforcapacityAdv.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/ourProgramdetailsforhypertensionbluepoint.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/ourprogramdetail.dart';
import 'package:merckfoundation22dec/widget/CustomAdvFab.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:merckfoundation22dec/utility/ResponsiveFlutter.dart';

class OurProgramSevenlist extends StatefulWidget {
  OurProgramSevenlist({Key? key, this.title, this.indexpass}) : super(key: key);

  final String? title;
  final int? indexpass;

  @override
  _MyHomePageState createState() => _MyHomePageState(this.indexpass!);
}

Map<String, bool> expansionState = Map();

class _MyHomePageState extends State<OurProgramSevenlist> {
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
    'Merck Foundation "More Than a Mother" Movement',
    //"Merck Foundation More Than A Mother",
    "Merck Foundation Cancer Access Program",
    "Merck Foundation Capacity Advancement Program",
    // "Merck Foundation Capacity Advancement & Nationwide Diabetes Blue Points Program",
    "Merck Foundation Nationwide Diabetes & Hypertension Blue Points Program", //"Merck Foundation Sustainability Initiative",
    "Merck Foundation First Ladies Initiative Summit- MFFLI",
    //"Merck Foundation First Ladies Initiative Summit",
    "Merck Foundation STEM Program",
    "Merck Foundation Educating Linda Program",
    // "Merck Foundation Sustainability Initiative",
    "Merck Foundation Africa Asia Luminary",
    //   'Merck Foundation "More Than a Mother" Movement',//"Merck Foundation More Than A Mother",
    //   "Merck Foundation Cancer Access Program",
    //  "Merck Foundation Capacity Advancement Program", // "Merck Foundation Capacity Advancement & Nationwide Diabetes Blue Points Program",
    //   "Merck Foundation First Ladies Initiative Summit- MFFLIs",//"Merck Foundation First Ladies Initiative Summit",
    //   "Merck Foundation STEM Program",
    //   "Merck Foundation Educating Linda Program",
    //   "Merck Foundation Sustainability Initiative",
    //   "Merck Foundation Africa Asia Luminary",
  ];

  bool useAsFloatingActionButton = true;

  _MyHomePageState(this.indexpass);
  @override
  void initState() {
    print('AAAAPPPP');
    super.initState();
    // mabialaFABController = AdvFabController();
    setData();
  }

  setData() {
    expansionList.forEach((name) {
      expansionState.putIfAbsent(name, () => false);
    });
  }
final GlobalKey<CustomAdvFabState> fabKey = GlobalKey<CustomAdvFabState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //16june2025
      body: 
          widget.indexpass == 1
                ? ourProgramdetailsforcapacityAdv() //MerckCapabilityadvancement()
                : widget.indexpass == 2
                    ? FirstLadiesInitiativeDetails()
                    : widget.indexpass == 3
                        ? EducatingLinda()
                        : widget.indexpass == 4
                            ? ourProgramdetailsforhypertensionbluepoint() //MerckSubstantional()
                            : Container(),

                             floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: 
           CustomAdvFab(
             key: fabKey,
          icon: Icons.menu,
          iconColor: 
          Customcolor.text_darkblue,
          backgroundColor: Customcolor.programyellow,
          expandedContent: 
ListView.builder(
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
            print("on trap");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        OurProgram(
                          indexpass: 0,
                        ))).then((onValue){
 fabKey.currentState?.collapse();
 setState(() {});
          });
          } else if (index == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        OurProgram(
                          indexpass: 1,
                        ))).then((onValue){
 fabKey.currentState?.collapse();
 setState(() {});
          });
          } else if (index == 2) {
           
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ourProgramdetailsforcapacityAdv())).then((onValue){
 fabKey.currentState?.collapse();
 setState(() {});
          });
          } else if (index == 4) {
           
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        OurProgramSevenlist(
                          indexpass: 2,
                        ))).then((onValue){
 fabKey.currentState?.collapse();
 setState(() {});
          });
          } else if (index == 3) {
           
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ourProgramdetailsforhypertensionbluepoint())).then((onValue){
 fabKey.currentState?.collapse();
 setState(() {});
          });
          } else if (index == 5) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        OurProgramStem())).then((onValue){
 fabKey.currentState?.collapse();
 setState(() {});
          });
          } else if (index == 6) {
            
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        OurProgramSevenlist(
                          indexpass: 3,
                        ))).then((onValue){
 fabKey.currentState?.collapse();
 setState(() {});
          });
          } else if (index == 7) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        OurProgramAfrica())).then((onValue){
 fabKey.currentState?.collapse();
 setState(() {});
          });
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
                fontSize:
                    ResponsiveFlutter.of(context)
                        .fontSize(1.8),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width:
                    SizeConfig.blockSizeHorizontal *
                        80,
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
)


        ),
        // body: AdvFabBottomBarBody(
        //   screens: <Widget>[
        //     widget.indexpass == 1
        //         ? ourProgramdetailsforcapacityAdv() //MerckCapabilityadvancement()
        //         : widget.indexpass == 2
        //             ? FirstLadiesInitiativeDetails()
        //             : widget.indexpass == 3
        //                 ? EducatingLinda()
        //                 : widget.indexpass == 4
        //                     ? ourProgramdetailsforhypertensionbluepoint() //MerckSubstantional()
        //                     : Container()
        //   ],
        //   controller: mabialaFABController,
        // ),
      
        ));
  }
}

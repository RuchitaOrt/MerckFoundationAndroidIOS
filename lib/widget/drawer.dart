import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/dummy.dart';
import 'package:merckfoundation22dec/mediascreen.dart/newReleases.dart';
import 'package:merckfoundation22dec/screens/ceomessage/messageFromLeadership.dart';
import 'package:merckfoundation22dec/screens/contactus/contactUs.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/ourprogramdetail.dart';
import 'package:merckfoundation22dec/screens/ourpartner/ourPartners.dart';
import 'package:merckfoundation22dec/screens/ourvision/vision.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/drawerWidget.dart';

Map<String, bool> expansionState = Map();

//import 'applicantDetails.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
//  var expansionList = ["Who We Are", "What We Do", "Our Programs", "Media & Events"];
  var expansionList = [
    "Who We Are",
    "What We Do",
    "Our Programs",
    "Media & Events"
  ];

  bool isLoggedIn = false;
  // static final FacebookLogin facebookSignIn = new FacebookLogin();

  void closeOpenExpansionList(expansionName) {
    expansionList.forEach((name) {
      if (name != expansionName) expansionState[name] = false;
    });
    setState(() {
      if (!expansionState[expansionName]) expansionState[expansionName] = true;
    });
  }

  var headingTextStyle = TextStyle(
      color: Customcolor.colorBlue, fontSize: 16, fontWeight: FontWeight.w600);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }

  setData() {
    expansionList.forEach((name) {
      expansionState.putIfAbsent(name, () => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //  ScaffoldState().openDrawer() ,
      child: Container(
        color: Customcolor.baby_blue,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: ListView(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                children: [
                  Container(
                    color: Customcolor.background,
                    padding: EdgeInsets.all(0),
                    child: new Column(
                      children: <Widget>[
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/newImages/logo_nav.png',
                              width: 200,
                              height: 140,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Dashboard(
                                              index: 0,
                                            )));
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 40, right: 20),
                                child: Image.asset(
                                  'assets/newImages/arrow_forward.png',
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "The Philanthropic arm of Merck KGaA",
                          style: TextStyle(
                            color: Customcolor.colorBlue,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/newImages/home.png',
                      width: 20,
                      height: 20,
                    ),
                    title: Transform(
                        transform: Matrix4.translationValues(-18, 0.0, 0.0),
                        child: Text("Home", style: headingTextStyle)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Dashboard(
                                    index: 0,
                                  )));
                    },
                  ),
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      key: GlobalKey(),
                      initiallyExpanded: expansionState['Who We Are'],
                      title: Container(
                        padding: EdgeInsets.all(2),
                        child: new Row(
                          children: <Widget>[
                            Divider(
                              color: Colors.black54,
                            ),
                            new Image.asset(
                              'assets/newImages/whoweare.png',
                              height: 20.0,
                              width: 20.0,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text('Who We Are', style: headingTextStyle),
                          ],
                        ),
                      ),
                      onExpansionChanged: ((newState) {
                        expansionState['Who We Are'] = newState;
                        if (newState) closeOpenExpansionList('Who We Are');
                      }),
                      children: <Widget>[
                        DrawerWidget(
                          image: '',
                          value: 'Vision',
                          onTapfun: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        OurVision()));
                          },
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Leadership',
                          onTapfun: () {
                            // Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (BuildContext context) =>
                            //               Check()));
                          },
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Message from Leadership\n Team',
                          onTapfun: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MessageFromLeadership()));
                          },
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Merck Foundation Overview',
                          onTapfun: () {
                            print('ontap');
                          },
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Contact Us',
                          onTapfun: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ContactUs()));
                          },
                        ),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ),
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      key: GlobalKey(),
                      initiallyExpanded: expansionState['What We Do'],
                      title: Container(
                        padding: EdgeInsets.all(2),
                        child: new Row(
                          children: <Widget>[
                            new Image.asset(
                              '',
                              height: 20.0,
                              width: 20.0,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text('What We Do', style: headingTextStyle),
                          ],
                        ),
                      ),
                      onExpansionChanged: ((newState) {
                        expansionState['What We Do'] = newState;
                        if (newState) closeOpenExpansionList('What We Do');
                      }),
                      children: <Widget>[
                        SizedBox(
                          height: 2,
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Mission',
                          onTapfun: () {
                            print('ontap');
                          },
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Our Policies',
                          onTapfun: () {
                            print('ontap');
                          },
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Our Activities',
                          onTapfun: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (BuildContext context) =>
                            //             OurActivities()));
                          },
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Legal Disclaimer',
                          onTapfun: () {
                            print('ontap');
                          },
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Data Privacy',
                          onTapfun: () {
                            print('ontap');
                          },
                        ),
                        SizedBox(
                          height: 2,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/newImages/partner.png',
                      width: 20,
                      height: 20,
                    ),
                    title: Transform(
                        transform: Matrix4.translationValues(-18, 0.0, 0.0),
                        child: Text("Our Partners", style: headingTextStyle)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Ourpatner()));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      key: GlobalKey(),
                      initiallyExpanded: expansionState['Our Programs'],
                      title: Container(
                        padding: EdgeInsets.all(2),
                        child: new Row(
                          children: <Widget>[
                            new Image.asset(
                              'assets/newImages/programs.png',
                              height: 14.0,
                              width: 16.0,
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            Text('Our Programs', style: headingTextStyle),
                          ],
                        ),
                      ),
                      onExpansionChanged: ((newState) {
                        expansionState['Our Programs'] = newState;
                        if (newState) closeOpenExpansionList('Our Programs');
                      }),
                      children: <Widget>[
                        SizedBox(
                          height: 4,
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Merck More Than A Mother',
                          onTapfun: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        OurProgram(
                                          indexpass: 0,
                                        )));
                          },
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Merck Cancer Access\n Program',
                          onTapfun: () {
                            print('ontap');
                          },
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        DrawerWidget(
                          image: '',
                          value:
                              'Merck Capacity Advancement \n& Diabetes Blue Point Program',
                          onTapfun: () {
                            print('ontap');
                          },
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        DrawerWidget(
                          image: '',
                          value:
                              'Merck Foundation First Ladies\n Initiative Summit',
                          onTapfun: () {
                            print('ontap');
                          },
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Merck STEM Program',
                          onTapfun: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        OurProgram(
                                          indexpass: 4,
                                        )));
                          },
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Educating Linda Program',
                          onTapfun: () {
                            print('ontap');
                          },
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Merck Foundation Sustainability\n Initiative',
                          onTapfun: () {
                            print('ontap');
                          },
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Merck Africa Asia Luminary',
                          onTapfun: () {
                            print('ontap');
                          },
                        ),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ),
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      key: GlobalKey(),
                      initiallyExpanded: expansionState['Media & Events'],
                      title: Container(
                        padding: EdgeInsets.all(2),
                        child: new Row(
                          children: <Widget>[
                            new Image.asset(
                              'assets/newImages/media.png',
                              height: 20.0,
                              width: 20.0,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text('Media & Events', style: headingTextStyle),
                          ],
                        ),
                      ),
                      onExpansionChanged: ((newState) {
                        expansionState['Media & Events'] = newState;
                        if (newState) closeOpenExpansionList('Media & Events');
                      }),
                      children: <Widget>[
                        SizedBox(
                          height: 4,
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Video Library',
                          onTapfun: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (BuildContext context) =>
                            //             OurStories()));
                          },
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Stories',
                          onTapfun: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Dashboard(
                                          index: 2,
                                        )));
                          },
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Merck Foundation Alumnis \nTestimonies',
                          onTapfun: () {
                            print('ontap1');
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (BuildContext context) =>
                            //             MerckfoundationTestmonial()));
                          },
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Newsletters And Articles',
                          onTapfun: () {
                            print('ontap');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Dashboard(
                                          index: 4,
                                        )));
                          },
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Call For Application',
                          onTapfun: () {
                            print('ontap');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Dashboard(
                                          index: 4,
                                        )));
                          },
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'News Releases',
                          onTapfun: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        NewsRelease()));
                          },
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Merck foundation in Media',
                          onTapfun: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (BuildContext context) => Media()));

                            // print('ontap');
                          },
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Annual Report',
                          onTapfun: () {
                            print('ontap');
                          },
                        ),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/newImages/call.png',
                      width: 20,
                      height: 20,
                    ),
                    title: Transform(
                        transform: Matrix4.translationValues(-18, 0.0, 0.0),
                        child: Text("Contact Us", style: headingTextStyle)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => ContactUs()));
                      // Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => Profile()));
                    },
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(bottom: 10, left: 15),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      "assets/newImages/instagram.png",
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        "assets/newImages/facebook.png",
                        width: 30,
                        height: 30,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      "assets/newImages/twitter.png",
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      "assets/newImages/youtube.png",
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      "assets/newImages/flickr.png",
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }

  void onLoginStatusChanged(bool isLoggedIn) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
    });
  }
}

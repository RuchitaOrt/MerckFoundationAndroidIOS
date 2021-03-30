import 'dart:io';

import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/mediascreen.dart/merckFoudationTestimonial.dart';
import 'package:merckfoundation22dec/mediascreen.dart/merckFoundationMedia.dart';
import 'package:merckfoundation22dec/mediascreen.dart/AnnualReport.dart';

import 'package:merckfoundation22dec/mediascreen.dart/newReleases.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videoplayer.dart';
import 'package:merckfoundation22dec/screens/ceomessage/ceomessage.dart';
import 'package:merckfoundation22dec/screens/ceomessage/messageFromLeadership.dart';
import 'package:merckfoundation22dec/screens/contactus/contactUs.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videolibray.dart';

import 'package:merckfoundation22dec/screens/ourpartner/ourPartnerDetails.dart';
import 'package:merckfoundation22dec/screens/ourvision/vision.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/whatwedo/dataprivacy.dart';
import 'package:merckfoundation22dec/whatwedo/legaldisclaimer.dart';
import 'package:merckfoundation22dec/whatwedo/ouractivities.dart';
import 'package:merckfoundation22dec/whatwedo/ourmission.dart';
import 'package:merckfoundation22dec/whatwedo/ourpolicy.dart';

import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/drawerWidget.dart';
import 'package:merckfoundation22dec/widget/pdfviewpage.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

Map<String, bool> expansionState = Map();

//import 'applicantDetails.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
//  var expansionList = ["Who We Are", "What We Do", "Our Programs", "Media & Events"];
  var expansionList = ["Who We Are", "What We Do", "Media & Events"];

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
    var headingTextStyle = TextStyle(
        color: Customcolor.text_darkblue,
        fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
        fontWeight: FontWeight.w700);

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
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/newImages/logoforheader.png",
                              // 'assets/newImages/logo_menu.png',
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
                        padding: EdgeInsets.all(0),
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
                          value: 'Our Vision',
                          onTapfun: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        OurVision()));
                          },
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Leadership',
                          onTapfun: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Ceomessage()));
                          },
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Message from Leadership\nTeam',
                          onTapfun: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MessageFromLeadership()));
                          },
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Merck Foundation Overview',
                          onTapfun: () {
                            print('ontap');
                            ShowDialogs.launchURL(
                                GlobalLists.Constantmerckoverview);

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (BuildContext context) =>
                            //             PdfviewPage()
                            //         // VideoPlayer(
                            //         //   videoUrl:
                            //         //       "http://merckfoundation.org/merck/public/uploads/page_content/1616159695_3c88d39708ef1a56f6cf.pdf",
                            //         // )
                            //         ));
                          },
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
                              'assets/newImages/whatwedo.png',
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
                        DrawerWidget(
                          image: '',
                          value: 'Our Mission',
                          onTapfun: () {
                            print('ontap');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        OurMission()));
                          },
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Our Policies',
                          onTapfun: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        OurPolicy()));
                          },
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Our Activities',
                          onTapfun: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        OurActivity()));
                          },
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Legal Disclaimer',
                          onTapfun: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Ourlegaldisclimer()));
                          },
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Data Privacy',
                          onTapfun: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        OurDataprivacy()));
                          },
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
                              builder: (BuildContext context) =>
                                  Ourpatnerdetail()));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/newImages/programs.png',
                      width: 20,
                      height: 20,
                    ),
                    title: Transform(
                        transform: Matrix4.translationValues(-18, 0.0, 0.0),
                        child: Text("Our Programs", style: headingTextStyle)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Dashboard(
                                    index: 1,
                                  )));
                    },
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
                        DrawerWidget(
                          image: '',
                          value: 'Video Library',
                          onTapfun: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Videolibrary()));
                          },
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Our Stories',
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
                        DrawerWidget(
                          image: '',
                          value: 'Merck Foundation Aluminis \nTestimonies',
                          onTapfun: () {
                            print('ontap1');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MerckFoundationTestimonial()));
                          },
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
                                          index: 3,
                                        )));
                          },
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Upcoming Programs & \nCall For Applications',
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
                        DrawerWidget(
                          image: '',
                          value: 'News Release',
                          onTapfun: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        NewsRelease()));
                          },
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Merck foundation in Media',
                          onTapfun: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MerckFoundationMedia(
                                          apiurl: API.merckfoundationinmedia,
                                        )));

                            // print('ontap');
                          },
                        ),
                        DrawerWidget(
                          image: '',
                          value: 'Annual Report',
                          onTapfun: () {
                            print('ontap');

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        AnnualReport()));
                          },
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
                    GestureDetector(
                      onTap: () {
                        Platform.isAndroid
                            ? ShowDialogs.followuslink(
                                Constantstring.followinsta,
                                Constantstring.followmsg)
                            : ShowDialogs.launchInstagram(
                                Constantstring.followinsta, "merckfoundation");
                      },
                      child: Image.asset(
                        "assets/newImages/instagram.png",
                        width: 30,
                        height: 30,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Platform.isAndroid
                            ? ShowDialogs.followuslink(
                                Constantstring.followfacebook,
                                Constantstring.followmsg)
                            : ShowDialogs.launchFacebook(
                                Constantstring.followfacebook,
                                "1053979038068008");
                      },
                      child: Image.asset(
                        "assets/newImages/facebook.png",
                        width: 30,
                        height: 30,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Platform.isAndroid
                            ? ShowDialogs.followuslink(
                                Constantstring.followtwitter,
                                Constantstring.followmsg)
                            : ShowDialogs.launchTwitter(
                                Constantstring.followtwitter);
                      },
                      child: Image.asset(
                        "assets/newImages/twitter.png",
                        width: 30,
                        height: 30,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Platform.isAndroid
                            ? ShowDialogs.followuslink(
                                Constantstring.followyoutube,
                                Constantstring.followmsg)
                            : ShowDialogs.youtubevideolink(
                                Constantstring.followyoutube);
                      },
                      child: Image.asset(
                        "assets/newImages/youtube.png",
                        width: 30,
                        height: 30,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Platform.isAndroid
                            ? ShowDialogs.followuslink(
                                Constantstring.followflicker,
                                Constantstring.followmsg)
                            : ShowDialogs.launchURL(
                                Constantstring.followflicker);
                      },
                      child: Image.asset(
                        "assets/newImages/flickr.png",
                        width: 30,
                        height: 30,
                      ),
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

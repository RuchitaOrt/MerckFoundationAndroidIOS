import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/mediascreen.dart/callforApplication.dart';
import 'package:merckfoundation22dec/mediascreen.dart/news.dart';
import 'package:merckfoundation22dec/mediascreen.dart/stories.dart';
import 'package:merckfoundation22dec/screens/home.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/ourPrograms.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/UtilityFile.dart';
import 'package:merckfoundation22dec/widget/customappbar.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/drawer.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title, this.index, this.apiurl}) : super(key: key);
  final String title;
  final int index;
  final dynamic apiurl;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  int currentPage;
  Color inactiveColor = Customcolor.colorBlue;
  PageController tabBarController;
  int currentIndex;

  var style = TextStyle(
      color: Customcolor.colorBlue, fontWeight: FontWeight.w800, fontSize: 12);

  @override
  void initState() {
    super.initState();
    Utility().loadAPIConfig(context);
    currentIndex = widget.index;
    tabBarController = new PageController(initialPage: widget.index);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Customcolor.background,
      key: _scaffoldKey,
      // appBar: CustomAppBar(
      //   () {
      //     _scaffoldKey.currentState.openDrawer();
      //   },
      //   1,
      //   height: 120,
      // ),

      body: PageView(
          controller: tabBarController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Home(),
            Ourprogram(),
            Stories(),    
            NewsPage(
              apiurl: API.newsletters,
            ),
            CallforApplication(
              apiurl: API.callforapplication,
              sharelink: Constantstring.sharecallforapp,
            )
          ]),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        showElevation: true,
        itemCornerRadius: 8,
        curve: Curves.easeInBack,
        onItemSelected: (index) => setState(() {
          currentIndex = index;
          tabBarController.jumpToPage(index);
        }),
        items: [
          BottomNavyBarItem(
            icon: Image.asset(
              "assets/newImages/home_unselect.png",
              height: 25,
            ),
            title: Text(
              'Home',
              style: style,
            ),
            activeColor: Customcolor.colorBlue,
            inactiveColor: Colors.grey,
            textAlign: TextAlign.center,
            selectedIcon: Image.asset(
              "assets/newImages/home_bottom.png",
              height: 25,
            ),
          ),
          BottomNavyBarItem(
            icon: Image.asset(
              "assets/newImages/programs_unselect.png",
              height: 25,
            ),
            title: Text(
              'Our Program',
              style: style,
            ),
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
            textAlign: TextAlign.center,
            selectedIcon: Image.asset(
              "assets/newImages/programs_bottom.png",
              height: 25,
            ),
          ),
          BottomNavyBarItem(
            icon: Image.asset(
              "assets/newImages/media_events_unselect.png",
              height: 25,
            ),
            title: Text(
              'Our Stories',
              style: style,
            ),
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
            textAlign: TextAlign.center,
            selectedIcon: Image.asset(
              "assets/newImages/media_bottom.png",
              height: 25,
            ),
          ),
          BottomNavyBarItem(
            icon: Image.asset(
              "assets/newImages/news_bottom_unselect.png",
              height: 25,
            ),
            title: Text(
              'News',
              style: style,
            ),
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
            textAlign: TextAlign.center,
            selectedIcon: Image.asset(
              "assets/newImages/news_selected-bottom.png",
              height: 25,
            ),
          ),
          BottomNavyBarItem(
            // icon: Icon(Icons.call),
            // title: Expanded(
            //     child: Text(
            //   'Call for Application',
            //   style: style,
            //   maxLines: 2,
            // )),
            icon: Image.asset(
              "assets/newImages/call_for_application_unselect.png",
              height: 25,
            ),
            title: Text(
              'Upcoming Programs & Call for applications',
              style: style,
              maxLines: 2,
            ),
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
            textAlign: TextAlign.center,
            selectedIcon: Image.asset(
              "assets/newImages/call_for_application_bottom.png",
              height: 25,
            ),
          ),
          // BottomNavyBarItem(
          //   icon: Icon(Icons.perm_media),
          //   title: Text('Gallery'),
          //   activeColor: Colors.blue,
          //   textAlign: TextAlign.center,
          // ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    tabBarController.dispose();
    super.dispose();
  }
}

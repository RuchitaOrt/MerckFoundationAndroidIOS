import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/mediascreen.dart/callforApplication.dart';
import 'package:merckfoundation22dec/mediascreen.dart/news.dart';
import 'package:merckfoundation22dec/mediascreen.dart/stories.dart';
import 'package:merckfoundation22dec/screens/home.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/ourPrograms.dart';
import 'package:merckfoundation22dec/widget/customappbar.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/drawer.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title, this.index}) : super(key: key);
  final String title;
  final int index;

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
            NewsPage(),
            CallforApplication()
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
            icon: Icon(Icons.home),
            title: Text(
              'Home',
              style: style,
            ),
            activeColor: Customcolor.colorBlue,
            inactiveColor: Colors.grey,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text(
              'Our Program',
              style: style,
            ),
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.video_call),
            title: Text(
              'Our Stories',
              style: style,
            ),
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.new_releases),
            title: Text(
              'News',
              style: style,
            ),
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.call),
            title: Expanded(
                child: Text(
              'Call for Application',
              style: style,
              maxLines: 2,
            )),
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
            textAlign: TextAlign.center,
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

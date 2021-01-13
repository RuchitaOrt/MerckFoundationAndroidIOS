import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/model/getNewsRelease.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';

import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';

import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';

class NewsRelease extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewsReleaseState();
  }
}

class NewsReleaseState extends State<NewsRelease> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  void initState() {
    // TODO: implement initState
    getNewsRelease();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Customcolor.background,
        appBar: InnerCustomAppBar(
          onTapval: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Dashboard(
                          index: 0,
                        )));
          },
          index: 1,
          title: "News Releases",
          titleImg: "assets/newImages/newsarticle_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        body: GlobalLists.newsReleaseList.length <= 0
            ? Container(
                child: Center(child: Text(Constantstring.emptyData)),
              )
            : Stack(
                children: [
                  ListView(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    children: [
                      ListView.builder(
                        itemCount: GlobalLists.newsReleaseList.length,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 6),
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 8, bottom: 8),
                                child: Column(
                                  children: [
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      //crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ClipRect(
                                          child: FadeInImage.assetNetwork(
                                            placeholder:
                                                'assets/newImages/placeholder_3.jpg',
                                            image: GlobalLists
                                                .newsLettersList[index].image,
                                            fit: BoxFit.fill,
                                            height: 80,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Text(
                                            GlobalLists
                                                .newsReleaseList[index].title,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: ResponsiveFlutter.of(
                                                        context)
                                                    .fontSize(1.8),
                                                fontWeight: FontWeight.w500),
                                            maxLines: 4,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 60, right: 60, top: 20, bottom: 10),
                        child: Image.asset(
                          "assets/newImages/flowers_footer.png",
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 90, right: 90, bottom: 20),
                      child: FlatButton(
                        color: Customcolor.text_blue,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Customcolor.text_blue)),
                        child: Text(
                          "Media Enquiries",
                          style: TextStyle(color: Colors.white),
                        ),
                        minWidth: 40,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ));
  }

  static Future<bool> enquirySMDialog(BuildContext context) async {
    bool status = await showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          title: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Customcolor.colorBlue,
            ),
            child: Center(
              child: Text(
                "For Media Enquiry",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Container(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Text(
                    "Contact",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Ms. Mehak Handa',
                    style: TextStyle(
                        color: Customcolor.colorBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text('+91 93196 06669',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w400))
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                        child: Text(' mehak.handa@external.merckgroup.com',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w400)))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Ms. Ekta Pal',
                    style: TextStyle(
                        color: Customcolor.colorBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(' ektapalconsultant@gmail.com',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w400))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Ms. Linda Aryeetey',
                    style: TextStyle(
                        color: Customcolor.colorBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text('+233 26 474 6400',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w400))
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(' audrey5aryeetey@gmail.com',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w400))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          // actions: <Widget>[
          //   // usually buttons at the bottom of the dialog
          //   new FlatButton(
          //     child: new Text("Close"),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ],
        );
      },
    );

    return status;
  }

  getNewsRelease() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.newsRelease,
        (response) async {
          NewsreleaseResponse resp = response;
          print(resp);

          Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.newsReleaseList = resp.data.list;
            });
          } else {
            ShowDialogs.showToast(resp.msg);
          }
        },
        (error) {
          print('ERR msg is $error');
          Navigator.of(_keyLoader.currentContext).pop();
        },
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

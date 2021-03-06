import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videoplayer.dart';
import 'package:merckfoundation22dec/model/empoweingbernavideo.dart';
import 'package:merckfoundation22dec/model/empoweringbernacontentResponse.dart';
import 'package:merckfoundation22dec/model/ourActivitiesObjectiveResp.dart';
import 'package:merckfoundation22dec/model/ourActivitiesResponse.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';

import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';

import 'package:responsive_flutter/responsive_flutter.dart';

class EmpoweringBerna extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmpoweringBernaState();
  }
}

class EmpoweringBernaState extends State<EmpoweringBerna> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  void initState() {
    // TODO: implement initState
    getempoweringbernacontent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: InnerCustomAppBar(
        onTapval: () {
          Navigator.pop(context);
        },
        index: 2,
        title: "Our Program",
        titleImg: "assets/newImages/vision_logo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child: ListView(
              shrinkWrap: true,
              //  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                GlobalLists.empowercontentlist.length <= 0
                    ? Container(
                        child: Center(child: Text(Constantstring.emptyData)),
                      )
                    : Html(
                        data:
                            """${GlobalLists.empowercontentlist[0].pageContent} """,
                        onLinkTap: (url) {
                          print("Opening $url...");
                        },
                      ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
            child: FormLabel(
              text: "Videos",
              labelColor: Customcolor.colorPink,
              fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
              fontweight: FontWeight.w500,
            ),
          ),
          GlobalLists.empowervideotlist.length <= 0
              ? Container(
                  child: Center(child: Text(Constantstring.emptyData)),
                )
              : ourvideo(),
          // Padding(
          //   padding:
          //       const EdgeInsets.only(right: 60, left: 60, top: 20, bottom: 20),
          //   child: Image.asset(
          //     "assets/newImages/flowers_footer.png",
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(right: 0, left: 0),
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                "assets/newImages/flowers_footer.png",
                height: 170,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget ourvideo() {
    return Container(
        height: 190,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: GlobalLists.empowervideotlist.length,
            itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Container(
                    height: SizeConfig.blockSizeVertical * 20,
                    width: SizeConfig.blockSizeHorizontal * 86,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 2.0),
                      child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(1),
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          VideoPlayer(
                                            videoUrl: GlobalLists
                                                .empowervideotlist[index]
                                                .videoLink,
                                          )));
                            },
                            child: Container(
                              color: Colors.transparent,
                              width: SizeConfig.blockSizeHorizontal * 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 100,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        // border: Border.all(
                                        //   width: 1,
                                        // ),
                                        image: new DecorationImage(
                                          image: new NetworkImage(
                                              'https://img.youtube.com/vi/${GlobalLists.empowervideotlist[index].videoLink.substring(GlobalLists.empowervideotlist[index].videoLink.length - 11)}/mqdefault.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      GlobalLists
                                          .empowervideotlist[index].videoDesc,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                              ResponsiveFlutter.of(context)
                                                  .fontSize(1.4),
                                          fontWeight: FontWeight.w500),
                                      maxLines: 3,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                ],
                              ),
                            ),
                          )),
                    ),
                  ),
                )));
  }

  getempoweringbernacontent() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.empoweringbernacontent,
        (response) async {
          EmpoweingbernacontentResponse resp = response;
          print(response);
          print('Resp : $resp');

          if (resp.success == "True") {
            setState(() {
              GlobalLists.empowercontentlist = resp.data.list;

              getvideoData();
            });
          } else {
            ShowDialogs.showToast(resp.msg);
            Navigator.of(_keyLoader.currentContext).pop();
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

  getvideoData() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      //  ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.empoweringbernavideo,
        (response) async {
          GetEmpowringbernaVideosResp resp = response;
          print(response);
          print('Resp : $resp');

          Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.empowervideotlist = resp.data.list;
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

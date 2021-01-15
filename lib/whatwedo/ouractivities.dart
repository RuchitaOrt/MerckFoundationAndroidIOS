import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
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

class OurActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OurActivityState();
  }
}

class OurActivityState extends State<OurActivity> {
  List listourObjective = [
    "expand professional capabilities in healthcare research and media.",
    "improve access to innovative and equitable healthcare solutions",
    "empower women and youth in education with a special focus on STEM (Science, Technology, Engineering and Mathematics).",
    "build advocacy to address health, social and economic challenges.",
    "raise awareness of disease prevention and early detection through access to information, health and change of mind-set."
  ];
  List _productsAvailable = [
    "assets/newImages/img3.jpg",
    "assets/newImages/img4.jpg",
    "assets/newImages/img3.jpg",
    "assets/newImages/img4.jpg",
    "assets/newImages/img3.jpg"
  ];

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  void initState() {
    // TODO: implement initState
    getActivitiesObjectives();
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
        title: "Our Activities",
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
                GlobalLists.ourActivitiesObjectives.length <= 0
                    ? Container(
                        child: Center(child: Text(Constantstring.emptyData)),
                      )
                    : Html(
                        data:
                            """${GlobalLists.ourActivitiesObjectives[0].pageContent} """,
                        onLinkTap: (url) {
                          print("Opening $url...");
                        },
                        // style: {
                        //   "body": Style(
                        //     fontSize: FontSize(
                        //         ResponsiveFlutter.of(context).fontSize(2.2)),
                        //     fontWeight: FontWeight.w600,
                        //     color: Customcolor.pink_col,
                        //   ),
                        // },
                      ),
                SizedBox(
                  height: 15,
                ),
                FormLabel(
                  text:
                      "The Merck Foundation focuses on activities that will contribute towards the Sustainable Development Goals (SDGs) as outlined by the United Nations.",
                  labelColor: Customcolor.text_darkgrey,
                  fontweight: FontWeight.w400,
                  fontSize: ResponsiveFlutter.of(context).fontSize(1.9),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
            child: FormLabel(
              text: "Our Activities",
              labelColor: Customcolor.colorPink,
              fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
              fontweight: FontWeight.w500,
            ),
          ),
          GlobalLists.ourActivitiesData.length <= 0
              ? Container(
                  child: Center(child: Text(Constantstring.emptyData)),
                )
              : ouractivities(),
          Padding(
            padding:
                const EdgeInsets.only(right: 60, left: 60, top: 20, bottom: 20),
            child: Image.asset(
              "assets/newImages/flowers_footer.png",
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget ouractivities() {
    return Container(
        height: 190,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: GlobalLists.ourActivitiesData.length,
            itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Container(
                    height: SizeConfig.blockSizeVertical * 20,
                    width: SizeConfig.blockSizeHorizontal * 86,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: SizeConfig.blockSizeHorizontal * 86,
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/newImages/placeholder_3.jpg',
                            image: Constantstring.baseUrl +
                                GlobalLists.ourActivitiesData[index].image,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 80,
                                      child: Text(
                                        GlobalLists
                                            .ourActivitiesData[index].title,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                        maxLines: 3,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 85,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.amber,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Center(
                                              child: FormLabel(
                                                text: 'Portuguese',
                                                fontSize: ResponsiveFlutter.of(
                                                        context)
                                                    .fontSize(1.8),
                                                labelColor:
                                                    Customcolor.text_darkblue,
                                                fontweight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Container(
                                            width: 60,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.amber,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Center(
                                              child: FormLabel(
                                                text: 'French',
                                                fontSize: ResponsiveFlutter.of(
                                                        context)
                                                    .fontSize(1.8),
                                                labelColor:
                                                    Customcolor.text_darkblue,
                                                fontweight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Container(
                                            width: 70,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.amber,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Center(
                                              child: FormLabel(
                                                text: 'English',
                                                fontSize: ResponsiveFlutter.of(
                                                        context)
                                                    .fontSize(1.8),
                                                labelColor:
                                                    Customcolor.text_darkblue,
                                                fontweight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )));
  }

  getActivitiesObjectives() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.ourActivitiesObjectives,
        (response) async {
          OurActivityObjectiveResponse resp = response;
          print(response);
          print('Resp : $resp');

          if (resp.success == "True") {
            setState(() {
              GlobalLists.ourActivitiesObjectives = resp.data.list;

              getActivitiesData();
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

  getActivitiesData() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      //  ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.ourActivities,
        (response) async {
          OurActivityResponse resp = response;
          print(response);
          print('Resp : $resp');

          Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.ourActivitiesData = resp.data.list;
              Constantstring.baseUrl = resp.baseUrl;
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

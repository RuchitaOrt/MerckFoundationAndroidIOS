import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/model/getNewsRelease.dart';
import 'package:merckfoundation22dec/model/merckFoundationMediaResp.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';

import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';

import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';

class MerckFoundationMedia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MerckFoundationMediaState();
  }
}

class MerckFoundationMediaState extends State<MerckFoundationMedia> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  void initState() {
    // TODO: implement initState
    getmerckfoundationmediaData();
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
          title: "Merck Foundation in Media",
          titleImg: "assets/newImages/newsarticle_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        body: GlobalLists.merckinMediaList.length <= 0
            ? Container(
                child: Center(child: Text(Constantstring.emptyData)),
              )
            :  ListView(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    children: [
                      ListView.builder(
                        itemCount: GlobalLists.merckinMediaList.length,
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
                                                .merckinMediaList[index].image,
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
                                                .merckinMediaList[index].title,
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
                 
                
              );
  }

 

  getmerckfoundationmediaData() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.merckfoundationinmedia,
        (response) async {
          MerckinMediaResponse resp = response;
          print(resp);

          Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.merckinMediaList = resp.data.list;
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

import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videofilter.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videolibray.dart';
import 'package:merckfoundation22dec/model/FilterdataResponse.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';

import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';

class AppDrawerfilter extends StatefulWidget {
  final int index;

  const AppDrawerfilter({Key key, this.index}) : super(key: key);
  @override
  _AppDrawerfilterState createState() => _AppDrawerfilterState();
}

class _AppDrawerfilterState extends State<AppDrawerfilter> {
  bool iscountryexpanded = false;
  List option = ["option1", "option2", "option3"];
  var countryController = TextEditingController();
  bool isvideocategoryexpanded = false;
  var videocategoryController = TextEditingController();
  bool isyearexpanded = false;
  var yearController = TextEditingController();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  String countryid = "";
  String catid = "";
  String title = "";
  bool isfilterLoaded = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Drawer(
      //  ScaffoldState().openDrawer() ,

      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: widget.index == 1
                    ? ListView(
                        padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
                        shrinkWrap: true,
                        children: [
                          Text("Country"),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 80,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  print("in state");
                                  iscountryexpanded = !iscountryexpanded;
                                });
                              },
                              child: TextField(
                                enabled: false,
                                controller: countryController,
                                decoration: InputDecoration(
                                    // contentPadding:
                                    //     EdgeInsets.fromLTRB(20.0, 5, 20.0, 5),
                                    hintText: "Select Country",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    suffixIcon: Icon(Icons.arrow_drop_down)),
                              ),
                            ),
                          ),
                          iscountryexpanded == true
                              ? coutryDropdown()
                              : Container(),
                          SizedBox(
                            height: 15,
                          ),
                          Text("Video Categories"),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 80,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  print("in state");
                                  isvideocategoryexpanded =
                                      !isvideocategoryexpanded;
                                });
                              },
                              child: TextField(
                                enabled: false,
                                controller: videocategoryController,
                                decoration: InputDecoration(
                                    // contentPadding:
                                    //     EdgeInsets.fromLTRB(20.0, 5, 20.0, 5),
                                    hintText: "Select video category",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    suffixIcon: Icon(Icons.arrow_drop_down)),
                              ),
                            ),
                          ),
                          isvideocategoryexpanded == true
                              ? videocategoriesDropdown()
                              : Container(),
                          SizedBox(
                            height: 15,
                          ),
                          // Text("Year"),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // Container(
                          //   height: 40,
                          //   child: GestureDetector(
                          //     onTap: () {
                          //       setState(() {
                          //         print("in state");
                          //         isyearexpanded = !isyearexpanded;
                          //       });
                          //     },
                          //     child: TextField(
                          //       enabled: false,
                          //       controller: videocategoryController,
                          //       decoration: InputDecoration(
                          //           // contentPadding:
                          //           //     EdgeInsets.fromLTRB(20.0, 5, 20.0, 5),
                          //           hintText: "Select Year",
                          //           border: OutlineInputBorder(
                          //               borderRadius: BorderRadius.circular(5.0)),
                          //           suffixIcon: Icon(Icons.arrow_drop_down)),
                          //     ),
                          //   ),
                          // ),
                          // isyearexpanded == true ? yearDropdown() : Container(),
                        ],
                      )
                    : widget.index == 2
                        ? ListView(
                            padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
                            shrinkWrap: true,
                            children: [
                              Text("Country"),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 80,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      print("in state");
                                      iscountryexpanded = !iscountryexpanded;
                                    });
                                  },
                                  child: TextField(
                                    enabled: false,
                                    controller: countryController,
                                    decoration: InputDecoration(
                                        // contentPadding:
                                        //     EdgeInsets.fromLTRB(20.0, 5, 20.0, 5),
                                        hintText: "Select Country",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        suffixIcon:
                                            Icon(Icons.arrow_drop_down)),
                                  ),
                                ),
                              ),
                              iscountryexpanded == true
                                  ? coutryDropdown()
                                  : Container(),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          )
                        : widget.index == 3
                            ? ListView(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 60, 20, 0),
                                shrinkWrap: true,
                                children: [
                                  Text("Video Categories"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 80,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          print("in state");
                                          isvideocategoryexpanded =
                                              !isvideocategoryexpanded;
                                        });
                                      },
                                      child: TextField(
                                        enabled: false,
                                        controller: videocategoryController,
                                        style: TextStyle(fontSize: 14),
                                        //keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                            // contentPadding:
                                            //     EdgeInsets.fromLTRB(20.0, 5, 20.0, 5),

                                            hintText: "Select video category",
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0)),
                                            suffixIcon:
                                                Icon(Icons.arrow_drop_down)),
                                      ),
                                    ),
                                  ),
                                  isvideocategoryexpanded == true
                                      ? videocategoriesDropdown()
                                      : Container(),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              )
                            : Container()),
            Visibility(
              visible: isfilterLoaded,
              replacement: Center(child: CircularProgressIndicator()),
              child: Container(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(bottom: 10, left: 15),
                height: 60,
                child: GestureDetector(
                  onTap: () {
                    if (widget.index == 1) {
                      //for video library
                      title = "Video Library";
                      getfilterdata("2", countryid, catid);
                    } else if (widget.index == 2) {
                      //for stories
                      title = "Our Stories";
                      getfilterdata("1", countryid, catid);
                    } else if (widget.index == 3) {
                      //for alumina
                      title = "Merck Foundation Alumini's Testimonial";
                      getfilterdata("3", countryid, catid);
                    }
                  },
                  child: Container(
                    width: 110,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Customcolor.text_darkblue,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "Apply",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }

  Widget coutryDropdown() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Card(
        elevation: 5,
        child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ListView.builder(
                itemCount: GlobalLists.countrylisting.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            countryController.text =
                                GlobalLists.countrylisting[index].countryName;
                            countryid =
                                GlobalLists.countrylisting[index].countryId;
                            iscountryexpanded = false;
                          });
                        },
                        child: Container(
                          color: Colors.white,
                          width: SizeConfig.blockSizeHorizontal * 100,
                          child: Text(
                            GlobalLists.countrylisting[index].countryName,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Divider(
                        color: Customcolor.colorGrey,
                      )
                    ],
                  );
                })),
      ),
    );
  }

  Widget videocategoriesDropdown() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Card(
        elevation: 5,
        child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ListView.builder(
                itemCount: GlobalLists.categorylisting.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            videocategoryController.text =
                                GlobalLists.categorylisting[index].categoryName;
                            catid = GlobalLists.categorylisting[index].id;
                            isvideocategoryexpanded = false;
                          });
                        },
                        child: Container(
                          color: Colors.white,
                          width: SizeConfig.blockSizeHorizontal * 100,
                          child: Text(
                            GlobalLists.categorylisting[index].categoryName,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        color: Customcolor.colorGrey,
                      )
                    ],
                  );
                })),
      ),
    );
  }

  Widget yearDropdown() {
    return Container(
      height: 130,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Card(
        elevation: 5,
        child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ListView.builder(
                itemCount: option.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            yearController.text = option[index];
                            isyearexpanded = false;
                          });
                        },
                        child: Container(
                          color: Colors.white,
                          child: Text(
                            option[index],
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Customcolor.colorGrey,
                      )
                    ],
                  );
                })),
      ),
    );
  }

  getfilterdata(String pagename, String countryid, String catid) async {
    var status1 = await ConnectionDetector.checkInternetConnection();
    // var fcm_token = SPManager().getAuthToken();
    var json;
    if (status1) {
      setState(() {
        isfilterLoaded = false;
      });

      //  ShowDialogs.showLoadingDialog(context, _keyLoader);
      if (pagename == "1") {
        json = {
          'page_name': pagename,
          'country_id': countryid,
        };
      } else if (pagename == "2") {
        json = {
          'page_name': pagename,
          'country_id': countryid,
          "catg_id": catid
        };
      } else if (pagename == "3") {
        json = {'page_name': pagename, "catg_id": catid};
      }
      print("filter");
      print(json);
      APIManager().apiRequest(context, API.filterlist, (response) async {
        FilterdataResponse resp = response;
        print(response);
        print('Resp : $resp');

        isfilterLoaded = true;
        //   Navigator.of(_keyLoader.currentContext).pop();
        if (resp.success == "True") {
          setState(() {
            //  ShowDialogs.showToast(resp.msg);
            GlobalLists.filterdatalisting = resp.data.list;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Videofilter(
                          apptitle: title,
                        )));
          });
        } else {
          ShowDialogs.showToast(resp.msg);
          setState(() {
            isfilterLoaded = true;
          });
        }
      }, (error) {
        print('ERR msg is $error');
        ShowDialogs.showToast("Server Not Responding");
        setState(() {
          isfilterLoaded = true;
        });
        //  Navigator.of(_keyLoader.currentContext).pop();
      }, jsonval: json);
    } else {
      isfilterLoaded = true;
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

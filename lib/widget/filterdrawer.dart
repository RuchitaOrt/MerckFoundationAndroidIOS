// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/WatchDigitalLibrary.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videofilter.dart';

import 'package:merckfoundation22dec/model/CountrylistResponse.dart';
import 'package:merckfoundation22dec/model/DigLibCatFilterResponse.dart' as dg;
import 'package:merckfoundation22dec/model/FilterdataResponse.dart';
import 'package:merckfoundation22dec/model/GetLanguageResponse.dart' as lang;
import 'package:merckfoundation22dec/model/Get_Filter_DLResponse.dart';
import 'package:merckfoundation22dec/screens/WatchDigitalLibraryfilter.dart';
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
  String langid = "";
  bool isfilterLoaded = true;

  bool isdigitalcategoryexpanded = false;
  var digitalcategoryController = TextEditingController();

  bool islanexpanded = false;
  var languageController = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.index == 4) {
      if (GlobalLists.digitalcategory == "" ||
          digitalcategoryController.text == "ALL") {
        digitalcategoryController.text = "ALL";
        getlanguagelist();
      } else {
        digitalcategoryController.text = GlobalLists.digitalcategory;
        catid = GlobalLists.digitalcategoryid;
      }
      if (GlobalLists.digitallanguage == "" ||
          languageController.text == "ALL") {
        languageController.text = "ALL";
        // getlanguagelist();
      } else {
        languageController.text = GlobalLists.digitallanguage;
        langid = GlobalLists.digitallanguageid;
      }
      // languageController.text=GlobalLists.digitallanguage;
      //for digital
      getdigitalcatlist();
    }
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
                            : widget.index == 4
                                ? ListView(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 60, 20, 0),
                                    shrinkWrap: true,
                                    children: [
                                      Text("Categories"),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 80,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              print("in state");
                                              isdigitalcategoryexpanded =
                                                  !isdigitalcategoryexpanded;
                                            });
                                          },
                                          child: TextField(
                                            enabled: false,
                                            controller:
                                                digitalcategoryController,
                                            decoration: InputDecoration(
                                                // contentPadding:
                                                //     EdgeInsets.fromLTRB(20.0, 5, 20.0, 5),
                                                hintText: "Select category",
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                suffixIcon: Icon(
                                                    Icons.arrow_drop_down)),
                                          ),
                                        ),
                                      ),
                                      isdigitalcategoryexpanded == true
                                          ? digitalcategoriesDropdown()
                                          : Container(),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text("Language"),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        // height: 80,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              print("in state");
                                              islanexpanded = !islanexpanded;
                                            });
                                          },
                                          child: TextField(
                                            enabled: false,
                                            controller: languageController,
                                            decoration: InputDecoration(
                                                // contentPadding:
                                                //     EdgeInsets.fromLTRB(20.0, 5, 20.0, 5),
                                                hintText: "Select Language",
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                suffixIcon: Icon(
                                                    Icons.arrow_drop_down)),
                                          ),
                                        ),
                                      ),
                                      islanexpanded == true
                                          ? languageDropdown()
                                          : Container(),
                                      // SizedBox(
                                      //   height: 15,
                                      // ),
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
                    } else if (widget.index == 4) {
                      if (digitalcategoryController.text == "ALL" &&
                          languageController.text == "ALL") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    WatchDigitalLibrary(
                                      apiurl: API.digitalhome,
                                      digitallink:
                                          Constantstring.sharedigitalhome,
                                    )));
                      } else if (digitalcategoryController.text == "ALL") {
                        getfilterdigitallist(catid, "3");
                      } else {
                        getfilterdigitallist(catid, "1");
                      }
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

  Widget languageDropdown() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            padding: EdgeInsets.all(0),
            // shrinkWrap: true,
            // physics: ScrollPhysics(),
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    islanexpanded = false;

                    GlobalLists.digitallanguage = "ALL";
                    languageController.text = "ALL";

                    langid = "";
                    GlobalLists.digitallanguageid = "";

                    getdigitalcatlist();
                  });
                },
                child: Container(
                  color: Colors.white,
                  width: SizeConfig.blockSizeHorizontal * 100,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10), // Added padding to maintain spacing
                    child: Text(
                      "ALL",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              Divider(),
              ListView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                physics:
                    NeverScrollableScrollPhysics(), // Prevents scrolling within the list
                itemCount: GlobalLists.filterlanglisting.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            languageController.text =
                                GlobalLists.filterlanglisting[index].language;
                            GlobalLists.digitallanguage =
                                GlobalLists.filterlanglisting[index].language;
                            langid = GlobalLists.filterlanglisting[index].id;
                            GlobalLists.digitallanguageid =
                                GlobalLists.filterlanglisting[index].id;
                            islanexpanded = false;
                            print("languageid");
                            print(langid);

                            print("coni1");
                            getfilterdigitallist(catid, "4");
                          });
                        },
                        child: Container(
                          color: Colors.white,
                          width: SizeConfig.blockSizeHorizontal * 100,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    0), // Added padding to maintain spacing
                            child: Text(
                              GlobalLists.filterlanglisting[index].language,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Customcolor.colorGrey,
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
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
                            countryController.text = "";
                            getcountrylist(catid);
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

  Widget digitalcategoriesDropdown() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Card(
        elevation: 5,
        child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ListView(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                GestureDetector(
                  onTap: () {
                    digitalcategoryController.text = "ALL";
                    //catid = GlobalLists.filterdigitalcatlisting[index].id;
                    catid = "";
                    isdigitalcategoryexpanded = false;
                    languageController.text = "";
                    GlobalLists.digitallanguage = "";
                    GlobalLists.digitallanguageid = "";
                    GlobalLists.digitalcategory = "ALL";
                    GlobalLists.digitalcategoryid = "";
                    getlanguagelist();
                  },
                  child: Container(
                    color: Colors.white,
                    //height: 20,
                    width: SizeConfig.blockSizeHorizontal * 100,
                    child: Text(
                      "ALL",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Divider(),
                ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: GlobalLists.filterdigitalcatlisting.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                digitalcategoryController.text = GlobalLists
                                    .filterdigitalcatlisting[index]
                                    .categoryName;
                                catid = GlobalLists
                                    .filterdigitalcatlisting[index].id;
                                isdigitalcategoryexpanded = false;
                                languageController.text = "";
                                GlobalLists.digitallanguage = "";
                                GlobalLists.digitallanguageid = "";
                                GlobalLists.digitalcategory = GlobalLists
                                    .filterdigitalcatlisting[index]
                                    .categoryName;
                                GlobalLists.digitalcategoryid = GlobalLists
                                    .filterdigitalcatlisting[index].id
                                    .toString();
                                getfilterdigitallist(catid, "2");
                              });
                            },
                            child: Container(
                              color: Colors.white,
                              width: SizeConfig.blockSizeHorizontal * 100,
                              child: Text(
                                GlobalLists.filterdigitalcatlisting[index]
                                    .categoryName,
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
                    }),
              ],
            )),
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
                padding: EdgeInsets.all(0),
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
                          filterindex: widget.index,
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

  getcountrylist(String catid) async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      // ShowDialogs.showLoadingDialog(context, _keyLoader);
      GlobalLists.countrylisting.clear();
      var json = {
        'video_category_id': catid,
      };
      print("catid");
      print(catid);
      APIManager().apiRequest(
        context,
        API.getCategoryWiseCountryList,
        (response) async {
          CountrylistResponse resp = response;
          print(response);
          print('Resp : $resp');

          //  Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.countrylisting = resp.data.list;
            });
          } else {
            ShowDialogs.showToast(resp.msg);
          }
        },
        (error) {
          print('ERR msg is $error');
          // Navigator.of(_keyLoader.currentContext).pop();
        },
        jsonval: json,
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }

  getlanguagelist() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      // ShowDialogs.showLoadingDialog(context, _keyLoader);
      GlobalLists.filterlanglisting.clear();

      APIManager().apiRequest(
        context,
        API.getLanguageList,
        (response) async {
          lang.GetLanguageResponse resp = response;
          print(response);
          print('Resp : $resp');

          //  Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.filterlanglisting = resp.data.list;
              //  languageController.text =
              //                   GlobalLists.filterlanglisting[0].language;
              //               langid =
              //                   GlobalLists.filterlanglisting[0].id;
            });
          } else {
            ShowDialogs.showToast(resp.msg);
          }
        },
        (error) {
          print('ERR msg is $error');
          // Navigator.of(_keyLoader.currentContext).pop();
        },
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }

  getdigitalcatlist() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      // ShowDialogs.showLoadingDialog(context, _keyLoader);
      GlobalLists.filterdigitalcatlisting.clear();

      APIManager().apiRequest(
        context,
        API.getTblCategoryList,
        (response) async {
          dg.DigLibCatFilterResponse resp = response;
          print(response);
          print('Resp : $resp');

          //  Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.filterdigitalcatlisting = resp.data.list;
            });
          } else {
            ShowDialogs.showToast(resp.msg);
          }
        },
        (error) {
          print('ERR msg is $error');
          // Navigator.of(_keyLoader.currentContext).pop();
        },
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }

  getfilterdigitallist(String catid, String comingfrom) async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      // ShowDialogs.showLoadingDialog(context, _keyLoader);
      GlobalLists.countrylisting.clear();
      var json = {
        'catg_id': catid,
        'language_id': comingfrom == "2" ? "" : langid,
      };
      print("catid");
      print(json);
      APIManager().apiRequest(
        context,
        API.get_digital_library,
        (response) async {
          GetFilterDlResponse resp = response;
          print(response);
          print('Resp : $resp');

          //  Navigator.of(_keyLoader.currentContext).pop();

          //if (resp.status == true) {
          setState(() {
            GlobalLists.filterdigitallibrarylist = resp.digitalLibraryList;
            print("lengthresponse");
            print(GlobalLists.filterdigitallibrarylist.length);
            //Navigator.pop(context);
            if (resp.categoryList.length > 0) {
              GlobalLists.filterdigitalcatlisting.clear();
              resp.categoryList.forEach((element) {
                GlobalLists.filterdigitalcatlisting.add(dg.ListElement(
                    categoryName: element.categoryName,
                    catgSlug: element.catgSlug,
                    createdAt: element.createdAt,
                    createdBy: element.createdBy,
                    id: element.id,
                    status: element.status,
                    modifiedBy: element.modifiedBy,
                    updatedAt: element.updatedAt));
              });
//               for(int i=0;i<resp.categoryList.length;i++)
//               {
//  GlobalLists.filterdigitalcatlisting.add(dg.ListElement(categoryName: resp.categoryList[i].categoryName,
//  catgSlug: resp.categoryList[i].catgSlug,
//  createdAt: resp.categoryList[i].createdAt,
//  createdBy: resp.categoryList[i].createdBy,
//  id: resp.categoryList[i].id,
//  status: resp.categoryList[i].status,
//  modifiedBy: resp.categoryList[i].modifiedBy,
//  updatedAt: resp.categoryList[i].updatedAt));
//               }
            }
            if (comingfrom == "1" || comingfrom == "3") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          WatchDigitalLibraryfilter()));
            } else if (comingfrom == "2") {
              GlobalLists.filterlanglisting.clear();
              languageController.text = "";
              langid = "";
              resp.languageList.forEach((element) {
                GlobalLists.filterlanglisting.add(lang.ListElement(
                    id: element.id,
                    language: element.language,
                    abbr: element.abbr,
                    createdAt: element.createdAt,
                    updatedAt: element.updatedAt));
              });
            }
          });
          // } else {
          //   ShowDialogs.showToast(resp.message);
          // }
        },
        (error) {
          print('ERR msg is $error');
          // Navigator.of(_keyLoader.currentContext).pop();
        },
        jsonval: json,
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:merckfoundation22dec/mediascreen.dart/videofilter.dart';
// import 'package:merckfoundation22dec/mediascreen.dart/videolibray.dart';
// import 'package:merckfoundation22dec/model/CountrylistResponse.dart';
// import 'package:merckfoundation22dec/model/FilterdataResponse.dart';
// import 'package:merckfoundation22dec/utility/APIManager.dart';
// import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';

// import 'package:merckfoundation22dec/widget/customcolor.dart';
// import 'package:merckfoundation22dec/utility/GlobalLists.dart';
// import 'package:merckfoundation22dec/widget/showdailog.dart';
// import 'package:merckfoundation22dec/widget/sizeConfig.dart';

// class AppDrawerfilter extends StatefulWidget {
//   final int index;

//   const AppDrawerfilter({Key key, this.index}) : super(key: key);
//   @override
//   _AppDrawerfilterState createState() => _AppDrawerfilterState();
// }

// class _AppDrawerfilterState extends State<AppDrawerfilter> {
//   bool iscountryexpanded = false;
//   List option = ["option1", "option2", "option3"];
//   var countryController = TextEditingController();
//   bool isvideocategoryexpanded = false;
//   var videocategoryController = TextEditingController();
//   bool isyearexpanded = false;
//   var yearController = TextEditingController();
//   final GlobalKey<State> _keyLoader = new GlobalKey<State>();
//   String countryid = "";
//   String catid = "";
//   String title = "";
//   bool isfilterLoaded = true;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Drawer(
//       //  ScaffoldState().openDrawer() ,

//       child: Container(
//         color: Colors.white,
//         child: Stack(
//           children: [
//             Padding(
//                 padding: const EdgeInsets.only(bottom: 0),
//                 child: widget.index == 1
//                     ? ListView(
//                         padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
//                         shrinkWrap: true,
//                         children: [
//                           Text("Video Categories"),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Container(
//                             height: 80,
//                             child: GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   print("in state");
//                                   isvideocategoryexpanded =
//                                       !isvideocategoryexpanded;
//                                 });
//                               },
//                               child: TextField(
//                                 enabled: false,
//                                 controller: videocategoryController,
//                                 decoration: InputDecoration(
//                                     // contentPadding:
//                                     //     EdgeInsets.fromLTRB(20.0, 5, 20.0, 5),
//                                     hintText: "Select video category",
//                                     border: OutlineInputBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(5.0)),
//                                     suffixIcon: Icon(Icons.arrow_drop_down)),
//                               ),
//                             ),
//                           ),
//                           isvideocategoryexpanded == true
//                               ? videocategoriesDropdown()
//                               : Container(),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Text("Country"),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Container(
//                             height: 80,
//                             child: GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   print("in state");
//                                   iscountryexpanded = !iscountryexpanded;
//                                 });
//                               },
//                               child: TextField(
//                                 enabled: false,
//                                 controller: countryController,
//                                 decoration: InputDecoration(
//                                     // contentPadding:
//                                     //     EdgeInsets.fromLTRB(20.0, 5, 20.0, 5),
//                                     hintText: "Select Country",
//                                     border: OutlineInputBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(5.0)),
//                                     suffixIcon: Icon(Icons.arrow_drop_down)),
//                               ),
//                             ),
//                           ),
//                           iscountryexpanded == true
//                               ? coutryDropdown()
//                               : Container(),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           // Text("Year"),
//                           // SizedBox(
//                           //   height: 10,
//                           // ),
//                           // Container(
//                           //   height: 40,
//                           //   child: GestureDetector(
//                           //     onTap: () {
//                           //       setState(() {
//                           //         print("in state");
//                           //         isyearexpanded = !isyearexpanded;
//                           //       });
//                           //     },
//                           //     child: TextField(
//                           //       enabled: false,
//                           //       controller: videocategoryController,
//                           //       decoration: InputDecoration(
//                           //           // contentPadding:
//                           //           //     EdgeInsets.fromLTRB(20.0, 5, 20.0, 5),
//                           //           hintText: "Select Year",
//                           //           border: OutlineInputBorder(
//                           //               borderRadius: BorderRadius.circular(5.0)),
//                           //           suffixIcon: Icon(Icons.arrow_drop_down)),
//                           //     ),
//                           //   ),
//                           // ),
//                           // isyearexpanded == true ? yearDropdown() : Container(),
//                         ],
//                       )
//                     : widget.index == 2
//                         ? ListView(
//                             padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
//                             shrinkWrap: true,
//                             children: [
//                               Text("Country"),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Container(
//                                 height: 80,
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       print("in state");
//                                       iscountryexpanded = !iscountryexpanded;
//                                     });
//                                   },
//                                   child: TextField(
//                                     enabled: false,
//                                     controller: countryController,
//                                     decoration: InputDecoration(
//                                         // contentPadding:
//                                         //     EdgeInsets.fromLTRB(20.0, 5, 20.0, 5),
//                                         hintText: "Select Country",
//                                         border: OutlineInputBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(5.0)),
//                                         suffixIcon:
//                                             Icon(Icons.arrow_drop_down)),
//                                   ),
//                                 ),
//                               ),
//                               iscountryexpanded == true
//                                   ? coutryDropdown()
//                                   : Container(),
//                               SizedBox(
//                                 height: 15,
//                               ),
//                             ],
//                           )
//                         : widget.index == 3
//                             ? ListView(
//                                 padding:
//                                     const EdgeInsets.fromLTRB(20, 60, 20, 0),
//                                 shrinkWrap: true,
//                                 children: [
//                                   Text("Video Categories"),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Container(
//                                     height: 80,
//                                     child: GestureDetector(
//                                       onTap: () {
//                                         setState(() {
//                                           print("in state");
//                                           isvideocategoryexpanded =
//                                               !isvideocategoryexpanded;
//                                         });
//                                       },
//                                       child: TextField(
//                                         enabled: false,
//                                         controller: videocategoryController,
//                                         style: TextStyle(fontSize: 14),
//                                         //keyboardType: TextInputType.multiline,
//                                         decoration: InputDecoration(
//                                             // contentPadding:
//                                             //     EdgeInsets.fromLTRB(20.0, 5, 20.0, 5),

//                                             hintText: "Select video category",
//                                             border: OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(5.0)),
//                                             suffixIcon:
//                                                 Icon(Icons.arrow_drop_down)),
//                                       ),
//                                     ),
//                                   ),
//                                   isvideocategoryexpanded == true
//                                       ? videocategoriesDropdown()
//                                       : Container(),
//                                   SizedBox(
//                                     height: 15,
//                                   ),
//                                 ],
//                               )
//                             : Container()),
//             Visibility(
//               visible: isfilterLoaded,
//               replacement: Center(child: CircularProgressIndicator()),
//               child: Container(),
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 padding: EdgeInsets.only(bottom: 10, left: 15),
//                 height: 60,
//                 child: GestureDetector(
//                   onTap: () {
//                     if (widget.index == 1) {
//                       //for video library
//                       title = "Video Library";
//                       getfilterdata("2", countryid, catid);
//                     } else if (widget.index == 2) {
//                       //for stories
//                       title = "Our Stories";
//                       getfilterdata("1", countryid, catid);
//                     } else if (widget.index == 3) {
//                       //for alumina
//                       title = "Merck Foundation Alumini's Testimonial";
//                       getfilterdata("3", countryid, catid);
//                     }
//                   },
//                   child: Container(
//                     width: 110,
//                     height: 40,
//                     decoration: BoxDecoration(
//                         color: Customcolor.text_darkblue,
//                         borderRadius: BorderRadius.circular(5)),
//                     child: Center(
//                       child: Text(
//                         "Apply",
//                         style: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       // ),
//     );
//   }

//   Widget coutryDropdown() {
//     return Container(
//       height: 200,
//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(10)),
//       child: Card(
//         elevation: 5,
//         child: Padding(
//             padding: EdgeInsets.only(left: 10, right: 10),
//             child: ListView.builder(
//                 itemCount: GlobalLists.countrylisting.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Column(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             countryController.text =
//                                 GlobalLists.countrylisting[index].countryName;
//                             countryid =
//                                 GlobalLists.countrylisting[index].countryId;
//                             iscountryexpanded = false;
//                           });
//                         },
//                         child: Container(
//                           color: Colors.white,
//                           width: SizeConfig.blockSizeHorizontal * 100,
//                           child: Text(
//                             GlobalLists.countrylisting[index].countryName,
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       // SizedBox(
//                       //   height: 10,
//                       // ),
//                       Divider(
//                         color: Customcolor.colorGrey,
//                       )
//                     ],
//                   );
//                 })),
//       ),
//     );
//   }

//   Widget videocategoriesDropdown() {
//     return Container(
//       height: 200,
//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(10)),
//       child: Card(
//         elevation: 5,
//         child: Padding(
//             padding: EdgeInsets.only(left: 10, right: 10),
//             child: ListView.builder(
//                 itemCount: GlobalLists.categorylisting.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Column(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             videocategoryController.text =
//                                 GlobalLists.categorylisting[index].categoryName;
//                             catid = GlobalLists.categorylisting[index].id;
//                             isvideocategoryexpanded = false;
//                             countryController.text = "";
//                             getcountrylist(catid);
//                           });
//                         },
//                         child: Container(
//                           color: Colors.white,
//                           width: SizeConfig.blockSizeHorizontal * 100,
//                           child: Text(
//                             GlobalLists.categorylisting[index].categoryName,
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Divider(
//                         color: Customcolor.colorGrey,
//                       )
//                     ],
//                   );
//                 })),
//       ),
//     );
//   }

//   Widget yearDropdown() {
//     return Container(
//       height: 130,
//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(10)),
//       child: Card(
//         elevation: 5,
//         child: Padding(
//             padding: EdgeInsets.only(left: 10, right: 10),
//             child: ListView.builder(
//                 itemCount: option.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Column(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             yearController.text = option[index];
//                             isyearexpanded = false;
//                           });
//                         },
//                         child: Container(
//                           color: Colors.white,
//                           child: Text(
//                             option[index],
//                             style: TextStyle(
//                               color: Colors.black54,
//                               fontSize: 20,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Divider(
//                         color: Customcolor.colorGrey,
//                       )
//                     ],
//                   );
//                 })),
//       ),
//     );
//   }

//   getfilterdata(String pagename, String countryid, String catid) async {
//     var status1 = await ConnectionDetector.checkInternetConnection();
//     // var fcm_token = SPManager().getAuthToken();
//     var json;
//     if (status1) {
//       setState(() {
//         isfilterLoaded = false;
//       });

//       //  ShowDialogs.showLoadingDialog(context, _keyLoader);
//       if (pagename == "1") {
//         json = {
//           'page_name': pagename,
//           'country_id': countryid,
//         };
//       } else if (pagename == "2") {
//         json = {
//           'page_name': pagename,
//           'country_id': countryid,
//           "catg_id": catid
//         };
//       } else if (pagename == "3") {
//         json = {'page_name': pagename, "catg_id": catid};
//       }
//       print("filter");
//       print(json);
//       APIManager().apiRequest(context, API.filterlist, (response) async {
//         FilterdataResponse resp = response;
//         print(response);
//         print('Resp : $resp');

//         isfilterLoaded = true;
//         //   Navigator.of(_keyLoader.currentContext).pop();
//         if (resp.success == "True") {
//           setState(() {
//             //  ShowDialogs.showToast(resp.msg);
//             GlobalLists.filterdatalisting = resp.data.list;
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (BuildContext context) => Videofilter(
//                           apptitle: title,
//                           filterindex: widget.index,
//                         )));
//           });
//         } else {
//           ShowDialogs.showToast(resp.msg);
//           setState(() {
//             isfilterLoaded = true;
//           });
//         }
//       }, (error) {
//         print('ERR msg is $error');
//         ShowDialogs.showToast("Server Not Responding");
//         setState(() {
//           isfilterLoaded = true;
//         });
//         //  Navigator.of(_keyLoader.currentContext).pop();
//       }, jsonval: json);
//     } else {
//       isfilterLoaded = true;
//       ShowDialogs.showToast("Please check internet connection");
//     }
//   }

//   getcountrylist(String catid) async {
//     var status1 = await ConnectionDetector.checkInternetConnection();

//     if (status1) {
//       // ShowDialogs.showLoadingDialog(context, _keyLoader);
//       GlobalLists.countrylisting.clear();
//       var json = {
//         'video_category_id': catid,
//       };
//       print("catid");
//       print(catid);
//       APIManager().apiRequest(
//         context,
//         API.getCategoryWiseCountryList,
//         (response) async {
//           CountrylistResponse resp = response;
//           print(response);
//           print('Resp : $resp');

//           //  Navigator.of(_keyLoader.currentContext).pop();

//           if (resp.success == "True") {
//             setState(() {
//               GlobalLists.countrylisting = resp.data.list;
//             });
//           } else {
//             ShowDialogs.showToast(resp.msg);
//           }
//         },
//         (error) {
//           print('ERR msg is $error');
//           // Navigator.of(_keyLoader.currentContext).pop();
//         },
//         jsonval: json,
//       );
//     } else {
//       ShowDialogs.showToast("Please check internet connection");
//     }
//   }
// }

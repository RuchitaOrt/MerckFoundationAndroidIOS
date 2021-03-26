import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/searchscreen/search.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class Searchcategory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchcategoryState();
  }
}

class SearchcategoryState extends State<Searchcategory>
    with TickerProviderStateMixin {
  AnimationController _controller;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  bool isexpanded = false;
  List searchcategorylist = [
    "Video",
    "News_Release",
    "Articles",
    "Ceo_Message",
    "Events",
    "Photo",
    "Media",
    "Testimonials",
    "Awards"
  ];
  TextEditingController categoryController = new TextEditingController();
  TextEditingController keywordController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
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
          title: "Search",
          titleImg: "assets/newImages/vision_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: ListView(
          shrinkWrap: true,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Container(
                height: 80,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      print("in state");
                      isexpanded = !isexpanded;
                    });
                  },
                  child: TextField(
                    enabled: false,
                    controller: categoryController,
                    decoration: InputDecoration(
                        // contentPadding:
                        //     EdgeInsets.fromLTRB(20.0, 5, 20.0, 5),
                        hintText: "Select Category",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        suffixIcon: Icon(Icons.arrow_drop_down)),
                  ),
                ),
              ),
            ),
            isexpanded == true ? categoryDropdown() : Container(),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: TextField(
                enabled: true,
                controller: keywordController,
                decoration: InputDecoration(
                  // contentPadding:
                  //     EdgeInsets.fromLTRB(20.0, 5, 20.0, 5),
                  hintText: "Enter Keyword",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(bottom: 10, left: 15, top: 10),
                height: 60,
                child: GestureDetector(
                  onTap: () {
                    search();
                  },
                  child: Container(
                    width: 110,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Customcolor.text_darkblue,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "Search",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget categoryDropdown() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Card(
          elevation: 5,
          child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: ListView.builder(
                  itemCount: searchcategorylist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              categoryController.text =
                                  searchcategorylist[index];

                              isexpanded = false;
                            });
                          },
                          child: Container(
                            color: Colors.white,
                            width: SizeConfig.blockSizeHorizontal * 100,
                            child: Text(
                              searchcategorylist[index],
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
      ),
    );
  }

  Future<String> search() async {
    var status = await ConnectionDetector.checkInternetConnection();

    if (status) {
      dynamic bodyData = {
        'search': keywordController.text,
        'search_type': categoryController.text
      };

      // String body = json.encode(bodyData);
      print(bodyData);
      var response = await fetchPostWithBodyResponse(
        APIManager.searchapi,
        bodyData,
      );

      var res = json.decode(response.body);
      print("res");
      print(res);
      //1-video 2-News_Release 3-Article 4-Events 5-Testimonials 6-Photo  7-Media 8-ceomeaasage 9-award
      if (response.statusCode == 200) {
        if (res['success'] == "True") {
          if (categoryController.text == "Video") {
            setState(() {
              GlobalLists.searchvideollisting = res['data']['list'];

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Search(
                            categorytype: 1,
                          )));
            });
          } else if (categoryController.text == "News_Release") {
            // SearchnewreleasecategoryResponse resp = res;
            setState(() {
              Constantstring.baseUrl = res['base_url'];
              GlobalLists.searchnewreleaselisting = res['data']['list'];
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Search(
                            categorytype: 2,
                          )));
            });
          } else if (categoryController.text == "Articles") {
            // SearchnewreleasecategoryResponse resp = res;
            setState(() {
              Constantstring.baseUrl = res['base_url'];
              GlobalLists.searcharticlelisting = res['data']['list'];
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Search(
                            categorytype: 3,
                          )));
            });
          } else if (categoryController.text == "Events") {
            // SearchnewreleasecategoryResponse resp = res;
            setState(() {
              Constantstring.baseUrl = res['base_url'];
              GlobalLists.searcheventslisting = res['data']['list'];
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Search(
                            categorytype: 4,
                          )));
            });
          } else if (categoryController.text == "Testimonials") {
            // SearchnewreleasecategoryResponse resp = res;
            setState(() {
              Constantstring.baseUrl = res['base_url'];
              GlobalLists.searchtestimoniallisting = res['data']['list'];
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Search(
                            categorytype: 5,
                          )));
            });
          } else if (categoryController.text == "Photo") {
            // SearchnewreleasecategoryResponse resp = res;
            setState(() {
              Constantstring.baseUrl = res['base_url'];
              GlobalLists.searchphotolisting = res['data']['list'];
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Search(
                            categorytype: 6,
                          )));
            });
          } else if (categoryController.text == "Media") {
            // SearchnewreleasecategoryResponse resp = res;
            setState(() {
              Constantstring.baseUrl = res['base_url'];
              GlobalLists.searchmedialisting = res['data']['list'];
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Search(
                            categorytype: 7,
                          )));
            });
          } else if (categoryController.text == "Ceo_Message") {
            // SearchnewreleasecategoryResponse resp = res;
            setState(() {
              Constantstring.baseUrl = res['base_url'];
              GlobalLists.searchceomeassagelisting = res['data']['list'];
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Search(
                            categorytype: 8,
                          )));
            });
          } else if (categoryController.text == "Awards") {
            // SearchnewreleasecategoryResponse resp = res;
            setState(() {
              Constantstring.baseUrl = res['base_url'];
              GlobalLists.searchawardlisting = res['data']['list'];
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Search(
                            categorytype: 9,
                          )));
            });
          }
        } else {
          setState(() {
            ShowDialogs.showToast(res['msg']);
          });
          //showErrorDialog(context, message: "Something went wrong!");
        }
      } else {
        ShowDialogs.showToast("Server Not Responding");
      }
    } else {
      setState(() {
        ShowDialogs.showToast("Please check Internet Connection.");
      });
    }
  }

  Future<http.Response> fetchPostWithBodyResponse(
      String url, dynamic body) async {
    IOClient ioClient = new IOClient();

    HttpClient client = new HttpClient();

    ioClient = new IOClient(client);
    final response = await ioClient.post(url, body: body);
    print('pit stop');
    return response;
  }
}

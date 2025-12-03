import 'dart:io';

import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/model/viewmoreMMTMResponse.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:merckfoundation22dec/utility/ResponsiveFlutter.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/model/GalleryProgram.dart';
import 'dart:convert';
import 'package:merckfoundation22dec/model/viewmoreMMTMResponse.dart'
    as viewmmtmrightsec;

// ignore: must_be_immutable
class ViewmoremmtmAmbassadar extends StatefulWidget {
  final dynamic apiurl;
  dynamic appBarTitle;
  final dynamic sharelink;

  ViewmoremmtmAmbassadar({Key? key, this.apiurl, this.sharelink})
      : super(key: key);
  @override
  _viewmoremmtmaState createState() => _viewmoremmtmaState();
}

class _viewmoremmtmaState extends State<ViewmoremmtmAmbassadar> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  ScrollController _sc = new ScrollController();
  List<Current> current = [];
  List<Current> currentformeer = [];
  late ViewmoremmtmResponse resp;
  int totalcount = 10;
  int page = 10;
  int offset = 0;
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    GlobalLists.viewmoremmtmlist.clear();
    getviewmoremmmt(widget.apiurl);

    ///  _sc = new ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    //   print("scroll");
    if (_sc.position.extentAfter < 50) {
      if (!_isLoading && totalcount > GlobalLists.viewmoremmtmlist.length) {
        // getNewsLetteranArticles();
        setState(() {
          _isLoading = true;
        });
        Future.delayed(const Duration(seconds: 2), () {
// Here you can write your code

          setState(() {
            // Here you can write your code for open new view
            _isLoading = false;
            if (resp.success == "True") {
              setState(() {
                print("here");
                // list = new List();
                // list = resp.data.list;
                //totalcount 10

                for (int i = offset; i < totalcount; i++) {
                  setState(() {
                    GlobalLists.viewmoremmtmlist.add(viewmmtmrightsec.Current(
                      id: current[i].id,
                      photo: current[i].photo,
                      photoCategoryId: current[i].photoCategoryId,
                      photoDescription: current[i].photoDescription,
                    ));
                  });

                  // GlobalLists.newsLettersList.add(resp.data.list);
                }

                offset = totalcount;
                int remem = current.length - totalcount;
                print("remem");
                print(remem);
                if (remem < 10) {
                  totalcount = totalcount + remem;
                } else {
                  totalcount = totalcount + 10;
                }
                // // GlobalLists.newsLettersList = resp.data.list;
                Constantstring.baseUrl = resp.baseUrl!;
                print("-----------------------------------");
                print(totalcount);
                //    print(GlobalLists.newsLettersList.length);
              });

              setState(() {
                _isLoading = false;
              });
            } else {
              ShowDialogs.showToast(resp.msg!);
              setState(() {
                _isLoading = false;
              });
            }
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InnerCustomAppBar(
        onTapval: () {
          Navigator.pop(context);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (BuildContext context) => Dashboard(
          //               index: 0,
          //             )));
        },
        index: 2,
        sharelink: widget.sharelink,
        title:
            'Merck Foundation "More Than a Mother" Ambassadors', //'Merck Foundation "More Than a Mother"',
        titleImg: "assets/newImages/news_logo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      backgroundColor: Customcolor.background,
      body: Stack(
        children: [
          ListView(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            controller: _sc,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                child: Text(
                  'Ambassadors of Merck Foundation "More Than a Mother" Movement',
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Customcolor.text_darkblue,
                      fontSize: ResponsiveFlutter.of(context).fontSize(2.6),
                      fontWeight: FontWeight.w500),
                  maxLines: 3,
                ),
              ),
              (current.length == 0 && _isLoading)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : (current.length == 0 && _isLoading == false)
                      ? Center(
                          child: Container(
                            child:
                                Center(child: Text(Constantstring.emptyData)),
                          ),
                        )
                      : ListView(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          children: [
                            GridView.count(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              padding: const EdgeInsets.all(5),
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 2,
                              crossAxisCount: 1, //2
                              childAspectRatio: 1.32, //0.85,
                              children: List.generate(current.length, (index) {
                                List<String> splits = current[index]
                                    .photoDescription!
                                    .split(current[index]
                                        .photoDescription!
                                        .substring(current[index]
                                            .photoDescription!
                                            .lastIndexOf(",")));
                                List<String> splitslast =
                                    current[index].photoDescription!.split(",");

                                return Padding(
                                  padding: const EdgeInsets.only(
                                      right: 70.0,
                                      left: 70,
                                      top: 10,
                                      bottom: 10),
                                  child: Card(
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(1),
                                        ),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          ShowDialogs.showImageDialog(
                                            context: context,
                                            image: Constantstring.baseUrl +
                                                current[index].photo!,
                                            description:
                                                current[index].photoDescription,
                                          );
                                        },
                                        child: Container(
                                          color: Colors.transparent,
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  50,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  // width:
                                                  //     SizeConfig.blockSizeHorizontal *
                                                  //         100,
                                                  // height: 150,
                                                  width: SizeConfig
                                                          .blockSizeHorizontal *
                                                      100,
                                                  height: SizeConfig
                                                          .blockSizeVertical *
                                                      22, // 16,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    // border: Border.all(
                                                    //   width: 1,
                                                    // ),
                                                    //change
                                                    image: new DecorationImage(
                                                      image: new NetworkImage(
                                                          Constantstring
                                                                  .baseUrl +
                                                              current[index]
                                                                  .photo!),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        splits[0],
                                                        textAlign:
                                                            TextAlign.center,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            color: Customcolor
                                                                .pink_col,
                                                            fontSize:
                                                                ResponsiveFlutter.of(
                                                                        context)
                                                                    .fontSize(
                                                                        1.4),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                        maxLines: 2,
                                                      ),
                                                      Text(
                                                        splitslast[
                                                            splitslast.length -
                                                                1],
                                                        textAlign:
                                                            TextAlign.center,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            color: Customcolor
                                                                .text_darkblue,
                                                            fontSize:
                                                                ResponsiveFlutter.of(
                                                                        context)
                                                                    .fontSize(
                                                                        1.4),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                        maxLines: 2,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                            ],
                                          ),
                                        ),
                                      )),
                                );
                                // }
                              }),
                            ),
                            _isLoading
                                ? Center(
                                    child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: CircularProgressIndicator(),
                                  ))
                                : Container()
                          ],
                        ),
//Former
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15, bottom: 10),
                child: Text(
                  'Former African First Ladies and Ambassadors of Merck Foundation "More Than a Mother" Movement',
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Customcolor.text_darkblue,
                      fontSize: ResponsiveFlutter.of(context).fontSize(2.6),
                      fontWeight: FontWeight.w500),
                  maxLines: 3,
                ),
              ),
              (currentformeer.length == 0 && _isLoading)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : (currentformeer.length == 0 && _isLoading == false)
                      ? Center(
                          child: Container(
                            child:
                                Center(child: Text(Constantstring.emptyData)),
                          ),
                        )
                      : ListView(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          children: [
                            GridView.count(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              padding: const EdgeInsets.all(5),
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 2,
                              crossAxisCount: 2,
                              childAspectRatio: 0.70,
                              children:
                                  List.generate(currentformeer.length, (index) {
                                List<String> splits = currentformeer[index]
                                    .photoDescription!
                                    .split(currentformeer[index]
                                        .photoDescription!
                                        .substring(currentformeer[index]
                                            .photoDescription!
                                            .lastIndexOf(",")));
                                List<String> splitslast = currentformeer[index]
                                    .photoDescription!
                                    .split(",");

                                return Padding(
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
                                          ShowDialogs.showImageDialog(
                                            context: context,
                                            image: Constantstring.baseUrl +
                                                currentformeer[index].photo!,
                                            description: currentformeer[index]
                                                .photoDescription,
                                          );
                                        },
                                        child: Container(
                                          color: Colors.transparent,
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  50,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  // width:
                                                  //     SizeConfig.blockSizeHorizontal *
                                                  //         100,
                                                  // height: 150,
                                                  width: SizeConfig
                                                          .blockSizeHorizontal *
                                                      100,
                                                  height: SizeConfig
                                                          .blockSizeVertical *
                                                      21, //21
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    // border: Border.all(
                                                    //   width: 1,
                                                    // ),
                                                    image: new DecorationImage(
                                                      image: new NetworkImage(
                                                          Constantstring
                                                                  .baseUrl +
                                                              currentformeer[
                                                                      index]
                                                                  .photo!),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      splits[0],
                                                      textAlign:
                                                          TextAlign.center,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: Customcolor
                                                              .pink_col,
                                                          fontSize:
                                                              ResponsiveFlutter
                                                                      .of(
                                                                          context)
                                                                  .fontSize(
                                                                      1.4),
                                                          fontWeight:
                                                              FontWeight.w500),
                                                      maxLines: 3,
                                                    ),
                                                    Text(
                                                      splitslast[
                                                          splitslast.length -
                                                              1],
                                                      textAlign:
                                                          TextAlign.center,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: Customcolor
                                                              .text_darkblue,
                                                          fontSize:
                                                              ResponsiveFlutter
                                                                      .of(
                                                                          context)
                                                                  .fontSize(
                                                                      1.4),
                                                          fontWeight:
                                                              FontWeight.w500),
                                                      maxLines: 2,
                                                    ),
                                                  ],
                                                ),
                                               
                                              ),
                                              SizedBox(height: 5),
                                            ],
                                          ),
                                        ),
                                      )),
                                );
                                // }
                              }),
                            ),
                            _isLoading
                                ? Center(
                                    child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: CircularProgressIndicator(),
                                  ))
                                : Container()
                          ],
                        ),

            
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
                height: 40,
              ),
            ],
          ),
          Align(alignment: Alignment.bottomCenter, child: Bottomcardlink()),
        ],
      ),
    );
  }

  getviewmoremmmt(dynamic api) async {
    var status1 = await ConnectionDetector.checkInternetConnection();
    if (status1) {
      print(api);
      // ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(context, api, (response) async {
        resp = response;
        print("i am here");
        print(response);
        print('Resp : $resp');
        // Navigator.of(_keyLoader.currentContext).pop();
        if (resp.success == "True") {
          print(resp.data!.list!);
          Constantstring.baseUrl = resp.baseUrl!;
          setState(() {
            print("here");
            //  current = resp.data.list.current;

            for (int i = 0; i < resp.data!.list!.current!.length; i++) {
              setState(() {
                current.add(viewmmtmrightsec.Current(
                  id: resp.data!.list!.current![i].id,
                  photo: resp.data!.list!.current![i].photo,
                  photoCategoryId: resp.data!.list!.current![i].photoCategoryId,
                  photoDescription: resp.data!.list!.current![i].photoDescription,
                ));
              });
            }
            List<String> splits = current[1].photoDescription!.split(',');
            print("last elemt");
            print(splits[0]);
            print(splits[splits.length - 1]);

            for (int i = 0; i < resp.data!.list!.former!.length; i++) {
              setState(() {
                currentformeer.add(viewmmtmrightsec.Current(
                  id: resp.data!.list!.former![i].id,
                  photo: resp.data!.list!.former![i].photo,
                  photoCategoryId: resp.data!.list!.former![i].photoCategoryId,
                  photoDescription: resp.data!.list!.former![i].photoDescription,
                ));
              });
            }
            print("Current ${current.length}");
           
          });

          setState(() {
            _isLoading = false;
          });
        } else {
          ShowDialogs.showToast(resp.msg!);
          setState(() {
            _isLoading = false;
          });
        }
      }, (error) {
        print('ERR msg is $error');
        setState(() {
          _isLoading = false;
        });
        //  Navigator.of(_keyLoader.currentContext).pop();
      }, jsonval: json);
    } else {
      setState(() {
        _isLoading = false;
      });
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

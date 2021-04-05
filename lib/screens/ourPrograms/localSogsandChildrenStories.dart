import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videoplayer.dart';

import 'package:merckfoundation22dec/model/LocalsongResponde.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/screens/watchmorevideolibray.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customHorizontalCard.dart';

import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_flutter/responsive_flutter.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:merckfoundation22dec/mediascreen.dart/Detailpage.dart';
import 'package:merckfoundation22dec/watchmorevideoambaassadar.dart';

class LocalSongsandChildrenStories extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LocalSongsandChildrenStoriesState();
  }
}

class LocalSongsandChildrenStoriesState
    extends State<LocalSongsandChildrenStories> {
  List typewidet = [];
  bool isMiddleSectionLoaded = false;
  List<Widget> listofwiget = [];

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  void initState() {
    // TODO: implement initState
    getmmtmapi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: InnerCustomAppBar(
        onTapval: () {
          Navigator.pop(context);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (BuildContext context) => Dashboard(
          //               index: 1,
          //             )));
        },
        index: 2,
        sharelink: Constantstring.localsong,
        title: "Local Songs And Children Stories",
        titleImg: "assets/newImages/our_programsLogo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      body: ListView(
        shrinkWrap: true,
        //  crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Visibility(
            visible: isMiddleSectionLoaded,
            replacement: Center(child: CircularProgressIndicator()),
            child: Padding(
                     padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
              child: ListView(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  // scrollDirection: Axis.horizontal,
                  children: list()),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(right: 0, left: 0),
          //   child: Align(
          //     alignment: Alignment.topRight,
          //     child: Image.asset(
          //       "assets/newImages/flowers_footer.png",
          //       height: 170,
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 10,
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
                height: 10,
              ),
              Bottomcardlink(),
        ],
      ),
    );
  }

  List<Widget> list() {
    listofwiget.clear();
    for (int i = 0; i < typewidet.length; i++) {
      if (typewidet[i] == "gallery") {
        listofwiget.add(
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 5),
            child: CustomHorizontalCard(
              index: 1,
              cardImage: "assets/newImages/ourvison.png",
              cardsubtitle: "Photo ",
              cardTitle: "Gallery",
              btnTitle: "View More",
              titleColor: Customcolor.pink_col,
              titleImg: "assets/newImages/flowers-3.png",
              onbtnTap: () {
                //  getprogramgallery();
              },
              list: ListView.builder(
                itemCount: GlobalLists.homegallerylist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      ShowDialogs.showImageDialog(
                        context: context,
                        image: GlobalLists.homegallerybaseurl +
                            GlobalLists.homegallerylist[index].photo,
                        description:
                            GlobalLists.homegallerylist[index].photoDescription,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8, left: 10),
                      child: Stack(
                        children: [
                          Container(
                            //width: SizeConfig.blockSizeHorizontal * 86,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/newImages/placeholder_3.jpg',
                              image:
                                  "${GlobalLists.homegallerybaseurl + GlobalLists.homegallerylist[index].photo}",
                              fit: BoxFit.contain,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Container(
                                      //   width:
                                      //       SizeConfig.blockSizeHorizontal * 80,
                                      //   child: Text(
                                      //     GlobalLists.homegallerylist[index].title,
                                      //     overflow: TextOverflow.ellipsis,
                                      //     style: TextStyle(
                                      //         color: Colors.white,
                                      //         fontSize: 14,
                                      //         fontWeight: FontWeight.w700),
                                      //     maxLines: 3,
                                      //   ),
                                      // ),
                                      SizedBox(
                                        height: 8,
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
                  );
                },
              ),
            ),
          ),
        );
      }
      if (typewidet[i] == "videos") {
        listofwiget.add(
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: CustomHorizontalCard(
              index: 1,
              cardImage: "assets/newImages/gallery.png",
              cardsubtitle: "",
              isheading: 1,
              cardTitle: "Watch Below videos :",
              btnTitle: "Watch More",
              onbtnTap: () {  
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            WatchmoreVideoambassdar(
                              categoryid:
                                  GlobalLists.homevideolist[0].categoryId,
                              api: APIManager.watchsubmenuvideoapi,
                              type: "",
                              headertitle: "Videos",
                            )));
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) =>
                //             WatchmoreVideolibrary(
                //               apiurl: API.watchvideolocalsong,
                //             )));
              },
              titleColor: Customcolor.pink_col,
              titleImg: "assets/newImages/flowers-3.png",
             //  heigthoflist: SizeConfig.blockSizeVertical * 36,
              list: ListView.builder(
                itemCount: GlobalLists.homevideolist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) => VideoPlayer(
                      //               videoUrl: GlobalLists
                      //                   .homevideolist[index].videoLink,
                      //             )));
                      var storykey = GlobalLists.homevideolist[index].videoLink
                          .substring(GlobalLists
                                  .homevideolist[index].videoLink.length -
                              11);
                      ShowDialogs.youtubevideolink(
                          "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
                      // _launchInWebViewWithJavaScript(
                      //     "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8, left: 10),
                          child: Stack(
                            children: [
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 86,
                                  height: SizeConfig.blockSizeVertical * 25,
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/newImages/placeholder_3.jpg',
                                  image:
                                      "https://img.youtube.com/vi/${GlobalLists.homevideolist[index].videoLink.substring(GlobalLists.homevideolist[index].videoLink.length - 11)}/mqdefault.jpg",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              // Align(
                              //   alignment: Alignment.bottomCenter,
                              //   child: Padding(
                              //     padding: const EdgeInsets.only(
                              //         left: 0, right: 10, bottom: 10),
                              //     child: Row(
                              //       crossAxisAlignment: CrossAxisAlignment.end,
                              //       //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //       children: [
                              //         Column(
                              //           mainAxisAlignment: MainAxisAlignment.end,
                              //           crossAxisAlignment:
                              //               CrossAxisAlignment.start,
                              //           children: [
                              //             Container(
                              //               width:
                              //                   SizeConfig.blockSizeHorizontal * 80,
                              //               child: Text(
                              //                 GlobalLists
                              //                     .homevideolist[index].videoDesc,
                              //                 overflow: TextOverflow.ellipsis,
                              //                 style: TextStyle(
                              //                     color: Colors.black87,
                              //                     fontSize: 14,
                              //                     fontWeight: FontWeight.w700),
                              //                 maxLines: 3,
                              //               ),
                              //             ),
                              //             SizedBox(
                              //               height: 25,
                              //             )
                              //           ],
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              Padding(
                                padding: EdgeInsets.only(left: 120,top: 70),
                                child: Center(
                                    child:
                                        Image.asset("assets/newImages/pause.png")),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 9),
                                            width:
                                                SizeConfig.blockSizeHorizontal * 80,
                                            child: Text(
                                              GlobalLists
                                                  .homevideolist[index].videoDesc,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                              maxLines: 3,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          )
                                  
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      }
      if (typewidet[i] == "content") {
        listofwiget.add(
          Column(
            children: [
              Html(
                data: """${GlobalLists.homecontentlist[0].pageContent} """,
                onLinkTap: (url) {
                  print("Opening $url...");
                  ShowDialogs.launchURL(url);
                },
              ),
              Html(
                data: """${GlobalLists.homecontentlist[1].pageContent} """,
                onLinkTap: (url) {
                  print("Opening $url...");
                  ShowDialogs.launchURL(url);
                },
              ),
            ],
          ),
        );
      }
      if (typewidet[i] == "latest_updates") {
        listofwiget.add(
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: CustomHorizontalCard(
              index: 1,
              cardImage: "assets/newImages/ourvison.png",
              cardsubtitle: "Latest ",
              cardTitle: "Updates",
              btnTitle: "View More",
              titleColor: Customcolor.pink_col,
              onbtnTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Dashboard(index: 3)));
              },
              titleImg: "assets/newImages/flowers-3.png",
              list: ListView.builder(
                itemCount: GlobalLists.homeceomsglist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Detailpage(
                                    indexIs: index,
                                    callfrom: 2,
                                  )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8, left: 10),
                      child: Stack(
                        children: [
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 86,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/newImages/placeholder_3.jpg',
                              image:
                                  "${GlobalLists.homeceomsgbaseurl + GlobalLists.homeceomsglist[index].image}",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 80,
                                        child: Text(
                                          GlobalLists
                                              .homeceomsglist[index].title,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                          maxLines: 3,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
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
                  );
                },
              ),
            ),
          ),
        );
      }
      if (typewidet[i] == "digital_library") {
        listofwiget.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                FormLabel(
                  text: "Children Stories",
                  labelColor: Customcolor.text_blue,
                  fontSize: ResponsiveFlutter.of(context).fontSize(2),
                  maxLines: 2,
                  textAlignment: TextAlign.left,
                  fontweight: FontWeight.w800,
                ),
                SizedBox(
                  height: 10,
                ),
                FormLabel(
                  text:
                      "Merck Foundation in partnership with African First Ladies, launched a children storybook to emphasize strong family values of love and respect from young age which will reflect on eliminating the stigma of infertility and resulted domestic violence in the future. The storybooks have been localized for each country to have a better connect with the young readers.",
                  labelColor: Colors.black,
                  fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                  textAlignment: TextAlign.justify,
                  maxLines: 2,
                  fontweight: FontWeight.w400,
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 340,
                  // color: Colors.grey.shade800,
                  //  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Swiper(
                          fade: 0.0,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                print("pdf");
                                print(GlobalLists
                                    .programdigitalcontentlist[index].document);
                                ShowDialogs.launchURL(
                                    GlobalLists.programdigitalcontentbaseurl +
                                        GlobalLists
                                            .programdigitalcontentlist[index]
                                            .document);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (BuildContext context) =>
                                //             VideoPlayer(
                                //               videoUrl: GlobalLists
                                //                       .programdigitalcontentbaseurl +
                                //                   GlobalLists
                                //                       .programdigitalcontentlist[
                                //                           index]
                                //                       .document,
                                //             )));
                              },
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Card(
                                      elevation: 5,
                                      color: Colors.white,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(6),
                                            width:
                                                SizeConfig.blockSizeHorizontal *
                                                    60,
                                            child: Text(
                                              GlobalLists
                                                  .programdigitalcontentlist[
                                                      index]
                                                  .title,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                              maxLines: 3,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              // height: SizeConfig.blockSizeVertical * 40,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: FadeInImage.assetNetwork(
                                                placeholder:
                                                    'assets/newImages/placeholder_3.jpg',
                                                image:
                                                    "${GlobalLists.programdigitalcontentbaseurl + GlobalLists.programdigitalcontentlist[index].image}",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount:
                              GlobalLists.programdigitalcontentlist.length,
                          viewportFraction: 0.7,
                          layout: SwiperLayout.DEFAULT,

                          scale: 0.9,
                          //outer: true,
                          //  itemWidth: 300.0,
                          //itemHeight: 400,
                          //itemHeight: 300,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Center(
                //   child: Container(
                //     width: 120,
                //     height: 40,
                //     decoration: BoxDecoration(
                //         color: Colors.amber,
                //         borderRadius: BorderRadius.circular(5)),
                //     child: Center(
                //       child: Text(
                //         "Watch More",
                //         style: TextStyle(
                //             color: Customcolor.colorBlue,
                //             fontSize: 15,
                //             fontWeight: FontWeight.w500),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
    }
    return listofwiget;
  }

  Future<http.Response> getmmtmapi() async {
    print("mmtm api");
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      var response = await APIManager.fetchget(
        encoding: APIManager.subprogramlocalsong,
      );
      print("response");
      print(response);
      if (response.statusCode == 200) {
        var res = json.decode(response.body);
        print("ff");
        print(res);
        LocalsongResponse homepageres = LocalsongResponse.fromJson(res);

        Map<String, dynamic> section1 = homepageres.middleArea;

        for (int i = 0; i < section1.length; i++) {
          //  MiddleArea categoryKeys = section1[(i + 1).toString()];
          //  print(categoryKeys.videos.type);
          dynamic section = res['middle_area']['${i + 1}'];
          print("TKey: ${section.keys.first}");
          var middlecategoryname = section.keys.first;

          setState(() {
            typewidet.add(middlecategoryname);

            print(typewidet);
          });
          if (middlecategoryname.toString().toLowerCase() ==
              "Videos".toLowerCase()) {
            GlobalLists.homevideolist =
                homepageres.middleArea['${i + 1}'].videos.list;
            print(GlobalLists.homevideolist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "content".toLowerCase()) {
            GlobalLists.homecontentlist =
                homepageres.middleArea['${i + 1}'].content.list;
            print(GlobalLists.homecontentlist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "digital_library".toLowerCase()) {
            GlobalLists.programdigitalcontentbaseurl =
                homepageres.middleArea['${i + 1}'].digitalLibrary.baseUrl;
            GlobalLists.programdigitalcontentlist =
                homepageres.middleArea['${i + 1}'].digitalLibrary.list;
            print(GlobalLists.programdigitalcontentlist.length);
          }
        }

        setState(() {
          isMiddleSectionLoaded = true;
        });

        return response;
      } else {
        setState(() {
          isMiddleSectionLoaded = true;
        });

        ShowDialogs.showToast(GlobalLists.serverresp);
      }
    } else {
      setState(() {
        isMiddleSectionLoaded = true;
      });

      ShowDialogs.showToast("Please check internet connection");
    }
  }

  Future<void> _launchInWebViewWithJavaScript(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}

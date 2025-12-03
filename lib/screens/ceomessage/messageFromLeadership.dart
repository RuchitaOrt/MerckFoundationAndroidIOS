// ignore_for_file: unused_field

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:merckfoundation22dec/model/leadershipTeamResponse.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';

class MessageFromLeadership extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MessageFromLeadershipState();
  }
}

class leaderclass {
  final String? programname;
  final String? image;
  final String? title;
  final String? subtitle;

  leaderclass({this.programname, this.image, this.title, this.subtitle});
}

class MessageFromLeadershipState extends State<MessageFromLeadership> {
  late CarouselSlider carouselSlider;
  int _current = 0;
  
 final CarouselSliderController _controller = CarouselSliderController();
  // late final CarouselController _controller = CarouselController();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  List<leaderclass> _messageAvailable = [
    leaderclass(
        programname:
            "We at Merck, the world’s oldest pharmaceutical and chemical company, know that acting responsibly is key for long-time entrepreneurial success. Therefore, we do a lot for the communities in which we operate in.\n\nI strongly believe that it is crucial to have a real economic transformation with a social dimension that will ensure not only all basic needs but quality of life for everyone. This can never be achieved except with capacity building and the empowerment of women and youth.\n\nThe size and complexity of the task is so large that no single organization can manage on its own, so integration of effort is necessary to realize our vision for a world where everyone can lead healthy and fulﬁlling lives. The private sector has an important role as partner with governments, academia and communities; it is time to take an action now.\n\nTherefore, we will consolidate many of our centrally driven corporate responsibility activities under one single roof: the Merck Foundation. This new philanthropic organization will allow us to considerably expand the scope, reach and effectiveness of our projects. It puts us in a better position to address some of the most pressing health, social and economic challenges of the 21st century.\n\nWe strongly believe that together we can make a signiﬁcant contribution towards the Sustainable Development Goals. With Merck Foundation, our long term commitment to the communities in which we operate will remain strong and consistent as it was throughout generations.",
        image: "assets/newImages/message.png",
        title: "Prof. Dr. Frank Stangenberg-Haverkamp",
        subtitle: "Chairman of Board of Trustees of Merck Foundation"),
    leaderclass(
        programname:
            "We at Merck, the world’s oldest pharmaceutical and chemical company, know that acting responsibly is key for long-time entrepreneurial success. Therefore, we do a lot for the communities in which we operate in.\n\nI strongly believe that it is crucial to have a real economic transformation with a social dimension that will ensure not only all basic needs but quality of life for everyone. This can never be achieved except with capacity building and the empowerment of women and youth.\n\nThe size and complexity of the task is so large that no single organization can manage on its own, so integration of effort is necessary to realize our vision for a world where everyone can lead healthy and fulﬁlling lives. The private sector has an important role as partner with governments, academia and communities; it is time to take an action now.\n\nTherefore, we will consolidate many of our centrally driven corporate responsibility activities under one single roof: the Merck Foundation. This new philanthropic organization will allow us to considerably expand the scope, reach and effectiveness of our projects. It puts us in a better position to address some of the most pressing health, social and economic challenges of the 21st century.\n\nWe strongly believe that together we can make a signiﬁcant contribution towards the Sustainable Development Goals. With Merck Foundation, our long term commitment to the communities in which we operate will remain strong and consistent as it was throughout generations.",
        image: "assets/newImages/leader2.png",
        title: "Dr. Rasha Keleji",
        subtitle: "Chairman of Board of Trustees of Merck Foundation")
  ];

  @override
  void initState() {
    // TODO: implement initState
    getLeadershipTeamResponse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: InnerCustomAppBar(
        onTapval: () {
          // Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Dashboard(
                        index: 0,
                      )));
        },
        index: 2,
        title: "Message from LeadershipTeam",
        sharelink: Constantstring.sharemessagefromleadership,
        titleImg: "assets/newImages/leadership_logo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: gifcontainer(context)

         

          ),
    );
  }

  Widget gifcontainer(BuildContext context) {
    return Stack(
      children: <Widget>[
        GlobalLists.leadershipTeamResp.length <= 0
            ? Container(
                child: Center(child: Text(Constantstring.emptyData)),
              )
            : Container(
                //color: Colors.amber,
                width: SizeConfig.blockSizeHorizontal * 100,
                height: SizeConfig.blockSizeVertical * 100,
                child: carouselSlider = CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: false,
                      // aspectRatio: 0.1,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      viewportFraction: 1.0,
                      height: SizeConfig.blockSizeVertical * 100,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                  items: GlobalLists.leadershipTeamResp.map((product) {
                    return new Builder(
                      builder: (BuildContext context) {
                        return new Container(
                          width: SizeConfig.blockSizeHorizontal * 100,

                          child: ListView(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            //  crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 240,
                                      child: Center(
                                        child: Container(
                                          height: 200,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: FadeInImage.assetNetwork(
                                            placeholder:
                                                'assets/newImages/placeholder_3.jpg',
                                            image: Constantstring.baseUrl +
                                                product.image!,
                                            fit: BoxFit.cover,
                                            height: 150,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // alignment: Alignment.bottomRight,
                                      top: 100.0,
                                      left: 155.0,
                                      right: 0.0,
                                      child: Image.asset(
                                        "assets/newImages/msgfromleadership.png",
                                        height: 140,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Center(
                                child: Html(
                                  data: """${product.shortDescription} """,
                                  onLinkTap: (url, attributes,
                                      element) {
                                    print("Opening $url...");
                                    ShowDialogs.launchURL(url!);
                                  },
                                  style: {
                                    "body": Style(
                                      textAlign: TextAlign.center,
                                      // fontSize: FontSize(15.0)
                                    ),
                                    "tr": Customcolor.tableboderstyle(context),
                                  },
                                   extensions: [
      TagExtension(
        tagsToExtend: {"img"},
        builder: (ExtensionContext context) {
          final src = context.attributes['src'] ?? '';
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.network(
              src,
              width: double.infinity,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image),
            ),
          );
        },
      )
    ],
                                  // style: {
                                  //   "body": Style(
                                  //       textAlign: TextAlign.center,
                                  //       color: Customcolor.violet_col,
                                  //       fontWeight: FontWeight.bold,
                                  //       fontSize: FontSize.large),
                                  // },
                                ),
                              ),

                              Container(
                                // margin:
                                //     EdgeInsets.fromLTRB(16.0, 250.0, 16.0, 16.0),
                                decoration: BoxDecoration(
                                    color: Customcolor.background,
                                    borderRadius: BorderRadius.circular(5.0)),
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Divider(),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Html(
                                      data: """${product.pageContent} """,
                                      onLinkTap: (url,
                                          attributes, element) {
                                        print("Opening $url...");
                                        ShowDialogs.launchURL(url!);
                                      },
                                      style: {
                                        "tr": Customcolor.tableboderstyle(
                                            context),
                                      },
                                       extensions: [
      TagExtension(
        tagsToExtend: {"img"},
        builder: (ExtensionContext context) {
          final src = context.attributes['src'] ?? '';
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.network(
              src,
              width: double.infinity,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image),
            ),
          );
        },
      )
    ],
                                    ),
                                    SizedBox(height: 10.0),
                                    SizedBox(
                                      height: 15,
                                    ),

                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsets.only(right: 60, left: 60),
                                    //   child: Image.asset(
                                    //     "assets/newImages/flowers_footer.png",
                                    //   ),
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(
                                    //       right: 0, left: 0),
                                    //   child: Align(
                                    //     alignment: Alignment.topRight,
                                    //     child: Image.asset(
                                    //       "assets/newImages/flowers_footer.png",
                                    //       height: 170,
                                    //     ),
                                    //   ),
                                    // ),
                                    // SizedBox(
                                    //   height: 10,
                                    // )
                                  ],
                                ),
                              ),
                              // ListView(
                              //   children: [
                              //     Container(
                              //       // margin:
                              //       //     EdgeInsets.fromLTRB(16.0, 250.0, 16.0, 16.0),
                              //       decoration: BoxDecoration(
                              //           color: Customcolor.background,
                              //           borderRadius:
                              //               BorderRadius.circular(5.0)),
                              //       padding: const EdgeInsets.all(16.0),
                              //       child: Column(
                              //         crossAxisAlignment:
                              //             CrossAxisAlignment.start,
                              //         children: <Widget>[
                              //           Divider(),
                              //           SizedBox(
                              //             height: 15.0,
                              //           ),
                              //           Text(product.programname,
                              //               textAlign: TextAlign.justify,
                              //               style: TextStyle(
                              //                   color: Customcolor.colorblack,
                              //                   fontSize: 14,
                              //                   fontWeight: FontWeight.w400)),
                              //           SizedBox(height: 10.0),
                              //           SizedBox(
                              //             height: 15,
                              //           ),
                              //           Padding(
                              //             padding: const EdgeInsets.only(
                              //                 right: 60, left: 60),
                              //             child: Image.asset(
                              //               "assets/newImages/flowers_footer.png",
                              //             ),
                              //           ),
                              //           SizedBox(
                              //             height: 10,
                              //           )
                              //         ],
                              //       ),
                              //     ),
                              //   ],
                              // ),

                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 0, left: 0),
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
                          //child: new Text('text $i', style: new TextStyle(fontSize: 16.0,color: Colors.black),)
                        );
                      },
                    );
                  }).toList(),
                  carouselController: _controller,
                ),
              ),
        Positioned(
          top: 140,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      goToPrevious();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Customcolor.text_darkblue,
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      goToNext();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Customcolor.text_darkblue,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  goToPrevious() {
    _controller.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToNext() {
    _controller.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }

  getLeadershipTeamResponse() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.leadershipTeam,
        (response) async {
          MessageFromleadershipResponse resp = response;
          print(response);
          print('Resp : $resp');
          GlobalLists.leadershipTeamResp.clear();
          Navigator.of(_keyLoader.currentContext!).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.leadershipTeamResp = resp.data!.list!;
              Constantstring.baseUrl = resp.baseUrl!;
            });
          } else {
            ShowDialogs.showToast(resp.msg!);
          }
        },
        (error) {
          print('ERR msg is $error');
          Navigator.of(_keyLoader.currentContext!).pop();
        },
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

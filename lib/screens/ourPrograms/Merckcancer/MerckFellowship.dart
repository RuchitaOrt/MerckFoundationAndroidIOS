import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:merckfoundation22dec/GalleryProgram.dart';
import 'package:merckfoundation22dec/mediascreen.dart/Detailpage.dart';
import 'package:merckfoundation22dec/mediascreen.dart/merckFoundationMedia.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videoplayer.dart';
import 'package:merckfoundation22dec/model/GalleryProgram.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/AutoResizeWebView.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customHorizontalCard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart' as html;
import 'package:merckfoundation22dec/screens/ourPrograms/Testimonailprogramviewmore.dart';
import 'package:merckfoundation22dec/screens/ourPrograms/Testimonailprogramdetailpage.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:merckfoundation22dec/model/MerckFellowship.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:merckfoundation22dec/watchmorevideoambaassadar.dart';
import 'package:merckfoundation22dec/widget/slidercontainer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MerckFellowship extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OurProgramsDetailsState();
  }
}

class OurProgramsDetailsState extends State<MerckFellowship>
    with TickerProviderStateMixin {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  int _current = 0;
  List<dynamic> slidersection = [];
  List typewidet = [];
  List typewidetofrightsection = [];
  List typewidetofbottomsection = [];
  int _current1 = 0;
  List _productsAvailable = [];
  bool isMiddleSectionLoaded = false;
//  bool isrightSectionLoaded = false;
  bool isbottomSectionLoaded = false;
  List<Widget> listofwiget = [];
  List<Widget> listoftabwiget = [];
  List<Widget> listofbottomwiget = [];

  List _imgarray = [
    "assets/newImages/img3.jpg",
    "assets/newImages/img4.jpg",
    "assets/newImages/leader1.png",
    "assets/newImages/leader2.png",
    "assets/newImages/img3.jpg",
    "assets/newImages/leader1.png",
    "assets/newImages/leader2.png",
  ];
  late CarouselSlider carouselSlider;

  bool iscall = true;
  bool islibrary = false;
  bool ismeck = false;
  bool expandClick = false;
  String expandedName = "Upcoming Events";

  final List<Tab> tabs = <Tab>[];
  final CarouselSliderController callAppCarouselController = CarouselSliderController();
  TabController? _tabController;

  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    // getmmtmslider();
    getmmtmapi();
    super.initState();
    //_tabController = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: InnerCustomAppBar(
        onTapval: () {
          Navigator.pop(context);
        },
        index: 2,
        sharelink: Constantstring.cancerfellowship,
        title: "Merck Foundation Oncology Fellowship Program",
        titleImg: "assets/newImages/our_programsLogo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView(
              //  crossAxisAlignment: CrossAxisAlignment.start,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                slider(context),
                Visibility(
                  visible: isMiddleSectionLoaded,
                  replacement: Center(child: CircularProgressIndicator()),
                  child: ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      // scrollDirection: Axis.horizontal,
                      children: list()),
                ),
                Visibility(
                    visible: isbottomSectionLoaded,
                    replacement: Center(child: CircularProgressIndicator()),
                    child: ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      // scrollDirection: Axis.horizontal,
                      children: listbottomwidget(),
                    )),
                SizedBox(
                  height: 8,
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
              ])),
    );
  }

  Widget callforApplication() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
      ),
      child: Card(
          elevation: 5,
          // height: 1800,
          color: Colors.white,
          child: getcallforapp(context)),
    );
  }

  Widget digitalLibraryLastSection() {
    return getdigitallib(context);
  }

  Widget getcallforapp(BuildContext context) {
    return Stack(
      children: <Widget>[
        GlobalLists.homecallforapp.length <= 0
            ? Container(
                child: Center(child: Text(Constantstring.emptyData)),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    //color: Colors.amber,
                    width: SizeConfig.blockSizeHorizontal * 100,
                    height: 470,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text(
                              expandedName,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            )),
                            GestureDetector(
                              onTap: () {
                                print("in tap");
                                setState(() {
                                  expandClick = !expandClick;
                                });
                              },
                              child: Image.asset(
                                "assets/newImages/expand_more.png",
                                width: 30,
                                height: 30,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        carouselSlider = CarouselSlider(
                          options: CarouselOptions(
                              autoPlay: false,
                              // aspectRatio: 0.1,
                              enlargeCenterPage: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                              viewportFraction: 1.0,
                              height: 340,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current1 = index;
                                });
                              }),
                          items: GlobalLists.homecallforapp.map((product) {
                            return new Builder(
                              builder: (BuildContext context) {
                                return ListView(
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: FadeInImage.assetNetwork(
                                        placeholder:
                                            'assets/newImages/placeholder_3.jpg',
                                        image:
                                            GlobalLists.homeCallForAppBaseURL +
                                                product.appImg,
                                        fit: BoxFit.fill,
                                        width: 240,
                                        height: 290,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Text(product.title,
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: AppFonts.normal)),
                                    )
                                  ],
                                );
                              },
                            );
                          }).toList(),
                          carouselController: callAppCarouselController,
                        ),
                      ],
                    )),
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
                      padding: const EdgeInsets.only(left: 20),
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
                      padding: const EdgeInsets.only(right: 20),
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

  Widget getdigitallib(BuildContext context) {
    return Stack(
      children: <Widget>[
        GlobalLists.homedigitallib.length <= 0
            ? Container(
                child: Center(child: Text(Constantstring.emptyData)),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  //color: Colors.amber,
                  width: SizeConfig.blockSizeHorizontal * 100,
                  height: 400,
                  color: Colors.white,
                  child: carouselSlider = CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: false,
                        aspectRatio: 1,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        viewportFraction: 1.0,
                        //  height: SizeConfig.blockSizeVertical * 100,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current1 = index;
                          });
                        }),
                    items: GlobalLists.homedigitallib.map((product) {
                      print(GlobalLists.homeDigitalLibraryBaseURL +
                          product.image);
                      return new Builder(
                        builder: (BuildContext context) {
                          return ListView(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            //  crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  padding: EdgeInsets.only(top: 20),
                                  width: 240,
                                  height: 290,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: FadeInImage.assetNetwork(
                                    placeholder:
                                        'assets/newImages/placeholder_3.jpg',
                                    image:
                                        GlobalLists.homeDigitalLibraryBaseURL +
                                            product.image,
                                    fit: BoxFit.fitHeight,
                                    height: 200,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Text(product.title,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: AppFonts.normal)),
                              )
                            ],
                          );
                        },
                      );
                    }).toList(),
                    carouselController: callAppCarouselController,
                  ),
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
                      padding: const EdgeInsets.only(left: 20),
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
                      padding: const EdgeInsets.only(right: 40),
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

  // goToPrevious() {
  //   _controller.previousPage(
  //       duration: Duration(milliseconds: 300), curve: Curves.ease);
  // }

  // goToNext() {
  //   _controller.nextPage(
  //       duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  // }
  goToPrevious() {
    callAppCarouselController.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToNext() {
    callAppCarouselController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }

  Widget digitalLibrary() {
    return Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
        ),
        child: getdigitallib(context));
  }


  // Widget slider(BuildContext context) {
  //   return Stack(
  //     children: <Widget>[
  //       Column(
  //         children: <Widget>[
  //           Container(
  //             child: carouselSlider = CarouselSlider(
  //               options: CarouselOptions(
  //                 viewportFraction: 1.0,
  //                 height: 200,
  //                 autoPlay: true,
  //                 onPageChanged: (index, reason) {
  //                   setState(() {
  //                     _current = index;
  //                   });
  //                 },
  //               ),
  //               items: GlobalLists.mmtmsliderlist.map((product) {
  //                 return new Builder(
  //                   builder: (BuildContext context) {
  //                     return new Container(
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(10),
  //                       ),
  //                       width: SizeConfig.blockSizeHorizontal * 100,
  //                       child: FadeInImage.assetNetwork(
  //                         placeholder: 'assets/newImages/placeholder_3.jpg',
  //                         image: Constantstring.baseUrl + product.image,
  //                         fit: BoxFit.cover,
  //                       ),
  //                     );
  //                   },
  //                 );
  //               }).toList(),
  //             ),
  //           ),
  //           new DotsIndicator(
  //             dotsCount: GlobalLists.mmtmsliderlist.length,
  //             position: double.parse("$_current"),
  //             decorator: DotsDecorator(
  //               size: const Size.square(9.0),
  //               activeSize: const Size(18.0, 9.0),
  //               activeColor: Customcolor.colorPink,
  //               activeShape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(5.0)),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }
  Widget slider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 8),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                // child: html.HtmlWidget("${GlobalLists.sliderurl}")

                child: carouselSlider = CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1.0,
                    height: 170,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                  items: _productsAvailable.map((product) {
                    return new Builder(
                      builder: (BuildContext context) {
                        return Slidercard(
                          cardImage: GlobalLists.sliderurl + product['image'],
                          cardTitle: product['image_title'],
                          subTitle: product['image_desc'],
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
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
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: CustomHorizontalCard(
              index: 1,
              cardImage: "assets/newImages/ourvison.png",
              cardsubtitle: "Photo ",
              cardTitle: "Gallery",
              btnTitle: "View More",
              titleColor: Customcolor.pink_col,
              titleImg: "assets/newImages/flowers-3.png",
              onbtnTap: () {
                getprogramgallery();
              },
              list: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
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
                      padding: const EdgeInsets.only(right: 5, left: 5),
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
              cardsubtitle: "Our ",
              cardTitle: "Videos  ",
              btnTitle: "Watch More",
              // heigthoflist: SizeConfig.blockSizeVertical * 32,
              onbtnTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) => Videolibrary()));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            WatchmoreVideoambassdar(
                              categoryid: GlobalLists
                                  .homevideolist[
                                      GlobalLists.homevideolist.length - 1]
                                  .categoryId,
                              api: APIManager.watchsubmenuvideoapi,
                              type: "",
                              headertitle: "Videos",
                            )));
              },
              titleColor: Customcolor.pink_col,
              titleImg: "assets/newImages/flowers-3.png",
              list: ListView.builder(
                itemCount: GlobalLists.homevideolist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
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
                                  placeholder:
                                      'assets/newImages/placeholder_3.jpg',
                                  //placeholderScale: 0.4,
                                  image:
                                      "https://img.youtube.com/vi/${GlobalLists.homevideolist[index].videoLink.substring(GlobalLists.homevideolist[index].videoLink.length - 11)}/mqdefault.jpg",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 120, top: 70),
                                child: Center(
                                    child: Image.asset(
                                        "assets/newImages/pause.png")),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 9),
                          width: SizeConfig.blockSizeHorizontal * 80,
                          child: Text(
                            GlobalLists.homevideolist[index].videoDesc,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                            maxLines: 2,
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
  html.HtmlWidget(
    '${GlobalLists.homecontentlist[0].pageContent}',
    customWidgetBuilder: (element) {
      if (element.localName == 'iframe' || element.localName == 'video') {
        final src = element.localName == 'iframe'
            ? element.attributes['src']
            : element.children
                .firstWhere((e) => e.localName == 'source')
                .attributes['src'];

        if (src != null && src.contains('youtube.com')) {
          return SizedBox(
            height: 300,
            width: double.infinity,
            child: WebView(
              initialUrl: Uri.dataFromString(
                '<html><body style="margin:0;padding:0;"><iframe width="100%" height="100%" src="$src" frameborder="0" allowfullscreen></iframe></body></html>',
                mimeType: 'text/html',
              ).toString(),
              javascriptMode: JavascriptMode.unrestricted,
            ),
          );
        }
      } 
      else if (element.localName == 'table') {
        //3dec2025
  final modifiedHtml = """
  <html>
  <head>
    <style>
      table {
        width: 100%;
        border-collapse: collapse;
      }
      td, th {
        padding: 8px;
        vertical-align: middle;
        text-align: center;
      }
      img {
 max-width: 100%;
  height: auto;
  display: inline-block;
  vertical-align: text-bottom; 
}
      iframe, embed {
        width: 100%;
        height: auto;
      }
    </style>
  </head>
  <body>
    ${element.outerHtml}
  </body>
  </html>
  """;

  return AutoResizeWebView(htmlContent: modifiedHtml);
}

      // else if (element.localName == 'table') {
     
      //   return  AutoResizeWebView(htmlContent: element.outerHtml,);
       
      // }

      return null;
    },
  ),

            );
        //tables
      }
      // if (typewidet[i] == "content") {
      //   listofwiget.add(
      //       html.HtmlWidget('${GlobalLists.homecontentlist[0].pageContent}',
      //        customWidgetBuilder: (element) {
      //         if (element.localName == 'video') {
      //           final src = element.children.firstWhere((e) => e.localName == 'source').attributes['src'];
      //           if (src != null && src.contains('youtube.com')) {
      //             return SizedBox(
      //               height: 300,
      //               width: double.infinity,
      //               child: WebView(
      //                 initialUrl: src,
      //                 javascriptMode: JavascriptMode.unrestricted,
      //               ),
      //             );
      //           }
      //         }else  if (element.localName == 'iframe') {
      //           final iframeSrc = element.attributes['src'];

      //           // If the iframe is a YouTube video, handle it
      //           if (iframeSrc != null && iframeSrc.contains("youtube.com")) {
      //             return SizedBox(
      //               height: 300,
      //               width: double.infinity,
      //               child: WebView(
      //                 initialUrl: iframeSrc,
      //                 javascriptMode: JavascriptMode.unrestricted,
      //               ),
      //             );
      //           }
      //         }
      //         return null;
      //       },)
      //       // html.HtmlWidget(
      //       //   '${GlobalLists.homecontentlist[0].pageContent}',
      //       //   onTapUrl: (url) {
      //       //     print("Opening $url...");
      //       //     ShowDialogs.launchURL(url);
      //       //   },
      //       //   textStyle: TextStyle(fontSize: 16),
      //       //   // Add any additional styling or configuration here
      //       // ),

      //       // Html(
      //       //   data: """${GlobalLists.homecontentlist[0].pageContent} """,
      //       //   onLinkTap: (url) {
      //       //     print("Opening $url...");
      //       //     ShowDialogs.launchURL(url);
      //       //   },
      //       //   style: {
      //       //     "tr": Customcolor.tableboderstyle(context),
      //       //   },
      //       // ),

      //       //     Html(
      //       //   data: GlobalLists.homecontentlist[0].pageContent ?? "",
      //       //   onLinkTap: (url) {
      //       //     print("Opening $url...");
      //       //     ShowDialogs.launchURL(url);
      //       //   },
      //       // )
      //       );
      //   //tables
      // }
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
      if (typewidet[i] == "testimonial") {
        listofwiget.add(
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: CustomHorizontalCard(
              index: 1,
              cardImage: "assets/newImages/mqdefault.png",
              cardsubtitle: "Merck Foundation ",
              cardTitle: "Alumini Testimonials  ",
              titleColor: Customcolor.pink_col,
              heigthoflist: SizeConfig.blockSizeVertical * 44,
              //  showviewmore: 1,
              onbtnTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Testimonialprogramviewmore(
                              apiurl: API.watchmoretestimonialcancerfellowship,
                              sharelink: Constantstring
                                  .sharetestimonialviewmorecancerfellowship,
                            )));
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) =>
                //             MerckFoundationTestimonial()));
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) =>
                //             Testimonialprogramviewmore()));
                // getMerckprogramTestimonial();
              },
              btnTitle: "View More",
              titleImg: "assets/newImages/flowers-3.png",
              list: ListView.builder(
                itemCount: GlobalLists.mmttestimoniallist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Testimonialprogramdetailpage(
                                    index: index,
                                    baseurl: GlobalLists.mmttestimonialbaseurl,
                                  )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8, left: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 86,
                            height: SizeConfig.blockSizeVertical * 28,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/newImages/placeholder_3.jpg',
                              image:
                                  "${GlobalLists.mmttestimonialbaseurl + GlobalLists.mmttestimoniallist[index].image}",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 80,
                            child: Html(
                              data: GlobalLists
                                  .mmttestimoniallist[index].testimonialName,
                              style: {
                                "body": Style(
                                    fontSize: FontSize(14.0),
                                    color: Colors.black87,

                                    //textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w500),
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
                            ),
                          ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 80,
                            child: Html(
                              data: GlobalLists
                                  .mmttestimoniallist[index].departmentName,
                              style: {
                                "body": Style(
                                    fontSize: FontSize(14.0),
                                    color: Customcolor.colorBlue,

                                    //textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w500),
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              //  Padding(
              //   padding: const EdgeInsets.only(left: 8),
              //   child: Container(
              //     height: 160,
              //     child: ListView.builder(
              //       itemCount: GlobalLists.mmttestimoniallist.length,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (BuildContext context, int index) {
              //         return Padding(
              //           padding: const EdgeInsets.only(left: 8, right: 8),
              //           child: GestureDetector(
              //             onTap: () {
              //               Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                       builder: (BuildContext context) =>
              //                           Testimonialprogramdetailpage(
              //                             index: index,
              //                             baseurl: GlobalLists
              //                                 .mmttestimonialbaseurl,
              //                           )));
              //             },
              //             child: Container(
              //               height: SizeConfig.blockSizeVertical * 15,
              //               width: SizeConfig.blockSizeHorizontal * 80,
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(5),
              //                   color: Colors.white),
              //               child: Row(
              //                 children: [
              //                   Padding(
              //                     padding: const EdgeInsets.only(
              //                         top: 5, bottom: 3, left: 8, right: 8),
              //                     child: Container(
              //                       // height: 220,
              //                       width: 100,
              //                       decoration: BoxDecoration(
              //                         //color: Colors.amber,
              //                         borderRadius: BorderRadius.circular(10),
              //                       ),
              //                       child: FadeInImage.assetNetwork(
              //                         placeholder:
              //                             'assets/newImages/placeholder_3.jpg',
              //                         image:
              //                             "${GlobalLists.mmttestimonialbaseurl + GlobalLists.mmttestimoniallist[index].image}",
              //                         fit: BoxFit.cover,
              //                       ),
              //                     ),
              //                   ),
              //                   Expanded(
              //                     child: ListView(
              //                       shrinkWrap: true,
              //                       // crossAxisAlignment:
              //                       //     CrossAxisAlignment.start,
              //                       children: [
              //                         SizedBox(
              //                           height: 12,
              //                         ),
              //                         FormLabel(
              //                           text: GlobalLists
              //                               .mmttestimoniallist[index]
              //                               .testimonialName,
              //                           labelColor: Customcolor.colorPink,
              //                           fontSize: 17,
              //                           maxLines: 1,
              //                           fontweight: FontWeight.w700,
              //                         ),
              //                         SizedBox(
              //                           height: 4,
              //                         ),
              //                         Html(
              //                           data: GlobalLists
              //                               .mmttestimoniallist[index]
              //                               .departmentName,
              //                           style: {
              //                             "body": Style(
              //                                 fontSize: FontSize(13.0),
              //                                 color: Colors.black87,
              //                                 fontWeight: FontWeight.w600),
              //                           },
              //                         ),
              //                         // FormLabel(
              //                         //   text: GlobalLists
              //                         //       .mmttestimoniallist[index]
              //                         //       .departmentName,
              //                         //   labelColor: Colors.black87,
              //                         //   fontSize: 13,
              //                         //   fontweight: FontWeight.w600,
              //                         //   maxLines: 2,
              //                         // ),
              //                         SizedBox(
              //                           height: 7,
              //                         ),
              //                         FormLabel(
              //                           text: GlobalLists
              //                               .mmttestimoniallist[index]
              //                               .shortDescription,
              //                           labelColor: Colors.black54,
              //                           fontSize: 13,
              //                           fontweight: FontWeight.w500,
              //                           maxLines: 4,
              //                         ),
              //                       ],
              //                     ),
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // )
            ),
          ),
        );
      }
    }
    return listofwiget;
  }

  List<Widget> listbottomwidget() {
    listofbottomwiget.clear();
    for (int i = 0; i < typewidetofbottomsection.length; i++) {
      if (typewidetofbottomsection[i] == "media") {
        listofbottomwiget.add(
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: CustomHorizontalCard(
              index: 1,
              cardImage: "assets/newImages/mqdefault.png",
              cardsubtitle: 'Merck Foundation In ',
              cardTitle: "Media  ",
              titleColor: Customcolor.pink_col,
              onbtnTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            MerckFoundationMedia()));
              },
              btnTitle: "View More",
              titleImg: "assets/newImages/flowers-3.png",
              list: ListView.builder(
                itemCount: GlobalLists.mmtmmedialist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => VideoPlayer(
                                    videoUrl: GlobalLists
                                        .mmtmmedialist[index].mediaUrl,
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
                                  "${GlobalLists.mmtmmediabaseurl + GlobalLists.mmtmmedialist[index].image}",
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
                                              .mmtmmedialist[index].title,
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
      if (typewidetofbottomsection[i] == "testimonial") {
        listofbottomwiget.add(
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: CustomHorizontalCard(
                index: 1,
                cardImage: "assets/newImages/mqdefault.png",
                cardsubtitle: "Merck Foundation ",
                cardTitle: "Alumini Testimonials  ",
                titleColor: Customcolor.pink_col,
                onbtnTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) =>
                  //             MerckFoundationTestimonial()));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Testimonialprogramviewmore()));
                  // getMerckprogramTestimonial();
                },
                btnTitle: "View More",
                titleImg: "assets/newImages/flowers-3.png",
                list: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Container(
                    height: 160,
                    child: ListView.builder(
                      itemCount: GlobalLists.mmttestimoniallist.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Testimonialprogramdetailpage(
                                            index: index,
                                            baseurl: GlobalLists
                                                .mmttestimonialbaseurl,
                                          )));
                            },
                            child: Container(
                              height: SizeConfig.blockSizeVertical * 15,
                              width: SizeConfig.blockSizeHorizontal * 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 3, left: 8, right: 8),
                                    child: Container(
                                      // height: 220,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        //color: Colors.amber,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: FadeInImage.assetNetwork(
                                        placeholder:
                                            'assets/newImages/placeholder_3.jpg',
                                        image:
                                            "${GlobalLists.mmttestimonialbaseurl + GlobalLists.mmttestimoniallist[index].image}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView(
                                      shrinkWrap: true,
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 12,
                                        ),
                                        FormLabel(
                                          text: GlobalLists
                                              .mmttestimoniallist[index]
                                              .testimonialName,
                                          labelColor: Customcolor.colorPink,
                                          fontSize: 17,
                                          maxLines: 1,
                                          fontweight: FontWeight.w700,
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        FormLabel(
                                          text: GlobalLists
                                              .mmttestimoniallist[index]
                                              .departmentName,
                                          labelColor: Colors.black87,
                                          fontSize: 13,
                                          fontweight: FontWeight.w600,
                                          maxLines: 2,
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        FormLabel(
                                          text: GlobalLists
                                              .mmttestimoniallist[index]
                                              .shortDescription,
                                          labelColor: Colors.black54,
                                          fontSize: 13,
                                          fontweight: FontWeight.w500,
                                          maxLines: 4,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )),
          ),
        );
      }
    }
    return listofbottomwiget;
  }

  List<Widget> tablist() {
    setState(() {
      listoftabwiget.clear();
      tabs.clear();

      // digitalLibrary(),
      // merckmorethanmother()
      for (int i = 0; i < typewidetofrightsection.length; i++) {
        if (typewidetofrightsection[i] == "call_for_app" &&
            GlobalLists.homecallforapp.length > 0) {
          tabs.add(
            new Tab(
              child: Callforapptext(),
            ),
          );

          listoftabwiget.add(
            getcallforapp(context),
          );
        }
        if (typewidetofrightsection[i] == "mmtm" &&
            GlobalLists.homemmtm.length > 0) {
          tabs.add(
            new Tab(
              child: Merckmtmtext(),
            ),
          );
          listoftabwiget.add(getMMTMS(context));
        }
        if (typewidetofrightsection[i] == "digital_library" &&
            GlobalLists.homedigitallib.length > 0) {
          tabs.add(
            new Tab(
              child: Digitaltext(),
            ),
          );
          listoftabwiget.add(digitalLibraryLastSection());
        }
        print('tabs');
        print(tabs.length);
      }
    });
    //_tabController.length = tabs.length;
    return listoftabwiget;
  }

  Widget getMMTMS(BuildContext context) {
    return Stack(
      children: <Widget>[
        GlobalLists.homemmtm.length <= 0
            ? Container(
                child: Center(child: Text(Constantstring.emptyData)),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  //color: Colors.amber,
                  width: SizeConfig.blockSizeHorizontal * 100,
                  height: 400,
                  color: Colors.white,
                  child: carouselSlider = CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: false,
                        aspectRatio: 1,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        viewportFraction: 1.0,
                        //  height: SizeConfig.blockSizeVertical * 100,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current1 = index;
                          });
                        }),
                    items: GlobalLists.homemmtm.map((product) {
                      return new Builder(
                        builder: (BuildContext context) {
                          return ListView(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            //  crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  padding: EdgeInsets.only(top: 20),
                                  width: 240,
                                  height: 290,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: FadeInImage.assetNetwork(
                                    placeholder:
                                        'assets/newImages/placeholder_3.jpg',
                                    image: GlobalLists.homeMMTMBaseURL +
                                        product.photo,
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Text(product.photoDescription,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 17,
                                    )),
                              )
                            ],
                          );
                        },
                      );
                    }).toList(),
                    carouselController: callAppCarouselController,
                  ),
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
                      padding: const EdgeInsets.only(left: 20),
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
                      padding: const EdgeInsets.only(right: 40),
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

  Future<http.Response?> getmmtmapi() async {
    print("mmtm api");
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      var response = await APIManager.fetchget(
        encoding: APIManager.subprofellowship,
      );
      print("response");
      print(response);
      if (response!.statusCode == 200) {
        var res = json.decode(response.body);
        print("ff");
        print(res);
        MerckFellowshipResponse homepageres =
            MerckFellowshipResponse.fromJson(res);

        // print("it is HomePageres${homepageres.middleArea[0].content.list[0]}");
        GlobalLists.sliderurl = homepageres.sliderArea[0].slider.baseUrl;
        slidersection = homepageres.sliderArea[0].slider.list;
        slidersection.forEach((element) {
          _productsAvailable.add({
            "id": element.id,
            "menu_id": element.menuId,
            "image_title": element.imageTitle,
            "image_desc": element.imageDesc,
            "links": element.links,
            "image": element.image,
            "alt_text": element.altText,
            "status": element.status,
            "created_at": element.createdAt,
            "updated_at": element.updatedAt
          });
        });

        print("sliderprogramsection");
        print(slidersection.length);

        Map<String, dynamic> section1 = homepageres.middleArea;
        //  Map<String, dynamic> lastsection = homepageres.rightArea;

        print(section1);
        print(section1['1']);
        print(res['middle_area'].keys);
        List<String> middleareakey = [];
        section1.keys.forEach((element) {
          middleareakey.add(element.toString());
        });
        print(middleareakey);
        for (int i = 0; i < section1.length; i++) {
          //  MiddleArea categoryKeys = section1[(i + 1).toString()];

          dynamic section = res['middle_area'][middleareakey[i]];
          print("TKey: ${section.keys.first}");
          var middlecategoryname = section.keys.first;

          setState(() {
            typewidet.add(middlecategoryname);

            print(typewidet);
          });
          if (middlecategoryname.toString().toLowerCase() ==
              "Videos".toLowerCase()) {
            GlobalLists.homevideolist =
                homepageres.middleArea[middleareakey[i]]!.videos!.list;
            print(GlobalLists.homevideolist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "content".toLowerCase()) {
            GlobalLists.homecontentlist =
                homepageres.middleArea[middleareakey[i]]!.content!.list;
            print(GlobalLists.homecontentlist.length);
          } else if (middlecategoryname.toString().toLowerCase() ==
              "testimonial".toLowerCase()) {
            GlobalLists.mmttestimoniallist =
                homepageres.middleArea[middleareakey[i]]!.testimonial!.list;
            print(GlobalLists.mmttestimoniallist.length);
            GlobalLists.mmttestimonialbaseurl =
                homepageres.middleArea[middleareakey[i]]!.testimonial!.baseUrl;
          }
        }

  
        setState(() {
          isMiddleSectionLoaded = true;
          //   isrightSectionLoaded = true;
          isbottomSectionLoaded = true;
        });

        return response;
      } else {
        _tabController = new TabController(vsync: this, length: 0);
        isMiddleSectionLoaded = true;
        //  isrightSectionLoaded = true;
        isbottomSectionLoaded = true;
        ShowDialogs.showToast(GlobalLists.serverresp);
      }
    } else {
      _tabController = new TabController(vsync: this, length: 0);
      isMiddleSectionLoaded = true;
      // isrightSectionLoaded = true;
      isbottomSectionLoaded = true;
      ShowDialogs.showToast("Please check internet connection");
    }
  }


  getprogramgallery() async {
    var status1 = await ConnectionDetector.checkInternetConnection();
    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(context, API.programgallerymmtm,
          (response) async {
        GalleryProgramResponse resp = response;

        print(response);
        print('Resp : $resp');
        Navigator.of(_keyLoader.currentContext!).pop();
        if (resp.success == "True".toLowerCase()) {
          print(resp.list);
          GlobalLists.programgallerybaseurl = resp.baseUrl!;
          GlobalLists.programgallerylist = resp.list!;
          print(GlobalLists.programgallerylist);
          // GlobalLists.awarddetallisting[0].title

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => GalleryProgram(
                        baseURL: GlobalLists.programgallerybaseurl,
                        photosList: GlobalLists.programgallerylist,
                      )));
        } else {
          ShowDialogs.showToast(resp.msg!);
        }
      }, (error) {
        print('ERR msg is $error');
        Navigator.of(_keyLoader.currentContext!).pop();
      }, jsonval: json);
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

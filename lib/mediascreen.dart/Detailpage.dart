import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/widget/AutoResizeWebView.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';

import 'package:merckfoundation22dec/utility/ResponsiveFlutter.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Detailpage extends StatefulWidget {
  final int? indexIs;
  final int? callfrom;
  const Detailpage({Key? key, this.indexIs, this.callfrom}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DetailpageState();
  }
}

class DetailpageState extends State<Detailpage> with TickerProviderStateMixin {
  AnimationController? _controller;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  void initState() {
    log(widget.indexIs.toString(), name: 'is cdhd');
    log(widget.callfrom.toString(), name: 'is cdhd');

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
            Navigator.pop(context);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => Dashboard(
            //               index: 0,
            //             )));
            // if (widget.callfrom == 1) {
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (BuildContext context) => Dashboard(
            //                 index: 3,
            //               )));
            // } else {
            //   Navigator.pop(context);
            // }
          },
          index: widget.callfrom == 1
              ? 2
              : widget.callfrom == 3
                  ? 2
                  : 1,
          titleshowingindex: "1",
          sharelink: widget.callfrom == 1
              ? Constantstring.sharearticledetailpage +
                  GlobalLists.newsLettersList[widget.indexIs!].detailPageUrl!
              : widget.callfrom == 3
                  ? Constantstring.sharearticledetailpage +
                      GlobalLists.homeceoList[widget.indexIs!].detailPageUrl!
                  : "",
          title: widget.callfrom == 1
              ? GlobalLists.newsLettersList[widget.indexIs!].title
              : widget.callfrom == 3
                  ? GlobalLists.homeceoList[widget.indexIs!].title
                  : "Articles",
          titleImg: "assets/newImages/vision_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: ListView(
                shrinkWrap: true,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  widget.callfrom == 1
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 8, top: 8, bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                GlobalLists
                                    .newsLettersList[widget.indexIs!].title!,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize:
                                      ResponsiveFlutter.of(context).fontSize(2),
                                  fontWeight: FontWeight.w600,
                                  color: Customcolor.colorVoilet,
                                ),
                              ),
                              HtmlWidget(
                                """${GlobalLists.newsLettersList[widget.indexIs!].details} """,
                                customWidgetBuilder: (element) {
                                  if (element.localName == 'video') {
                                    final src = element.children
                                        .firstWhere(
                                            (e) => e.localName == 'source')
                                        .attributes['src'];
                                    if (src != null &&
                                        src.contains('youtube.com')) {
                                      return SizedBox(
                                        height: 300,
                                        width: double.infinity,
                                        child: WebView(
                                          initialUrl: src,
                                          javascriptMode:
                                              JavascriptMode.unrestricted,
                                        ),
                                      );
                                    }
                                  } else
                                  if (element.localName == 'iframe') {
      final iframeSrc = element.attributes['src'];

      if (iframeSrc != null && iframeSrc.contains("youtube.com")) {
        final videoId = YoutubePlayer.convertUrlToId(iframeSrc);

        if (videoId != null) {
          return YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: videoId,
              flags: YoutubePlayerFlags(
                autoPlay: false,
                disableDragSeek: false,
                loop: false,
                enableCaption: true,
              ),
            ),
            showVideoProgressIndicator: true,
          );
        }
      }
    }
                                  //  if (element.localName == 'iframe') {
                                  //   final iframeSrc = element.attributes['src'];

                                  //   // If the iframe is a YouTube video, handle it
                                  //   if (iframeSrc != null &&
                                  //       iframeSrc.contains("youtube.com")) {
                                  //     return SizedBox(
                                  //       height: 300,
                                  //       width: double.infinity,
                                  //       child: WebView(
                                  //         initialUrl: iframeSrc,
                                  //         javascriptMode:
                                  //             JavascriptMode.unrestricted,
                                  //       ),
                                  //     );
                                  //   }
                                  // }
                                  else if (element.localName == 'table') {
     
        return  AutoResizeWebView(htmlContent: element.outerHtml,);
       
      }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              HtmlWidget(
                                """${GlobalLists.newsLettersList[widget.indexIs!].detailPageUrl} """,
                                customWidgetBuilder: (element) {
                                  if (element.localName == 'video') {
                                    final src = element.children
                                        .firstWhere(
                                            (e) => e.localName == 'source')
                                        .attributes['src'];
                                    if (src != null &&
                                        src.contains('youtube.com')) {
                                      return SizedBox(
                                        height: 300,
                                        width: double.infinity,
                                        child: WebView(
                                          initialUrl: src,
                                          javascriptMode:
                                              JavascriptMode.unrestricted,
                                        ),
                                      );
                                    }
                                  } else
                                  //  if (element.localName == 'iframe') {
                                  //   final iframeSrc = element.attributes['src'];

                                  //   // If the iframe is a YouTube video, handle it
                                  //   if (iframeSrc != null &&
                                  //       iframeSrc.contains("youtube.com")) {
                                  //     return SizedBox(
                                  //       height: 300,
                                  //       width: double.infinity,
                                  //       child: WebView(
                                  //         initialUrl: iframeSrc,
                                  //         javascriptMode:
                                  //             JavascriptMode.unrestricted,
                                  //       ),
                                  //     );
                                  //   }
                                  // }
                                  if (element.localName == 'iframe') {
      final iframeSrc = element.attributes['src'];

      if (iframeSrc != null && iframeSrc.contains("youtube.com")) {
        final videoId = YoutubePlayer.convertUrlToId(iframeSrc);

        if (videoId != null) {
          return YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: videoId,
              flags: YoutubePlayerFlags(
                autoPlay: false,
                disableDragSeek: false,
                loop: false,
                enableCaption: true,
              ),
            ),
            showVideoProgressIndicator: true,
          );
        }
      }
    }
                                  else if (element.localName == 'table') {
     
        return  AutoResizeWebView(htmlContent: element.outerHtml,);
       
      }
                                  return null;
                                },
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //       right: 60, left: 60, top: 20),
                              //   child: Image.asset(
                              //     "assets/newImages/flowers_footer.png",
                              //   ),
                              // ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.only(right: 0, left: 0),
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
                        )
                      : widget.callfrom == 2
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 8, bottom: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HtmlWidget(
                                    """${GlobalLists.homeceomsglist[widget.indexIs!].title} """,
                                    customWidgetBuilder: (element) {
                                      if (element.localName == 'video') {
                                        final src = element.children
                                            .firstWhere(
                                                (e) => e.localName == 'source')
                                            .attributes['src'];
                                        if (src != null &&
                                            src.contains('youtube.com')) {
                                          return SizedBox(
                                            height: 300,
                                            width: double.infinity,
                                            child: WebView(
                                              initialUrl: src,
                                              javascriptMode:
                                                  JavascriptMode.unrestricted,
                                            ),
                                          );
                                        }
                                      } else 
                                      if (element.localName == 'iframe') {
      final iframeSrc = element.attributes['src'];

      if (iframeSrc != null && iframeSrc.contains("youtube.com")) {
        final videoId = YoutubePlayer.convertUrlToId(iframeSrc);

        if (videoId != null) {
          return YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: videoId,
              flags: YoutubePlayerFlags(
                autoPlay: false,
                disableDragSeek: false,
                loop: false,
                enableCaption: true,
              ),
            ),
            showVideoProgressIndicator: true,
          );
        }
      }
    }
                                      // if (element.localName ==
                                      //     'iframe') {
                                      //   final iframeSrc =
                                      //       element.attributes['src'];

                                      //   // If the iframe is a YouTube video, handle it
                                      //   if (iframeSrc != null &&
                                      //       iframeSrc.contains("youtube.com")) {
                                      //     return SizedBox(
                                      //       height: 300,
                                      //       width: double.infinity,
                                      //       child: WebView(
                                      //         initialUrl: iframeSrc,
                                      //         javascriptMode:
                                      //             JavascriptMode.unrestricted,
                                      //       ),
                                      //     );
                                      //   }
                                      // }
                                      return null;
                                    },
                                  ),
                                  HtmlWidget(
                                    """${GlobalLists.homeceomsglist[widget.indexIs!].details} """,
                                    customWidgetBuilder: (element) {
                                      if (element.localName == 'video') {
                                        final src = element.children
                                            .firstWhere(
                                                (e) => e.localName == 'source')
                                            .attributes['src'];
                                        if (src != null &&
                                            src.contains('youtube.com')) {
                                          return SizedBox(
                                            height: 300,
                                            width: double.infinity,
                                            child: WebView(
                                              initialUrl: src,
                                              javascriptMode:
                                                  JavascriptMode.unrestricted,
                                            ),
                                          );
                                        }
                                      } else if (element.localName == 'iframe') {
      final iframeSrc = element.attributes['src'];

      if (iframeSrc != null && iframeSrc.contains("youtube.com")) {
        final videoId = YoutubePlayer.convertUrlToId(iframeSrc);

        if (videoId != null) {
          return YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: videoId,
              flags: YoutubePlayerFlags(
                autoPlay: false,
                disableDragSeek: false,
                loop: false,
                enableCaption: true,
              ),
            ),
            showVideoProgressIndicator: true,
          );
        }
      }
    }
                                      // if (element.localName ==
                                      //     'iframe') {
                                      //   final iframeSrc =
                                      //       element.attributes['src'];

                                      //   // If the iframe is a YouTube video, handle it
                                      //   if (iframeSrc != null &&
                                      //       iframeSrc.contains("youtube.com")) {
                                      //     return SizedBox(
                                      //       height: 300,
                                      //       width: double.infinity,
                                      //       child: WebView(
                                      //         initialUrl: iframeSrc,
                                      //         javascriptMode:
                                      //             JavascriptMode.unrestricted,
                                      //       ),
                                      //     );
                                      //   }
                                      // }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),

                                  // Padding(
                                  //   padding: const EdgeInsets.only(
                                  //       right: 60, left: 60, top: 20),
                                  //   child: Image.asset(
                                  //     "assets/newImages/flowers_footer.png",
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 0, left: 0),
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
                            )
                          : widget.callfrom == 3
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 8, bottom: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      HtmlWidget(
                                        """${GlobalLists.homeceoList[widget.indexIs!].title} """,
                                        customWidgetBuilder: (element) {
                                          if (element.localName == 'video') {
                                            final src = element.children
                                                .firstWhere((e) =>
                                                    e.localName == 'source')
                                                .attributes['src'];
                                            if (src != null &&
                                                src.contains('youtube.com')) {
                                              return SizedBox(
                                                height: 300,
                                                width: double.infinity,
                                                child: WebView(
                                                  initialUrl: src,
                                                  javascriptMode: JavascriptMode
                                                      .unrestricted,
                                                ),
                                              );
                                            }
                                          } else if (element.localName == 'iframe') {
      final iframeSrc = element.attributes['src'];

      if (iframeSrc != null && iframeSrc.contains("youtube.com")) {
        final videoId = YoutubePlayer.convertUrlToId(iframeSrc);

        if (videoId != null) {
          return YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: videoId,
              flags: YoutubePlayerFlags(
                autoPlay: false,
                disableDragSeek: false,
                loop: false,
                enableCaption: true,
              ),
            ),
            showVideoProgressIndicator: true,
          );
        }
      }
    }
                                          // if (element.localName ==
                                          //     'iframe') {
                                          //   final iframeSrc =
                                          //       element.attributes['src'];

                                          //   // If the iframe is a YouTube video, handle it
                                          //   if (iframeSrc != null &&
                                          //       iframeSrc
                                          //           .contains("youtube.com")) {
                                          //     return SizedBox(
                                          //       height: 300,
                                          //       width: double.infinity,
                                          //       child: WebView(
                                          //         initialUrl: iframeSrc,
                                          //         javascriptMode: JavascriptMode
                                          //             .unrestricted,
                                          //       ),
                                          //     );
                                          //   }
                                          // }
                                          return null;
                                        },
                                      ),
                                      HtmlWidget(
                                        '${GlobalLists.homeceoList[widget.indexIs!].details}',
                                        customWidgetBuilder: (element) {
                                          if (element.localName == 'video') {
                                            final src = element.children
                                                .firstWhere((e) =>
                                                    e.localName == 'source')
                                                .attributes['src'];
                                            if (src != null &&
                                                src.contains('youtube.com')) {
                                              return SizedBox(
                                                height: 300,
                                                width: double.infinity,
                                                child: WebView(
                                                  initialUrl: src,
                                                  javascriptMode: JavascriptMode
                                                      .unrestricted,
                                                ),
                                              );
                                            }
                                          } else  if (element.localName == 'iframe') {
      final iframeSrc = element.attributes['src'];

      if (iframeSrc != null && iframeSrc.contains("youtube.com")) {
        final videoId = YoutubePlayer.convertUrlToId(iframeSrc);

        if (videoId != null) {
          return YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: videoId,
              flags: YoutubePlayerFlags(
                autoPlay: false,
                disableDragSeek: false,
                loop: false,
                enableCaption: true,
              ),
            ),
            showVideoProgressIndicator: true,
          );
        }
      }
    }
                                          // if (element.localName ==
                                          //     'iframe') {
                                          //   final iframeSrc =
                                          //       element.attributes['src'];

                                          //   // If the iframe is a YouTube video, handle it
                                          //   if (iframeSrc != null &&
                                          //       iframeSrc
                                          //           .contains("youtube.com")) {
                                          //     return SizedBox(
                                          //       height: 300,
                                          //       width: double.infinity,
                                          //       child: WebView(
                                          //         initialUrl: iframeSrc,
                                          //         javascriptMode: JavascriptMode
                                          //             .unrestricted,
                                          //       ),
                                          //     );
                                          //   }
                                          // }
                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 0, left: 0),
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
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 8, top: 8, bottom: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      HtmlWidget(
                                        """${GlobalLists.searcharticlelisting[widget.indexIs!]['detail_page_url']} """,
                                        customWidgetBuilder: (element) {
                                          if (element.localName == 'video') {
                                            final src = element.children
                                                .firstWhere((e) =>
                                                    e.localName == 'source')
                                                .attributes['src'];
                                            if (src != null &&
                                                src.contains('youtube.com')) {
                                              return SizedBox(
                                                height: 300,
                                                width: double.infinity,
                                                child: WebView(
                                                  initialUrl: src,
                                                  javascriptMode: JavascriptMode
                                                      .unrestricted,
                                                ),
                                              );
                                            }
                                          } else if (element.localName == 'iframe') {
      final iframeSrc = element.attributes['src'];

      if (iframeSrc != null && iframeSrc.contains("youtube.com")) {
        final videoId = YoutubePlayer.convertUrlToId(iframeSrc);

        if (videoId != null) {
          return YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: videoId,
              flags: YoutubePlayerFlags(
                autoPlay: false,
                disableDragSeek: false,
                loop: false,
                enableCaption: true,
              ),
            ),
            showVideoProgressIndicator: true,
          );
        }
      }
    }
                                          // if (element.localName ==
                                          //     'iframe') {
                                          //   final iframeSrc =
                                          //       element.attributes['src'];

                                          //   // If the iframe is a YouTube video, handle it
                                          //   if (iframeSrc != null &&
                                          //       iframeSrc
                                          //           .contains("youtube.com")) {
                                          //     return SizedBox(
                                          //       height: 300,
                                          //       width: double.infinity,
                                          //       child: WebView(
                                          //         initialUrl: iframeSrc,
                                          //         javascriptMode: JavascriptMode
                                          //             .unrestricted,
                                          //       ),
                                          //     );
                                          //   }
                                          // }
                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                     
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 0, left: 0),
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
                                )
                ],
              ),
            ),

            // TextSpan(

            // ),
          ],
        ));
  }
}

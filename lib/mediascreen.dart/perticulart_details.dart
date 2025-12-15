
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/AutoResizeWebView.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';

import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Perticulardetails extends StatefulWidget {
  final String? title;
  final String? image;
  final String? details;

  const Perticulardetails({Key? key, this.title, this.image, this.details})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return PerticulardetailsState();
  }
}

class PerticulardetailsState extends State<Perticulardetails>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  void initState() {
    super.initState();
print("DETAIL AFRICA FLOATING SCREEN");
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
            
          },
          titleshowingindex: "1",
          title: widget.title!,
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
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 8, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HtmlWidget(
                          """${widget.title} """,
                           customWidgetBuilder: (element) {
                            
                            
              if (element.localName == 'video') {
               
                final src = element.children.firstWhere((e) => e.localName == 'source').attributes['src'];
                if (src != null && src.contains('youtube.com')) {
                  return SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: WebView(
                      initialUrl: src,
                      javascriptMode: JavascriptMode.unrestricted,
                    ),
                  );
                }
              }else if (element.localName == 'iframe') {
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
              //   if (iframeSrc != null && iframeSrc.contains("youtube.com")) {
              //     return SizedBox(
              //       height: 300,
              //       width: double.infinity,
              //       child: WebView(
              //         initialUrl: iframeSrc,
              //         javascriptMode: JavascriptMode.unrestricted,
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
                        HtmlWidget(
 """${widget.details} """,
  customWidgetBuilder: (element) {
    
    /// YOUTUBE IFRAME
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

    /// HTML <video> tags (local MP4)
    if (element.localName == 'video') {
      final src = element.children
          .firstWhere((e) => e.localName == 'source')
          .attributes['src'];

      if (src != null) {
        return Text(
            "❗ Native video playback inside HTML is not supported.\nUse a custom player.");
      }
    }

    /// TABLE HANDLING
    if (element.localName == 'table') {
      return AutoResizeWebView(htmlContent: element.outerHtml);
    }

    return null;
  },
)
//                         HtmlWidget(
//   """${widget.details} """,
//   customWidgetBuilder: (element) {
//     // ---------------------------------------
//     // VIDEO TAG (<video>)
//     // ---------------------------------------
//     if (element.localName == 'video') {
//        print("video");
//                 print(element.localName);
//       var sourceTag = element.children.firstWhere(
//         (e) => e.localName == 'source',
      
//       );

//       if (sourceTag == null) return null;

//       final src = sourceTag.attributes['src'];
//       if (src == null) return null;

//       final html = """
//       <html>
//       <body style="margin:0;padding:0;background:black;">
//         <video width="100%" height="100%" controls playsinline>
//           <source src="$src" type="video/mp4">
//         </video>
//       </body>
//       </html>
//       """;

//       return SizedBox(
//         height: 250,
//         child: WebView(
//           initialUrl: Uri.dataFromString(
//             html,
//             mimeType: 'text/html',
//             encoding: Encoding.getByName('utf-8'),
//           ).toString(),
//           javascriptMode: JavascriptMode.unrestricted,
//         ),
//       );
//     }

//     // ---------------------------------------
//     // IFRAME (YOUTUBE EMBED)
//     // ---------------------------------------
//    if (element.localName == 'iframe') {
//   print("iframe detected");

//   final iframeSrc = element.attributes['src'];

//   if (iframeSrc != null && iframeSrc.contains("youtube.com")) {
//     print(iframeSrc);
//     print("youtube detected");
//     final html = """
//     <html>
//     <body style="margin:0;padding:0;">
//       <iframe 
//         src="$iframeSrc"
//         width="100%"
//         height="100%"
//         frameborder="0"
//         allow="autoplay; encrypted-media"
//         allowfullscreen>
//       </iframe>
//     </body>
//     </html>
//     """;

//     return SizedBox(
//       height: 300,
//       child: WebView(
//         initialUrl: Uri.dataFromString(
//           html,
//           mimeType: 'text/html',
//           encoding: Encoding.getByName('utf-8'),
//         ).toString(),
//         javascriptMode: JavascriptMode.unrestricted,
//         initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
//         gestureNavigationEnabled: true,
//       ),
//     );
//   }
// }


//     // ---------------------------------------
//     // TABLE TAG
//     // ---------------------------------------
//     if (element.localName == 'table') {
//        print("table");
//                 print(element.localName);
//       return AutoResizeWebView(htmlContent: element.outerHtml);
//     }

//     return null; // THIS IS VALID
//   },
// )
,
//                         HtmlWidget(
//     """${widget.details} """,
//   customWidgetBuilder: (element) {
//     //---------------------------------------------------------------------------
//     // 1️⃣ Handle <video> (MP4 Videos)
//     //---------------------------------------------------------------------------
//     if (element.localName == 'video') {
//       final source = element.children
//           .firstWhere((e) => e.localName == 'source', orElse: () => null);

//       final src = source?.attributes['src'];

//       if (src != null && src.isNotEmpty) {
//         final html = """
//         <html>
//           <body style="margin:0;padding:0;background-color:black;">
//             <video width="100%" height="100%" controls playsinline>
//               <source src="$src" type="video/mp4">
//             </video>
//           </body>
//         </html>
//         """;

//         return SizedBox(
//           height: 250,
//           child: WebView(
//             initialUrl: Uri.dataFromString(
//               html,
//               mimeType: 'text/html',
//               encoding: Encoding.getByName('utf-8'),
//             ).toString(),
//             javascriptMode: JavascriptMode.unrestricted,
//           ),
//         );
//       }
//     }

//     //---------------------------------------------------------------------------
//     // 2️⃣ Handle <iframe> (YouTube Embeds)
//     //---------------------------------------------------------------------------
//     if (element.localName == 'iframe') {
//       final iframeSrc = element.attributes['src'];

//       if (iframeSrc != null && iframeSrc.contains("youtube.com")) {
//         final html = """
//         <html>
//           <body style="margin:0;padding:0;">
//             <iframe 
//               src="$iframeSrc"
//               width="100%" 
//               height="100%" 
//               frameborder="0"
//               allowfullscreen
//               allow="autoplay; encrypted-media">
//             </iframe>
//           </body>
//         </html>
//         """;

//         return SizedBox(
//           height: 300,
//           child: WebView(
//             initialUrl: Uri.dataFromString(
//               html,
//               mimeType: 'text/html',
//             ).toString(),
//             javascriptMode: JavascriptMode.unrestricted,
//           ),
//         );
//       }
//     }

//     //---------------------------------------------------------------------------
//     // 3️⃣ Handle <table> (PDF icons, formatted content)
//     //---------------------------------------------------------------------------
//     if (element.localName == 'table') {
//       // Use AutoResizeWebView EXACTLY as you used before
//       return AutoResizeWebView(htmlContent: element.outerHtml);
//     }

//     return null;
//   },
// ),

//                         HtmlWidget(
//                           """${widget.details} """,
//                           customWidgetBuilder: (element) {
                            
//   // Handle <video> tag
//   if (element.localName == 'video') {
   
//     final src = element.children
//         .firstWhere((e) => e.localName == 'source')
//         .attributes['src'];

//     if (src != null) {
//       // Wrap inside HTML
//       final html = """
//       <html>
//       <body style="margin:0;padding:0;">
//         <video width="100%" height="100%" controls playsinline>
//           <source src="$src" type="video/mp4">
//         </video>
//       </body>
//       </html>
//       """;

//       return SizedBox(
//         height: 250,
//         child: WebView(
//           initialUrl: Uri.dataFromString(
//             html,
//             mimeType: 'text/html',
//             encoding: Encoding.getByName('utf-8'),
//           ).toString(),
//           javascriptMode: JavascriptMode.unrestricted,
//         ),
//       );
//     }
//   }

//   // Handle YouTube iframe
//   if (element.localName == 'iframe') {
    
//     final iframeSrc = element.attributes['src'];

//     if (iframeSrc != null && iframeSrc.contains("youtube.com")) {
//       final html = """
//       <html>
//       <body style="margin:0;padding:0;">
//         <iframe 
//           src="$iframeSrc"
//           width="100%" 
//           height="100%" 
//           frameborder="0"
//           allowfullscreen
//           allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture">
//         </iframe>
//       </body>
//       </html>
//       """;

//       return SizedBox(
//         height: 300,
//         child: WebView(
//           initialUrl: Uri.dataFromString(
//             html,
//             mimeType: 'text/html',
//             encoding: Encoding.getByName('utf-8'),
//           ).toString(),
//           javascriptMode: JavascriptMode.unrestricted,
//         ),
//       );
//     }
//   }

//   // Handle <table> tag
//   if (element.localName == 'table') {
//     return AutoResizeWebView(htmlContent: element.outerHtml);
//   }

//   return null;
// },

      //                      customWidgetBuilder: (element) {
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
      //         }else if (element.localName == 'table') {
     
      //   return  AutoResizeWebView(htmlContent: element.outerHtml,);
       
      // }
      //         return null;
      //       },
                      //  ),
                        SizedBox(
                          height: 15,
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

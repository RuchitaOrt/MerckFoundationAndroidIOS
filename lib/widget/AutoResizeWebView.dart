
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class AutoResizeWebView extends StatefulWidget {
//   final String htmlContent;
//   const AutoResizeWebView({required this.htmlContent});

//   @override
//   _AutoResizeWebViewState createState() => _AutoResizeWebViewState();
// }

// class _AutoResizeWebViewState extends State<AutoResizeWebView> {
//   double _webViewHeight = 100;

//   @override
//   Widget build(BuildContext context) {
//     return 
//     SizedBox(
//   height: _webViewHeight,
//   child: WebView(
//   initialUrl: Uri.dataFromString(
//   '''
//   <html>
//     <head>
//       <meta name="viewport" content="width=device-width, initial-scale=1.0">
//       <style>
//         table {
//           width: 100%;
//           border-collapse: collapse;
//         }
//         th, td {
//           border: 1px solid black; /* Ensures both vertical and horizontal lines */
//           padding: 8px;
//           text-align: left;
//         }
//       </style>
//       <script>
//         function sendHeight() {
//           var height = document.body.scrollHeight;
//           if (window.FlutterPostMessage) {
//             FlutterPostMessage.postMessage(height);
//           }
//         }
//         window.onload = sendHeight;
//       </script>
//     </head>
//     <body>
//       ${widget.htmlContent}
//     </body>
//   </html>
//   ''',
//   mimeType: 'text/html',
// ).toString(),


//     javascriptMode: JavascriptMode.unrestricted,
//     javascriptChannels: {
//       JavascriptChannel(
//         name: 'FlutterPostMessage',
//         onMessageReceived: (JavascriptMessage message) {
//           setState(() {
//             _webViewHeight = double.tryParse(message.message) ?? 100;
//           });
//         },
//       ),
//     },
//     navigationDelegate: (NavigationRequest request) {
//       final url = request.url;
//       if (url.endsWith('.pdf')) {
//         _launchURL(url);
//         return NavigationDecision.prevent;
//       }
//       return NavigationDecision.navigate;
//     },
//   ),
// );

    
//   }
//   //   _launchURL(String urlIs) async {
//   //   var url = urlIs;
//   //   if (await canLaunch(url)) {
//   //     await launch(url);
//   //   } else {
//   //     throw 'Could not launch $url';
//   //   }
//   // }
//     Future<void> _launchURL(String urlIs) async {
//   final Uri uri = Uri.parse(urlIs);

//   if (!await launchUrl(
//     uri,
//     mode: LaunchMode.externalApplication,
//   )) {
//     throw 'Could not launch $uri';
//   }
// }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AutoResizeWebView extends StatefulWidget {
  final String htmlContent;

  const AutoResizeWebView({super.key, required this.htmlContent});

  @override
  State<AutoResizeWebView> createState() => _AutoResizeWebViewState();
}

class _AutoResizeWebViewState extends State<AutoResizeWebView> {
  double height = 1; // start with 1px to avoid jumps

  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        backgroundColor: Colors.transparent,

        onWebViewCreated: (ctrl) async {
          controller = ctrl;

          await controller.loadUrl(Uri.dataFromString("""
              <!DOCTYPE html>
              <html>
              <head>
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <style>
                  body { margin: 0; padding: 0; }
                  table { width: 100%; border-collapse: collapse; }
                </style>
              </head>
              <body>
                ${widget.htmlContent}
                <script>
                  function updateHeight() {
                      let h = document.body.scrollHeight;
                      Height.postMessage(h.toString());
                  }
                  window.onload = updateHeight;
                  window.addEventListener("resize", updateHeight);
                  setTimeout(updateHeight, 300); // ensure proper height after render
                </script>
              </body>
              </html>
            """,
              mimeType: 'text/html',
              encoding: const Utf8Codec())
              .toString());
        },

        javascriptChannels: {
          JavascriptChannel(
            name: 'Height',
            onMessageReceived: (msg) {
              double h = double.tryParse(msg.message) ?? 100;

              // avoid huge space + shrinking flickers
              if (h < 50) h = 50;

              setState(() => height = h.toDouble());
            },
          )
        },

        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith("http")) {
            ShowDialogs.launchURL(request.url);
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}

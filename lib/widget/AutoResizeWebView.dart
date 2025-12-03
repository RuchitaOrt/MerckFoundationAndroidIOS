
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AutoResizeWebView extends StatefulWidget {
  final String htmlContent;
  const AutoResizeWebView({required this.htmlContent});

  @override
  _AutoResizeWebViewState createState() => _AutoResizeWebViewState();
}

class _AutoResizeWebViewState extends State<AutoResizeWebView> {
  double _webViewHeight = 100;

  @override
  Widget build(BuildContext context) {
    return 
    SizedBox(
  height: _webViewHeight,
  child: WebView(
  initialUrl: Uri.dataFromString(
  '''
  <html>
    <head>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <style>
        table {
          width: 100%;
          border-collapse: collapse;
        }
        th, td {
          border: 1px solid black; /* Ensures both vertical and horizontal lines */
          padding: 8px;
          text-align: left;
        }
      </style>
      <script>
        function sendHeight() {
          var height = document.body.scrollHeight;
          if (window.FlutterPostMessage) {
            FlutterPostMessage.postMessage(height);
          }
        }
        window.onload = sendHeight;
      </script>
    </head>
    <body>
      ${widget.htmlContent}
    </body>
  </html>
  ''',
  mimeType: 'text/html',
).toString(),


    javascriptMode: JavascriptMode.unrestricted,
    javascriptChannels: {
      JavascriptChannel(
        name: 'FlutterPostMessage',
        onMessageReceived: (JavascriptMessage message) {
          setState(() {
            _webViewHeight = double.tryParse(message.message) ?? 100;
          });
        },
      ),
    },
    navigationDelegate: (NavigationRequest request) {
      final url = request.url;
      if (url.endsWith('.pdf')) {
        _launchURL(url);
        return NavigationDecision.prevent;
      }
      return NavigationDecision.navigate;
    },
  ),
);

    
  }
  //   _launchURL(String urlIs) async {
  //   var url = urlIs;
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
    Future<void> _launchURL(String urlIs) async {
  final Uri uri = Uri.parse(urlIs);

  if (!await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $uri';
  }
}
}

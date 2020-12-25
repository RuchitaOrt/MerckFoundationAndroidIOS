import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/customappbar.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:webview_flutter/webview_flutter.dart';

class VideoPlayer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WebPageState();
  }
}

class WebPageState extends State<VideoPlayer> {
  @override
  void initState() {
    super.initState();

    // _launchInWebViewWithJavaScript(
    //     "https://www.youtube.com/watch?v=XP-4BiWsuaQ");
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWebview(
        () {
          Navigator.pop(context);
        },
        2,
        height: 160,
      ),
      body: WebView(
        initialUrl: 'https://youtu.be/1l3oLvJXnIA',
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (NavigationRequest request) {
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}

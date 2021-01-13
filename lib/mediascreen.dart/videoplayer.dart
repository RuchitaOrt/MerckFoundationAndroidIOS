import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/customappbar.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';


class VideoPlayer extends StatefulWidget {
  final String videoUrl ;

  const VideoPlayer({Key key, this.videoUrl}) : super(key: key);

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
        appBar: InnerCustomAppBar(
        onTapval: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Dashboard(index: 0,)));
        },
        index: 1,
        title: widget.videoUrl,
        titleImg: "assets/newImages/flowers-1.png",
        trallingImg1: "assets/newImages/share.png",
       trallingImg2: "assets/newImages/search.png",

       
        height: 85,
      ),
      body: WebView(
        initialUrl: widget.videoUrl,
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (NavigationRequest request) {
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}

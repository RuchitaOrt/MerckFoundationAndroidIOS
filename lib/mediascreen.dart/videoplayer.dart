import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';

class VideoPlayer extends StatefulWidget {
  final String videoUrl;

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
      // appBar: InnerCustomAppBar(
      //   onTapval: () {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //             builder: (BuildContext context) => Dashboard(
      //                   index: 0,
      //                 )));
      //   },
      //   index: 1,
      //   title: widget.videoUrl,
      //   titleImg: "assets/newImages/flowers-1.png",
      //   trallingImg1: "assets/newImages/share.png",
      //   trallingImg2: "assets/newImages/search.png",
      //   height: 85,
      // ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Customcolor.baby_blue,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Customcolor.colorVoilet,
                ),
              )),
          title: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  // child: FormLabel(
                  //   text: widget.videoUrl,
                  //   fontSize: 17,
                  //   maxLines: 3,
                  //   fontweight: FontWeight.w700,
                  //   labelColor: Customcolor.text_blue,

                  // ),
                  child: Text(
                    widget.videoUrl,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Customcolor.text_blue,
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                    maxLines: 2,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  "assets/newImages/toolflowerfortext.png",
                  height: 35,
                )
              ],
            ),
          ),
        ),
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

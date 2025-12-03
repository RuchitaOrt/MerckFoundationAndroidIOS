import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/AutoResizeWebView.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:html/parser.dart' show parse;
import 'package:webview_flutter/webview_flutter.dart';

class StemInnerPages extends StatefulWidget {
  final String? title;
  final String? details;

  const StemInnerPages({Key? key, this.title, this.details}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return StemInnerPagesState();
  }
}

class StemInnerPagesState extends State<StemInnerPages>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  double imgHeight = 50;
  String _platformVersion = 'Unknown';
  final String htmlData = """
    <h1>Hello, Flutter!</h1>
    <p>This is a <strong>scrollable</strong> HTML content.</p>
    <p>Scroll down to see more content.</p>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
  """;

  //  final String htmlContent = """
  //       <h1>Watch this YouTube Video</h1>
  //       <p>This is a simple way to embed YouTube videos:</p>
  //       <video width="100%" height="300" controls>
  //         <source src="https://www.youtube.com/watch?v=o1T_IEy2yi0" type="video/mp4">
  //         Your browser does not support the video tag.
  //       </video>
  //     """;
  final String htmlContent = """
        <h1>Watch this YouTube Video</h1>
        <p>This is a simple way to embed YouTube videos:</p>
        <iframe allowfullscreen="" frameborder="0" height="349" mozallowfullscreen="" src="https://www.youtube.com/embed/ucWHk1yA5tU" webkitallowfullscreen="" width="560"></iframe>
      """;
  @override
  void initState() {
    // getvision();
    super.initState();

    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Customcolor.background,
        appBar: InnerCustomAppBar(
          onTapvalfilter: () {},
          onTapval: () {
            Navigator.pop(context);
       
          },
          index: 2,
          title: widget.title!,
          titleImg: "assets/newImages/vision_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Stack(
          children: [
            ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 2, right: 1, top: 8, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      SingleChildScrollView(
                        // scrollDirection: Axis.,
                        //22jan
                        child:

            HtmlWidget(
             '${widget.details}',
             // htmlContent,
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
              }else  if (element.localName == 'iframe') {
                final iframeSrc = element.attributes['src'];

                // If the iframe is a YouTube video, handle it
                if (iframeSrc != null && iframeSrc.contains("youtube.com")) {
                  return SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: WebView(
                      initialUrl: iframeSrc,
                      javascriptMode: JavascriptMode.unrestricted,
                    ),
                  );
                }
              }else if (element.localName == 'table') {
     
        return  AutoResizeWebView(htmlContent: element.outerHtml,);
       
      }
              return null;
            },),
                    //           HtmlWidget('${widget.details}')),
                       ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
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
                  height: 40,
                ),
              ],
            ),

            // TextSpan(

            // ),

            Align(alignment: Alignment.bottomCenter, child: Bottomcardlink()),
          ],
        ));
  }

}


class YoutubeWidgetFactory extends WidgetFactory {
   buildIframeWidget(BuildContext? context, String? url,
      {double? width, double? height}) {
    if (url!.contains("youtube.com") || url.contains("youtu.be")) {
      return SizedBox(
        height: 200,
        width: double.infinity,
        child: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      );
    }
    //  return super.buildIframeWidget(context, url, width: width, height: height);
  }
}

class HtmlWidgetExample extends StatelessWidget {
  final String? pageContent;

  HtmlWidgetExample({ this.pageContent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YouTube Video in HTML"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: HtmlWidget(
            pageContent!,
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
              }else  if (element.localName == 'iframe') {
                final iframeSrc = element.attributes['src'];

                // If the iframe is a YouTube video, handle it
                if (iframeSrc != null && iframeSrc.contains("youtube.com")) {
                  return SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: WebView(
                      initialUrl: iframeSrc,
                      javascriptMode: JavascriptMode.unrestricted,
                    ),
                  );
                }
              }else if (element.localName == 'table') {
     
        return  AutoResizeWebView(htmlContent: element.outerHtml,);
       
      }
              return null;
            },
          ),
        ),
      ),
    );
  }
}

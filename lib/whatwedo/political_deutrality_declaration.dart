// ignore_for_file: unused_import, camel_case_types, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:merckfoundation22dec/model/dataprivacy.dart';

import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/AutoResizeWebView.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../model/PoliticalDeutrality.dart';

class political_deutrality_declaration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return political_deutrality_declarationState();
  }
}

class political_deutrality_declarationState
    extends State<political_deutrality_declaration>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  final GlobalKey<State> skey = new GlobalKey<State>();

  @override
  void initState() {
    super.initState();
    getdataprivacy();
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
            //  Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Dashboard(
                          index: 0,
                        )));
          },
          index: 2,
          title: "Political Neutrality Declaration",
          sharelink: Constantstring.sharedataprivacy,
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
              child: GlobalLists.political.length == 0
                  ? Container(
                      child: Center(child: Text(Constantstring.emptyData)),
                    )
                  : ListView(
                      shrinkWrap: true,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 8, top: 8, bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Html(
                              //   data:
                              //       """${GlobalLists.political[0].pageContent}""",
                              //   onLinkTap:
                              //       (url, renderContext, attributes, element) {
                              //     print("Opening $url...");
                              //     ShowDialogs.launchURL(url);
                              //   },
                              //   style: {
                              //     "tr": Customcolor.tableboderstyle(context),
                              //   },
                              // ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: HtmlWidget(
                                    GlobalLists.political[0].pageContent!,
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
                      ],
                    ),
            ),

            // TextSpan(

            // ),
          ],
        ));
  }

  getdataprivacy() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, skey);

      APIManager().apiRequest(
        context,
        API.political,
        (response) async {
          PoliticalDeutrality resp = response;
          print(response);
          print('Resp : $resp');

          Navigator.of(skey.currentContext!).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.political = resp.data!.list!;
            });
          } else {
            ShowDialogs.showToast(resp.msg!);
          }
        },
        (error) {
          print('ERR msg is $error');
          Navigator.of(skey.currentContext!).pop();
        },
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

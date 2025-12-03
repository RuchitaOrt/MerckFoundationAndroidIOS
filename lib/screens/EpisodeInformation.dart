import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:merckfoundation22dec/ViewmoreAlbum.dart';
import 'package:merckfoundation22dec/model/GetEpisodeDataResponse.dart';
import 'package:merckfoundation22dec/screens/Episodeseason.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/customHorizontalCard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';

import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:merckfoundation22dec/utility/ResponsiveFlutter.dart';

class EpisodeInformation extends StatefulWidget {
  final dynamic showbrief;
  final dynamic episodebrief;
  final dynamic guestinfo;
  final dynamic credits;
  final dynamic relatednews;
  final dynamic photid;
  final dynamic episodeid;
  const EpisodeInformation(
      {Key? key,
      this.showbrief,
      this.episodebrief,
      this.guestinfo,
      this.credits,
      this.relatednews,
      this.photid,
      this.episodeid})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return EpisodeInformationState();
  }
}

class EpisodeInformationState extends State<EpisodeInformation>
    with TickerProviderStateMixin {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  String baseurl = "";
  @override
  void initState() {
    getepisodeinfo(widget.episodeid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: InnerCustomAppBar(
        onTapval: () {
          Navigator.pop(context);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (BuildContext context) => Dashboard(
          //               index: 1,
          //             )));
        },
        index: 2,
        sharelink: Constantstring.cancercommunityawareness,
        title: "Episode Information",
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
                GlobalLists.episodeinfodata.length != 0
                    ? setupAlertDialoadContainer(context)
                    : Container()
              ])),
    );
  }

  Widget setupAlertDialoadContainer(context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Our Africa by Merck Foundation (TV Program) Brief:",
                maxLines: 2,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                    fontWeight: FontWeight.w700,
                    fontFamily: AppFonts.normal,
                    color: Customcolor.pink_col)),
            Html(
              data: GlobalLists.episodeinfodata[0].showBrief,
              onLinkTap: (url, attributes, element) {
                print("Opening $url...");
                ShowDialogs.launchURL(url!);
              },
              style: {
                "body": Style(textAlign: TextAlign.start),
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
            Text("Episode Brief:",
                maxLines: 2,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                    fontWeight: FontWeight.w700,
                    fontFamily: AppFonts.normal,
                    color: Customcolor.pink_col)),
            Html(
              data: GlobalLists.episodeinfodata[0].episodeBrief,
              onLinkTap: (url, attributes, element) {
                print("Opening $url...");
                ShowDialogs.launchURL(url!);
              },
              style: {
                "body": Style(textAlign: TextAlign.start),
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
            Text("Guests & Designer Information:",
                maxLines: 2,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                    fontWeight: FontWeight.w700,
                    fontFamily: AppFonts.normal,
                    color: Customcolor.pink_col)),
            Html(
              data: GlobalLists.episodeinfodata[0].guestInfo,
              onLinkTap: (url, attributes, element) {
                print("Opening $url...");
                ShowDialogs.launchURL(url!);
              },
              style: {
                "body": Style(textAlign: TextAlign.start),
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
            Text("Credits:",
                maxLines: 2,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                    fontWeight: FontWeight.w700,
                    fontFamily: AppFonts.normal,
                    color: Customcolor.pink_col)),
            Html(
              data: GlobalLists.episodeinfodata[0].credits,
              onLinkTap: (url, attributes, element) {
                print("Opening $url...");
                ShowDialogs.launchURL(url!);
              },
              style: {
                "body": Style(textAlign: TextAlign.start),
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Merckepisodeseason()));
              },
              child: Container(
                width: 160,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    "Watch More Episodes",
                    style: TextStyle(
                        color: Customcolor.colorBlue,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Related News :",
                maxLines: 2,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                    fontWeight: FontWeight.w700,
                    fontFamily: AppFonts.normal,
                    color: Customcolor.colorBlue)),
            Html(
              data: GlobalLists.episodeinfodata[0].relatedNews,
              onLinkTap: (url, attributes, element) {
                print("Opening $url...");
                ShowDialogs.launchURL(url!);
              },
              style: {
                "body": Style(textAlign: TextAlign.start),
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
            Container(
              height: 330.0, // Change as per your requirement
              width: 400.0, // Change as per your requirement
              child: Padding(
                padding: const EdgeInsets.only(left: 0, top: 10),
                child: CustomHorizontalCard(
                  index: 1,
                  cardImage: "assets/newImages/gallery.png",
                  cardsubtitle: "",
                  cardTitle: "Photos",
                  btnTitle: "View More",
                  heigthoflist: SizeConfig.blockSizeVertical * 20,
                  onbtnTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => ViewmoreAlbum(
                                  apiurl: APIManager.viewmorealbum,
                                  albumtitle: GlobalLists.episodeinfodata[0]
                                      .photoList![0][0].albumName,
                                  sharelink:
                                      Constantstring.sharemmtmambassadarmmtm,
                                  albumurl: GlobalLists.episodeinfodata[0]
                                      .photoList![0][0].albumUrl,
                                )));
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (BuildContext context) =>
                    //             WatchmoreVideolibrary(
                    //               apiurl: API.watchvideommtm,
                    //               headertitle:
                    //                   "Merck Foundation More Than A Mother Videos",
                    //               sharelink: Constantstring.sharewatchallvideommtm,
                    //             )));
                  },
                  titleColor: Customcolor.pink_col,
                  titleImg: "assets/newImages/flowers-3.png",
                  list:

                      // Container()
                      ListView.builder(
                    itemCount:
                        GlobalLists.episodeinfodata[0].photoList![0].length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 8, left: 10),
                              child: Stack(
                                children: [
                                  Container(
                                    width: SizeConfig.blockSizeHorizontal * 40,
                                    height: SizeConfig.blockSizeVertical * 13,
                                    child: FadeInImage.assetNetwork(
                                      placeholder:
                                          'assets/newImages/placeholder_3.jpg',
                                      image: baseurl +
                                          GlobalLists.episodeinfodata[0]
                                              .photoList![0][index].photo!,
                                      fit: BoxFit.fill
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: SizeConfig.blockSizeHorizontal * 49,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 7),
                                child: Text(
                                  GlobalLists.episodeinfodata[0]
                                      .photoList![0][index].photoDescription!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500),
                                  // fontSize: 17,
                                  // labelColor: Colors.white,
                                  // fontweight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getepisodeinfo(String episodeid) async {
    var status1 = await ConnectionDetector.checkInternetConnection();
    // var fcm_token = SPManager().getAuthToken();
    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);
      final json = {
        'episode_id': episodeid,
      };

      print(json);
      APIManager().apiRequest(context, API.get_episode_data, (response) async {
        GetEpisodeDataResponse resp = response;
        print(response);
        print('Resp : $resp');
        Navigator.of(_keyLoader.currentContext!).pop();
        if (resp.success == true) {
          setState(() {
            baseurl = resp.photoUrl!;
            GlobalLists.episodeinfodata = resp.list!;
          });
        } else {
          // ShowDialogs.showToast(resp.msg);
          Navigator.of(_keyLoader.currentContext!).pop();
        }
      }, (error) {
        Navigator.of(_keyLoader.currentContext!).pop();
        print('ERR msg is $error');
        ShowDialogs.showToast("Server Not Responding");
      }, jsonval: json);
    } else {
      Navigator.of(_keyLoader.currentContext!).pop();
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

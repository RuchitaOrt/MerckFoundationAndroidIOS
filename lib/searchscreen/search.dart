import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videoplayer.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:merckfoundation22dec/mediascreen.dart/Detailpage.dart';

class Search extends StatefulWidget {
  //1-video 2-News_Release

  final int categorytype;

  const Search({Key key, this.categorytype}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return SearchState();
  }
}

class SearchState extends State<Search> with TickerProviderStateMixin {
  AnimationController _controller;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  void initState() {
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Dashboard(
                          index: 0,
                        )));
          },
          index: 1,
          title: "Search",
          titleImg: "assets/newImages/vision_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: ListView(
          shrinkWrap: true,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.categorytype == 1
                ? GridView.count(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    children: List.generate(
                        GlobalLists.searchvideollisting.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 2.0),
                        child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(1),
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            VideoPlayer(
                                              videoUrl: GlobalLists
                                                      .searchvideollisting[
                                                  index]['video_link'],
                                            )));
                              },
                              child: Container(
                                color: Colors.transparent,
                                width: SizeConfig.blockSizeHorizontal * 50,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: SizeConfig.blockSizeHorizontal *
                                            100,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          // border: Border.all(
                                          //   width: 1,
                                          // ),
                                          image: new DecorationImage(
                                            image: new NetworkImage(
                                                'https://img.youtube.com/vi/${GlobalLists.searchvideollisting[index]['video_link'].substring(GlobalLists.searchvideollisting[index]['video_link'].length - 11)}/mqdefault.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        GlobalLists.searchvideollisting[index]
                                            ['video_desc'],
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                ResponsiveFlutter.of(context)
                                                    .fontSize(1.4),
                                            fontWeight: FontWeight.w500),
                                        maxLines: 3,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                  ],
                                ),
                              ),
                            )),
                      );
                    }),
                  )
                : widget.categorytype == 2
                    ? ListView.builder(
                        itemCount: GlobalLists.searchnewreleaselisting.length,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 6),
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 8, bottom: 8),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        print(Constantstring.baseUrl +
                                            GlobalLists.searchnewreleaselisting[
                                                index]['pdf_file']);
                                        _launchURL(Constantstring.baseUrl +
                                            GlobalLists.searchnewreleaselisting[
                                                index]['pdf_file']);
                                      },
                                      child: Row(
                                        children: [
                                          ClipRect(
                                            child: Image.asset(
                                              "assets/newImages/pdf.png",
                                              height: 80,
                                              width: 80,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              GlobalLists
                                                      .searchnewreleaselisting[
                                                  index]['title'],
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                      ResponsiveFlutter.of(
                                                              context)
                                                          .fontSize(1.8),
                                                  fontWeight: FontWeight.w500),
                                              maxLines: 4,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : widget.categorytype == 3
                        ? ListView.builder(
                            itemCount: GlobalLists.searcharticlelisting.length,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, bottom: 6),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Detailpage(
                                                  indexIs: index,
                                                  callfrom: 2,
                                                )));
                                  },
                                  child: Card(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 8,
                                          left: 10,
                                          right: 10,
                                          top: 8),
                                      child: Column(
                                        children: [
                                          Row(
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            //crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              ClipRect(
                                                child: FadeInImage.assetNetwork(
                                                  placeholder:
                                                      'assets/newImages/placeholder_3.jpg',
                                                  image: Constantstring
                                                          .baseUrl +
                                                      GlobalLists
                                                              .searcharticlelisting[
                                                          index]['image'],
                                                  fit: BoxFit.cover,
                                                  height: 80,
                                                  width: 80,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      GlobalLists
                                                              .searcharticlelisting[
                                                          index]['title'],
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: Customcolor
                                                              .colorblack,
                                                          fontSize:
                                                              ResponsiveFlutter
                                                                      .of(
                                                                          context)
                                                                  .fontSize(
                                                                      1.8),
                                                          fontWeight:
                                                              FontWeight.w500),
                                                      maxLines: 4,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : Container()
          ],
        ));
  }

  _launchURL(String urlIs) async {
    var url = urlIs;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

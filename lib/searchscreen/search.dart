import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/Homescreenceo.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videoplayer.dart';
import 'package:merckfoundation22dec/model/OurawarddetailResponse.dart';
import 'package:merckfoundation22dec/model/OurawarddetailResponse.dart';
import 'package:merckfoundation22dec/ourawarddetail.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/searchscreen/DetailSearchtestimonial.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:merckfoundation22dec/mediascreen.dart/Detailpage.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/slidercontainer.dart';

class Search extends StatefulWidget {
  //1-video 2-News_Release

  final int categorytype;
  final String baseurl;

  const Search({Key key, this.categorytype, this.baseurl}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return SearchState();
  }
}

class SearchState extends State<Search> with TickerProviderStateMixin {
  AnimationController _controller;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  Color color;
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
            Navigator.pop(context);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => Dashboard(
            //               index: 0,
            //             )));
          },
          index: 1,
          title: "Search",
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
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.categorytype == 1
                    ? GridView.count(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 0.9,
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
                                    var storykey = GlobalLists
                                        .searchvideollisting[index]['video_link']
                                        .substring(GlobalLists
                                                .searchvideollisting[index]
                                                    ['video_link']
                                                .length -
                                            11);
                                    ShowDialogs.youtubevideolink(
                                        "https://www.youtube.com/watch?v=${storykey}?rel=0&autoplay=1");
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (BuildContext context) =>
                                    //             VideoPlayer(
                                    //               videoUrl: GlobalLists
                                    //                       .searchvideollisting[
                                    //                   index]['video_link'],
                                    //             )));
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
                                          child: Stack(
                                            children: [
                                              Container(
                                                width:
                                                    SizeConfig.blockSizeHorizontal *
                                                        100,
                                                height:
                                                    SizeConfig.blockSizeVertical *
                                                        16,
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
                                              PauseImage()
                                            ],
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
                                        //  SizedBox(height: 5),
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
                            : widget.categorytype == 4
                                ? ListView.builder(
                                    itemCount:
                                        GlobalLists.searcheventslisting.length,
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
                                                left: 10,
                                                right: 10,
                                                top: 8,
                                                bottom: 8),
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    _launchURL(Constantstring
                                                            .baseUrl +
                                                        GlobalLists
                                                                .searcheventslisting[
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
                                                                  .searcheventslisting[
                                                              index]['title'],
                                                          overflow:
                                                              TextOverflow.ellipsis,
                                                          style: TextStyle(
                                                              color: Colors.black,
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
                                : widget.categorytype == 5
                                    ? ListView.builder(
                                        itemCount: GlobalLists
                                            .searchtestimoniallisting.length,
                                        shrinkWrap: true,
                                        physics: ScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          DetailSearchTestimonialPage(
                                                            index: index,
                                                            baseurl: widget.baseurl,
                                                          )));
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10, top: 10),
                                              child: Container(
                                                height:
                                                    SizeConfig.blockSizeVertical *
                                                        15,
                                                width:
                                                    SizeConfig.blockSizeHorizontal *
                                                        80,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(5),
                                                    color: Colors.white),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5,
                                                              bottom: 3,
                                                              left: 8,
                                                              right: 8),
                                                      child: Container(
                                                        // height: 220,
                                                        width: 100,
                                                        decoration: BoxDecoration(
                                                          //color: Colors.amber,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  10),
                                                        ),
                                                        child: FadeInImage
                                                            .assetNetwork(
                                                          placeholder:
                                                              'assets/newImages/placeholder_3.jpg',
                                                          image:
                                                              "${Constantstring.baseUrl + GlobalLists.searchtestimoniallisting[index]['image']}",
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: ListView(
                                                        shrinkWrap: true,
                                                        // crossAxisAlignment:
                                                        //     CrossAxisAlignment.start,
                                                        children: [
                                                          SizedBox(
                                                            height: 12,
                                                          ),
                                                          FormLabel(
                                                            text: GlobalLists
                                                                        .searchtestimoniallisting[
                                                                    index][
                                                                'testimonial_name'],
                                                            labelColor: Customcolor
                                                                .colorPink,
                                                            fontSize: 17,
                                                            maxLines: 1,
                                                            fontweight:
                                                                FontWeight.w700,
                                                          ),
                                                          SizedBox(
                                                            height: 4,
                                                          ),
                                                          FormLabel(
                                                            text: GlobalLists
                                                                        .searchtestimoniallisting[
                                                                    index]
                                                                ['department_name'],
                                                            labelColor:
                                                                Colors.black87,
                                                            fontSize: 13,
                                                            fontweight:
                                                                FontWeight.w600,
                                                            maxLines: 2,
                                                          ),
                                                          SizedBox(
                                                            height: 7,
                                                          ),
                                                          FormLabel(
                                                            text: GlobalLists
                                                                        .searchtestimoniallisting[
                                                                    index][
                                                                'short_description'],
                                                            labelColor:
                                                                Colors.black54,
                                                            fontSize: 13,
                                                            fontweight:
                                                                FontWeight.w500,
                                                            maxLines: 4,
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
                                    : widget.categorytype == 6
                                        ? GridView.count(
                                            shrinkWrap: true,
                                            physics: ScrollPhysics(),
                                            padding: const EdgeInsets.all(5),
                                            crossAxisSpacing: 0,
                                            mainAxisSpacing: 2,
                                            crossAxisCount: 2,
                                            childAspectRatio: 0.9,
                                            children: List.generate(
                                                GlobalLists.searchphotolisting
                                                    .length, (index) {
                                              // if (GlobalLists.viewmoremmtmlist.length - 1 == index &&
                                              //     _isLoading) {
                                              //   return Center(
                                              //     child: CircularProgressIndicator(),
                                              //   );
                                              // } else {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 2.0),
                                                child: Card(
                                                    elevation: 2,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(1),
                                                      ),
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        ShowDialogs.showImageDialog(
                                                          context: context,
                                                          image: widget.baseurl +
                                                              GlobalLists
                                                                      .searchphotolisting[
                                                                  index]['photo'],
                                                          description: GlobalLists
                                                                      .searchphotolisting[
                                                                  index]
                                                              ['photo_description'],
                                                        );
                                                      },
                                                      child: Container(
                                                        color: Colors.transparent,
                                                        width: SizeConfig
                                                                .blockSizeHorizontal *
                                                            50,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Container(
                                                                // width:
                                                                //     SizeConfig.blockSizeHorizontal *
                                                                //         100,
                                                                // height: 150,
                                                                width: SizeConfig
                                                                        .blockSizeHorizontal *
                                                                    100,
                                                                height: SizeConfig
                                                                        .blockSizeVertical *
                                                                    16,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  // border: Border.all(
                                                                  //   width: 1,
                                                                  // ),
                                                                  image:
                                                                      new DecorationImage(
                                                                    image: new NetworkImage(widget
                                                                            .baseurl +
                                                                        GlobalLists.searchphotolisting[
                                                                                index]
                                                                            [
                                                                            'photo']),
                                                                    fit:
                                                                        BoxFit.fill,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4.0),
                                                              child: Text(
                                                                GlobalLists.searchphotolisting[
                                                                        index][
                                                                    'photo_description'],
                                                                textAlign: TextAlign
                                                                    .center,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: ResponsiveFlutter.of(
                                                                            context)
                                                                        .fontSize(
                                                                            1.4),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                                maxLines: 3,
                                                              ),
                                                            ),
                                                            SizedBox(height: 5),
                                                          ],
                                                        ),
                                                      ),
                                                    )),
                                              );
                                              // }
                                            }),
                                          )
                                        : widget.categorytype == 7
                                            ? ListView.builder(
                                                itemCount: GlobalLists
                                                    .searchmedialisting.length,
                                                shrinkWrap: true,
                                                physics: ScrollPhysics(),
                                                itemBuilder: (BuildContext context,
                                                    int index) {
                                                  return Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 8,
                                                        right: 8,
                                                        bottom: 6),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    VideoPlayer(
                                                                      videoUrl: GlobalLists
                                                                                  .searchmedialisting[
                                                                              index]
                                                                          [
                                                                          'media_url'],
                                                                    )));
                                                        // _launchURL(
                                                        //     GlobalLists.merckinMediaList[index].mediaUrl);
                                                      },
                                                      child: Card(
                                                        elevation: 2,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(5),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                  left: 10,
                                                                  right: 10,
                                                                  top: 8,
                                                                  bottom: 8),
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                // mainAxisAlignment: MainAxisAlignment.start,
                                                                //crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  ClipRect(
                                                                    child: FadeInImage
                                                                        .assetNetwork(
                                                                      placeholder:
                                                                          'assets/newImages/placeholder_3.jpg',
                                                                      image: Constantstring
                                                                              .baseUrl +
                                                                          GlobalLists
                                                                                  .searchmedialisting[index]
                                                                              [
                                                                              'image'],
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      height: 80,
                                                                      width: 80,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      GlobalLists.searchmedialisting[
                                                                              index]
                                                                          ['title'],
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize: ResponsiveFlutter.of(
                                                                                  context)
                                                                              .fontSize(
                                                                                  1.8),
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .w500),
                                                                      maxLines: 4,
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
                                            : widget.categorytype == 8
                                                ? ListView.builder(
                                                    itemCount: GlobalLists
                                                        .searchceomeassagelisting
                                                        .length,
                                                    shrinkWrap: true,
                                                    physics: ScrollPhysics(),
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                left: 8,
                                                                right: 8,
                                                                bottom: 6),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (BuildContext
                                                                            context) =>
                                                                        Homeceomessage(
                                                                          detail: GlobalLists
                                                                                  .searchceomeassagelisting[index]
                                                                              [
                                                                              'details'],
                                                                          detailpageurl:
                                                                              GlobalLists.searchceomeassagelisting[index]
                                                                                  [
                                                                                  'detail_page_url'],
                                                                          title: GlobalLists
                                                                                  .searchceomeassagelisting[index]
                                                                              [
                                                                              'title'],
                                                                        )));
                                                          },
                                                          child: Card(
                                                            elevation: 2,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.all(
                                                                Radius.circular(10),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
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
                                                                        child: FadeInImage
                                                                            .assetNetwork(
                                                                          placeholder:
                                                                              'assets/newImages/placeholder_3.jpg',
                                                                          image: Constantstring
                                                                                  .baseUrl +
                                                                              GlobalLists.searchceomeassagelisting[index]
                                                                                  [
                                                                                  'image'],
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          height:
                                                                              80,
                                                                          width: 80,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width: 10,
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Text(
                                                                              GlobalLists.searchceomeassagelisting[index]
                                                                                  [
                                                                                  'title'],
                                                                              overflow:
                                                                                  TextOverflow.ellipsis,
                                                                              style: TextStyle(
                                                                                  color: Customcolor.colorblack,
                                                                                  fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                                                                                  fontWeight: FontWeight.w500),
                                                                              maxLines:
                                                                                  4,
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
                                                : widget.categorytype == 9
                                                    ? ListView.builder(
                                                        itemCount: GlobalLists
                                                            .searchawardlisting
                                                            .length,
                                                        shrinkWrap: true,
                                                        physics: ScrollPhysics(),
                                                        itemBuilder:
                                                            (BuildContext context,
                                                                int index) {
                                                          if (index % 7 == 0) {
                                                            print("index");
                                                            print(index % 3);
                                                            color =
                                                                Customcolor.prog1;
                                                          } else if (index % 7 ==
                                                              1) {
                                                            color =
                                                                Customcolor.prog2;
                                                          } else if (index % 7 ==
                                                              2) {
                                                            color =
                                                                Customcolor.prog3;
                                                          } else if (index % 7 ==
                                                              3) {
                                                            color =
                                                                Customcolor.prog4;
                                                          } else if (index % 7 ==
                                                              4) {
                                                            color =
                                                                Customcolor.prog5;
                                                          } else if (index % 7 ==
                                                              5) {
                                                            color =
                                                                Customcolor.prog6;
                                                          } else if (index % 7 ==
                                                              6) {
                                                            color =
                                                                Customcolor.prog7;
                                                          } else if (index % 7 ==
                                                              7) {
                                                            color =
                                                                Customcolor.prog8;
                                                          }
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 8,
                                                                    right: 8,
                                                                    bottom: 6),
                                                            child: GestureDetector(
                                                              onTap: () {},
                                                              child: Card(
                                                                elevation: 2,
                                                                color: color,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius.circular(
                                                                        4),
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .only(
                                                                          bottom: 0,
                                                                          left: 10,
                                                                          right: 10,
                                                                          top: 8),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Html(
                                                                        data:
                                                                            """${GlobalLists.searchawardlisting[index]['title']} """,
                                                                        onLinkTap:
                                                                            (url) {
                                                                          print(
                                                                              "Opening $url...");
                                                                        },
                                                                        style: {
                                                                          "body": Style(
                                                                              textAlign: TextAlign
                                                                                  .start,
                                                                              color: Colors
                                                                                  .white,
                                                                              fontSize: FontSize
                                                                                  .large,
                                                                              fontWeight:
                                                                                  FontWeight.w500),
                                                                                   "tr": Customcolor.tableboderstyle(),
                                                                        },
                                                                      ),
                                                                      SizedBox(
                                                                        height: 10,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .spaceBetween,
                                                                        children: [
                                                                          GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              getawarddetail(GlobalLists.searchawardlisting[index]
                                                                                  [
                                                                                  'page_url']);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width:
                                                                                  110,
                                                                              height:
                                                                                  40,
                                                                              decoration: BoxDecoration(
                                                                                  color: Colors.amber,
                                                                                  borderRadius: BorderRadius.circular(5)),
                                                                              child:
                                                                                  Center(
                                                                                child:
                                                                                    Text(
                                                                                  "Read More",
                                                                                  style: TextStyle(color: Customcolor.text_darkblue, fontWeight: FontWeight.w500),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          // Image
                                                                          //     .asset(
                                                                          //   "assets/images/trophy.png",
                                                                          //   width:
                                                                          //       70,
                                                                          //   height:
                                                                          //       70,
                                                                          // )
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height: 8,
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      )
                                                    : Container(),
       
       
       
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

            Align(
              alignment: Alignment.bottomCenter,
              child: Bottomcardlink(),
            )
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

  getawarddetail(String pageurl) async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);
      final json = {
        'page_url': pageurl,
      };
      print(json);
      APIManager().apiRequest(context, API.ourawarddetail, (response) async {
        OurawarddetailResponse resp = response;
        print(response);
        print('Resp : $resp');

        Navigator.of(_keyLoader.currentContext).pop();

        if (resp.success == "True") {
          setState(() {
            GlobalLists.awarddetallisting = resp.data.list;
            // GlobalLists.awarddetallisting[0].title
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => OurAwardDetail(
                          detaill: GlobalLists.awarddetallisting,
                          pageurl: pageurl,
                        )));
          });
        } else {
          ShowDialogs.showToast(resp.msg);
        }
      }, (error) {
        print('ERR msg is $error');
        Navigator.of(_keyLoader.currentContext).pop();
      }, jsonval: json);
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

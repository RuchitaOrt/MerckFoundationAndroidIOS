import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/model/our_gallery_detail_response.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:photo_view/photo_view.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';

class OurGalleryDetailsPage extends StatefulWidget {
  String categoryID;
  OurGalleryDetailsResponse galleryDetailsResponse;

  OurGalleryDetailsPage({Key key, this.categoryID, this.galleryDetailsResponse})
      : super(key: key);
  @override
  _OurGalleryDetailsPageState createState() => _OurGalleryDetailsPageState(
      categoryID: this.categoryID,
      galleryDetailsResponse: this.galleryDetailsResponse);
}

class _OurGalleryDetailsPageState extends State<OurGalleryDetailsPage> {
  final String categoryID;
  final OurGalleryDetailsResponse galleryDetailsResponse;

  _OurGalleryDetailsPageState({this.categoryID, this.galleryDetailsResponse});

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
        //sharelink: Constantstring.photogalleryyearwise,
        title: "Photo Gallery",
        titleImg: "assets/newImages/news_logo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      body: ListView(
        shrinkWrap: true,
        children: widgetList(),
      ),
    );
  }

  List<Widget> widgetList() {
    List<Widget> widgetList = [];

    for (int i = 0; i < galleryDetailsResponse.list.length; i++) {
      widgetList.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomCard(
          index: 1,
          cardImage: "assets/newImages/ourvison.png",
          cardTitle: galleryDetailsResponse.list.keys.elementAt(i),
          btnTitle: "View More",
          titleColor: Customcolor.text_blue,
          titleImg: "assets/newImages/flowers-3.png",
          list: ListView.builder(
            itemCount: galleryDetailsResponse
                .list[galleryDetailsResponse.list.keys.elementAt(i)].length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8, left: 10),
                child: GestureDetector(
                  onTap: () {
                    //   _showImageDialog(
                    //       context: context,
                    //       image: galleryDetailsResponse.baseUrl +
                    //           galleryDetailsResponse
                    //               .list[galleryDetailsResponse.list.keys
                    //                   .elementAt(i)][index]
                    //               .photo,
                    //       description: galleryDetailsResponse
                    //           .list[galleryDetailsResponse.list.keys.elementAt(i)]
                    //               [index]
                    //           .photoDescription);

                    ShowDialogs.showImageDialog(
                        context: context,
                        image: galleryDetailsResponse.baseUrl +
                            galleryDetailsResponse
                                .list[galleryDetailsResponse.list.keys
                                    .elementAt(i)][index]
                                .photo,
                        description: galleryDetailsResponse
                            .list[galleryDetailsResponse.list.keys.elementAt(i)]
                                [index]
                            .photoDescription);
                  },
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 86,
                            height: SizeConfig.blockSizeHorizontal * 45,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/newImages/placeholder_3.jpg',
                              image: galleryDetailsResponse.baseUrl +
                                  galleryDetailsResponse
                                      .list[galleryDetailsResponse.list.keys
                                          .elementAt(i)][index]
                                      .photo,
                              fit: BoxFit.fill,
                            ),
                          ),
                          // Align(
                          //   alignment: Alignment.bottomCenter,
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(
                          //         bottom: 1, left: 2.5, right: 2.5),
                          //     child: Row(
                          //       crossAxisAlignment: CrossAxisAlignment.end,
                          //       //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         Column(
                          //           mainAxisAlignment: MainAxisAlignment.end,
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //           children: [
                          //             Container(
                          //               width:
                          //                   SizeConfig.blockSizeHorizontal * 85,
                          //               // color: Colors.black.withOpacity(0.7),
                          //               child: Text(
                          //                 galleryDetailsResponse
                          //                         .list[galleryDetailsResponse
                          //                             .list.keys
                          //                             .elementAt(i)][index]
                          //                         .photoDescription ??
                          //                     "",
                          //                 overflow: TextOverflow.ellipsis,
                          //                 style: TextStyle(
                          //                     color: Colors.white,
                          //                     fontSize: 14,
                          //                     fontWeight: FontWeight.w700),
                          //                 maxLines: 3,
                          //               ),
                          //             ),
                          //             // SizedBox(
                          //             //   height: 8,
                          //             // )
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 85,
                                // color: Colors.black.withOpacity(0.7),
                                child: Text(
                                  galleryDetailsResponse
                                          .list[galleryDetailsResponse.list.keys
                                              .elementAt(i)][index]
                                          .photoDescription ??
                                      "",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                  maxLines: 3,
                                ),
                              ),
                              // SizedBox(
                              //   height: 8,
                              // )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ));
    }

    return widgetList;
  }

  _showImageDialog({BuildContext context, String image, String description}) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        elevation: 0,
        insetPadding: EdgeInsets.all(0),
        backgroundColor: Colors.black.withOpacity(0.7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(child: Container()),
            Expanded(
              child: PhotoView(
                backgroundDecoration: BoxDecoration(color: Colors.transparent),
                initialScale: 0.2,
                imageProvider: NetworkImage(
                  image,
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            // Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: 10.0),
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String cardTitle;
  final String cardImage;
  final String subTitle;
  final String btnTitle;
  final Color titleColor;
  final String titleImg;
  final int index;
  final Function onbtnTap;
  final Widget list;

  const CustomCard(
      {Key key,
      this.cardTitle,
      this.cardImage,
      this.subTitle,
      this.btnTitle,
      this.titleColor,
      this.titleImg,
      this.list,
      this.index,
      this.onbtnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: cardTitle,
                      style: TextStyle(
                        color: titleColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    // WidgetSpan(
                    //   alignment: PlaceholderAlignment.bottom,
                    //   child: Image.asset(
                    //     titleImg,
                    //     width: 40,
                    //     height: 25,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
        // Row(
        //   children: [
        //     SizedBox(
        //       width: 15,
        //     ),
        //     Expanded(
        //       child: FormLabel(
        //         text: cardTitle,
        //         labelColor: Customcolor.colorPink,
        //         fontSize: 17,
        //         fontweight: FontWeight.w500,
        //       ),
        //     ),
        //     SizedBox(
        //       width: 7,
        //     ),
        //     Image.asset(
        //       titleImg,
        //       width: 40,
        //       height: 40,
        //     )
        //   ],
        // ),
        SizedBox(
          height: 10,
        ),
        Container(height: SizeConfig.blockSizeVertical * 30, child: list),
        SizedBox(
          height: 9,
        ),
        // Center(
        //   child: GestureDetector(
        //     onTap: onbtnTap,
        //     child: Container(
        //       width: 120,
        //       height: 40,
        //       decoration: BoxDecoration(
        //           color: Colors.amber, borderRadius: BorderRadius.circular(5)),
        //       child: Center(
        //         child: Text(
        //           btnTitle,
        //           style: TextStyle(
        //               color: Customcolor.colorBlue,
        //               fontSize: 15,
        //               fontWeight: FontWeight.w500),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/ViewmoreAlbum.dart';
import 'package:merckfoundation22dec/ViewmoremmtmAmbassadar.dart';
import 'package:merckfoundation22dec/model/our_gallery_detail_response.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:photo_view/photo_view.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/botttomlink.dart';
import 'package:merckfoundation22dec/utility/ResponsiveFlutter.dart';

class OurGalleryDetailsPage extends StatefulWidget {
  String? categoryID;
  OurGalleryDetailsResponse? galleryDetailsResponse;

  OurGalleryDetailsPage({Key? key, this.categoryID, this.galleryDetailsResponse})
      : super(key: key);
  @override
  _OurGalleryDetailsPageState createState() => _OurGalleryDetailsPageState(
      categoryID: this.categoryID!,
      galleryDetailsResponse: this.galleryDetailsResponse!);
}

class _OurGalleryDetailsPageState extends State<OurGalleryDetailsPage> {
  final String? categoryID;
  final OurGalleryDetailsResponse? galleryDetailsResponse;

  _OurGalleryDetailsPageState({this.categoryID, this.galleryDetailsResponse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Customcolor.background,
      appBar: InnerCustomAppBar(
        onTapval: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (BuildContext context) => Dashboard(
          //               index: 0,
          //             )));
          Navigator.pop(context);
        },
        index: 2,
        sharelink: Constantstring.photogalleryyearwise +
            galleryDetailsResponse!
                .list![galleryDetailsResponse!.list!.keys.elementAt(0)]![0].url!,
        title: "Photo Gallery",
        titleImg: "assets/newImages/news_logo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: widgetList(),
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
    );
  }

  List<Widget> widgetList() {
    List<Widget> widgetList = [];

    for (int i = 0; i < galleryDetailsResponse!.list!.length; i++) {
      widgetList.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomCard(
          index: 1,
          cardImage: "assets/newImages/ourvison.png",
          cardTitle: galleryDetailsResponse!.list!.keys.elementAt(i),
          btnTitle: "View More",
          onbtnTap: () {
            //need to do code here
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => ViewmoreAlbum(
                          apiurl: APIManager.viewmorealbum,
                          albumtitle:
                              galleryDetailsResponse!.list!.keys.elementAt(i),
                          sharelink: Constantstring.sharemmtmambassadarmmtm,
                          albumurl: galleryDetailsResponse!
                              .list![galleryDetailsResponse!.list!.keys
                                  .elementAt(i)]![0]
                              .url,
                        )));
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => ViewmoremmtmAmbassadar(
            //               apiurl: API.creategallerymobile,
            //               sharelink: Constantstring.sharemmtmambassadarmmtm,
            //             )));
          },
          titleColor: Customcolor.text_blue,
          titleImg: "assets/newImages/flowers-3.png",
          list: ListView.builder(
            itemCount: galleryDetailsResponse!
                        .list![galleryDetailsResponse!.list!.keys.elementAt(i)]!
                        .length <
                    4
                ? galleryDetailsResponse!
                    .list![galleryDetailsResponse!.list!.keys.elementAt(i)]!.length
                : 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8, left: 10),
                child: GestureDetector(
                  onTap: () {
                    ShowDialogs.showImageDialog(
                        context: context,
                        image: galleryDetailsResponse!.baseUrl! +
                            galleryDetailsResponse!
                                .list![galleryDetailsResponse!.list!.keys!
                                    .elementAt(i)]![index]!
                                .photo!,
                        description: galleryDetailsResponse!
                            .list![galleryDetailsResponse!.list!.keys.elementAt(i)]!
                                [index]
                            .photoDescription);
                  },
                  child: Column(
                    children: [
                      Stack(
                        children: [
                        Container(
  width: SizeConfig.blockSizeHorizontal * 50,
  height: SizeConfig.blockSizeHorizontal * 50,
  color: Colors.grey.shade200, // fallback background so it never appears blank
  child: SafeNetworkImage(
    url: galleryDetailsResponse!.baseUrl! +
        galleryDetailsResponse!
            .list![galleryDetailsResponse!.list!.keys!.elementAt(i)]![index]
            .photo!,
    placeholder: "assets/newImages/placeholder_3.jpg",
  ),
)
                          // Container(
                          //   width: SizeConfig.blockSizeHorizontal * 50,
                          //   height: SizeConfig.blockSizeHorizontal * 50,
                          //   child: FadeInImage.assetNetwork(
                          //     placeholder: 'assets/newImages/placeholder_3.jpg',
                          //     image: galleryDetailsResponse!.baseUrl! +
                          //         galleryDetailsResponse!
                          //             .list![galleryDetailsResponse!.list!.keys!
                          //                 .elementAt(i)]![index]
                          //             .photo!,
                          //     fit: BoxFit.contain,
                          //     // width: SizeConfig.blockSizeHorizontal * 20,
                          //   ),
                          // ),
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
                                width: SizeConfig.blockSizeHorizontal * 50,
                                // color: Colors.black.withOpacity(0.7),
                                child: Text(
                                  galleryDetailsResponse!
                                          .list![galleryDetailsResponse!.list!.keys
                                              .elementAt(i)]![index]
                                          .photoDescription ??
                                      "",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Customcolor.descriptiontext,
                                      fontSize: ResponsiveFlutter.of(context)
                                          .fontSize(1.6),
                                      fontFamily: "verdana",
                                      fontWeight: FontWeight.w500),
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


}

class CustomCard extends StatelessWidget {
  final dynamic cardTitle;
  final dynamic cardImage;
  final dynamic subTitle;
  final dynamic btnTitle;
  final Color? titleColor;
  final dynamic titleImg;
  final int? index;
  final VoidCallback? onbtnTap;
  final Widget? list;

  const CustomCard(
      {Key? key,
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
        Container(
            width: SizeConfig.blockSizeHorizontal * 100,
            height: SizeConfig.blockSizeVertical * 35,
            child: list),
        // SizedBox(
        //   height: 4,
        // ),
        Center(
          child: GestureDetector(
            onTap: onbtnTap,
            child: Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  btnTitle,
                  style: TextStyle(
                      color: Customcolor.colorBlue,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
class SafeNetworkImage extends StatelessWidget {
  final String url;
  final String placeholder;
  final BoxFit fit;

  const SafeNetworkImage({
    Key? key,
    required this.url,
    required this.placeholder,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // If empty or null-like → show placeholder
    if (url.isEmpty ||
        url.endsWith("/null") ||
        url.contains("null") ||
        url.trim().isEmpty) {
      return Image.asset(placeholder, fit: fit);
    }

    return Image.network(
      url,
      fit: fit,
      // While loading → show placeholder
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;

        return Image.asset(
          placeholder,
          fit: fit,
        );
      },
      // On error → show placeholder
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          placeholder,
          fit: fit,
        );
      },
    );
  }
}

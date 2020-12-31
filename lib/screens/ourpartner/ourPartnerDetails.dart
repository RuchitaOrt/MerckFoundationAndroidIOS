import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class partnerclass {
  final String image;
  final String title;

  partnerclass({this.image, this.title});
}

class Ourpatnerdetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OurpatnerdetailState();
  }
}

class OurpatnerdetailState extends State<Ourpatnerdetail> {
  List<partnerclass> _productsAvailable = [
    partnerclass(
        image: "assets/images/img1.jpg",
        title:
            "International Institute for Training and Research in Repordouctive health"),
    partnerclass(
        image: "assets/images/img2.jpg",
        title: "Indonesian Reproductive Science Institute"),
    partnerclass(
        image: "assets/images/img1.jpg", title: "University of south Wales,UK"),
    partnerclass(
        image: "assets/images/img2.jpg", title: "Angel of hope foundation"),
    partnerclass(image: "assets/images/img2.jpg", title: "African Unioon"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Customcolor.background,
        appBar: InnerCustomAppBar(
          onTapval: () {
            Navigator.pop(context);
          },
          index: 2,
          title: "Our Partners",
          titleImg: "assets/newImages/ourPartner_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                shrinkWrap: true,
                children: List.generate(_productsAvailable.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 2.0),
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Container(
                          width: SizeConfig.blockSizeHorizontal * 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 100,
                                height: 130,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            _productsAvailable[index].image),
                                        fit: BoxFit.cover)),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    _productsAvailable[index].title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Customcolor.text_darkblue,
                                      fontSize: ResponsiveFlutter.of(context)
                                          .fontSize(1.6),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  );
                }),
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videoplayer.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/model/videoLibraryResponse.dart';

class Videolibrary extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VideolibraryState();
  }
}

class VideolibraryState extends State<Videolibrary> {
  List _productsAvailable = [
    "assets/images/slider1.jpg",
    "assets/images/slider1.jpg",
    "assets/images/slider2.jpg",
    "assets/images/slider1.jpg",
    "assets/images/slider1.jpg",
    "assets/images/slider1.jpg",
    "assets/images/slider1.jpg",
  ];

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  void initState() {
    // TODO: implement initState

    getvideolibray();
   
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: "Video Library",
          titleImg: "assets/newImages/ourstoriesLogo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        backgroundColor: Customcolor.background,
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ListView(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5),
                child: FormLabel(
                  text: "Video Library",
                  labelColor: Customcolor.colorblack,
                  fontSize: ResponsiveFlutter.of(context).fontSize(2),
                  maxLines: 2,
                  fontweight: FontWeight.w800,
                ),
              ),
              GlobalLists.videolibrary.length<=0?Container():
              GridView.count(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                children: List.generate(GlobalLists.videolibrary.length, (index) {
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
                                        VideoPlayer()));
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
                                    width: SizeConfig.blockSizeHorizontal * 100,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        // border: Border.all(
                                        //   width: 1,
                                        // ),
                                         image: new DecorationImage(
                                        image: new NetworkImage(
                                            'https://img.youtube.com/vi/${GlobalLists.videolibrary.video_link.substring(GlobalLists.videolibrary.video_link.length - 11)}/mqdefault.jpg'),
                                        // fit: BoxFit.cover,
                                      ),
                                    ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                   GlobalLists.videolibrary[index].video_desc,
                                    // overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: ResponsiveFlutter.of(context)
                                            .fontSize(1.4),
                                        fontWeight: FontWeight.w500),
                                    maxLines: 4,
                                  ),
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                          ),
                        )),
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 60, right: 60, top: 20, bottom: 10),
                child: Image.asset(
                  "assets/newImages/flowers_footer.png",
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ));
  }

  getvideolibray() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.videoLibrary,
        (response) async {
          GetVideoLibraryResponse resp = response;
          print(response);
          print('Resp : $resp');

          Navigator.of(_keyLoader.currentContext).pop();

          if (resp.success == "True") {
            setState(() {
              GlobalLists.videolibrary = resp.data.list;
            });
          } else {
            ShowDialogs.showToast(resp.msg);
          }
        },
        (error) {
          print('ERR msg is $error');
          Navigator.of(_keyLoader.currentContext).pop();
        },
      );
    } else {
      ShowDialogs.showToast("Please check internet connection");
    }
  }
}

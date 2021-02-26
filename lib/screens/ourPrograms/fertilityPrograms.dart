import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:merckfoundation22dec/mediascreen.dart/videoplayer.dart';
import 'package:merckfoundation22dec/model/GetFertilityContentResp.dart';
import 'package:merckfoundation22dec/model/GetFertilityTestimonialResp.dart';
import 'package:merckfoundation22dec/model/GetFertilityVideosResp.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/APIManager.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/utility/checkInternetconnection.dart';
import 'package:merckfoundation22dec/widget/customHorizontalCard.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';

class MerckFertility extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MerckFertilityState();
  }
}

class MerckFertilityState extends State<MerckFertility> {
  List images = [
    "assets/images/slider1.jpg",
    "assets/images/slider2.jpg",
    "assets/images/slider1.jpg"
  ];
  List paravalue = [
    "Breaking the Stigma around infertile couples in general and infertile women in particular.",
    "Empowering Girls and Women in Education in general and in STEM in particular.",
    "Improving access to quality & equitable healthcare solutions.",
  ];

  List _imgarray = [
    "assets/newImages/img3.jpg",
    "assets/newImages/img4.jpg",
    "assets/newImages/leader1.png",
    "assets/newImages/leader2.png",
    "assets/newImages/img3.jpg",
    "assets/newImages/leader1.png",
    "assets/newImages/leader2.png",
  ];

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  void initState() {
    getFertilityContent();
    super.initState();
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
                        index: 1,
                      )));
        },
        index: 2,
        title: "Our Programs",
        titleImg: "assets/newImages/our_programsLogo.png",
        trallingImg1: "assets/newImages/share.png",
        trallingImg2: "assets/newImages/search.png",
        height: 85,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
        child: ListView(
          shrinkWrap: true,
          //  crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            GlobalLists.fertilityContentList.length <= 0
                ? Container(
                    child: Center(child: Text(Constantstring.emptyData)),
                  )
                : Html(
                    data:
                        """${GlobalLists.fertilityContentList[0].pageContent} """,
                    onLinkTap: (url) {
                      print("Opening $url...");
                    },
                  ),
            SizedBox(
              height: 20,
            ),
            CustomHorizontalCard(
              index: 1,
              cardImage: "assets/newImages/mqdefault1.png",
              cardTitle:
                  "Watch below some of the latest videos of Dr. Rasha kelej and first ladies of Africa. Ambassadars of Merck More than a Mother.",
              titleColor: Customcolor.colorPink,
               btnTitle: "Watch More",
              titleImg: "",
              list: ListView.builder(
                itemCount: GlobalLists.fertilityVideosList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){
                        Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                VideoPlayer(
                                                  videoUrl: GlobalLists.fertilityVideosList[index]
                                                      .videoLink,
                                                )));
                    },
                                      child: Padding(
                      padding: const EdgeInsets.only(right: 8, left: 10),
                      child: Stack(
                        children: [
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 86,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/newImages/placeholder_3.jpg',
                              image:
                                  "https://img.youtube.com/vi/${GlobalLists.fertilityVideosList[index].videoLink.substring(GlobalLists.fertilityVideosList[index].videoLink.length - 11)}/mqdefault.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 80,
                                        child: Text(
                                          GlobalLists.fertilityVideosList[index]
                                              .videoDesc,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                          maxLines: 3,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                    
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),


                            Padding(
                                            padding: EdgeInsets.only(left: 120,),
                                            child: Center(
                                              child: Image.asset(
                                                  "assets/newImages/pause.png"),
                                            ),
                                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                FormLabel(
                  text: "Alumini Testimonials",
                  labelColor: Customcolor.colorPink,
                  fontSize: 18,
                  fontweight: FontWeight.w700,
                  maxLines: 2,
                ),
                SizedBox(
                  width: 7,
                ),
                Image.asset(
                  'assets/newImages/flowers-3.png',
                  width: 40,
                  height: 40,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Container(
                height: 140,
                child: ListView.builder(
                  itemCount: GlobalLists.fertilityTestimonialList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 0, right: 8),
                      child: Container(
                        height: SizeConfig.blockSizeVertical * 15,
                        width: SizeConfig.blockSizeHorizontal * 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, bottom: 3, left: 8, right: 8),
                              child: Container(
                                // height: 220,
                                width: 100,
                                decoration: BoxDecoration(
                                  //color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                child: FadeInImage.assetNetwork(
                                  placeholder:
                                      'assets/newImages/placeholder_3.jpg',
                                  image:
                                      "${Constantstring.baseUrl + GlobalLists.fertilityTestimonialList[index].image}",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 12,
                                  ),
                                  FormLabel(
                                    text: GlobalLists
                                        .fertilityTestimonialList[index]
                                        .testimonialName,
                                    labelColor: Customcolor.colorPink,
                                    fontSize: 14,
                                    fontweight: FontWeight.w700,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  FormLabel(
                                    text: GlobalLists
                                        .fertilityTestimonialList[index]
                                        .departmentName,
                                    labelColor: Colors.black87,
                                    fontSize: 13,
                                    fontweight: FontWeight.w600,
                                    maxLines: 2,
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    GlobalLists.fertilityTestimonialList[index]
                                        .shortDescription,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                    maxLines: 4,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 9,
            ),
            Center(
              child: Container(
                width: 120,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    "Read All",
                    style: TextStyle(
                        color: Customcolor.colorBlue,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 60, left: 60, top: 20),
              child: Image.asset(
                "assets/newImages/flowers_footer.png",
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  getFertilityContent() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      ShowDialogs.showLoadingDialog(context, _keyLoader);

      APIManager().apiRequest(
        context,
        API.merckFertilityContent,
        (response) async {
          GetFertilityContentResp resp = response;
          print(response);
          print('Resp : $resp');

          if (resp.success == "True") {
            setState(() {
              GlobalLists.fertilityContentList = resp.data.list;
              getFertilityVideos();
            });
          } else {
            ShowDialogs.showToast(resp.msg);
            Navigator.of(_keyLoader.currentContext).pop();
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

  getFertilityVideos() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      APIManager().apiRequest(
        context,
        API.merckFertilityVideos,
        (response) async {
          GetFertilityVideosResp resp = response;
          print(response);
          print('Resp : $resp');
          if (resp.success == "True") {
            setState(() {
              GlobalLists.fertilityVideosList = resp.data.list;
              getFertilityTestimonial();
            });
          } else {
            ShowDialogs.showToast(resp.msg);
            Navigator.of(_keyLoader.currentContext).pop();
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

  getFertilityTestimonial() async {
    var status1 = await ConnectionDetector.checkInternetConnection();

    if (status1) {
      APIManager().apiRequest(
        context,
        API.merckFertilityTestimonials,
        (response) async {
          GetFertilityTestimonialResp resp = response;
          print(response);
          print('Resp : $resp');
          Navigator.of(_keyLoader.currentContext).pop();
          if (resp.success == "True") {
            setState(() {
              GlobalLists.fertilityTestimonialList = resp.data.list;
              Constantstring.baseUrl = resp.baseUrl;
            });
          } else {
            ShowDialogs.showToast(resp.msg);
            Navigator.of(_keyLoader.currentContext).pop();
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

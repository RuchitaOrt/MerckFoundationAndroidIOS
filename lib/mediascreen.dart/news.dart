
import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';

class NewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewsState();
  }
}

class NewsState extends State<NewsPage> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  List _productsAvailable = [
    "assets/newImages/img3.jpg",
    "assets/newImages/img4.jpg",
     "assets/newImages/leader1.png",

    "assets/newImages/leader2.png",
    "assets/newImages/img3.jpg",
     "assets/newImages/leader1.png",
      "assets/newImages/leader2.png",

  ];

  @override
  void initState() {
    // TODO: implement initState
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
                          index: 0,
                        )));
          },   
          index: 1,
          title: "News Article",
          titleImg: "assets/newImages/news_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        body: ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: [
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              itemCount: _productsAvailable.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 6),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8, left: 10, right: 10, top: 8),
                      child: Column(
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRect(
                                child: Image.asset(
                                 _productsAvailable[index],
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "Jackline Mwende, Merck More Than A Mother Heroine from Kenya shares her story",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Customcolor.colorblack,
                                          fontSize:
                                              ResponsiveFlutter.of(context)
                                                  .fontSize(1.8),
                                          fontWeight: FontWeight.w500),
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
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 60, right: 60, top: 20, bottom: 10),
              child: Image.asset(
                "assets/newImages/flowers_footer.png",
              ),
            ),
          ],
        ));
  }



  //  getNewsLetteranArticles() async {
  //   var status1 = await ConnectionDetector.checkInternetConnection();

  //   if (status1) {
  //     ShowDialogs.showLoadingDialog(context, _keyLoader);

  //     APIManager().apiRequest(
  //       context,
  //       API.newsletters,
  //       (response) async {
       
  //        List<GetNewsReleaseanArticlesResponse> resp = response;
  //         print(resp);
  //       setState(() {
  //           // GlobalLists.newsLetteranArticles = resp.;
  //       });
        
  //      //   print( GlobalLists.newsLetteranArticles.title);

  //         Navigator.of(_keyLoader.currentContext).pop();
  //       },
  //       (error) {
  //         print('ERR msg is $error');
  //         Navigator.of(_keyLoader.currentContext).pop();
  //       },
  //     );
  //   } else {
  //     ShowDialogs.showToast("Please check internet connection");
  //   }
  // }




}


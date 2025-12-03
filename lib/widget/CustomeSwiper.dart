import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/sizeConfig.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomSwiper extends StatefulWidget {
  final List<dynamic> imageUrls;

  CustomSwiper({required this.imageUrls});

  @override
  _CustomSwiperState createState() => _CustomSwiperState();
}

class _CustomSwiperState extends State<CustomSwiper> {
  PageController _pageController = PageController(viewportFraction: 0.7);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 370,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.imageUrls.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final isCurrent = index == _currentIndex;
        
              return Column(
                children: [
                  AnimatedContainer(
                    height: 320,
                    width: SizeConfig.blockSizeHorizontal*80,
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: isCurrent ? 0 : 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6)],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // Handle PDF/image link
                          _launchURL(Constantstring.baseUrl +  widget.imageUrls[index].pdfFile);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/newImages/placeholder_3.jpg',
                          image:Constantstring.baseUrl + widget.imageUrls[index].appImg,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  
                ],
              );
            },
          ),
        ),
        Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: ScrollPhysics(),
                child: DotsIndicator(
                  dotsCount: GlobalLists.pastevent.length,
                  position: double.parse("$_currentIndex"),
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(25.0, 9.0),
                    color: Customcolor.ligthpink,
                    spacing: EdgeInsets.only(right: 3),
                    activeColor: Customcolor.pink_col,
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ),
            ),
            ListTile(
              // subtitle: Text("awesome image caption"),
              title: Text(
                widget.imageUrls[_currentIndex].title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 17),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            
      ],
    );
  }
  Future<void> _launchURL(String urlIs) async {
  final Uri uri = Uri.parse(urlIs);

  if (!await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $uri';
  }
}
}

import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/customappbar.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/formLabel.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class Ceomessage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CeomessageState();
  }
}

class CeomessageState extends State<Ceomessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Customcolor.background,
        appBar: CustomAppBar(
          () {
            //_scaffoldKey.currentState.openDrawer();
            Navigator.pop(context);
          },
          2,
          height: 160,
        ),
        body: Column(
          children: [
            FormLabel(
              text: "Message From , CEO of Merck Foundation",
              labelColor: Customcolor.colorPink,
              fontSize: ResponsiveFlutter.of(context).fontSize(2),
              fontweight: FontWeight.bold,
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 7,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 6),
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
                                    "assets/images/g1.jpg",
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    "Jackline Mwende, Merck More Than A Mother Heroine from Kenya shares her story",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: ResponsiveFlutter.of(context)
                                            .fontSize(1.8),
                                        fontWeight: FontWeight.w500),
                                    maxLines: 4,
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
            ),
          ],
        ));
  }
}

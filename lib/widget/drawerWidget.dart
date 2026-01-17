import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/utility/ResponsiveFlutter.dart';

class DrawerWidget extends StatelessWidget {
  final String? image;
  final String value;
  final VoidCallback? onTapfun;

  const DrawerWidget({
    Key? key,
    this.image,
    required this.value,
    this.onTapfun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveFlutter.of(context);

    return GestureDetector(
      onTap: onTapfun,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: responsive.height(1.5),
          horizontal: responsive.width(3),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            if (image != null && image!.isNotEmpty)
              Image.asset(
                image!,
                width: responsive.width(6), // responsive width
                height: responsive.width(6),
                fit: BoxFit.contain,
              )
            else
              SizedBox(width: responsive.width(6), height: responsive.width(6)),

            SizedBox(width: responsive.width(3)),

            // Text
            Expanded(
              child: Text(
                value,
                style: TextStyle(
                  color: Customcolor.text_darkblue,
                  fontSize: responsive.fontSize(2),
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

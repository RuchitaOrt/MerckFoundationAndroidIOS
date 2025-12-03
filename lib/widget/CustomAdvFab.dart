// import 'package:flutter/material.dart';
// import 'package:merckfoundation22dec/widget/customcolor.dart';

// class CustomAdvFab extends StatefulWidget {
//   final IconData icon;
//   final Color iconColor;
//   final Color backgroundColor;
//   final Widget expandedContent;

//   const CustomAdvFab({
//     super.key,
//     required this.icon,
//     required this.iconColor,
//     required this.backgroundColor,
//     required this.expandedContent,
//   });

//   @override
//   State<CustomAdvFab> createState() => _CustomAdvFabState();
// }

// class _CustomAdvFabState extends State<CustomAdvFab> {
//   bool _isExpanded = false;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         if (_isExpanded)
//           Align(
//             alignment: Alignment.bottomRight,
//             child: Container(
//               height: 300,
//               width: 250,
//               margin: const EdgeInsets.only(bottom: 8),
//               decoration: BoxDecoration(
//                 color: Customcolor.programyellow,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6)],
//               ),
//               child: widget.expandedContent,
//             ),
//           ),
//       (_isExpanded)?Container():  FloatingActionButton(
//           backgroundColor: widget.backgroundColor,
//           onPressed: () {
//             setState(() {
//               _isExpanded = !_isExpanded;
//             });
//           },
//           child: Icon(widget.icon, color: widget.iconColor),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';

// final GlobalKey<_CustomAdvFabState> fabKey = GlobalKey<_CustomAdvFabState>();

class CustomAdvFab extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final Widget expandedContent;

  const CustomAdvFab({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.expandedContent,
  }) : super(key: key);

  @override
  State<CustomAdvFab> createState() => CustomAdvFabState();
}

class CustomAdvFabState extends State<CustomAdvFab> {
    bool isExpanded = false;

  void _toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }
 
  void collapse() {
  if (isExpanded) {
    setState(() {
      isExpanded = false;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (isExpanded)
          Container(
            height: 350,
            width: 300,
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Customcolor.programyellow,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6)],
            ),
            child: Column(
              children: [
                // Top bar with close button
                Container(
                  padding: const EdgeInsets.only(left: 8, right: 4),
                  height: 48,
                  decoration: BoxDecoration(
                    color: Customcolor.programyellow,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Customcolor.text_darkblue,
                        ),
                        onPressed: _toggleExpand,
                        iconSize: 20,
                        color: Colors.black87,
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(24),
                    ),
                    child: widget.expandedContent,
                  ),
                ),
              ],
            ),
          ),
        // if (!_isExpanded)
          // FloatingActionButton(
          //   backgroundColor: widget.backgroundColor,
          //   onPressed: _toggleExpand,
          //   child: Icon(widget.icon, color: widget.iconColor),
          // ),
          RawMaterialButton(
            onPressed: _toggleExpand,
            fillColor: widget.backgroundColor,
            shape: const CircleBorder(),
            constraints: const BoxConstraints.tightFor(
              width: 56,
              height: 56,
            ),
            elevation: 6.0,
            child: Icon(widget.icon, color: widget.iconColor),
          ),
      ],
    );
  }
}

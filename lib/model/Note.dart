import 'dart:convert';

import 'package:flutter/material.dart';

class Note {
  final String? title;
  final String? description;
  final String? screen;

  Note({
    this.title,
    this.description,
    this.screen,
  });

  factory Note.fromJsonString(String str) => Note._fromJson(jsonDecode(str));

  String toJsonString() => jsonEncode(_toJson());

  factory Note._fromJson(Map<String, dynamic> json) => Note(
        title: json['title'],
        description: json['description'],
        screen: json['screen'],
      );

  Map<String, dynamic> _toJson() =>
      {'title': title, 'description': description, 'screen': screen};
}

// import 'dart:convert';

// import 'package:flutter/material.dart';

// class Note {
//   final String title;
//   final String description;
//   final String screen;

//   Note({
//     @required this.title,
//     @required this.description,
//     this.screen,
//   });

//   //Add these methods below

//   factory Note.fromJsonString(String str) => Note._fromJson(jsonDecode(str));

//   String toJsonString() => jsonEncode(_toJson());

//   factory Note._fromJson(Map<String, dynamic> json) => Note(
//         title: json['title'],
//         description: json['description'],
//         screen: json['screen'],
//       );

//   Map<String, dynamic> _toJson() =>
//       {'title': title, 'description': description, 'screen': screen};
// }

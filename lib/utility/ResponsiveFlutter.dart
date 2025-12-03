import 'package:flutter/material.dart';

class ResponsiveFlutter {
  final BuildContext context;
  final double _screenWidth;
  final double _screenHeight;
  final double _textScaleFactor;

  ResponsiveFlutter._(this.context)
      : _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context).size.height,
        _textScaleFactor = MediaQuery.of(context).textScaleFactor;

  /// Accessor
  static ResponsiveFlutter of(BuildContext context) {
    return ResponsiveFlutter._(context);
  }

  /// Get width percentage
  double width(double percent) => _screenWidth * (percent / 100);

  /// Get height percentage
  double height(double percent) => _screenHeight * (percent / 100);
// double fontSize(double percent) => (_screenWidth * (percent / 100)) / _textScaleFactor;
double fontSize(double percent) {
  final avgDimension = (_screenWidth + _screenHeight) /1.7;
  return (avgDimension * (percent / 100)) / _textScaleFactor;
}

  /// Font size relative to screen height (like ResponsiveFlutter does)
  // double fontSize(double percent) => (_screenHeight * (percent / 100)) / _textScaleFactor;
}

import 'package:flutter/material.dart';
import 'dart:math';

class ScaleSize {
  static double textScaleFactor(BuildContext context, {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 800) * maxTextScaleFactor;
    print("In scaleSize: $val, $width, $maxTextScaleFactor");
    return max(1, min(val, maxTextScaleFactor));
  }
}
import 'package:flutter/widgets.dart';
class CustomRectTween extends RectTween {
  CustomRectTween();

  @override
  Rect lerp(double t) => Rect.lerp(begin, end, Curves.easeOut.transform(t))!;
}
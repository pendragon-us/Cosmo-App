import 'package:flutter/cupertino.dart';

import 'dashed_border_painter.dart';

class DashedBorder extends StatelessWidget {
  final double width;
  final double height;
  final double borderWidth;
  final double dashLength;
  final double dashSpacing;
  final Color borderColor;
  final BorderRadius borderRadius;

  const DashedBorder({
    Key? key,
    required this.width,
    required this.height,
    required this.borderWidth,
    required this.dashLength,
    required this.dashSpacing,
    required this.borderColor,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: DashedBorderPainter(
        borderWidth: borderWidth,
        dashLength: dashLength,
        dashSpacing: dashSpacing,
        borderColor: borderColor,
        borderRadius: borderRadius,
      ),
    );
  }
}
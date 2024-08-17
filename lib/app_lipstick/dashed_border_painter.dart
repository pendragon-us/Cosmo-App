import 'package:flutter/cupertino.dart';

class DashedBorderPainter extends CustomPainter {
  final double borderWidth;
  final double dashLength;
  final double dashSpacing;
  final Color borderColor;
  final BorderRadius borderRadius;

  DashedBorderPainter({
    required this.borderWidth,
    required this.dashLength,
    required this.dashSpacing,
    required this.borderColor,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final radius = borderRadius.topLeft.x;
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));

    final path = Path()
      ..addRRect(rrect)
      ..close();

    final pathMetrics = path.computeMetrics();
    for (final pathMetric in pathMetrics) {
      double distance = 0;
      while (distance < pathMetric.length) {
        final nextDistance = distance + dashLength;
        final metric = pathMetric.extractPath(distance, nextDistance);
        canvas.drawPath(metric, paint);
        distance = nextDistance + dashSpacing;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

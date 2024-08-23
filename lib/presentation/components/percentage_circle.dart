import 'package:flutter/material.dart';

class PercentageCircle extends StatelessWidget {
  final double percentage;
  final double size;
  final Color color;

  const PercentageCircle({
    required this.percentage,
    required this.size,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _PercentagePainter(
        percentage: percentage,
        color: color,
      ),
    );
  }
}

class _PercentagePainter extends CustomPainter {
  final double percentage;
  final Color color;

  _PercentagePainter({required this.percentage, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = Colors.grey.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    Paint foregroundPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    canvas.drawCircle(
        size.center(Offset.zero), size.width / 2, backgroundPaint);

    double sweepAngle = 2 * 3.141592653589793 * (percentage / 100);
    canvas.drawArc(
      Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2),
      -3.141592653589793 / 2,
      sweepAngle,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

import 'package:domi/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSilderThumbShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(20, 30);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: center, width: 15, height: 73),
        const Radius.circular(4),
      ),
      Paint()..color = const Color(0xFFF6F6F7),
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: center, width: 15, height: 73),
        const Radius.circular(4),
      ),
      Paint()
        ..color = AppColors.borderColor
        ..strokeWidth = 2.0
        ..style = PaintingStyle.stroke,
    );
    canvas.drawLine(
      Offset(center.dx, center.dy - 50 / 2),
      Offset(center.dx, center.dy + 50 / 2),
      Paint()
        ..color = AppColors.borderColor
        ..strokeWidth = 1.5,
    );
  }
}

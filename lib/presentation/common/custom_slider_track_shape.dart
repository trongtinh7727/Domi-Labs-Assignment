import 'package:flutter/material.dart';

class CustomSliderTrackShape extends SliderTrackShape {
  @override
  Rect getPreferredRect(
      {required RenderBox parentBox,
      Offset offset = Offset.zero,
      required SliderThemeData sliderTheme,
      bool isEnabled = false,
      bool isDiscrete = false}) {
    final double trackHeight = sliderTheme.trackHeight ?? 60;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;

    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  void paint(PaintingContext context, Offset offset,
      {required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required Animation<double> enableAnimation,
      required Offset thumbCenter,
      Offset? secondaryOffset,
      bool isEnabled = false,
      bool isDiscrete = false,
      required TextDirection textDirection}) {
    final Canvas canvas = context.canvas;

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );
    final Paint activeTrackPaint = Paint()
      ..color = sliderTheme.activeTrackColor ?? Colors.yellow
      ..style = PaintingStyle.fill;

    final Paint inactiveTrackPaint = Paint()
      ..color = sliderTheme.inactiveTrackColor ?? Colors.grey
      ..style = PaintingStyle.fill;
    const Radius trackRadius =   Radius.circular(4);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
            trackRect.left, trackRect.top, thumbCenter.dx, trackRect.bottom),
        trackRadius,
      ),
      activeTrackPaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
            thumbCenter.dx, trackRect.top, trackRect.right, trackRect.bottom),
        trackRadius,
      ),
      inactiveTrackPaint,
    );
  }
}

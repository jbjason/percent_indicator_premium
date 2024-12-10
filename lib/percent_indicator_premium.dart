import 'package:flutter/material.dart';
import 'package:percent_indicator_premium/core/util/mycolor.dart';
import 'dart:math';
import 'dart:ui';

class HorizontalPercentIndicator extends StatelessWidget {
  const HorizontalPercentIndicator({
    super.key,
    this.height = 30,
    this.width,
    this.borderRadius = 8,
    required this.loadingPercent,
    this.inactiveTrackColor = MyColor.inActiveColor,
    this.child,
    this.activeTrackColor = const [MyColor.skyPrimary, MyColor.skySecondary],
  });
  final double height;
  final double? width;
  final double borderRadius;
  final double loadingPercent;
  final Color inactiveTrackColor;
  final Widget? child;
  final List<Color> activeTrackColor;
  @override
  Widget build(BuildContext context) {
    final view = PlatformDispatcher.instance.views.first;
    final widthNow = width ?? view.physicalSize.width / view.devicePixelRatio;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: inactiveTrackColor,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: height,
          width: _getPercent(widthNow, loadingPercent),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: LinearGradient(colors: activeTrackColor),
          ),
          child: child ??
              Center(
                child: Text(
                  _getExactPercent,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
        ),
      ),
    );
  }

  double _getPercent(double width, double loadingPercent) {
    if (loadingPercent > 1) return width;
    if (loadingPercent < 0) return 0;
    return width * loadingPercent;
  }

  String get _getExactPercent => "${_getPercent(100, loadingPercent).toInt()}%";
}

class VerticalPercentIndicator extends StatelessWidget {
  const VerticalPercentIndicator({
    super.key,
    this.height = 120,
    this.width = 30,
    this.borderRadius = 8,
    required this.loadingPercent,
    this.inactiveTrackColor = MyColor.inActiveColor,
    this.child,
    this.activeTrackColor = const [MyColor.skyPrimary, MyColor.skySecondary],
  });
  final double height;
  final double width;
  final double borderRadius;
  final double loadingPercent;
  final Color inactiveTrackColor;
  final Widget? child;
  final List<Color> activeTrackColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: inactiveTrackColor,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: _getPercent(height, loadingPercent),
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: LinearGradient(colors: activeTrackColor),
          ),
          child: child ??
              Center(
                child: Text(
                  _getExactPercent,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
        ),
      ),
    );
  }

  double _getPercent(double width, double loadingPercent) {
    if (loadingPercent > 1) return width;
    if (loadingPercent < 0) return 0;
    return width * loadingPercent;
  }

  String get _getExactPercent => "${_getPercent(100, loadingPercent).toInt()}%";
}

class CircularPercentIndicator extends StatelessWidget {
  const CircularPercentIndicator({
    super.key,
    this.height = 150,
    this.width = 150,
    required this.loadingPercent,
    this.inActiveTrackColor = MyColor.inActiveColor,
    this.child,
    this.activeTrackColor = const [
      Colors.deepOrangeAccent,
      Colors.greenAccent,
      Color(0xFF913A84),
      Colors.deepOrangeAccent
    ],
  });
  final double height;
  final double width;
  final double loadingPercent;
  final Color inActiveTrackColor;
  final Widget? child;
  final List<Color> activeTrackColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CustomPaint(
        painter: LoadingPercentPainter(
          strokeWidth: 5.5,
          circleRadius: 12,
          loadingPercent: loadingPercent,
          inActiveTrackColor: inActiveTrackColor,
          indicatorGradientColor: _getGradientColor,
        ),
        child: child ?? Center(child: Text(_getExactPercent)),
      ),
    );
  }

  List<Color> get _getGradientColor {
    if (activeTrackColor.isEmpty) {
      return [Colors.blue, Colors.blue];
    } else if (activeTrackColor.length == 1) {
      return [activeTrackColor[0], activeTrackColor[0]];
    } else {
      return activeTrackColor;
    }
  }

  double _getPercent(double width, double loadingPercent) {
    if (loadingPercent > 1) return width;
    if (loadingPercent < 0) return 0;
    return width * loadingPercent;
  }

  String get _getExactPercent => "${_getPercent(100, loadingPercent).toInt()}%";
}

class SquarePercentIndicator extends StatelessWidget {
  const SquarePercentIndicator(
      {super.key,
      this.height = 150,
      this.width = 150,
      required this.loadingPercent,
      this.borderRadius = 12,
      this.indicatorColor = MyColor.skyPrimary,
      this.backColor = MyColor.inActiveColor,
      this.child});
  final double height;
  final double width;
  final double loadingPercent;
  final double borderRadius;
  final Color indicatorColor;
  final Color backColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: SweepGradient(
              stops: [_getPercent(1, loadingPercent), 0],
              colors: [indicatorColor, backColor],
            ),
          ),
          child: Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: Colors.white,
            ),
            child: child ?? Center(child: Text(_getExactPercent)),
          ),
        ),
      ],
    );
  }

  double _getPercent(double width, double loadingPercent) {
    if (loadingPercent > 1) return width;
    if (loadingPercent < 0) return 0;
    return width * loadingPercent;
  }

  String get _getExactPercent => "${_getPercent(100, loadingPercent).toInt()}%";
}

class LoadingPercentPainter extends CustomPainter {
  final double strokeWidth;
  final double circleRadius;
  final double loadingPercent;
  final Color inActiveTrackColor;
  final List<Color> indicatorGradientColor;
  const LoadingPercentPainter({
    required this.strokeWidth,
    required this.circleRadius,
    required this.loadingPercent,
    required this.inActiveTrackColor,
    required this.indicatorGradientColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height, w = size.width;
    final gradient1 = SweepGradient(colors: indicatorGradientColor);
    final center = Offset(w / 2, h / 2);
    final rect = Rect.fromCenter(center: center, width: w, height: h);

    // background ash-color circle
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = inActiveTrackColor
      ..strokeWidth = strokeWidth;
    canvas.drawArc(
        rect, degreesToRadians(270), degreesToRadians(360), false, paint);

    // colorful Circle
    final paint1 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth
      ..shader = gradient1.createShader(rect);
    canvas.drawArc(rect, degreesToRadians(270),
        degreesToRadians(360 * loadingPercent), false, paint1);

    // blueGrey CirclePointer
    final paint2 = Paint()..color = Colors.blueGrey;
    final x1 =
        center.dx + w / 2 * cos(degreesToRadians(270 + 360 * loadingPercent));
    final y1 =
        center.dy + w / 2 * sin(degreesToRadians(270 + 360 * loadingPercent));
    final center2 = Offset(x1, y1);
    canvas.drawCircle(center2, circleRadius, paint2);

    // // pointers Upper indicator circle
    // final rect2 = Rect.fromCenter(center: center2, width: 37, height: 37);
    // final paint3 = Paint()
    //   ..color = Colors.white
    //   ..strokeWidth = 2
    //   ..style = PaintingStyle.stroke
    //   ..strokeCap = StrokeCap.round
    //   ..shader = gradient1.createShader(rect2);
    // if (isProgress) {
    //   canvas.drawArc(
    //       rect2, math.radians(270), math.radians(120), false, paint3);
    // }
  }

  double degreesToRadians(double degrees) => degrees * (pi / 180);

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

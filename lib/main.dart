import 'package:flutter/material.dart';
import 'package:percent_indicator_premium/config/theme/theme.dart';
import 'package:percent_indicator_premium/core/util/mycolor.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Percent Indicator Premium',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const LoadingPercentScreen(),
    );
  }
}

class LoadingPercentScreen extends StatefulWidget {
  const LoadingPercentScreen({super.key});
  @override
  State<LoadingPercentScreen> createState() => _LoadingPercentScreenState();
}

class _LoadingPercentScreenState extends State<LoadingPercentScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    if (mounted) _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loading Percent"),
        centerTitle: true,
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  HorizontalPercentIndicator(
                    height: 30,
                    width: size.width,
                    loadingPercent: _controller.value,
                  ),
                  const SizedBox(height: 20),
                  VerticalPercentIndicator(
                    height: 120,
                    width: 30,
                    loadingPercent: _controller.value,
                  ),
                  const SizedBox(height: 20),
                  CircularPercentIndicator(
                    height: size.height * .28,
                    width: size.height * .28,
                    loadingPercent: _controller.value,
                  ),
                  const SizedBox(height: 20),
                  SquarePercentIndicator(
                    height: 60,
                    width: 60,
                    loadingPercent: _controller.value,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class HorizontalPercentIndicator extends StatelessWidget {
  const HorizontalPercentIndicator({
    super.key,
    required this.height,
    required this.width,
    this.borderRadius = 8,
    required this.loadingPercent,
    this.showLoadingPercent = true,
    this.inactiveTrackColor = MyColor.inActiveColor,
    this.activeTrackColor = const [MyColor.skyPrimary, MyColor.skySecondary],
  });
  final double height;
  final double width;
  final double borderRadius;
  final double loadingPercent;
  final bool showLoadingPercent;
  final Color inactiveTrackColor;
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
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: height,
              width: _getPercent(width, loadingPercent),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                gradient: LinearGradient(colors: activeTrackColor),
              ),
            ),
          ),
          if (showLoadingPercent)
            Center(
              child: Text(
                _getExactPercent,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
        ],
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
    required this.height,
    required this.width,
    this.borderRadius = 8,
    required this.loadingPercent,
    this.showLoadingPercent = true,
    this.inactiveTrackColor = MyColor.inActiveColor,
    this.activeTrackColor = const [MyColor.skyPrimary, MyColor.skySecondary],
  });
  final double height;
  final double width;
  final double borderRadius;
  final double loadingPercent;
  final bool showLoadingPercent;
  final Color inactiveTrackColor;
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
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: _getPercent(height, loadingPercent),
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                gradient: LinearGradient(colors: activeTrackColor),
              ),
            ),
          ),
          if (showLoadingPercent)
            Center(
              child: Text(
                _getExactPercent,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
        ],
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
    required this.height,
    required this.width,
    required this.loadingPercent,
    this.inActiveTrackColor = MyColor.inActiveColor,
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
        child: Center(child: Text(_getExactPercent)),
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
      required this.height,
      required this.width,
      required this.loadingPercent,
      this.borderRadius = 12,
      this.indicatorColor = MyColor.skyPrimary,
      this.backColor = MyColor.inActiveColor});
  final double height;
  final double width;
  final double loadingPercent;
  final double borderRadius;
  final Color indicatorColor;
  final Color backColor;

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
            child: Center(child: Text(_getExactPercent)),
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
    canvas.drawArc(rect, math.radians(270), math.radians(360), false, paint);

    // colorful Circle
    final paint1 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth
      ..shader = gradient1.createShader(rect);
    canvas.drawArc(rect, math.radians(270), math.radians(360 * loadingPercent),
        false, paint1);

    // blueGrey CirclePointer
    final paint2 = Paint()..color = Colors.blueGrey;
    final x1 =
        center.dx + w / 2 * cos(math.radians(270 + 360 * loadingPercent));
    final y1 =
        center.dy + w / 2 * sin(math.radians(270 + 360 * loadingPercent));
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

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

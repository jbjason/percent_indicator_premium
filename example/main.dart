import 'package:flutter/material.dart';
import 'package:percent_indicator_premium/config/theme/theme.dart';
import 'package:percent_indicator_premium/percent_indicator_premium.dart';

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
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    if (mounted) _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
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
                  HorizontalPercentIndicator(loadingPercent: _controller.value),
                  const SizedBox(height: 20),
                  VerticalPercentIndicator(loadingPercent: _controller.value),
                  const SizedBox(height: 20),
                  CircularPercentIndicator(loadingPercent: _controller.value),
                  const SizedBox(height: 20),
                  SquarePercentIndicator(loadingPercent: _controller.value),
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

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_app_02/animated_progress_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  Timer? _timer;
  final _timerDuration = 10;
  double _progressBarWidth = 0.0;
  bool _animate = false;
  List<double> _randomPauses = [];

  @override
  void dispose() {
    super.dispose();
    _resetTimer();
  }

  void _resetTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void _startProgressBar(double maxWidth) {
    _animate = true;
    _calculateRandomPauseMoments(maxWidth);
    if (_progressBarWidth >= maxWidth) {
      _progressBarWidth = 0.0;
    }
    _timer = Timer.periodic(
      Duration(milliseconds: _timerDuration),
      (_) => _animateContainerWidth(maxWidth),
    );
  }

  void _pauseProgressBar() {
    setState(() {
      _timer?.cancel();
      _animate = false;
    });
  }

  void _animateContainerWidth(double maxWidth) {
    if (_progressBarWidth < maxWidth) {
      _progressBarWidth += 1;
      for (final rnd in _randomPauses) {
        if (_progressBarWidth == rnd) {
          _timer?.cancel();
          _animate = false;
        }
      }
    } else {
      _animate = false;
      _randomPauses.clear();
      _resetTimer();
    }
    setState(() {});
  }

  double _calculateProgressBarWidth(double width) {
    if (width - _progressBarWidth <= 0) return 0;
    return width - _progressBarWidth;
  }

  void _calculateRandomPauseMoments(double maxWidth) {
    if (_randomPauses.length >= 2) return;
    double progressBarWidth = maxWidth * 0.26;
    final width = (maxWidth - progressBarWidth) / 2;
    for (int i = 0; i < 2; i++) {
      double rnd = 0;
      do {
        rnd = Random().nextInt((width - progressBarWidth).toInt()) + progressBarWidth + (width * i);
      } while (_randomPauses.contains(rnd));
      progressBarWidth = rnd;
      _randomPauses.add(rnd.toInt().toDouble());
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final height = 40.0;
    final width = sizeWidth * 0.9;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Bar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            AnimatedProgressBar(
              size: Size(width, height),
              child: AnimatedContainer(
                height: height,
                width: _calculateProgressBarWidth(width),
                duration: const Duration(milliseconds: 1),
                margin: EdgeInsets.only(left: _progressBarWidth),
                decoration: BoxDecoration(color: Colors.grey[100]),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => _animate ? _pauseProgressBar() : _startProgressBar(width),
              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _animate ? Colors.red[300] : Colors.green[300],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  _animate ? 'Pause' : 'Start',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

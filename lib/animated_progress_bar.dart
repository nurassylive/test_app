import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:test_app_02/helpers/shader_painter.dart';

class AnimatedProgressBar extends StatefulWidget {
  final Size size;
  final Widget child;

  const AnimatedProgressBar({
    Key? key,
    required this.size,
    required this.child,
  }) : super(key: key);

  @override
  State<AnimatedProgressBar> createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar> with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _shaderAnimationController;

  @override
  void initState() {
    super.initState();
    _shaderAnimationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
    _animation = Tween(begin: 0.0, end: 1.0).animate(_shaderAnimationController);
  }

  @override
  void dispose() {
    _shaderAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: widget.size.height,
        width: widget.size.width,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, snapshot) {
            return ShaderBuilder(
              (context, shader, child) {
                return CustomPaint(
                  size: Size(widget.size.width, widget.size.height),
                  painter: ShaderPainter(
                    shader: shader,
                    value: _animation.value,
                  ),
                  child: child,
                );
              },
              assetKey: 'shaders/simple.frag',
              child: widget.child,
            );
          },
        ),
      ),
    );
  }
}

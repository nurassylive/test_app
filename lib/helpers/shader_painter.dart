import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ShaderPainter extends CustomPainter {
  final double value;
  ui.FragmentShader shader;

  ShaderPainter({
    required this.shader,
    required this.value,
  });

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, value);
    shader.setFloat(1, size.height);
    shader.setFloat(2, size.width);

    final paint = Paint()..shader = shader;

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant ShaderPainter oldDelegate) {
    return oldDelegate.value != value;
  }
}

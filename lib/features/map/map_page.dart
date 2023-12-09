import 'package:flutter/material.dart';
import 'package:test_app/core/widgets/bottom_bar.dart';
import 'package:test_app/core/widgets/custom_app_bar.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final title = 'Карта';

    return Scaffold(
      appBar: CustomAppBar(title: title),
      body: Center(child: Text(title)),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

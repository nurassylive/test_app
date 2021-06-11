import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../models/menu.dart';

class Menus extends GetxController {
  List<Menu> _menus = [];

  List<Menu> get menus {
    return _menus.obs;
  }

  Future<void> fetchData() async {
    try {
      final url = 'https://hh.foxstudy.kz/api/menus';
      final uri = Uri.encodeFull(url);
      var response = await Dio().get(uri);
      if (response.statusCode == 200) {
        final data = response.data['data'] as List<dynamic>;

        for (int i = 0; i < data.length; i++) {
          _menus.add(Menu.fromJson(data[i]['attributes']));
        }
      }
    } catch (e) {
      print('e: ${e.toString()}');
      throw (e);
    }
  }
}

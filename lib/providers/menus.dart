import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../models/menu.dart';

class Menus extends GetxController {
  final menus = [].obs;
  final cart = [].obs;

  // List<Menu> get menus {
  //   return _menus.obs;
  // }

  // List<Menu> get cart {
  //   return _cart.obs;
  // }

  String _getImageName() {
    final rnd = Random();
    final number = rnd.nextInt(2);
    if (number == 0) return 'assets/images/01.png';
    return 'assets/images/02.png';
  }

  Future<void> fetchData() async {
    try {
      final url = 'https://hh.foxstudy.kz/api/menus';
      final uri = Uri.encodeFull(url);
      var response = await Dio().get(uri);
      if (response.statusCode == 200) {
        final data = response.data['data'] as List<dynamic>;

        for (int i = 0; i < data.length; i++) {
          final menuData = Menu.fromJson(data[i]['attributes']);
          final menu = Menu(
            id: Uuid().v1(),
            title: menuData.title,
            desc: menuData.desc,
            assetName: _getImageName(),
          );
          menus.add(menu);
        }
      }
    } catch (e) {
      print('e: ${e.toString()}');
      throw (e);
    }
  }

  void addToCart(Menu menu) {
    if (!cart.contains(menu)) cart.add(menu);
    // for (Menu cartMenu in _cart) {
    //   if (cartMenu.id != menu.id) {
    //     _cart.add(menu);
    //   }
    // }
  }

  void deleteFromCart(String id) {
    for (int i = 0; i < cart.length; i++) {
      if (cart[i].id == id) {
        cart.removeAt(i);
      }
    }
  }
}

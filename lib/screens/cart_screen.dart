import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../providers/menus.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final menusController = Get.find<Menus>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        leading: CupertinoButton(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: menusController.cart.isEmpty
          ? Center(
              child: Text('Please, add product to cart...'),
            )
          : ListView.builder(
              itemCount: menusController.cart.length,
              itemBuilder: (ctx, index) => ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: deviceSize.width * 0.02,
                  vertical: deviceSize.width * 0.02,
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    menusController.cart[index].assetName,
                    alignment: Alignment.center,
                  ),
                ),
                title: Text(
                  menusController.cart[index].title,
                  style: TextStyle(
                    fontSize: deviceSize.width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: CupertinoButton(
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      menusController.deleteFromCart(
                        menusController.cart[index].id,
                      );
                    });
                  },
                ),
              ),
            ),
    );
  }
}

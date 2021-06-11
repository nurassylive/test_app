import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_app/screens/cart_screen.dart';

import '../providers/menus.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final menusController = Get.put(Menus());

  @override
  void initState() {
    setup();
    super.initState();
  }

  void setup() async {
    await menusController.fetchData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final width = deviceSize.width / 3;
    final height = deviceSize.height * 0.3;

    return Scaffold(
      appBar: AppBar(
        title: Text('Menus'),
        actions: [
          CupertinoButton(
            child: Icon(
              menusController.cart.isEmpty
                  ? CupertinoIcons.cart
                  : CupertinoIcons.cart_fill,
              color: menusController.cart.isEmpty ? Colors.white : Colors.amber,
            ),
            onPressed: () {
              Get.to(() => CartScreen());
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: height,
          clipBehavior: Clip.none,
          child: ListView.builder(
            itemCount: menusController.menus.length,
            clipBehavior: Clip.none,
            itemBuilder: (ctx, index) => CupertinoButton(
              padding: EdgeInsets.zero,
              child: Container(
                width: width,
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(1, 2),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height * 0.7,
                      alignment: Alignment.center,
                      child: Image.asset(
                        menusController.menus[index].assetName,
                      ),
                    ),
                    Text(
                      menusController.menus[index].title.trim(),
                      style: TextStyle(
                        fontSize: deviceSize.width * 0.04,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              onPressed: () {
                setState(() {
                  menusController.addToCart(menusController.menus[index]);
                });
              },
            ),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}

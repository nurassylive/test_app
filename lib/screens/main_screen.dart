import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../providers/menus.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _getImageName() {
    final rnd = Random();
    final number = rnd.nextInt(2);
    print('number: $number');
    if (number == 0) return 'assets/images/01.png';
    return 'assets/images/02.png';
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final width = deviceSize.width / 3;
    final height = deviceSize.height * 0.3;

    final menusController = Get.put(Menus());

    return Scaffold(
      appBar: AppBar(
        title: Text('Menus'),
      ),
      body: FutureBuilder(
        future: menusController.fetchData(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          if (snapshot.connectionState == ConnectionState.done)
            return Center(
              child: Container(
                height: height,
                clipBehavior: Clip.none,
                child: ListView.builder(
                  itemCount: menusController.menus.length,
                  clipBehavior: Clip.none,
                  itemBuilder: (ctx, index) => Container(
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
                            _getImageName(),
                          ),
                        ),
                        Text(
                          menusController.menus[index].title
                              .trim()
                              .toLowerCase()
                              .capitalizeFirst,
                          style: TextStyle(
                            fontSize: deviceSize.width * 0.04,
                          ),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                  scrollDirection: Axis.horizontal,
                ),
              ),
            );
        },
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    // Trigger rebuild when window is resized. This updates the bounding box sizes.
    MediaQuery.of(context);
    const int mobileWidth = 480;
    const int tabletWidth = 900;
    const int desktopWidth = 1180;
    double screenheight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color.fromRGBO(61, 61, 61, 1.0),
          appBar: AppBar(
            toolbarHeight: 120,
            shape: const Border(
                bottom: BorderSide(
                    color: Colors.orange,
                    width: 4
                )
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(boxShadow: const [
                    BoxShadow(
                      color: Colors.orange,
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                      offset: Offset(0.0, 0.0),
                    )
                  ], borderRadius: BorderRadius.circular(20)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/mylog.jpg',
                      fit: BoxFit.contain,
                      width: (screenWidth * 0.1 > 70 ? screenWidth : 70),
                      height: (screenWidth * 0.1 > 70 ? screenWidth : 70),
                    ),
                  ),
                ),
                Container(
                  width: (screenWidth * 0.3 > 180 ? screenWidth : 180),//200
                  height: (screenWidth * 0.3 > 200 ? screenWidth : 180) * 0.4,//80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/textlogo.jpg',
                      fit: BoxFit.contain,
                      height: (screenWidth * 0.4 > 180 ? screenWidth : 180),//100,
                      width: (screenWidth * 0.4 > 180 ? screenWidth : 180) * 0.4,//300,
                    ),
                  ),
                ),
              ],

            ),
            shadowColor: Color.fromRGBO(126, 64, 0, 1.0),
            actions: [
              IconButton(
              onPressed: () {},
              icon: Icon(Icons.call),
            ),

            ],
            foregroundColor: Color.fromRGBO(255, 255, 255, 1.0),
            backgroundColor: Color.fromRGBO(14, 0, 0, 1.0),
          ),
          body: Container(
            child: Align(
              alignment: AlignmentDirectional.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go back!'),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            color: Colors.brown,
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
              height: 80,
            ),/*Text('Shop Page')*/
          )
      ),
    );
  }
}
import 'dart:math';

import 'package:flutter/material.dart';
import 'market_main.dart' as mainPage;

/*void main() {
  runApp(const MyApp());
}*/
void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /*const MyApp({super.key});*/

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
      /*const Color.fromRGBO(0, 228, 236, 0.2)*/
    final ButtonStyle buttomStyle =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 14),foregroundColor: Colors.white,backgroundColor:const Color.fromRGBO(0, 228, 236, 0.2) ,side: const BorderSide(width: 2,color: Color.fromRGBO(121, 0, 0, 1.0)));
   /* final TextStyle testStyle =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 14),foregroundColor: Colors.white,backgroundColor:const Color.fromRGBO(0, 228, 236, 0.2) ,side: const BorderSide(width: 2,color: Color.fromRGBO(121, 0, 0, 1.0)));*/
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/third.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: TextField(
                        style:TextStyle(color: Colors.white),
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User Name',
                          hintText: 'Enter Your Name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: TextField(
                        style:TextStyle(color: Colors.white),
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter Password',
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: buttomStyle,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const mainPage.MyApp()),
                        );
                      },
                      child: const Text('Log In'),
                    ),
                    /*ElevatedButton(
                      style: ButtonStyle(foregroundColor:MaterialStateColor.resolveWith((states) => Colors.white) ,backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue)),
                      child: Text('Sign In'),
                      onPressed: () {
                      },
                    )*/
                  ],
                ))
            /*Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                ElevatedButton(
                  style: buttomStyle,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const mainPage.MyApp()),
                    );
                  },
                  child: const Text('Log In'),
                ),
              ],
            ),*/
          ),
        ),
      ],
    );
  }
}

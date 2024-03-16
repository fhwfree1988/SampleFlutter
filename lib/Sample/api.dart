import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_test_flut/Market/Food/FoodModel.dart';

/*
Future<http.Response> fetchFood() {
  return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
}

Future<http.Response> fetchFood() {
  return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
}*/

Future<Food> addFood(String title,int cost) async {
  final response = await http.post(
    Uri.parse('http://localhost:8080/food/add'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
      'cost': cost.toString(),
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Food.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller_title = TextEditingController();
  final TextEditingController _controller_cost = TextEditingController();

  Future<Food>? _futureFood;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: (_futureFood == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: _controller_title,
            //controller: _controller,
            decoration: const InputDecoration(hintText: 'Enter Title'),
            keyboardType: TextInputType.number,
          ),
        ),
        Expanded(
          child: TextField(
            controller: _controller_cost,
            //controller: _controller,
            decoration: const InputDecoration(hintText: 'Enter Cost'),
            keyboardType: TextInputType.number,
          ),
        ),
        /* TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Enter Title'),
        ),*/
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureFood = addFood(_controller_title.text,int.parse(_controller_cost.text));
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<Food> buildFutureBuilder() {
    return FutureBuilder<Food>(
      future: _futureFood,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.title);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
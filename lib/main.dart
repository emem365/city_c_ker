import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:city_c_ker/data/cities_api_service.dart';
import 'package:city_c_ker/models/built_city.dart';
import 'dart:convert';

void main() async {
  runApp(MyApp());
  // var response;
  // response = await CitiesApiService.create().getCities();
  // response.forEach((e) => print(e.city));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CitiesApiService client = CitiesApiService.create();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Response<BuiltList<BuiltCity>>>(
        future: client.getCities(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // print(snapshot.data.body[0].runtimeType);
            // var cities = json.decode(snapshot.data.body);
            // print(cities);
            return ListView(
              children:
                  snapshot.data.body.map<Widget>((a) => Text(a.toString())).toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}


import 'package:city_c_ker/ui/show_all_cities.dart';
import 'package:city_c_ker/util/city_search_delegate.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City C-ker'),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CitySearchDelegate());
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(elevation: 1.0, items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.all_inclusive), title: Text('All Cities')),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite), title: Text('Favorites'))
      ]),
      body: ShowAllCities(),
    );
  }
}
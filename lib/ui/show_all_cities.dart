import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:city_c_ker/data/cities_api_service.dart';
import 'package:city_c_ker/data/service_locator.dart';
import 'package:city_c_ker/models/built_city.dart';
import 'package:city_c_ker/widgets/city_list_tile.dart';
import 'package:flutter/material.dart';

class ShowAllCities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Response<BuiltList<BuiltCity>>>(
      future: locator<CitiesApiService>().getCities(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemCount: snapshot.data.body.length,
            itemBuilder: (context, index) =>
                CityListTile(snapshot.data.body[index]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
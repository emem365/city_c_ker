// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cities_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$CitiesApiService extends CitiesApiService {
  _$CitiesApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CitiesApiService;

  @override
  Future<Response<dynamic>> getCities() {
    final $url = '/cities';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getParticularCities(
      {String city, String district, String state}) {
    final $url = '/cities';
    final $params = <String, dynamic>{
      'City': city,
      'District': district,
      'State': state
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> searchFromCities(
      {String cityLike, String districtLike, String stateLike}) {
    final $url = '/cities';
    final $params = <String, dynamic>{
      'City_like': cityLike,
      'District_like': districtLike,
      'State_like': stateLike
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}

import 'package:chopper/chopper.dart';

part 'cities_api_service.chopper.dart';

@ChopperApi(baseUrl: '/cities')
abstract class CitiesApiService extends ChopperService {
  @Get()
  Future<Response> getCities();

  @Get()
  Future<Response> getParticularCities(
      {@Query('City') String city,
      @Query('District') String district,
      @Query('State') String state});
  
  @Get()
  Future<Response> searchFromCities({@Query('City_like') String cityLike,
      @Query('District_like') String districtLike,
      @Query('State_like') String stateLike});

  static CitiesApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://indian-cities-api-nocbegfhqg.now.sh',
      services: [
        _$CitiesApiService(),
      ],
      converter: JsonConverter(),
    );
    return _$CitiesApiService(client);
  }
}

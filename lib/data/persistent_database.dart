import 'package:city_c_ker/models/built_city.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:moor/moor.dart';

part 'persistent_database.g.dart';

@DataClassName('FavoriteCity')
class FavoriteCities extends Table {
  TextColumn get city => text()();
  TextColumn get state => text()();
  TextColumn get district => text()();

  @override
  Set<Column> get primaryKey => {city, state, district};
}

@UseMoor(tables: [FavoriteCities])
class PersistentDatabase extends _$PersistentDatabase {
  PersistentDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<FavoriteCity>> getAllFavoriteCities() =>
      select(favoriteCities).get();

  Stream<List<FavoriteCity>> watchAllFavoriteCities() =>
      select(favoriteCities).watch();

  Future insertFavoriteCity(FavoriteCity favoriteCity) =>
      into(favoriteCities).insert(favoriteCity);

  Future updateFavoriteCity(FavoriteCity favoriteCity) =>
      update(favoriteCities).replace(favoriteCity);

  Future deleteFavoriteCity(FavoriteCity favoriteCity) =>
      delete(favoriteCities).delete(favoriteCity);

  // Future<bool> exists(FavoriteCity favoriteCity) async {
  //   final query = select(favoriteCities)
  //     ..where((tbl) => tbl.city.equals(favoriteCity.city))
  //     ..where((tbl) => tbl.state.equals(favoriteCity.state))
  //     ..where((tbl) => tbl.district.equals(favoriteCity.district));

  //   final List<FavoriteCity> cities = await query.get();
  //   return (cities.length > 0);
  // }
}

FavoriteCity builtValueToFavoriteCity(BuiltCity builtCity) {
  return FavoriteCity(
    city: builtCity.city,
    state: builtCity.state,
    district: builtCity.district,
  );
}

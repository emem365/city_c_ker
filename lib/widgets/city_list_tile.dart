import 'package:city_c_ker/data/persistent_database.dart';
import 'package:city_c_ker/data/service_locator.dart';
import 'package:city_c_ker/models/built_city.dart';
import 'package:flutter/material.dart';

class CityListTile extends StatefulWidget {
  final BuiltCity builtCity;
  final bool isFavorite;
  CityListTile(this.builtCity, this.isFavorite);
  @override
  _CityListTileState createState() => _CityListTileState();
}

class _CityListTileState extends State<CityListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
            title: Text(widget.builtCity.city),
            subtitle: Text(widget.builtCity.state),
            trailing: IconButton(
              icon: widget.isFavorite
                  ? Icon(
                      Icons.favorite,
                      color: Theme.of(context).accentColor,
                    )
                  : Icon(Icons.favorite_border),
              onPressed: () {
                if (widget.isFavorite) {
                  locator<PersistentDatabase>().deleteFavoriteCity(
                      builtValueToFavoriteCity(widget.builtCity));
                } else {
                  locator<PersistentDatabase>().insertFavoriteCity(
                      builtValueToFavoriteCity(widget.builtCity));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

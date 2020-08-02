import 'package:city_c_ker/models/built_city.dart';
import 'package:flutter/material.dart';

class CityListTile extends StatefulWidget {
  final BuiltCity builtCity;
  CityListTile(this.builtCity);
  @override
  _CityListTileState createState() => _CityListTileState();
}

class _CityListTileState extends State<CityListTile> {
  bool _isFavorite = false;
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
              icon: _isFavorite
                  ? Icon(
                      Icons.favorite,
                      color: Theme.of(context).accentColor,
                    )
                  : Icon(Icons.favorite_border),
              onPressed: () => setState(() => _isFavorite = !_isFavorite),
            ),
          ),
        ),
      ),
    );
  }
}
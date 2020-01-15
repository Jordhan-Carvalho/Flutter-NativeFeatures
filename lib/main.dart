import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/add_place_screen.dart';
import './screens/place_list_screen.dart';
import './providers/great_places.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          accentColor: Colors.indigo,
          primarySwatch: Colors.amber,
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
        },
      ),
    );
  }
}

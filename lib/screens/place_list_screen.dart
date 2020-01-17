import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/place_detail_screen.dart';
import './add_place_screen.dart';
import '../providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).fetchPlaces(),
        builder: (ctx, snapShot) => snapShot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                child: Center(
                  child: const Text('got no places yet'),
                ),
                builder: (ctx, greatPlacesData, ch) =>
                    greatPlacesData.items.length <= 0
                        ? ch
                        : ListView.builder(
                            itemCount: greatPlacesData.items.length,
                            itemBuilder: (ctx, i) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    FileImage(greatPlacesData.items[i].image),
                              ),
                              title: Text(greatPlacesData.items[i].title),
                              subtitle: Text(
                                  greatPlacesData.items[i].location.address),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  PlaceDetailScreen.routeName,
                                  arguments: greatPlacesData.items[i].id,
                                );
                              },
                            ),
                          ),
              ),
      ),
    );
  }
}

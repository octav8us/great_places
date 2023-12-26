import 'package:flutter/material.dart';
import 'package:great_places/providers/places_provider.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

import 'screens/places_list_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PlacesProvider(),
      child: MaterialApp(
        title: "Great places",
        routes: {
          AddPlaceScreen.routeName :(context) => const AddPlaceScreen(),

        },
        home:const PlacesListScreen(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:great_places/providers/places_provider.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("your places"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: context.read<PlacesProvider>().fetchAndSet(),
        builder: (context, snapshot) =>
        (snapshot.connectionState == ConnectionState.waiting)?
     const  Center(child: CircularProgressIndicator(),)

        : Consumer<PlacesProvider>(
           builder: (ctx, data, ch) => (data.items.isEmpty)
           ? ch!
           : ListView.builder(
            itemCount: data.items.length,
            itemBuilder: (ctx,i)
            =>  ListTile(
              leading: CircleAvatar(backgroundImage: FileImage(data.items[i].image)),
              title: Text(data.items[i].title),
              onTap: () {

              },


            ),

           )
            ,
          child: const Center(
            child: Text("No places yet, add Your places"),
          ),
        ),
      ),
    );
  }
}

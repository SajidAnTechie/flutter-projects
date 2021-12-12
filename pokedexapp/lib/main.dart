import 'package:flutter/material.dart';
import 'package:pokedexapp/provider/pokemon_provider.dart';
import 'package:pokedexapp/screen/pokemon_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(PokeMonApp());
}

class PokeMonApp extends StatelessWidget {
  const PokeMonApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) {
          return PokemonProvider();
        })
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: PokemonListScreen(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pokedexapp/screen/pokemon_list_screen.dart';

void main() {
  runApp(PokerMonApp());
}

class PokerMonApp extends StatelessWidget {
  const PokerMonApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: PokemonListScrenn(),
    );
  }
}

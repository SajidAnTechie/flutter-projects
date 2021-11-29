import 'package:flutter/material.dart';
import 'package:pokedexapp/model/pokemon_model.dart';

class BaseMoveTabe extends StatelessWidget {
  final PokemonModel pokemon;
  const BaseMoveTabe({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("3");
  }
}

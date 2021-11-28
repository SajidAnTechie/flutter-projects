import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedexapp/model/pokemon_model.dart';

class PokemonProvider with ChangeNotifier {
  List<PokemonModel> _pokemonList = [];

  List<PokemonModel> get pokemonList => _pokemonList;

  Future<void> getPokemonData() async {
    try {
      var url = Uri.parse(
          'https://gist.githubusercontent.com/lighttt/20e03ef249cc9b3ab5496b777c6f066f/raw/b27d2dce021d3b1f906f47bdbf574ffba62c1ded/pokeapi.json');

      final response = await http.get(url);
      List<dynamic> responseList = jsonDecode(response.body);

      _pokemonList = List<PokemonModel>.from(
          responseList.map((pokemon) => PokemonModel.fromJson(pokemon)));
    } catch (err) {
      print(err);
    }
  }
}

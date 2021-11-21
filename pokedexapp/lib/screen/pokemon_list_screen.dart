import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedexapp/model/pokemon_model.dart';
import 'package:http/http.dart' as http;
import 'package:pokedexapp/utils/pokemon_util.dart';

class PokemonListScrenn extends StatefulWidget {
  const PokemonListScrenn({Key key}) : super(key: key);

  @override
  _PokemonListScrennState createState() => _PokemonListScrennState();
}

class _PokemonListScrennState extends State<PokemonListScrenn> {
  List<PokemonModel> _pokemonList = [];

  Future<void> _getPokemonData() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PokeDex",
            style: TextStyle(
              fontSize: 28,
            )),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 30)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.favorite_border, size: 30))
        ],
      ),
      body: FutureBuilder(
        future: _getPokemonData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: 80,
                  itemBuilder: (ctx, index) {
                    final pokemon = _pokemonList[index];
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      key: Key("$index"),
                      color: PokemonUtils.getColor(pokemon),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  pokemon.id,
                                  style: TextStyle(
                                      color: Colors.grey[200], fontSize: 15),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              pokemon.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: pokemon.types
                                        .map((type) => Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 4),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 4, horizontal: 4),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.white),
                                                  color: PokemonUtils.getColor(
                                                      pokemon),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Text(type,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12)),
                                            ))
                                        .toList(),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Image.network(
                                    pokemon.imageUrl,
                                    height: 100,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pokedexapp/model/pokemon_model.dart';
import 'package:pokedexapp/utils/pokemon_util.dart';

class PokemonDetailScreen extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonDetailScreen({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PokemonUtils.getColor(pokemon),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: PokemonUtils.getColor(pokemon),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                size: 30,
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      pokemon.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 32),
                    ),
                    Text(
                      pokemon.id,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: pokemon.types
                      .map((type) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 4),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: PokemonUtils.getColorType(type),
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(type,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
          Hero(
            tag: "pokemon${pokemon.id}",
            child: Image.network(
              pokemon.imageUrl,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}

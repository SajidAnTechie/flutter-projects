import 'package:flutter/material.dart';
import 'package:pokedexapp/model/pokemon_model.dart';
import 'package:pokedexapp/utils/pokemon_util.dart';

class BaseMoveTab extends StatelessWidget {
  final PokemonModel pokemon;
  const BaseMoveTab({Key key, this.pokemon}) : super(key: key);

  Widget _buildBaseMove(String name, int value) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.grey.shade700)),
        ),
        Expanded(
          flex: 1,
          child: Text(name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black87)),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: LinearProgressIndicator(
            value: value / 100,
            backgroundColor: PokemonUtils.getColor(pokemon).withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(
              PokemonUtils.getColor(pokemon),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _buildBaseMove("Hp", pokemon.hp),
      SizedBox(
        height: 15,
      ),
      _buildBaseMove("Attack", pokemon.attack),
      SizedBox(
        height: 15,
      ),
      _buildBaseMove("Speed", pokemon.speed),
      SizedBox(
        height: 15,
      ),
      _buildBaseMove("Defense", pokemon.defense),
      SizedBox(
        height: 15,
      ),
      _buildBaseMove("Sp. Attack", pokemon.specialAttack),
      SizedBox(
        height: 15,
      ),
      _buildBaseMove("Sp. Defense", pokemon.specialDefense),
    ]);
  }
}

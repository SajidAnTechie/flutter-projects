import 'package:flutter/material.dart';
import 'package:pokedexapp/model/pokemon_model.dart';
import 'package:pokedexapp/provider/pokemon_provider.dart';
import 'package:provider/provider.dart';

class EvolutionTab extends StatefulWidget {
  final PokemonModel pokemon;
  const EvolutionTab({Key key, this.pokemon}) : super(key: key);

  @override
  _EvolutionTabState createState() => _EvolutionTabState();
}

class _EvolutionTabState extends State<EvolutionTab> {
  List<PokemonModel> _evolutionList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final evolutions = widget.pokemon.evolutions;

    evolutions.forEach((id) {
      final pokemon = Provider.of<PokemonProvider>(context, listen: false)
          .getPokemonById(id);
      _evolutionList.add(pokemon);
    });
  }

  Widget _buildEvolution(
      PokemonModel firstPokemon, PokemonModel secondPokemon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Image.network(
              firstPokemon.imageUrl,
              height: 50,
            ),
            Text(
              firstPokemon.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )
          ],
        ),
        Column(children: [
          Icon(
            Icons.arrow_forward,
            color: Colors.blueAccent.shade700,
          ),
          Text(
            widget.pokemon.evolveLevel,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          )
        ]),
        Column(
          children: [
            Image.network(
              secondPokemon.imageUrl,
              height: 50,
            ),
            Text(
              secondPokemon.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )
          ],
        ),
      ],
    );
  }

  List<Widget> buildEvolutionList() {
    if (_evolutionList.length < 1) {
      return [Center(child: Text("No evolution"))];
    }

    return Iterable<int>.generate(_evolutionList.length - 1)
        .map((index) =>
            _buildEvolution(_evolutionList[index], _evolutionList[index + 1]))
        .expand((widget) => [
              widget,
              Divider(
                thickness: 1.2,
              )
            ])
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: buildEvolutionList(),
    );
  }
}

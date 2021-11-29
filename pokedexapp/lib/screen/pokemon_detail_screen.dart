import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pokedexapp/utils/pokemon_util.dart';
import 'package:pokedexapp/screen/tabs/about_tab.dart';
import 'package:pokedexapp/provider/pokemon_provider.dart';
import 'package:pokedexapp/screen/tabs/base_move_tab.dart';
import 'package:pokedexapp/screen/tabs/evolution_tab.dart';

class PokemonDetailScreen extends StatelessWidget {
  final String id;
  const PokemonDetailScreen({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedPokemon =
        Provider.of<PokemonProvider>(context, listen: false).getPokemonById(id);
    return Scaffold(
      backgroundColor: PokemonUtils.getColor(selectedPokemon),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: PokemonUtils.getColor(selectedPokemon),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                size: 30,
              ))
        ],
      ),
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Column(
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
                        selectedPokemon.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 32),
                      ),
                      Text(
                        selectedPokemon.id,
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
                    children: selectedPokemon.types
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
              tag: "pokemon${selectedPokemon.id}",
              child: Image.network(
                selectedPokemon.imageUrl,
                height: 200,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: TabBar(
                  labelColor: Colors.black87,
                  unselectedLabelColor: Colors.grey.shade700,
                  labelStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  tabs: [
                    Tab(text: "About"),
                    Tab(text: "Evolutions"),
                    Tab(text: "Base Moves"),
                  ]),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TabBarView(children: [
                    SingleChildScrollView(
                        child: AboutTab(pokemon: selectedPokemon)),
                    SingleChildScrollView(
                        child: EvolutionTab(pokemon: selectedPokemon)),
                    SingleChildScrollView(
                        child: BaseMoveTabe(pokemon: selectedPokemon)),
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

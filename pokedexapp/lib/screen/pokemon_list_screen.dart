import 'package:flutter/material.dart';
import 'package:pokedexapp/provider/pokemon_provider.dart';
import 'package:pokedexapp/screen/pokemon_favouriteList.dart';
import 'package:pokedexapp/screen/pokemon_list_item.dart';
import 'package:pokedexapp/screen/pokemon_search_delegate.dart';
import 'package:provider/provider.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({Key key}) : super(key: key);

  @override
  _PokemonListScreenState createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  bool _isInit = true;
  Future _fetchData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      _fetchData =
          Provider.of<PokemonProvider>(context, listen: false).getPokemonData();
    }
    _isInit = false;
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
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: PokemonSearchDelegate());
              },
              icon: Icon(Icons.search, size: 30)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => FavouriteList()));
              },
              icon: Icon(Icons.favorite_border, size: 30))
        ],
      ),
      body: FutureBuilder(
        future: _fetchData,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : Consumer<PokemonProvider>(
                  builder: (context, data, child) {
                    return GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: 80,
                      itemBuilder: (ctx, index) {
                        final pokemon = data.pokemonList[index];
                        return PokemonListItem(pokemon: pokemon);
                      },
                    );
                  },
                );
        },
      ),
    );
  }
}

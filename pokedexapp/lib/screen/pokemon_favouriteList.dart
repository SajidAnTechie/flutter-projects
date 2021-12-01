import 'package:flutter/material.dart';
import 'package:pokedexapp/provider/pokemon_provider.dart';
import 'package:pokedexapp/screen/pokemon_list_item.dart';
import 'package:provider/provider.dart';

class FavouriteList extends StatefulWidget {
  const FavouriteList({Key key}) : super(key: key);

  @override
  _FavouriteListState createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<PokemonProvider>(context).getFavouriteList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourites"),
        elevation: 0,
      ),
      body: Consumer<PokemonProvider>(
        builder: (context, data, child) {
          final favouriteList = data.favouriteList;
          return favouriteList.isEmpty
              ? Center(
                  child: Text('No favourites have been added'),
                )
              : GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: favouriteList.length,
                  itemBuilder: (ctx, index) {
                    final pokemon = favouriteList[index];
                    return PokemonListItem(pokemon: pokemon);
                  },
                );
        },
      ),
    );
  }
}

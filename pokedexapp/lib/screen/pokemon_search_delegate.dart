import 'package:flutter/material.dart';
import 'package:pokedexapp/screen/pokemon_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:pokedexapp/provider/pokemon_provider.dart';

class PokemonSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    ThemeData themeData = Theme.of(context).copyWith(
      appBarTheme: AppBarTheme(
        elevation: 0,
      ),
    );
    return themeData;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return query.isEmpty
        ? Center(child: Text("Search through the PokeDex"))
        : Consumer<PokemonProvider>(
            builder: (context, data, child) {
              final searchResults = data.getSearchResults(query);
              return searchResults.isEmpty
                  ? Center(
                      child: Text("The pokemon '$query' doesn't exit"),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        itemCount: searchResults.length,
                        itemBuilder: (ctx, index) {
                          final pokemon = searchResults[index];
                          return ListTile(
                            leading:
                                Image.network(pokemon.imageUrl, height: 80),
                            title: Text(pokemon.name),
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) =>
                                          PokemonDetailScreen(id: pokemon.id)))
                            },
                          );
                        },
                        separatorBuilder: (context, index) => Divider(),
                      ),
                    );
            },
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return query.isEmpty
        ? Center(child: Text("Search through the PokeDex"))
        : Consumer<PokemonProvider>(
            builder: (context, data, child) {
              final searchResults = data.getSearchResults(query);
              return searchResults.isEmpty
                  ? Center(
                      child: Text("The pokemon '$query' doesn't exit"),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          itemCount: searchResults.length,
                          itemBuilder: (ctx, index) {
                            final pokemon = searchResults[index];
                            return ListTile(
                              leading:
                                  Image.network(pokemon.imageUrl, height: 80),
                              title: Text(pokemon.name),
                              onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => PokemonDetailScreen(
                                            id: pokemon.id)))
                              },
                            );
                          },
                          separatorBuilder: (context, index) => Divider()),
                    );
            },
          );
  }
}

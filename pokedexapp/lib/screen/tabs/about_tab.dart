import 'package:flutter/material.dart';
import 'package:pokedexapp/model/pokemon_model.dart';

class AboutTab extends StatelessWidget {
  final PokemonModel pokemon;
  const AboutTab({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(pokemon.description,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade700)),
        SizedBox(
          height: 20,
        ),
        Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text("Height",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700)),
                    SizedBox(
                      height: 8,
                    ),
                    Text(pokemon.height,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700))
                  ],
                ),
                Column(
                  children: [
                    Text("Weight"),
                    SizedBox(
                      height: 8,
                    ),
                    Text(pokemon.weight)
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text("Gender",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87)),
            SizedBox(
              width: 50,
            ),
            Row(
              children: [
                Icon(Icons.add_outlined, color: Colors.blue),
                SizedBox(
                  width: 10,
                ),
                Text(pokemon.malePercentage),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.minimize_outlined,
                  color: Colors.pink,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(pokemon.femalePercentage)
              ],
            ),
          ],
        )
      ],
    );
  }
}

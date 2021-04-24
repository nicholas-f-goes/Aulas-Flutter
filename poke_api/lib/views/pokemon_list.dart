import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/model/pokemon.dart';
import 'package:flutter_app/service/pokemon_service.dart';

class PokemonList extends StatefulWidget {

  @override
  _PokemonListState createState() => _PokemonListState();
}


class _PokemonListState extends State<PokemonList> {

  List<Pokemon> _pokemonList = [];

  _rowIcon() {
    return Icon(Icons.android, size: 100);
  }

  _rowButton(BuildContext context) {
    return TextButton.icon(
      onPressed: ()  =>  _search(context),
      label: Text('Buscar'),
      icon: Icon(Icons.add)
    );
  }

  _title(int index) {
    return Text('${_pokemonList[index].name}');
  }

  _subtitle(int index) {
    return Text('${_pokemonList[index].url}');
  }

  _rowPokemons() {
    if(_pokemonList.isEmpty) {
      return Text('Sem Pokmons...');
    }
    return ListView.builder(
      itemCount: _pokemonList.length,
      itemBuilder: (context, index) {
        print('Quantidade de Pokemon: ${_pokemonList.length}');
        return ListTile(
          title: _title(index),
          subtitle: _subtitle(index),
          leading: Image.network('${_pokemonList[index].getPokemon(index + 1)}'),
          onTap: () {
            title:('Clicou no: ${_pokemonList[index].name}');
            title:('${_pokemonList[index].toString()}');
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _rowIcon(),
        Container(
          height: 400,
          child: _rowPokemons(),
        ),
        _rowButton(context),
      ],
    );
  }

  _search(context) async {
    var pokemonService = PokemonService();

    _pokemonList = await pokemonService.fetchPokemons();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${_pokemonList.toString()}'))
    );

    setState((){
      print('Atualizando Tela');
    });
  }

}
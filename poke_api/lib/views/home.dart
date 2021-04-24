import 'package:flutter/material.dart';
import 'package:flutter_app/views/pokemon_list.dart';

class Home extends StatefulWidget {

  final String title;
  Home(this.title);

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PokemonList(),
    );
  }

}
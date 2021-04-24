
import 'package:flutter_app/constant.dart';

class Pokemon {

  String name;
  String url;

  Pokemon(this.name, this.url);

  Pokemon.fromJson(Map<dynamic, dynamic> map) {
    this.name = map['name'] ?? '';
    this.url = map['url'] ?? '';
  }

  @override
  String toString() {
    return '\nName: $name\nUrl: $url';
  }

  String getPokemon(int id) {
    return "${Constant.POKEMON_BASE_URL}${id+1}.png";
  }
}

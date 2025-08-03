import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

class PokemonService {
  static const String baseUrl = 'https://pokeapi.co/api/v2/pokemon/';

  Future<String> getRandomPokemonImageUrl() async {
    final randomId = Random().nextInt(898) + 1; // PokeAPI has 898 Pokémon
    final url = Uri.parse('$baseUrl$randomId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final sprites = data['sprites'];
      final imageUrl =
          sprites['front_default'] ??
          sprites['other']['official-artwork']['front_default'];

      if (imageUrl != null) {
        return imageUrl;
      } else {
        throw Exception('No image found for Pokémon ID $randomId');
      }
    } else {
      throw Exception('Failed to load Pokémon data');
    }
  }
}

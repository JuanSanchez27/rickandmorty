import 'package:flutter/material.dart';
import 'package:rickandmorty/models/characterModel.dart';
import 'package:http/http.dart' as http;

class CharacterProvider with ChangeNotifier {
  final String url = 'rickandmortyapi.com';
  List<Character> characters = [];

  Future<void> getCharacters(int page) async {
    final result = await http.get(Uri.https(url, "/api/character", {
      'page': page.toString(),
    })
    );
    final response = characterModelFromJson(result.body);
    characters.addAll(response.results!);
    notifyListeners();
  }
}

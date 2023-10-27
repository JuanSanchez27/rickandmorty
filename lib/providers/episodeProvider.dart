import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/models/episodeModel.dart';


class EpisodeProvider with ChangeNotifier {
  final String url = 'rickandmortyapi.com';
  List<Episode> episodes = [];

  Future<void> getEpisodes(int page) async {
    final result = await http.get(Uri.https(url, "/api/episode", {
      'page': page.toString(),
    })
    );
    final response = episodeModelFromJson(result.body);
    episodes.addAll(response.results!);
    notifyListeners();
  }
}
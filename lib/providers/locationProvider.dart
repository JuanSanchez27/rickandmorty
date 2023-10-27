import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/models/locationModel.dart';

class LocationProvider with ChangeNotifier {
  final String url = 'rickandmortyapi.com';
  List<Location> locations = [];

  Future<void> getLocations(int page) async {
    final result = await http.get(Uri.https(url, "/api/location", {
      'page': page.toString(),
    })
    );
    final response = locationModelFromJson(result.body);
    locations.addAll(response.results!);
    notifyListeners();
  }
}
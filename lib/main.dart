import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/details/detailEpisodeScreen.dart';
import 'package:rickandmorty/details/detailLocationScreen.dart';
import 'package:rickandmorty/models/characterModel.dart';
import 'package:rickandmorty/models/episodeModel.dart';
import 'package:rickandmorty/models/locationModel.dart' as loc;
import 'package:rickandmorty/providers/characterProvider.dart';
import 'package:rickandmorty/providers/episodeProvider.dart';
import 'package:rickandmorty/providers/locationProvider.dart';
import 'utils/routes.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  
  final GoRouter _router = GoRouter(
      routes: [
        GoRoute(path: '/',
          builder: (context, state) {
           return const HomeScreen(title: 'Rick and Morty App');
          },
          routes: [
            GoRoute(path: 'detailCharacter',
              builder: (context, state) {
              final character = state.extra as Character;
                return DetailCharacterScreen(character: character,);
              }
            ),
            GoRoute(path: 'detailLocation',
              builder: (context, state) {
                final location = state.extra as loc.Location;
                return DetailLocationScreen(location: location);
              }
            ),
            GoRoute(path: 'detailEpisode',
                builder: (context, state) {
                  final episode = state.extra as Episode;
                  return DetailEpisodeScreen(episode: episode);
                }
            ),
          ]
        )
      ] 
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CharacterProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => EpisodeProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Rick and Morty App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
        ),
        routerConfig: _router,
      ),
    );
  }
}
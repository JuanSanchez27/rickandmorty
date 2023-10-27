import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/providers/characterProvider.dart';
import 'package:rickandmorty/screens/characterScreen.dart';
import 'package:rickandmorty/screens/episodeScreen.dart';
import 'package:rickandmorty/screens/locationScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

const List<Widget> _list = <Widget> [
  CharacterScreen(),
  LocationScreen(),
  EpisodeScreen(),
];

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  @override
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty app'),
        elevation: 0,
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              'https://wallpaperaccess.com/full/5112248.jpg'))
        ),
        child: Center(
          child: _list.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Characters',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.landscape_outlined),
            label: 'Locations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv_outlined),
            label: 'Episodes',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
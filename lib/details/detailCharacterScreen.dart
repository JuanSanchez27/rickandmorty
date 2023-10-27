import 'package:flutter/material.dart';
import 'package:rickandmorty/models/characterModel.dart';
import 'package:rickandmorty/utils/responsive.dart';

class DetailCharacterScreen extends StatelessWidget {
  final Character character;
  const DetailCharacterScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final Responsive resp = Responsive(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(character.name!),
      ),
      body: Card(
        child: Column(
          children: [
            SizedBox(
              height: resp.hp(2),
            ),
            Center(
              child: SizedBox(
                height: resp.dp(25),
                child: Image.network(character.image.toString()),
              ),
            ),
            SizedBox(
              height: resp.hp(2),
            ),
            SizedBox(
              height: resp.hp(50),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                padding: const EdgeInsets.all(20),
                children: [
                  Card(
                    margin: EdgeInsets.all(10),
                    color: Colors.teal.shade100,
                    child: Column(
                      children: [
                        SizedBox(
                          height: resp.hp(5),
                        ),
                        Text('Status', style: TextStyle(
                          fontSize: resp.wp(5),
                          fontWeight: FontWeight.bold,
                        ),),
                        Text(character.status.toString()),
                      ],
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(10),
                    color: Colors.teal.shade100,
                    child: Column(
                      children: [
                        SizedBox(
                          height: resp.hp(5),
                        ),
                        Text('Species', style: TextStyle(
                      fontSize: resp.wp(5),
                      fontWeight: FontWeight.bold,
                    ),),
                        Text(character.species.toString()),
                      ],
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(10),
                    color: Colors.teal.shade100,
                    child: Column(
                      children: [
                        SizedBox(
                          height: resp.hp(5),
                        ),
                        Text('Gender', style: TextStyle(
                          fontSize: resp.wp(5),
                          fontWeight: FontWeight.bold,
                        ),),
                        Text(character.gender.toString()),
                      ],
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(10),
                    color: Colors.teal.shade100,
                    child: Column(
                      children: [
                        SizedBox(
                          height: resp.hp(5),
                        ),
                        Text('Origin', style: TextStyle(
                          fontSize: resp.wp(5),
                          fontWeight: FontWeight.bold,
                        ),),
                        Text(character.origin!.name.toString()),
                      ],
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(10),
                    color: Colors.teal.shade100,
                    child: Column(
                      children: [
                        SizedBox(
                          height: resp.hp(5),
                        ),
                        Text('Last location known', style: TextStyle(
                          fontSize: resp.wp(3),
                          fontWeight: FontWeight.bold,
                        ),),
                        Text(character.location!.name.toString()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

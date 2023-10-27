import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/characterProvider.dart';
import '../utils/responsive.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  final scrollController = ScrollController();
  bool isLoading = false;
  int page = 1;
  @override
  void initState(){
    super.initState();
    final characterProvider = Provider.of<CharacterProvider>(context, listen: false);
    if (characterProvider.characters.isEmpty) {
      characterProvider.getCharacters(page);
    }
    scrollController.addListener(() async {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        setState(() {
          isLoading = true;
        });
        page ++;
        await characterProvider.getCharacters(page);
        setState(() {
          isLoading = false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final characterProvider = Provider.of<CharacterProvider>(context);
    final Responsive resp = Responsive(context);

    return ListView.builder(
      controller: scrollController,
      itemCount: characterProvider.characters.length,
      itemBuilder: (BuildContext context, index) {
        final character = characterProvider.characters[index];
        return GestureDetector(
          onTap: (){
            context.go('/detailCharacter', extra: character);
          },
          child: Card(
            child: Row(
              children: [
                SizedBox(
                  height: resp.dp(10),
                  child: Image.network(character.image.toString()),
                ),
                SizedBox(
                  width: resp.wp(1.5),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name: ${character.name}'),
                    SizedBox(
                      height: resp.hp(1),
                    ),
                    Text('Status: ${character.status}'),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}

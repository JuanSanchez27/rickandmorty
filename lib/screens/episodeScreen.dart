import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/providers/episodeProvider.dart';
import 'package:rickandmorty/utils/responsive.dart';

class EpisodeScreen extends StatefulWidget {
  const EpisodeScreen({super.key});

  @override
  State<EpisodeScreen> createState() => _EpisodeScreenState();
}

class _EpisodeScreenState extends State<EpisodeScreen> {
  final scrollController = ScrollController();
  bool isLoading = false;
  int page = 1;
  @override
  void initState(){
    super.initState();
    final episodeProvider = Provider.of<EpisodeProvider>(context, listen: false);
    if(episodeProvider.episodes.isEmpty){
      episodeProvider.getEpisodes(page);
    }
    scrollController.addListener(() async {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        setState(() {
          isLoading = true;
        });
        page ++;
        await episodeProvider.getEpisodes(page);
        setState(() {
          isLoading = false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final episodeProvider = Provider.of<EpisodeProvider>(context);
    final Responsive resp = Responsive(context);

    return ListView.builder(
      controller: scrollController,
      itemCount: episodeProvider.episodes.length,
      itemBuilder: (BuildContext context, index) {
        final episode = episodeProvider.episodes[index];
        return GestureDetector(
          onTap: (){
            context.go('/detailEpisode', extra: episode);
          },
          child: Card(
            child: Row(
              children: [
                SizedBox(
                  height: resp.dp(10),
                  child: Image.network('https://thenounproject.com/api/private/icons/762411/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0'),
                ),
                SizedBox(
                  width: resp.wp(1.5),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.cover,
                      child: Text('${episode.name}'),
                    ),
                    SizedBox(
                      height: resp.hp(1),
                    ),
                    Text('Air date: ${episode.airDate}'),
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
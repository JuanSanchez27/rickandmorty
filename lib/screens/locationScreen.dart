import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/providers/locationProvider.dart';
import 'package:rickandmorty/utils/responsive.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final scrollController = ScrollController();
  bool isLoading = false;
  int page = 1;
  @override
  void initState(){
    super.initState();
    final locationProvider = Provider.of<LocationProvider>(context, listen: false);
    if (locationProvider.locations.isEmpty) {
      locationProvider.getLocations(page);
    }
    scrollController.addListener(() async {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        setState(() {
          isLoading = true;
        });
        page ++;
        await locationProvider.getLocations(page);
        setState(() {
          isLoading = false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    final Responsive resp = Responsive(context);

    return ListView.builder(
      controller: scrollController,
      itemCount: locationProvider.locations.length,
      itemBuilder: (BuildContext context, index) {
        final location = locationProvider.locations[index];
        return GestureDetector(
          onTap: (){
            context.go('/detailLocation', extra: location);
          },
          child: Card(
            child: Row(
              children: [
                SizedBox(
                  height: resp.dp(10),
                  child: Image.network('https://thenounproject.com/api/private/icons/571579/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0'),
                ),
                SizedBox(
                  width: resp.wp(1.5),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${location.name}'),
                    SizedBox(
                      height: resp.hp(1),
                    ),
                    Text('Type: ${location.type}'),
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
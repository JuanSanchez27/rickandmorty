import 'package:flutter/material.dart';
import 'package:rickandmorty/models/locationModel.dart';
import 'package:rickandmorty/utils/responsive.dart';

class DetailLocationScreen extends StatelessWidget {
  final Location location;
  const DetailLocationScreen ({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    final Responsive resp = Responsive(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(location.name!),
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
                child: Image.network('https://thenounproject.com/api/private/icons/571579/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0'),
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
                        Text('Type', style: TextStyle(
                          fontSize: resp.wp(5),
                          fontWeight: FontWeight.bold,
                        ),),
                        Text(location.type.toString()),
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
                        Text('Dimension', style: TextStyle(
                          fontSize: resp.wp(5),
                          fontWeight: FontWeight.bold,
                        ),),
                        Text(location.dimension.toString()),
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

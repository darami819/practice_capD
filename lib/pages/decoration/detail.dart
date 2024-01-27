
import 'package:flutter/material.dart';
import 'deco.dart';
import 'insert_image.dart';

class DetailPage extends StatelessWidget {
  final Furniture furniture;

  const DetailPage({Key? key, required this.furniture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(furniture.name),
      ),
      body: ListView.builder(
        itemCount: furniture.images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImagePlacementPage(imagePath: furniture.images[index]),
                ),
              );
            },
            child: Image.asset(furniture.images[index]),
          );
        },
      ),
    );
  }
}

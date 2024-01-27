import 'package:ex_game1/main.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'detail.dart';

// 가구 데이터 모델
class Furniture {
  final String name;
  final String description;
  final String thumbnailImage;
  final List<String> images;

  Furniture(this.name, this.description, this.thumbnailImage, this.images);
}

class DecoPage extends StatelessWidget {
  final List<Furniture> furnitureList = [
    Furniture('냉장고', '냉장고를 추가하려면 선택하세요.', 'assets/images/fridge/fridge.png', ['assets/images/fridge/fridge.png', 'assets/images/fridge/fridge_3.png', 'assets/images/fridge/fridge_4.png']),
    Furniture('식탁', '식탁을 추가하려면 선택하세요.', 'assets/images/table/table.png', ['assets/images/table/table.png', 'assets/images/table/table_2.png', 'assets/images/table/table_3.png', 'assets/images/table/table_4.png']),
    // 추가 가구 목록...
  ];

  @override
  Widget build(BuildContext context) {
    // MakeRoomGame 인스턴스에 접근
    //final game = Flame.of<MakeRoomGame>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Decoration Page'),
      ),
      body: ListView.builder(
        itemCount: furnitureList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(furnitureList[index].thumbnailImage), // 대표 이미지
            title: Text(furnitureList[index].name),
            subtitle: Text(furnitureList[index].description),
            onTap: () {
              //game.addFurnitureImage(furnitureList[index].thumbnailImage);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(furniture: furnitureList[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

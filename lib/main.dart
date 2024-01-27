import 'package:flame/events.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:logging/logging.dart';

import 'components/player.dart';
import 'package:flame/components.dart';
import 'components/appbar.dart';


void main() {
  Logger.root.level = Level.ALL; // 모든 로그 레벨을 표시
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    }
  });

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Room Game',
      // theme: ThemeData(
      //    primarySwatch: Colors.purple,
      // ),
      home: HomeScreen(),
        
    ),
  );
}

class MakeRoomGame extends FlameGame with PanDetector {
  late Player player;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // 배경 설정
    final bgSprite = await loadSprite('room.PNG');
    final bgComponent = SpriteComponent(sprite: bgSprite, size: size);
    add(bgComponent);

    player = Player();
    add(player);
    // 오버레이를 활성화합니다.
    overlays.add('DirectionalControls');
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.move(info.delta.global);
  }
}

// 방향 컨트롤러 위젯입니다.
class DirectionalControls extends StatelessWidget {
  final MakeRoomGame game;

  const DirectionalControls({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DirectionalButton(
              iconData: Icons.arrow_back,
              onPressed: () => game.player.move(Vector2(-10, 0)),
            ),
            DirectionalButton(
              iconData: Icons.arrow_upward,
              onPressed: () => game.player.move(Vector2(0, -10)),
            ),
            DirectionalButton(
              iconData: Icons.arrow_downward,
              onPressed: () => game.player.move(Vector2(0, 10)),
            ),
            DirectionalButton(
              iconData: Icons.arrow_forward,
              onPressed: () => game.player.move(Vector2(10, 0)),
            ),
          ],
        ),
      ),
    );
  }
}

class DirectionalButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;

  // Key 파라미터를 추가하고, const 생성자를 사용합니다.
  const DirectionalButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.purple,
          shape: BoxShape.circle,
        ),
        child: Icon(iconData, color: Colors.white),
      ),
    );
  }

}
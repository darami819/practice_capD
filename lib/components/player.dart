import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import '../main.dart';

class Player extends SpriteAnimationComponent with HasGameRef<MakeRoomGame>, KeyboardHandler {
  final Logger _logger = Logger('Player');

  late final SpriteAnimation animationFront;

  late final SpriteAnimation animationW;
  late final SpriteAnimation animationS;
  late final SpriteAnimation animationA;
  late final SpriteAnimation animationD;

  Player() : super(
    size: Vector2(100,150),
    anchor: Anchor.center,
  );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    animationFront = await _loadAnimation0('players/starts_4.png');

    // 각 키별 애니메이션 로드
    animationW = await _loadAnimation('players/player_w.png');
    animationS = await _loadAnimation('players/player_s.png');
    animationA = await _loadAnimation('players/player_a.png');
    animationD = await _loadAnimation('players/player_d.png');

    animation = animationFront; // 기본 애니메이션 설정
    position = gameRef.size / 2;
  }

    Future<SpriteAnimation> _loadAnimation0(String fileName) async {
    return await gameRef.loadSpriteAnimation(fileName, 
      SpriteAnimationData.sequenced(
        amount: 1,
        stepTime: 0.1,
        textureSize: Vector2(460, 600), // 이미지 크기에 따라 조절
      ),
    );
    }

    Future<SpriteAnimation> _loadAnimation(String fileName) async {
    return await gameRef.loadSpriteAnimation(fileName, 
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.1,
        textureSize: Vector2(145, 42), // 이미지 크기에 따라 조절
      ),
    );
    }
  
  @override
bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
  //print("onKeyEvent 호출됨: ${event.runtimeType} - ${event.logicalKey}");
  _logger.info("onKeyEvent 호출됨: ${event.runtimeType} - ${event.logicalKey}");
  if (event is RawKeyDownEvent) {
    Vector2 delta;
    switch (event.logicalKey.keyLabel) {
      case 'w':
        animation = animationW;
        delta = Vector2(0, -10); // 위로 이동
        break;
      case 's':
        animation = animationS;
        delta = Vector2(0, 10); // 아래로 이동
        break;
      case 'a':
        animation = animationA;
        delta = Vector2(-10, 0); // 왼쪽으로 이동
        break;
      case 'd':
        animation = animationD;
        delta = Vector2(10, 0); // 오른쪽으로 이동
        break;
      default:
        return false;
    }
    move(delta);
    // animation?.currentIndex = 0; // 애니메이션의 첫 프레임으로 재설정
    return true;
  }
  return false;
}

    
  void move(Vector2 delta) {
    position.add(delta);
  }
  // static const zIndex = 1;
}
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import '../main.dart';
import '../pages/decoration/deco.dart';
import '../pages/shopping.dart';
import '../pages/neighbor.dart';
import '../pages/memo.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text('Room Game'),
          centerTitle: true,
          elevation: 0.0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // 이제 올바른 context를 사용합니다.
                },
                icon: const Icon(Icons.menu),
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile/univ_student.PNG'),
                ),
                accountName: Text('삶은 계란이다'),
                accountEmail: Text('merong@naver.com'),
              ),
              ListTile(
                leading: const Icon(Icons.hub),
                iconColor: Colors.purple,
                focusColor: Colors.purple,
                title: const Text('꾸미기'),
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => DecoPage())
                  );
                },
                trailing: const Icon(Icons.navigate_next),
              ),
              ListTile(
                leading: const Icon(Icons.shopping_cart_rounded),
                iconColor: Colors.purple,
                focusColor: Colors.purple,
                title: const Text('쇼핑'),
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ShoppingPage())
                  );
                },
                trailing: const Icon(Icons.navigate_next),
              ),
              ListTile(
                leading: const Icon(Icons.mark_as_unread_sharp),
                iconColor: Colors.purple,
                focusColor: Colors.purple,
                title: const Text('방명록'),
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MemoPage())
                  );
                },
                trailing: const Icon(Icons.navigate_next),
              ),
              ListTile(
                leading: const Icon(Icons.hail),
                iconColor: Colors.purple,
                focusColor: Colors.purple,
                title: const Text('이웃'),
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => NeighPage())
                  );
                },
                trailing: const Icon(Icons.navigate_next),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                iconColor: Colors.purple,
                focusColor: Colors.purple,
                title: const Text('설정'),
                onTap: () {},
                trailing: const Icon(Icons.navigate_next),
              ),
            ],
          ),
        ),
        body: GameWidget<MakeRoomGame>(
          game: MakeRoomGame(),
          overlayBuilderMap: {
            'DirectionalControls': (context, game) {
              return DirectionalControls(game: game);
            },
          },
        )
    );
  }
}

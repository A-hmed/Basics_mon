import 'package:flutter/material.dart';
import 'package:flutter_basics_c17/ui/screens/game_board/game_board.dart';
import 'package:flutter_basics_c17/ui/screens/xo_intro/xo_intro.dart';
///Git gui tools: Android studio, Vs code, Github desktop, GitKraken, SourceTree
/// Git commands:
/// init: Create empty repository
/// add
/// commit: Save changes for added files in git with commit message
/// branch
/// switch(checkout)
/// merge
/// rebase
/// reset
/// reverse
/// squash
/// cherry-pick
/// fetch
/// pull
/// push
/// clone

void main() {
  runApp(const MyApp());
  Container(child: Text(""));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext xasdasdasd) {
    return MaterialApp(
      routes: {
        GameBoard.routeName: (_) => GameBoard(),
        XoIntro.routeName: (_) => XoIntro(),
      },
      initialRoute: XoIntro.routeName,
    );

  }


}









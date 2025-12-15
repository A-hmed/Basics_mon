import 'package:flutter/material.dart';
import 'package:flutter_basics_c17/ui/screens/game_board/game_board.dart';
import 'package:flutter_basics_c17/ui/utils/app_assets.dart';
import 'package:flutter_basics_c17/ui/utils/app_styles.dart';
import 'package:flutter_basics_c17/ui/widgets/gradient_scaffold.dart';

class XoIntro extends StatelessWidget {
  static const routeName = "xo_intro";

  const XoIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.introBg),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text("Tic Tac Toe", style: AppStyles.white40Thick),
              ),
            ),
          ),
          Text(
            "Pick who goes first",
            style: AppStyles.white24Medium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildSymbolContainer(context, AppAssets.icX, "x"),
              buildSymbolContainer(context, AppAssets.icO, "o"),
            ],
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget buildSymbolContainer(BuildContext context, String imagePath, String args) => InkWell(
    onTap: (){
      Navigator.pushNamed(context,GameBoard.routeName, arguments: args);
    },
    child: Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Image.asset(imagePath),
    ),
  );
}

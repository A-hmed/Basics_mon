import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_basics_c17/ui/screens/game_board/xo_button.dart';
import 'package:flutter_basics_c17/ui/utils/app_colors.dart';
import 'package:flutter_basics_c17/ui/utils/app_styles.dart';

class GameBoard extends StatefulWidget {
  static const routeName = "game_board";

  GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

/// const fully immutable
/// final half immutable
class _GameBoardState extends State<GameBoard> {
  List<String> board = ["", "", "", "", "", "", "", "", ""];
  late Timer timer;
  late String firstPlayer;
  late String secondPlayer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });


  }


  @override
  Widget build(BuildContext context) {
    ///Inherited widget
    firstPlayer = ModalRoute.of(context)!.settings.arguments as String;
    secondPlayer = firstPlayer == "x" ? "o" : "x";
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.lightBlue, AppColors.blue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildTimer(),
                SizedBox(height: 32),
                buildPlayerTurn(),
                SizedBox(height: 24),
                buildGameGrid(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildTimer() => Container(
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(44),
    ),
    padding: EdgeInsets.symmetric(vertical: 18),
    child: Text(
      "${formatTime(timer.tick)}",
      style: AppStyles.black32SemiBold,
      textAlign: TextAlign.center,
    ),
  );

  String formatTime(int seconds) {
    int min = seconds ~/ 60;
    int remainingSeconds = seconds - min * 60;
    return "${min < 10 ? "0$min" : "$min"}:${remainingSeconds < 10 ? "0$remainingSeconds" : "$remainingSeconds"}";
  }

  buildPlayerTurn() => Text(
    "Player ${counter.isEven ? "1" : "2"}’s Turn",
    style: AppStyles.white36Bold,
    textAlign: TextAlign.center,
  );

  buildGameGrid() => Expanded(
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(44),
          ),
          child:  Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    XoButton(
                      symbol: board[0],
                      onClick: onPlayerClick,
                      index: 0,
                    ),
                    XoButton(
                      symbol: board[1],
                      onClick: onPlayerClick,
                      index: 1,
                    ),
                    XoButton(
                      symbol: board[2],
                      onClick: onPlayerClick,
                      index: 2,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    XoButton(
                      symbol: board[3],
                      onClick: onPlayerClick,
                      index: 3,
                    ),
                    XoButton(
                      symbol: board[4],
                      onClick: onPlayerClick,
                      index: 4,
                    ),
                    XoButton(
                      symbol: board[5],
                      onClick: onPlayerClick,
                      index: 5,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    XoButton(
                      symbol: board[6],
                      onClick: onPlayerClick,
                      index: 6,
                    ),
                    XoButton(
                      symbol: board[7],
                      onClick: onPlayerClick,
                      index: 7,
                    ),
                    XoButton(
                      symbol: board[8],
                      onClick: onPlayerClick,
                      index: 8,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Divider(color: AppColors.black, thickness: 1),
              Divider(color: AppColors.black, thickness: 1),
            ],
          ),
        ),
        const Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalDivider(color: AppColors.black, thickness: 1),
              VerticalDivider(color: AppColors.black, thickness: 1),
            ],
          ),
        ),
      ],
    ),
  );
  int counter = 0;

  void onPlayerClick(int index) {
    if (board[index].isNotEmpty) {
      return;
    }
    board[index] = counter.isEven ? firstPlayer : secondPlayer;
    if (checkWinner() || counter == 8) {
      resetBoard();
      return;
    }

    counter++;
    setState(() {});
  }

  bool checkWinner() {
    var symbol = counter.isEven ? "o" : "x";

    ///Rows
    if (board[0] == symbol && board[1] == symbol && board[2] == symbol) {
      return true;
    }
    if (board[3] == symbol && board[4] == symbol && board[5] == symbol) {
      return true;
    }
    if (board[6] == symbol && board[7] == symbol && board[8] == symbol) {
      return true;
    }

    ///Columns
    if (board[0] == symbol && board[3] == symbol && board[6] == symbol) {
      return true;
    }
    if (board[1] == symbol && board[4] == symbol && board[7] == symbol) {
      return true;
    }
    if (board[2] == symbol && board[5] == symbol && board[8] == symbol) {
      return true;
    }

    ///Diagonals
    if (board[0] == symbol && board[4] == symbol && board[8] == symbol) {
      return true;
    }
    if (board[2] == symbol && board[4] == symbol && board[6] == symbol) {
      return true;
    }
    return false;
  }

  void resetBoard() {
    board = ["", "", "", "", "", "", "", "", ""];
    counter = 0;
    timer.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    setState(() {});
  }

  Widget myItemBuilder(BuildContext a1, int n2){
    return Container();
  }
}
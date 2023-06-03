import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac/utils/colors.dart';

class HomeController extends GetxController {
  final TextEditingController firstEditingCtr = TextEditingController();
  final TextEditingController secondEditingCtr = TextEditingController();
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  List<List<int>> xo = <List<int>>[];
  List<int> indexes = <int>[];
  List<Map<String, dynamic>> game = [];
  bool playerTurn = false;
  int firstPlayerX = 1;
  int secondPlayerO = 2;
  String firstPlayerName = '';
  String secondPlayerName = '';
  int winner = 0;
  String winnerName = '';

  String? checkNames(String name) {
    if (name.length < 3) {
      return 'must be at least 3 letters';
    } else if (name.length > 20) {
      return 'invalid name';
    } else if (name.isEmpty || name.trim().isEmpty) {
      return 'please enter your name';
    }
    return null;
  }

  void fillLists() {
    xo = List.generate(3, (i) => List.filled(3, 0, growable: false),
        growable: false);
    game =
        List.generate(9, (index) => {'value': 0, 'color': ''}, growable: false);
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        indexes.add(j);
      }
    }
  }

  void restGame() {
    playerTurn = false;
    winner = 0;
    winnerName = '';
    fillLists();
    update();
  }

  void xoGame(int index) {
    if (!checkGame() && game[index]['value'] == 0 && winner == 0) {
      int choice = playerTurn ? secondPlayerO : firstPlayerX;
      String color = playerTurn ? 'second' : 'first';
      int countRowsFPlayer = 0;
      int countRowsSPlayer = 0;
      int countColumnsFPlayer = 0;
      int countColumnsSPlayer = 0;
      int countMiddleFPlayer = 0;
      int countMiddleSPlayer = 0;
      int countOtherMiddleFPlayer = 0;
      int countOtherMiddleSPlayer = 0;
      int helper = 3;
      if (index < 3) {
        xo[0][indexes[index]] = choice;
        game[index]['value'] = choice;
        game[index]['color'] = color;
      } else if (index < 6) {
        xo[1][indexes[index]] = choice;
        game[index]['value'] = choice;
        game[index]['color'] = color;
      } else {
        xo[2][indexes[index]] = choice;
        game[index]['value'] = choice;
        game[index]['color'] = color;
      }
      playerTurn = !playerTurn;
      if (game.length >= 3) {
        for (int i = 0; i < 3; i++) {
          countRowsFPlayer = 0;
          countRowsSPlayer = 0;
          countColumnsFPlayer = 0;
          countColumnsSPlayer = 0;
          for (int j = 0; j < 3; j++) {
            if (xo[i][j] == 1) {
              countRowsFPlayer += 1;
            } else if (xo[i][j] == 2) {
              countRowsSPlayer += 2;
            }
            if (xo[j][i] == 1) {
              countColumnsFPlayer += 1;
            } else if (xo[j][i] == 2) {
              countColumnsSPlayer += 2;
            }
            if (i == j && xo[i][j] == 1) {
              countMiddleFPlayer += 1;
            } else if (i == j && xo[i][j] == 2) {
              countMiddleSPlayer += 2;
            }
            if (helper - 1 == j && 3 - helper == i && xo[i][j] == 1) {
              helper -= 1;
              countOtherMiddleFPlayer += 1;
            } else if (helper - 1 == j && 3 - helper == i && xo[i][j] == 2) {
              helper -= 1;
              countOtherMiddleSPlayer += 2;
            }
          }
          if (countRowsFPlayer == 3 ||
              countColumnsFPlayer == 3 ||
              countMiddleFPlayer == 3 ||
              countOtherMiddleFPlayer == 3) {
            winner = 1;
            break;
          } else if (countRowsSPlayer == 6 ||
              countColumnsSPlayer == 6 ||
              countMiddleSPlayer == 6 ||
              countOtherMiddleSPlayer == 6) {
            winner = 2;
            break;
          }
        }
      }
      if (checkGame() && game[index]['value'] > 0) {
        winner = 3;
      }
    }
    update();
  }

  bool checkGame() {
    int temp = 0;
    for (var i in game) {
      if (i['value'] > 0) {
        temp += 1;
      }
    }
    return temp == game.length;
  }

  String whichNameChose(int index) {
    if (game[index]['value'] == 0) {
      return '';
    } else if (game[index]['value'] == 1) {
      return 'X';
    } else if (game[index]['value'] == 2) {
      return 'O';
    } else {
      return 'error';
    }
  }

  Color whichColorChose(int index) {
    if (winner > 0) {
      return AppColors.winnerColor;
    } else if (game[index]['color'] == 'first') {
      return AppColors.xColor;
    } else if (game[index]['color'] == 'second') {
      return AppColors.oColor;
    } else {
      return AppColors.bgColor;
    }
  }

  (String, String) whoWon() {
    if (winner == 1) {
      return ('Congratulations', '$firstPlayerName Won the Game');
    } else if (winner == 2) {
      return ('Congratulations', '$secondPlayerName Won the Game');
    } else if (winner == 3) {
      return ('Good Luck!', 'Players Draw, try again.');
    }
    return ('Error!', 'Sorry, Something went happened');
  }

  String getLiveName() {
    if (winner == 1) {
      winnerName = '$firstPlayerName Won';
    } else if (winner == 2) {
      winnerName = '$secondPlayerName Won';
    } else if (winner == 3) {
      winnerName = 'Players Draw';
    }
    return winnerName;
  }

  @override
  void onInit() {
    fillLists();
    super.onInit();
  }

  @override
  void onClose() {
    firstEditingCtr.dispose();
    secondEditingCtr.dispose();
    super.onClose();
  }
}

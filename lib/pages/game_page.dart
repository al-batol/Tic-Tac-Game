import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac/components/xo_container.dart';
import 'package:tic_tac/controllers/home_page_controller.dart';
import 'package:tic_tac/utils/app_dimensions.dart';
import 'package:tic_tac/utils/colors.dart';

class GamePage extends StatelessWidget {
  final HomeController homeCtr = Get.find<HomeController>();

  GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Container(
          height: AppDimensions.screenHeight,
          width: AppDimensions.screenWidth,
          padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                    homeCtr.restGame();
                  },
                  splashColor: Colors.transparent,
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: AppDimensions.resWidth(30),
                  ),
                ),
              ),
              SizedBox(height: 3.0.hp),
              Center(
                  child: GetBuilder<HomeController>(
                builder: (ctr) => ctr.winner == 0
                    ? RichText(
                        text: TextSpan(
                            text: 'Turn:',
                            style: TextStyle(
                              fontSize: 24.0.sp,
                              color: AppColors.textColor,
                            ),
                            children: [
                            TextSpan(
                              text:
                                  ' ${homeCtr.playerTurn ? '${homeCtr.secondPlayerName} (O)' : '${homeCtr.firstPlayerName} (X)'}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: homeCtr.playerTurn
                                    ? AppColors.oColor
                                    : AppColors.xColor,
                              ),
                            ),
                          ]))
                    : Text(
                        ctr.getLiveName(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.winnerColor,
                          fontSize: 24.0.sp,
                        ),
                      ),
              )),
              SizedBox(height: 7.0.hp),
              GetBuilder<HomeController>(
                builder: (ctr) => GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {},
                    child: GestureDetector(
                      onTap: () {
                        ctr.xoGame(index);
                        if (ctr.winner > 0 && ctr.winner < 4) {
                          var (status, name) = ctr.whoWon();
                          Get.defaultDialog(
                              title: status,
                              contentPadding: EdgeInsets.symmetric(horizontal :6.0.wp, vertical: 3.0.wp),
                              titleStyle: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 24.0.sp,
                              ),
                              backgroundColor: AppColors.containerColor,
                              content: Column(
                                children: [
                                  Text(name,
                                      style: TextStyle(
                                        fontSize: 22.0.sp,
                                        color: AppColors.winnerColor,
                                      )),
                                ],
                              ),
                              onWillPop: () async {
                                ctr.winner = 4;
                                return Future.value(true);
                              });
                        }
                      },
                      child: XoContainer(
                        xo: ctr.whichNameChose(index),
                        color: ctr.game[index]['color'] == 'first'
                            ? AppColors.xColor
                            : AppColors.oColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.0.hp),
              SizedBox(
                width: AppDimensions.resWidth(100),
                height: AppDimensions.resWidth(50),
                child: MaterialButton(
                  color: AppColors.buttonColor,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    homeCtr.restGame();
                  },
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 14.0.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

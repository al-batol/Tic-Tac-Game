import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac/controllers/home_page_controller.dart';
import 'package:tic_tac/pages/game_page.dart';
import 'package:tic_tac/utils/app_dimensions.dart';
import 'package:tic_tac/utils/colors.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      resizeToAvoidBottomInset: true,
      body: Container(
        width: AppDimensions.screenWidth,
        height: AppDimensions.screenHeight,
        padding: EdgeInsets.symmetric(horizontal: 10.0.wp),
        child: Form(
          key: controller.form,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.0.hp),
                  child: Text(
                    'Tic Tac game',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 24.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 25.0.hp),
                Text(
                  'Enter Players Names',
                  style: TextStyle(
                    color: AppColors.textColor2,
                    fontSize: 20.0.sp,
                  ),
                ),
                SizedBox(height: 2.0.hp),
                TextFormField(
                  controller: controller.firstEditingCtr,
                  style: const TextStyle(color: AppColors.textColor),
                  onTapOutside: (_) =>FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_2),
                    prefixIconColor: Colors.white.withOpacity(0.5),
                    labelText: '1st Player',
                    labelStyle: TextStyle(
                        color: AppColors.textColor, fontSize: 14.0.sp),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.textColor2.withOpacity(0.8),
                        width: 1.0.wp,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1.0.wp,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1.0.wp,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.5),
                        width: 1.0.wp,
                      ),
                    ),
                  ),
                  validator: (value) {
                    return controller.checkNames(value!);
                  },
                ),
                SizedBox(height: 2.0.hp),
                TextFormField(
                  controller: controller.secondEditingCtr,
                  style: const TextStyle(color: AppColors.textColor),
                  onTapOutside: (_) =>FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_2),
                    prefixIconColor: Colors.white.withOpacity(0.5),
                    labelText: '2nd Player',
                    labelStyle: TextStyle(
                        color: AppColors.textColor, fontSize: 14.0.sp),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.textColor2.withOpacity(0.8),
                        width: 1.0.wp,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1.0.wp,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1.0.wp,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.5),
                        width: 1.0.wp,
                      ),
                    ),
                  ),
                  validator: (value) {
                    return controller.checkNames(value!);
                  },
                ),
                SizedBox(height: 2.0.hp),
                SizedBox(
                  width: AppDimensions.resWidth(100),
                  height: AppDimensions.resWidth(50),
                  child: MaterialButton(
                    color: AppColors.buttonColor,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      if (controller.form.currentState!.validate()) {
                        Get.to(() => GamePage(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 300));
                        controller.firstPlayerName = controller.firstEditingCtr.text.replaceRange(0, 1, controller.firstEditingCtr.text[0].toUpperCase());
                        controller.secondPlayerName = controller.secondEditingCtr.text.replaceRange(0, 1, controller.secondEditingCtr.text[0].toUpperCase());
                        controller.firstEditingCtr.clear();
                        controller.secondEditingCtr.clear();
                        controller.resetGame();
                      }
                    },
                    child: Text(
                      'Start',
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
      ),
    );
  }
}

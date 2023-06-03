import 'package:get/get.dart';

class AppDimensions {
  static double screenHeight = Get.height;
  static double screenWidth = Get.width;

  static double resWidth(int size) {
    const double baseWidth = 411.0;
    return size * screenWidth / baseWidth;
  }
}


extension Responsive on double {
  double get hp => (Get.height * (this / 100));
  double get wp => (Get.width * (this / 100));
  double get sp => (Get.width / 100 * (this / 3));
}

import 'package:get/get.dart';
import 'package:tic_tac/controllers/home_page_controller.dart';

class BeginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

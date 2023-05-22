import 'package:get/get.dart';

import 'package:test_modernvet/modules/mainScreen/mainScreen.dart';

class MainScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainScreenController(MainScreenService()));
  }
}
import 'package:get/get.dart';
import 'package:test_modernvet/modules/mainScreen/mainScreen.dart';
import 'package:test_modernvet/screens/mainScreen.dart';

class Routes {
  static const String root = '/';
}

final List<GetPage> routes = [
  GetPage(name: Routes.root, page: () => MainScreen(Get.find()), binding: MainScreenBindings()),
];
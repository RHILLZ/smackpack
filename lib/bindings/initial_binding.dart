import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/controller_exporter.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController(), fenix: true);
    Get.lazyPut(() => AdminController(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);

    Get.putAsync<SharedPreferences>(() async {
      final prefs = await SharedPreferences.getInstance();
      return prefs;
    });
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smackpack/core/styles.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _email = ''.obs;
  final _password = ''.obs;

  set email(value) => _email.value = value;
  set password(value) => _password.value = value;

  signInWithEmail() async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: _email.value.trim(), password: _password.value.trim());
      if (cred.user?.uid != null) {
        Get.toNamed('/admin_view');
      }
    } catch (exception) {
      Get.snackbar('Problem with authentication', '$exception',
          colorText: errorTextColor, backgroundColor: errorColor);
    }
  }

  logOut() async => await _auth.signOut();
}

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smackpack/core/styles.dart';
import 'package:smackpack/core/utils/reacher.dart';
import 'package:smackpack/data/firebase/futures.dart';
import 'package:smackpack/data/firebase/streams.dart';
import 'package:smackpack/data/models/contact.dart';
import 'package:smackpack/data/models/product.dart';
import 'package:smackpack/views/locationChoiceView.dart';
import 'package:url_launcher/url_launcher.dart';

enum Location {
  nj,
  nyc,
}

class AppController extends GetxController {
  late SharedPreferences _prefs;
  final _isVerified = false.obs;
  final RxList<Product> _products = <Product>[].obs;
  final Rx<Contact> _contact = Contact(
    cashAppTag: '',
    deliveryInfo: '',
    deliveryFee: '',
    pickUpLocation: '',
    contact: '',
  ).obs;
  final _doneLoading = false.obs;
  final Rx<Location> _location = Location.nj.obs;

  // getters
  get isVerified => _isVerified.value;
  get doneLoading => _doneLoading.value;
  get contact => _contact.value;
  get products => _products;
  get location => _location.value;

  @override
  void onInit() async {
    super.onInit();
    // initiate the shared preferences
    _prefs = await SharedPreferences.getInstance();
    // sets the age verification from the shared prefs
    _isVerified.value = _prefs.getBool('isVerified') ?? false;
    fetchData();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  //   registerToken();
  // }

//sets shared preferences age verification to true
  verifyAge(bool value) {
    _prefs.setBool('isVerified', value);
    _isVerified.value = value;
  }

// handle enter app
  enterApp() {
    if (_isVerified.value) {
      Get.to(() => const LocationChoiceView());
      registerToken();
    } else {
      Get.snackbar(
          'Are you 21+?', 'Please verify by checking the box below. Thank you.',
          colorText: errorTextColor, backgroundColor: errorColor);
    }
  }

  //set location
  void setLocation(Location location) async {
    _location.value = location;
    _doneLoading.value = false;
    Future.delayed(const Duration(microseconds: 2000), null);
    await fetchData();
    Get.toNamed('/main_view');
  }

  //fetch contact
  Future<void> fetchData() async {
    _products.bindStream(FirebaseStreams().streamMenuProducts(_location.value));
    _contact.value = await FirebaseFutures().getContactInfo(_location.value);
    _doneLoading.value = true;
  }

  // call smackpack nj
  void call() => ReachBy.call(contact.contact);

  // message smackpack nj
  void sms() => ReachBy.sendSMS(contact.contact);

  //register FCM token
  void registerToken() async {
    final token = _prefs.getString('fcmToken') ?? '';
    if (token == '') {
      final newToken = await FirebaseMessaging.instance.getToken();
      await FirebaseFutures().registerFCM(newToken!);
      _prefs.setString('fcmToken', newToken);
      if (kDebugMode) {
        print('REGISTERED FCM TOKEN...');
      }
    }

    return;
  }

  //open ig link
  followUsHere() async {
    const auth = 'instagram.com';
    final Uri uri = Uri.https(auth, '/smack_pack_nyc');
    await launchUrl(uri);
  }
}

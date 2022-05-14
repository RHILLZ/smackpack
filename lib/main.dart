import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/bindings/initial_binding.dart';
import 'package:smackpack/core/styles.dart';
import 'package:smackpack/routes/views.dart';
import 'package:firebase_core/firebase_core.dart';

import 'controllers/controller_exporter.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  InitialBinding().dependencies();
  final prefs = await SharedPreferences.getInstance();

//notifications config
  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      'resource://drawable/res_app_icon',
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: smackGreen,
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupkey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: true);

  runApp(DevicePreview(
    enabled: false,
    builder: (contect) => SmackPackApp(prefs: prefs),
  ));
}

class SmackPackApp extends StatelessWidget {
  const SmackPackApp({super.key, required SharedPreferences prefs})
      : _prefs = prefs;

  // This widget is the root of your application.
  final SharedPreferences _prefs;
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'SmackPack',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        getPages: Views.routes,
        initialBinding: InitialBinding(),
        // initialRoute: Views.authView
        initialRoute: _prefs.getBool('isVerified') ?? false
            ? Views.locationChoiceView
            : Views.enterView,
      );
    });
  }
}

import 'package:url_launcher/url_launcher.dart';

class ReachBy {
// format number as +16095555555
  static sendSMS(String phoneNumber) {
    final url = Uri(scheme: 'sms', path: phoneNumber);

    launchUrl(url);
  }

  static call(String phoneNumber) {
    String lead = '+1-';
    String areaCode = phoneNumber.substring(2, 5);
    String number =
        '${phoneNumber.substring(6, 8)}-${phoneNumber.substring(9)}';
    String phonenumber = '$lead$areaCode$number';
    final url = Uri(scheme: 'tel', path: phoneNumber);

    launchUrl(url);
  }
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/controllers/controller_exporter.dart';
import 'package:smackpack/core/styles.dart';
import 'package:smackpack/widgets/widgets_export.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required AppController controller})
      : _controller = controller;

  final AppController _controller;
  @override
  Widget build(BuildContext context) {
    final contactNumber = _controller.contact.contact;
    final areaCode = contactNumber.substring(0, 3);
    final first = contactNumber.substring(3, 6);
    final last = contactNumber.substring(6, 10);
    final number = '$areaCode-$first-$last';
    return Container(
      height: 10.h,
      width: 90.w,
      decoration: BoxDecoration(
          border: thinBorder,
          color: smackPink.withOpacity(.4),
          boxShadow: const [buttonBoxShadow]),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ContactButton(icon: Icons.phone, action: _controller.call),
          contact(number),
          ContactButton(icon: Icons.message, action: _controller.sms)
        ],
      ),
    );
  }

  Widget contact(String number) => SmackText(
      text: number,
      strokeColor: mainStrokeColor,
      textColor: mainTextColor,
      size: 30);
}

class ContactButton extends StatelessWidget {
  ContactButton({super.key, required IconData icon, required Function action})
      : _icon = icon,
        _action = action;

  final GlobalKey _key = GlobalKey();
  final IconData _icon;
  final Function _action;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: _key,
      shape: const CircleBorder(),
      backgroundColor: Colors.grey[200]!.withOpacity(.5),
      elevation: 3,
      onPressed: () => _action(),
      child: Icon(
        _icon,
        size: 30,
        color: smackGreen,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/controllers/admin_controller.dart';
import 'package:smackpack/core/styles.dart';

class SmackTextInput extends GetView<AdminController> {
  const SmackTextInput(
      {super.key,
      String? hintText,
      Widget? icon,
      int? width,
      required bool isPassword,
      Function? action,
      String? initialValue})
      : _hintext = hintText,
        _width = width,
        _initialValue = initialValue,
        _action = action,
        _isPassword = isPassword,
        _icon = icon;

  final String? _hintext;
  final Widget? _icon;
  final int? _width;
  final String? _initialValue;
  final Function? _action;
  final bool _isPassword;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width?.w ?? 95.w,
      child: TextFormField(
        obscureText: _isPassword,
        onChanged: (value) => _action!(value),
        initialValue: _initialValue,
        decoration: InputDecoration(
            suffixIcon: _icon,
            contentPadding:
                EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
            fillColor: Colors.grey[300],
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: smackGreen)),
            border: const OutlineInputBorder(),
            labelText: _hintext,
            labelStyle: const TextStyle(color: smackPink),
            hintText: _hintext),
      ),
    );
  }
}

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SmackText extends StatelessWidget {
  const SmackText(
      {Key? key,
      required String text,
      required Color strokeColor,
      required Color textColor,
      required double size,
      bool? showShimmer,
      double? strokeWidth})
      : _text = text,
        _strokeColor = strokeColor,
        _textColor = textColor,
        _size = size,
        _strokeWidth = strokeWidth,
        _showShimmer = showShimmer,
        super(key: key);

  final String _text;
  final Color _strokeColor, _textColor;
  final double _size;
  final double? _strokeWidth;
  final bool? _showShimmer;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          _text,
          style: strokeStyle(),
        ),
        Shimmer.fromColors(
          baseColor: _textColor,
          highlightColor: Colors.white,
          enabled: _showShimmer ?? false,
          child: Text(
            _text,
            style: textStyle(),
          ),
        ),
      ],
    );
  }

  strokeStyle() => TextStyle(
      decoration: TextDecoration.none,
      fontSize: _size,
      fontFamily: 'BadaBoom',
      height: 1,
      foreground: Paint()
        ..style = PaintingStyle.stroke
        ..color = _strokeColor
        ..strokeWidth = _strokeWidth ?? 4);
  textStyle() => TextStyle(
      decoration: TextDecoration.none,
      fontSize: _size,
      fontFamily: 'BadaBoom',
      height: 1,
      color: _textColor);
}

// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/controllers/controller_exporter.dart';
import 'package:smackpack/data/models/product.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer(
      {super.key, required AdminController controller, Product? product})
      : _controller = controller,
        _product = product;

  final AdminController _controller;
  final Product? _product;
  @override
  Widget build(BuildContext context) {
    final imagePath = _controller.imageFile.path;
    final imageFile = _controller.imageFile;
    final imageUrl = _product?.strainImageURL;
    return Obx(() => Container(
          foregroundDecoration: BoxDecoration(
              image: _controller.imageFile.path != ''
                  ? DecorationImage(
                      image: FileImage(_controller.imageFile),
                      fit: BoxFit.cover)
                  : null),
          decoration: BoxDecoration(
              image: imageUrl != null
                  ? DecorationImage(
                      image: CachedNetworkImageProvider(imageUrl),
                      fit: BoxFit.cover)
                  : const DecorationImage(
                      image: AssetImage('assets/logos/cover_logo.png'),
                      fit: BoxFit.cover)),
          width: 100.w,
          height: 40.h,
        ));
  }
}

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'package:flutter/foundation.dart';
import 'package:smackpack/controllers/controller_exporter.dart';

class Storage {
  final _storage = fs.FirebaseStorage.instance;

  //upload image to firebase
  Future<bool> uploadImage(
      File image, String strainName, Location location) async {
    bool isSuccessful = false;
    final imageName = image.path.split('/').last;
    try {
      if (location == Location.nj) {
        await _storage.ref('njMenu/$strainName/$imageName').putFile(image);
        isSuccessful = true;
      }
      if (location == Location.nyc) {
        await _storage.ref('nycMenu/$strainName/$imageName').putFile(image);
        isSuccessful = true;
      }
    } catch (exception) {
      throw exception.toString();
    }
    return isSuccessful;
  }

  //get download url
  Future<String?> getDownloadURL(
      Location location, String imageName, String strainName) async {
    String? imageUrl;
    if (location == Location.nj) {
      return await _storage
          .ref('njMenu/$strainName/$imageName')
          .getDownloadURL()
          .then((url) => imageUrl = url.toString());
    }
    if (location == Location.nyc) {
      return await _storage
          .ref('nycMenu/$strainName/$imageName')
          .getDownloadURL()
          .then((url) => imageUrl = url.toString());
    }
    return imageUrl;
  }

  //delete/ remove from storage
  Future<bool> removeImageFromStorage(
      Location location, String imageName, String strainName) async {
    bool isSuccessful = false;
    try {
      if (location == Location.nj) {
        await _storage.ref('njMenu/$strainName/$imageName').delete();
        isSuccessful = true;
      }
      if (location == Location.nyc) {
        await _storage.ref('nycMenu/$strainName/$imageName').delete();
        isSuccessful = true;
      }
    } catch (exception) {
      if (kDebugMode) {
        print(exception.toString());
      }
    }
    return isSuccessful;
  }
}

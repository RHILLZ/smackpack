import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:smackpack/controllers/controller_exporter.dart';
import 'package:smackpack/data/models/contact.dart';
import 'package:smackpack/data/models/product.dart';

class FirebaseFutures {
  final _fb = FirebaseFirestore.instance;
  final String njMenuCollection = 'nj_menu';
  final String nycMenuCollection = 'nyc_menu';
  final String contactCollection = 'contact';
  final String tokenCollection = 'tokens';

  //create product nj
  Future<bool> createProduct(Product prod, Location location) async {
    bool isSuccessful = false;
    final product = prod.toJson();
    try {
      if (location == Location.nj) {
        _fb
            .collection(njMenuCollection)
            .doc(product['strainName'])
            .set(product);
      }
      if (location == Location.nyc) {
        _fb
            .collection(nycMenuCollection)
            .doc(product['strainName'])
            .set(product);
      }
      isSuccessful = true;
    } catch (exception) {
      if (kDebugMode) {
        print(exception.toString());
      }
    }
    return isSuccessful;
  }

  //update product nj
  Future<bool> updateProduct(Product prod, Location location) async {
    bool isSuccessful = false;
    final product = prod.toJson();
    try {
      if (location == Location.nj) {
        _fb
            .collection(njMenuCollection)
            .doc(product['strainName'])
            .update(product);
      }

      if (location == Location.nyc) {
        _fb
            .collection(nycMenuCollection)
            .doc(product['strainName'])
            .update(product);
      }
      isSuccessful = true;
    } catch (exception) {
      if (kDebugMode) {
        print(exception.toString());
      }
    }
    return isSuccessful;
  }

  //delete product
  Future<bool> deleteProduct(Product prod, Location location) async {
    bool isSuccessful = false;
    final product = prod.toJson();
    try {
      if (location == Location.nj) {
        _fb.collection(njMenuCollection).doc(product['strainName']).delete();
      }

      if (location == Location.nyc) {
        _fb.collection(nycMenuCollection).doc(product['strainName']).delete();
      }
      isSuccessful = true;
    } catch (exception) {
      if (kDebugMode) {
        print(exception.toString());
      }
    }
    return isSuccessful;
  }

  //create contact
  Future<bool> createContactInfo(Contact contact, Location location) async {
    bool isSuccessful = false;
    final contactInfo = contact.toJson();
    try {
      if (location == Location.nj) {
        _fb.collection(contactCollection).doc('nj').set(contactInfo);
      }
      if (location == Location.nyc) {
        _fb.collection(contactCollection).doc('nyc').set(contactInfo);
      }
      isSuccessful = true;
    } catch (exception) {
      if (kDebugMode) {
        print(exception.toString());
      }
    }
    return isSuccessful;
  }

  //fetch contact
  Future<Contact> getContactInfo(Location location) async {
    late Contact contact;
    try {
      if (location == Location.nj) {
        contact = await _fb
            .collection(contactCollection)
            .doc('nj')
            .get()
            .then((doc) => Contact.fromJson(doc.data()!));
      }
      if (location == Location.nyc) {
        contact = await _fb
            .collection(contactCollection)
            .doc('nyc')
            .get()
            .then((doc) => Contact.fromJson(doc.data()!));
      }
    } catch (exception) {
      if (kDebugMode) {
        print(exception.toString());
      }
    }
    return contact;
  }

  //update contact info
  Future<bool> updateContactInfo(Contact contact, Location location) async {
    bool isSuccessful = false;
    final contactInfo = contact.toJson();
    try {
      if (location == Location.nj) {
        _fb.collection(contactCollection).doc('nj').update(contactInfo);
      }
      if (location == Location.nyc) {
        _fb.collection(contactCollection).doc('nyc').update(contactInfo);
      }
      isSuccessful = true;
    } catch (exception) {
      if (kDebugMode) {
        print(exception.toString());
      }
    }
    return isSuccessful;
  }

  //fcm token registration
  Future<void> registerFCM(String token) async {
    try {
      _fb.collection(tokenCollection).doc('tokenList').update({
        'tokens': FieldValue.arrayUnion([token])
      });
    } catch (exception) {
      if (kDebugMode) {
        print(exception.toString());
      }
    }
  }
}

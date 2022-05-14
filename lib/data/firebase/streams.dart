import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smackpack/data/models/product.dart';
import '../../controllers/controller_exporter.dart';

class FirebaseStreams {
  final _firestore = FirebaseFirestore.instance;
  final String njMenuCollection = 'nj_menu';
  final String nycMenuCollection = 'nyc_menu';

  //stream products
  Stream<List<Product>> streamAdminProducts(Location location) {
    if (location == Location.nj) {
      return _firestore.collection(njMenuCollection).snapshots().map((event) =>
          event.docs.map((doc) => Product.fromJson(doc.data())).toList());
    }
    if (location == Location.nyc) {
      return _firestore.collection(nycMenuCollection).snapshots().map((event) =>
          event.docs.map((doc) => Product.fromJson(doc.data())).toList());
    }

    return const Stream.empty();
  }

  Stream<List<Product>> streamMenuProducts(Location location) {
    if (location == Location.nj) {
      return _firestore.collection(njMenuCollection).snapshots().map((event) =>
          event.docs
              .map((doc) => Product.fromJson(doc.data()))
              .where((product) => product.isInStock == true)
              .toList());
    }
    if (location == Location.nyc) {
      return _firestore.collection(nycMenuCollection).snapshots().map((event) =>
          event.docs
              .map((doc) => Product.fromJson(doc.data()))
              .where((product) => product.isInStock == true)
              .toList());
    }

    return const Stream.empty();
  }

  //stream product
  Stream<Product> streamProduct(Location location, String strainName) {
    if (location == Location.nj) {
      return _firestore
          .collection(njMenuCollection)
          .doc(strainName)
          .snapshots()
          .map((doc) => Product.fromJson(doc.data()!));
    }
    if (location == Location.nyc) {
      return _firestore
          .collection(nycMenuCollection)
          .doc(strainName)
          .snapshots()
          .map((doc) => Product.fromJson(doc.data()!));
    }

    return const Stream.empty();
  }
}

import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

///{@template Product}
/// A ATO for Firstore `product` document.
/// {@endtemplate}

@JsonSerializable()
class Product {
  String strainName;
  String strainType;
  double effectLevel;
  String thcLevel;
  String cbdLevel;
  String quarterPrice;
  String halfPrice;
  String ozPrice;
  bool isInStock;
  String? strainImageURL;

  Product({
    required this.strainName,
    required this.strainType,
    required this.effectLevel,
    required this.thcLevel,
    required this.cbdLevel,
    required this.quarterPrice,
    required this.halfPrice,
    required this.ozPrice,
    required this.isInStock,
    this.strainImageURL,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

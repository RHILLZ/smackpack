// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      strainName: json['strainName'] as String,
      strainType: json['strainType'] as String,
      effectLevel: (json['effectLevel'] as num).toDouble(),
      thcLevel: json['thcLevel'] as String,
      cbdLevel: json['cbdLevel'] as String,
      quarterPrice: json['quarterPrice'] as String,
      halfPrice: json['halfPrice'] as String,
      ozPrice: json['ozPrice'] as String,
      isInStock: json['isInStock'] as bool,
      strainImageURL: json['strainImageURL'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'strainName': instance.strainName,
      'strainType': instance.strainType,
      'effectLevel': instance.effectLevel,
      'thcLevel': instance.thcLevel,
      'cbdLevel': instance.cbdLevel,
      'quarterPrice': instance.quarterPrice,
      'halfPrice': instance.halfPrice,
      'ozPrice': instance.ozPrice,
      'isInStock': instance.isInStock,
      'strainImageURL': instance.strainImageURL,
    };

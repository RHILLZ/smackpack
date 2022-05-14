// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      cashAppTag: json['cashAppTag'] as String,
      deliveryInfo: json['deliveryInfo'] as String,
      deliveryFee: json['deliveryFee'] as String,
      pickUpLocation: json['pickUpLocation'] as String,
      contact: json['contact'] as String,
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'cashAppTag': instance.cashAppTag,
      'deliveryInfo': instance.deliveryInfo,
      'deliveryFee': instance.deliveryFee,
      'pickUpLocation': instance.pickUpLocation,
      'contact': instance.contact,
    };

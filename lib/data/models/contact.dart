import 'package:json_annotation/json_annotation.dart';
part 'contact.g.dart';

///{@template Product}
/// A ATO for Firstore `product` document.
/// {@endtemplate}

@JsonSerializable()
class Contact {
  String cashAppTag;
  String deliveryInfo;
  String deliveryFee;
  String pickUpLocation;
  String contact;

  Contact({
    required this.cashAppTag,
    required this.deliveryInfo,
    required this.deliveryFee,
    required this.pickUpLocation,
    required this.contact,
  });

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}

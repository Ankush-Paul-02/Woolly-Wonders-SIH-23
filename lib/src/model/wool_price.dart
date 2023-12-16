// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WoolPrice {
  final String state;
  final String district;
  final String market;
  final String commodity;
  final String variety;
  final String arrivalDate;
  final String minPrice;
  final String maxPrice;
  final String modalPrice;
  final String updateDate;

  WoolPrice({
    required this.state,
    required this.district,
    required this.market,
    required this.commodity,
    required this.variety,
    required this.arrivalDate,
    required this.minPrice,
    required this.maxPrice,
    required this.modalPrice,
    required this.updateDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'state': state,
      'district': district,
      'market': market,
      'commodity': commodity,
      'variety': variety,
      'arrivalDate': arrivalDate,
      'minPrice': minPrice,
      'maxPrice': maxPrice,
      'modalPrice': modalPrice,
      'updateDate': updateDate,
    };
  }

  factory WoolPrice.fromMap(Map<String, dynamic> map) {
    return WoolPrice(
      state: map['state'] as String,
      district: map['district'] as String,
      market: map['market'] as String,
      commodity: map['commodity'] as String,
      variety: map['variety'] as String,
      arrivalDate: map['arrivalDate'] as String,
      minPrice: map['minPrice'] as String,
      maxPrice: map['maxPrice'] as String,
      modalPrice: map['modalPrice'] as String,
      updateDate: map['updateDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WoolPrice.fromJson(String source) =>
      WoolPrice.fromMap(json.decode(source) as Map<String, dynamic>);
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WoolModel {
  final String id;
  final String color;
  final bool isRejected;
  WoolModel({
    required this.id,
    required this.color,
    required this.isRejected,
  });

  WoolModel copyWith({
    String? id,
    String? color,
    bool? isRejected,
  }) {
    return WoolModel(
      id: id ?? this.id,
      color: color ?? this.color,
      isRejected: isRejected ?? this.isRejected,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'color': color,
      'isRejected': isRejected,
    };
  }

  factory WoolModel.fromMap(Map<String, dynamic> map) {
    return WoolModel(
      id: map['id'] as String,
      color: map['color'] as String,
      isRejected: map['isRejected'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory WoolModel.fromJson(String source) => WoolModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'WoolModel(id: $id, color: $color, isRejected: $isRejected)';

  @override
  bool operator ==(covariant WoolModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.color == color &&
      other.isRejected == isRejected;
  }

  @override
  int get hashCode => id.hashCode ^ color.hashCode ^ isRejected.hashCode;
  }

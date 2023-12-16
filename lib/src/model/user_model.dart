// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String name;
  final String phoneNumber;
  final String email;
  final String aadharNumber;
  final String profilePicture;
  final String uid;
  final bool isVerified;

  UserModel({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.aadharNumber,
    required this.profilePicture,
    required this.uid,
    required this.isVerified,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'aadharNumber': aadharNumber,
      'profilePicture': profilePicture,
      'uid': uid,
      'isVerified': isVerified,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      phoneNumber: map['phoneNumber'] as String,
      email: map['email'] as String,
      aadharNumber: map['aadharNumber'] as String,
      profilePicture: map['profilePicture'] as String,
      uid: map['uid'] as String,
      isVerified: map['isVerified'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserModel copyWith({
    String? name,
    String? phoneNumber,
    String? email,
    String? aadharNumber,
    String? profilePicture,
    String? uid,
    bool? isVerified,
  }) {
    return UserModel(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      aadharNumber: aadharNumber ?? this.aadharNumber,
      profilePicture: profilePicture ?? this.profilePicture,
      uid: uid ?? this.uid,
      isVerified: isVerified ?? this.isVerified,
    );
  }
}

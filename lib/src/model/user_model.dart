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
  final bool isRegistered;

  UserModel({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.aadharNumber,
    required this.profilePicture,
    required this.uid,
    required this.isVerified,
    required this.isRegistered,
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
      'isRegistered': isRegistered,
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
      isRegistered: map['isRegistered'] as bool,
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
    bool? isRegistered,
  }) {
    return UserModel(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      aadharNumber: aadharNumber ?? this.aadharNumber,
      profilePicture: profilePicture ?? this.profilePicture,
      uid: uid ?? this.uid,
      isVerified: isVerified ?? this.isVerified,
      isRegistered: isRegistered ?? this.isRegistered,
    );
  }

  @override
  String toString() {
    return 'UserModel(name: $name, phoneNumber: $phoneNumber, email: $email, aadharNumber: $aadharNumber, profilePicture: $profilePicture, uid: $uid, isVerified: $isVerified, isRegistered: $isRegistered)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.phoneNumber == phoneNumber &&
      other.email == email &&
      other.aadharNumber == aadharNumber &&
      other.profilePicture == profilePicture &&
      other.uid == uid &&
      other.isVerified == isVerified &&
      other.isRegistered == isRegistered;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      phoneNumber.hashCode ^
      email.hashCode ^
      aadharNumber.hashCode ^
      profilePicture.hashCode ^
      uid.hashCode ^
      isVerified.hashCode ^
      isRegistered.hashCode;
  }
}

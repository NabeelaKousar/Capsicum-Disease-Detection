// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  int? uid;
  String? role;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phone;
  String? address;
  UserModel({
    this.uid,
    this.role,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phone,
    this.address,
  });

  UserModel copyWith({
    int? uid,
    String? role,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? phone,
    String? address,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      role: role ?? this.role,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'role': role,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'phone': phone,
      'address': address,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] != null ? map['uid'] as int : null,
      role: map['role'] != null ? map['role'] as String : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uid: $uid, role: $role, firstName: $firstName, lastName: $lastName, email: $email, password: $password, phone: $phone, address: $address)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.role == role &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.password == password &&
        other.phone == phone &&
        other.address == address;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        role.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        password.hashCode ^
        phone.hashCode ^
        address.hashCode;
  }
}

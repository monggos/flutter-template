// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String idNumber;
  final String mobile;
  final String? pin;
  final String? token;
  final String nameFirst;
  final String nameLast;
  final String? nameMiddle;
  final String? suffix;
  final DateTime dob;
  final String gender;
  final String? bloodType;
  final String civilStatus;
  final String citizenship;
  final String? email;
  final String? houseNo;
  final String? building;
  final String? subdivision;
  final String street;
  final String sitio;
  final String residencyType;
  final String barangay;
  final String city;
  final String province;
  final String zipCode;
  final String? photo;
  final String? qrcode;
  final bool deleted;
  final String status;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const User({
    required this.id,
    required this.idNumber,
    required this.mobile,
    this.token,
    this.pin,
    required this.nameFirst,
    required this.nameLast,
    this.nameMiddle,
    this.suffix,
    required this.dob,
    required this.gender,
    this.bloodType,
    required this.civilStatus,
    required this.citizenship,
    this.email,
    this.houseNo,
    this.building,
    this.subdivision,
    required this.street,
    required this.sitio,
    required this.residencyType,
    required this.barangay,
    required this.city,
    required this.province,
    required this.zipCode,
    this.photo,
    this.qrcode,
    required this.deleted,
    required this.status,
    required this.createdAt,
    this.updatedAt,
  });

  User copyWith({
    String? id,
    String? idNumber,
    String? mobile,
    String? pin,
    String? token,
    String? nameFirst,
    String? nameLast,
    String? nameMiddle,
    String? suffix,
    DateTime? dob,
    String? gender,
    String? bloodType,
    String? civilStatus,
    String? citizenship,
    String? email,
    String? houseNo,
    String? building,
    String? subdivision,
    String? street,
    String? sitio,
    String? residencyType,
    String? barangay,
    String? city,
    String? province,
    String? zipCode,
    String? photo,
    String? qrcode,
    bool? deleted,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      idNumber: idNumber ?? this.idNumber,
      mobile: mobile ?? this.mobile,
      pin: pin ?? this.pin,
      token: token ?? this.token,
      nameFirst: nameFirst ?? this.nameFirst,
      nameLast: nameLast ?? this.nameLast,
      nameMiddle: nameMiddle ?? this.nameMiddle,
      suffix: suffix ?? this.suffix,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      bloodType: bloodType ?? this.bloodType,
      civilStatus: civilStatus ?? this.civilStatus,
      citizenship: citizenship ?? this.citizenship,
      email: email ?? this.email,
      houseNo: houseNo ?? this.houseNo,
      building: building ?? this.building,
      subdivision: subdivision ?? this.subdivision,
      street: street ?? this.street,
      sitio: sitio ?? this.sitio,
      residencyType: residencyType ?? this.residencyType,
      barangay: barangay ?? this.barangay,
      city: city ?? this.city,
      province: province ?? this.province,
      zipCode: zipCode ?? this.zipCode,
      photo: photo ?? this.photo,
      qrcode: qrcode ?? this.qrcode,
      deleted: deleted ?? this.deleted,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idNumber': idNumber,
      'mobile': mobile,
      'pin': pin,
      'token': token,
      'nameFirst': nameFirst,
      'nameLast': nameLast,
      'nameMiddle': nameMiddle,
      'suffix': suffix,
      'dob': dob.millisecondsSinceEpoch,
      'gender': gender,
      'bloodType': bloodType,
      'civilStatus': civilStatus,
      'citizenship': citizenship,
      'email': email,
      'houseNo': houseNo,
      'building': building,
      'subdivision': subdivision,
      'street': street,
      'sitio': sitio,
      'residencyType': residencyType,
      'barangay': barangay,
      'city': city,
      'province': province,
      'zipCode': zipCode,
      'photo': photo,
      'qrcode': qrcode,
      'deleted': deleted,
      'status': status,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: (map['id'] ?? '') as String,
      idNumber: (map['idNumber'] ?? '') as String,
      mobile: (map['mobile'] ?? '') as String,
      pin: map['pin'] != null ? map['pin'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
      nameFirst: (map['nameFirst'] ?? '') as String,
      nameLast: (map['nameLast'] ?? '') as String,
      nameMiddle: map['nameMiddle'] != null ? map['nameMiddle'] as String : null,
      suffix: map['suffix'] != null ? map['suffix'] as String : null,
      dob: DateTime.fromMillisecondsSinceEpoch((((map['dob'] is int) ? map['dob'] : DateTime.tryParse(map['dob'])?.millisecondsSinceEpoch))??0),
      gender: (map['gender'] ?? '') as String,
      bloodType: map['bloodType'] != null ? map['bloodType'] as String : null,
      civilStatus: (map['civilStatus'] ?? '') as String,
      citizenship: (map['citizenship'] ?? '') as String,
      email: map['email'] != null ? map['email'] as String : null,
      houseNo: map['houseNo'] != null ? map['houseNo'] as String : null,
      building: map['building'] != null ? map['building'] as String : null,
      subdivision: map['subdivision'] != null ? map['subdivision'] as String : null,
      street: (map['street'] ?? '') as String,
      sitio: (map['sitio'] ?? '') as String,
      residencyType: (map['residencyType'] ?? '') as String,
      barangay: (map['barangay'] ?? '') as String,
      city: (map['city'] ?? '') as String,
      province: (map['province'] ?? '') as String,
      zipCode: (map['zipCode'] ?? '') as String,
      photo: map['photo'] != null ? map['photo'] as String : null,
      qrcode: map['qrcode'] != null ? map['qrcode'] as String : null,
      deleted: (map['deleted'] ?? false) as bool,
      status: (map['status'] ?? '') as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch((((map['createdAt'] is int) ? map['createdAt'] : DateTime.tryParse(map['createdAt'])?.millisecondsSinceEpoch))??0),
      updatedAt: map['updatedAt'] != null ? DateTime.fromMillisecondsSinceEpoch((((map['updatedAt'] is int) ? map['updatedAt'] : DateTime.tryParse(map['updatedAt'])?.millisecondsSinceEpoch))??0) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      idNumber,
      mobile,
      pin,
      token,
      nameFirst,
      nameLast,
      nameMiddle,
      suffix,
      dob,
      gender,
      bloodType,
      civilStatus,
      citizenship,
      email,
      houseNo,
      building,
      subdivision,
      street,
      sitio,
      residencyType,
      barangay,
      city,
      province,
      zipCode,
      photo,
      qrcode,
      deleted,
      status,
      createdAt,
      updatedAt,
    ];
  }
}

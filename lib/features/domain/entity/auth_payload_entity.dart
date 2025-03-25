
import 'dart:convert';

import 'package:equatable/equatable.dart';

class AuthPayloadEntity extends Equatable {
  final String? userName;
  final String? otp;
  const AuthPayloadEntity({this.userName, this.otp});

  AuthPayloadEntity copyWith({String? userName, String? otp}) {
    return AuthPayloadEntity(
      userName: userName ?? this.userName,
      otp: otp ?? this.otp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'userName': userName, 'otp': otp};
  }

  factory AuthPayloadEntity.fromMap(Map<String, dynamic> map) {
    return AuthPayloadEntity(
      userName: map['userName'] != null ? map['userName'] as String : null,
      otp: map['otp'] != null ? map['otp'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthPayloadEntity.fromJson(String source) =>
      AuthPayloadEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [userName ?? '', otp ?? ''];
}

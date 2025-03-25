
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class AuthResultEntity extends Equatable {
  final String? userId;
  final String? userName;
  final String? loginStatus;
  final String? profilePicture;

  const AuthResultEntity({
    this.userId,
    this.userName,
    this.loginStatus,
    this.profilePicture,
  });

  AuthResultEntity copyWith({
    String? userId,
    String? userName,
    String? loginStatus,
    String? profilePicture,
  }) {
    return AuthResultEntity(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      loginStatus: loginStatus ?? this.loginStatus,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userName': userName,
      'loginStatus': loginStatus,
      'profilePicture': profilePicture,
    };
  }

  factory AuthResultEntity.fromMap(Map<String, dynamic> map) {
    return AuthResultEntity(
      userId: map['userId'] as String?,
      userName: map['userName'] as String?,
      loginStatus: map['loginStatus'] as String?,
      profilePicture: map['profilePicture'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthResultEntity.fromJson(Map<String, dynamic> json) {
    return AuthResultEntity(
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      loginStatus: json['loginStatus'] as String,
      profilePicture: json['profilePicture'] as String,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [userId, userName, loginStatus, profilePicture];
}

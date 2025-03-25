import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String username;
  final String userId;
  final String imgUrl;

  const UserModel({
    required this.username,
    required this.userId,
    required this.imgUrl,
  });

  UserModel copyWith({String? username, String? userId, String? imgUrl}) {
    return UserModel(
      username: username ?? this.username,
      userId: userId ?? this.userId,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'userId': userId,
      'imgUrl': imgUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] as String,
      userId: map['userId'] as String,
      imgUrl: map['imgUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [username, userId, imgUrl];
}

import 'package:equatable/equatable.dart';

class SocialModel extends Equatable {
  final String name;
  final String history;
  final String imgUrl;

  const SocialModel({this.name = "", this.history = "", this.imgUrl = ""});

  @override
  List<Object?> get props => [name, history, imgUrl];
}

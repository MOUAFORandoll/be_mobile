import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';
 
@freezed
class User with _$User {
  const factory User({
    required int id,
    required String nom,
    required String prenom,
    String? email,
    required String phone,
    required bool status,
    @JsonKey(name: 'is_complete') required bool isComplete,
    required int typeUser,
    required String profile,
    required int solde,
    @JsonKey(name: 'date_created') required String dateCreated,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
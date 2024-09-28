// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num).toInt(),
      nom: json['nom'] as String,
      prenom: json['prenom'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String,
      status: json['status'] as bool,
      isComplete: json['is_complete'] as bool,
      typeUser: (json['typeUser'] as num).toInt(),
      profile: json['profile'] as String,
      solde: (json['solde'] as num).toInt(),
      dateCreated: json['date_created'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'prenom': instance.prenom,
      'email': instance.email,
      'phone': instance.phone,
      'status': instance.status,
      'is_complete': instance.isComplete,
      'typeUser': instance.typeUser,
      'profile': instance.profile,
      'solde': instance.solde,
      'date_created': instance.dateCreated,
    };

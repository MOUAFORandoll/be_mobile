import 'package:jwt_decode/jwt_decode.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class YourDataModel {
  int id;
  String name;

  YourDataModel({this.id = 0, required this.name});
}

@Entity()
class Second {
  int id;
  String name;

  Second({this.id = 0, required this.name});
}

@Entity()
class User {
  int id = 0;
  @Property()
  int userId = 0;
  @Property()
  double solde = 0;

  @Property()
  double soldeBonus = 0;
  @Property()
  String nom;

  @Property()
  String prenom;

  @Property()
  String email;

  @Property()
  String profile;

  @Property()
  String phone;

  @Property()
  String dateCreated;

  @Property()
  int typeUser;

  User({
    required this.userId,
    required this.solde,
    required this.nom,
    required this.prenom,
    required this.typeUser,
    required this.email,
    required this.profile,
    required this.phone,
    required this.dateCreated,
    required this.soldeBonus,
  });
  Map<String, dynamic> toMap() {
    return {
      'solde': solde,
      'userId': userId,
      'nom': nom,
      'prenom': prenom,
      'typeUser': typeUser,
      'email': email,
      'profile': profile,
      'phone': phone,
      'dateCreated': dateCreated,
      'soldeBonus': soldeBonus,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['id'],
      solde: double.parse(json['solde'].toString()),
      typeUser: json['typeUser'],
      nom: json['nom'],
      prenom: json['prenom'],
      email: json['email'],
      profile: json['profile'],
      phone: json['phone'],
      dateCreated: json['date_created'],
      soldeBonus: double.parse(json['solde_bonus'].toString()),
    );
  }
}

@Entity()
class Lang {
  int id = 0;

  @Property()
  String name;

  Lang({required this.name});
}

@Entity()
class Theme {
  int id = 0;

  @Property()
  int value;

  Theme({required this.value});
}

@Entity()
class Localisation {
  int id = 0;

  @Property()
  String ville;

  @Property()
  String longitude;

  @Property()
  String latitude;

  @Property()
  String ip;

  Localisation({
    required this.ville,
    required this.longitude,
    required this.latitude,
    required this.ip,
  });

  Map<String, dynamic> toMap() {
    return {
      'ville': ville,
      'longitude': longitude.toString(),
      'latitude': latitude.toString(),
      'ip': ip,
    };
  }

  factory Localisation.fromJson(Map<String, dynamic> json) {
    return Localisation(
      ville: json['ville'],
      longitude: json['longitude'].toString(),
      latitude: json['latitude'].toString(),
      ip: json['ip'],
    );
  }
}
 
@Entity()
class KeyUser {
  int id = 0;

  @Property()
  int userId = 0;
  @Property()
  String keySecret;

  @Property()
  String token;

  @Property()
  String refreshToken;

  KeyUser({
    required this.keySecret,
    required this.userId,
    required this.token,
    required this.refreshToken,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'keySecret': keySecret,
      'token': token,
      'refreshToken': refreshToken,
    };
  }

  factory KeyUser.fromJson(Map<String, dynamic> json) {
    return KeyUser(
      userId: Jwt.parseJwt(json['token'])['id'],
      keySecret: Jwt.parseJwt(json['token'])['keySecret'],
      token: json['token'],
      refreshToken: json['refreshToken'],
    );
  }
}
@Entity()
class LivraisonPosition {
  int id = 0;

  @Property()
  int livraison_id;

  LivraisonPosition({
    required this.livraison_id,
  });

  Map<String, dynamic> toMap() {
    return {
      'livraison_id': livraison_id,
    };
  }

  factory LivraisonPosition.fromJson(Map<String, dynamic> json) {
    return LivraisonPosition(
      livraison_id: json['livraison_id'],
    );
  }
}


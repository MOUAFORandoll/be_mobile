// // To parse this JSON data, do
// //
// //     final boutiqueModel = boutiqueModelFromJson(jsonString);

// import 'dart:convert';

// import 'ImageModel.dart';
// import 'LocalisationModel.dart';

// MarketModel boutiqueModelFromJson(String str) =>
//     MarketModel.fromJson(json.decode(str));

// String boutiqueModelToJson(MarketModel data) => json.encode(data.toJson());

// class MarketModel {
//   MarketModel({
//     required this.codeBoutique,
//     required this.user,
//     required this.description,
//     required this.titre,
//     required this.status,
//     required this.status_abonnement,
//     required this.note,
//     required this.dateCreated,
//     required this.images,
//     required this.lienBoutique,
//     required this.localisation,
//     required this.nombre_produit,
//   });

//   String codeBoutique;
//   String user;
//   String description;
//   String titre;
//   bool status;
//   bool status_abonnement;
//   final String lienBoutique;
//   final note;
//   String dateCreated;
//   int nombre_produit;
//   List<ImageModel> images;
//   LocalisationModel localisation;

//   factory MarketModel.fromJson(Map<String, dynamic> json) => MarketModel(
//         codeBoutique: json['codeBoutique'],
//         user: json['user'],
//         description: json['description'],
//         nombre_produit: json['nombre_produit'],
//         titre: json['titre'],
//         status: json['status'],
//         status_abonnement: json['status_abonnement'],
//         dateCreated: json['dateCreated'],
//         note: double.parse(
//             (json['note'] == null ? null : json['note']).toString()),
//         images: List<ImageModel>.from(
//             json['images'].map((x) => ImageModel.fromJson(x))),
//         localisation: LocalisationModel.fromJson(json['localisation']),
//       );

//   Map<String, dynamic> toJson() => {
//         'codeBoutique': codeBoutique,
//         'user': user,
//         'description': description,
//         'nombre_produit': nombre_produit,
//         'titre': titre,
//         'status_abonnement': status_abonnement,
//         'status': status,
//         'note': note == null ? null : double.parse(note.toString()),
//         'dateCreated': dateCreated,
//         'images': List<dynamic>.from(images.map((x) => x.toJson())),
//         'localisation': localisation.toJson(),
//       };
// }

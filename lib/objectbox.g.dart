// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'entity.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 4969518057203688213),
      name: 'Commande',
      lastPropertyId: const IdUid(4, 1395444994505962781),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 5127329087435583877),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3733723678809820577),
            name: 'codeCommande',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 3733861273943814581),
            name: 'codeClient',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 1395444994505962781),
            name: 'date',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 8984566840537087468),
      name: 'KeyUser',
      lastPropertyId: const IdUid(5, 3050349477534242606),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6348612253164974944),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3624252355606891287),
            name: 'keySecret',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 8832846444064727260),
            name: 'token',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 34511884449713588),
            name: 'refreshToken',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 3050349477534242606),
            name: 'userId',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 528970694863214740),
      name: 'Lang',
      lastPropertyId: const IdUid(2, 7392225789609482597),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 5758480994236200392),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7392225789609482597),
            name: 'name',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(4, 5589971371954137280),
      name: 'Localisation',
      lastPropertyId: const IdUid(5, 421267395549205444),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 576028652935433197),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7973789328410402377),
            name: 'ville',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 3296741169851625451),
            name: 'longitude',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 994297135078503455),
            name: 'latitude',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 421267395549205444),
            name: 'ip',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(5, 1113314405807969848),
      name: 'Second',
      lastPropertyId: const IdUid(2, 1939509048529786318),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 4893917620272064576),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 1939509048529786318),
            name: 'name',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(6, 8515091795137785474),
      name: 'Theme',
      lastPropertyId: const IdUid(2, 5624160313008426624),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 898959819284985380),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5624160313008426624),
            name: 'value',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(7, 3111042122288968254),
      name: 'User',
      lastPropertyId: const IdUid(12, 3169514915697841993),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 1003019444414536860),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 9030123287430456540),
            name: 'userId',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 7194923917911908307),
            name: 'nom',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 1981058460113358940),
            name: 'prenom',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 7104273356431650241),
            name: 'email',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 7884356085899434437),
            name: 'profile',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 6408305374337865876),
            name: 'phone',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 1202883639022673218),
            name: 'dateCreated',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 4427249840446802544),
            name: 'typeUser',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 5181578774780277422),
            name: 'solde',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(12, 3169514915697841993),
            name: 'soldeBonus',
            type: 8,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(8, 6314683099039113893),
      name: 'YourDataModel',
      lastPropertyId: const IdUid(2, 4387494669297644908),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 550131433720045414),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 4387494669297644908),
            name: 'name',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Shortcut for [Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [Store.new] for an explanation of all parameters.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// Returns the ObjectBox model definition for this project for use with
/// [Store.new].
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(8, 6314683099039113893),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [754203462009673773],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Commande: EntityDefinition<Commande>(
        model: _entities[0],
        toOneRelations: (Commande object) => [],
        toManyRelations: (Commande object) => {},
        getId: (Commande object) => object.id,
        setId: (Commande object, int id) {
          object.id = id;
        },
        objectToFB: (Commande object, fb.Builder fbb) {
          final codeCommandeOffset = fbb.writeString(object.codeCommande);
          final codeClientOffset = fbb.writeString(object.codeClient);
          final dateOffset = fbb.writeString(object.date);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, codeCommandeOffset);
          fbb.addOffset(2, codeClientOffset);
          fbb.addOffset(3, dateOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final codeCommandeParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, '');
          final codeClientParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final dateParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final object = Commande(
              id: idParam,
              codeCommande: codeCommandeParam,
              codeClient: codeClientParam,
              date: dateParam);

          return object;
        }),
    KeyUser: EntityDefinition<KeyUser>(
        model: _entities[1],
        toOneRelations: (KeyUser object) => [],
        toManyRelations: (KeyUser object) => {},
        getId: (KeyUser object) => object.id,
        setId: (KeyUser object, int id) {
          object.id = id;
        },
        objectToFB: (KeyUser object, fb.Builder fbb) {
          final keySecretOffset = fbb.writeString(object.keySecret);
          final tokenOffset = fbb.writeString(object.token);
          final refreshTokenOffset = fbb.writeString(object.refreshToken);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, keySecretOffset);
          fbb.addOffset(2, tokenOffset);
          fbb.addOffset(3, refreshTokenOffset);
          fbb.addInt64(4, object.userId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final keySecretParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final userIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          final tokenParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final refreshTokenParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, '');
          final object = KeyUser(
              keySecret: keySecretParam,
              userId: userIdParam,
              token: tokenParam,
              refreshToken: refreshTokenParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    Lang: EntityDefinition<Lang>(
        model: _entities[2],
        toOneRelations: (Lang object) => [],
        toManyRelations: (Lang object) => {},
        getId: (Lang object) => object.id,
        setId: (Lang object, int id) {
          object.id = id;
        },
        objectToFB: (Lang object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final object = Lang(name: nameParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    Localisation: EntityDefinition<Localisation>(
        model: _entities[3],
        toOneRelations: (Localisation object) => [],
        toManyRelations: (Localisation object) => {},
        getId: (Localisation object) => object.id,
        setId: (Localisation object, int id) {
          object.id = id;
        },
        objectToFB: (Localisation object, fb.Builder fbb) {
          final villeOffset = fbb.writeString(object.ville);
          final longitudeOffset = fbb.writeString(object.longitude);
          final latitudeOffset = fbb.writeString(object.latitude);
          final ipOffset = fbb.writeString(object.ip);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, villeOffset);
          fbb.addOffset(2, longitudeOffset);
          fbb.addOffset(3, latitudeOffset);
          fbb.addOffset(4, ipOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final villeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final longitudeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final latitudeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final ipParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 12, '');
          final object = Localisation(
              ville: villeParam,
              longitude: longitudeParam,
              latitude: latitudeParam,
              ip: ipParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    Second: EntityDefinition<Second>(
        model: _entities[4],
        toOneRelations: (Second object) => [],
        toManyRelations: (Second object) => {},
        getId: (Second object) => object.id,
        setId: (Second object, int id) {
          object.id = id;
        },
        objectToFB: (Second object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final object = Second(id: idParam, name: nameParam);

          return object;
        }),
    Theme: EntityDefinition<Theme>(
        model: _entities[5],
        toOneRelations: (Theme object) => [],
        toManyRelations: (Theme object) => {},
        getId: (Theme object) => object.id,
        setId: (Theme object, int id) {
          object.id = id;
        },
        objectToFB: (Theme object, fb.Builder fbb) {
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.value);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final valueParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          final object = Theme(value: valueParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    User: EntityDefinition<User>(
        model: _entities[6],
        toOneRelations: (User object) => [],
        toManyRelations: (User object) => {},
        getId: (User object) => object.id,
        setId: (User object, int id) {
          object.id = id;
        },
        objectToFB: (User object, fb.Builder fbb) {
          final nomOffset = fbb.writeString(object.nom);
          final prenomOffset = fbb.writeString(object.prenom);
          final emailOffset = fbb.writeString(object.email);
          final profileOffset = fbb.writeString(object.profile);
          final phoneOffset = fbb.writeString(object.phone);
          final dateCreatedOffset = fbb.writeString(object.dateCreated);
          fbb.startTable(13);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.userId);
          fbb.addOffset(2, nomOffset);
          fbb.addOffset(3, prenomOffset);
          fbb.addOffset(4, emailOffset);
          fbb.addOffset(5, profileOffset);
          fbb.addOffset(6, phoneOffset);
          fbb.addOffset(7, dateCreatedOffset);
          fbb.addInt64(8, object.typeUser);
          fbb.addFloat64(10, object.solde);
          fbb.addFloat64(11, object.soldeBonus);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final userIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          final soldeParam =
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 24, 0);
          final nomParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final prenomParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final typeUserParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 20, 0);
          final emailParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 12, '');
          final profileParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 14, '');
          final phoneParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 16, '');
          final dateCreatedParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 18, '');
          final soldeBonusParam =
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 26, 0);
          final object = User(
              userId: userIdParam,
              solde: soldeParam,
              nom: nomParam,
              prenom: prenomParam,
              typeUser: typeUserParam,
              email: emailParam,
              profile: profileParam,
              phone: phoneParam,
              dateCreated: dateCreatedParam,
              soldeBonus: soldeBonusParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    YourDataModel: EntityDefinition<YourDataModel>(
        model: _entities[7],
        toOneRelations: (YourDataModel object) => [],
        toManyRelations: (YourDataModel object) => {},
        getId: (YourDataModel object) => object.id,
        setId: (YourDataModel object, int id) {
          object.id = id;
        },
        objectToFB: (YourDataModel object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final object = YourDataModel(id: idParam, name: nameParam);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Commande] entity fields to define ObjectBox queries.
class Commande_ {
  /// see [Commande.id]
  static final id = QueryIntegerProperty<Commande>(_entities[0].properties[0]);

  /// see [Commande.codeCommande]
  static final codeCommande =
      QueryStringProperty<Commande>(_entities[0].properties[1]);

  /// see [Commande.codeClient]
  static final codeClient =
      QueryStringProperty<Commande>(_entities[0].properties[2]);

  /// see [Commande.date]
  static final date = QueryStringProperty<Commande>(_entities[0].properties[3]);
}

/// [KeyUser] entity fields to define ObjectBox queries.
class KeyUser_ {
  /// see [KeyUser.id]
  static final id = QueryIntegerProperty<KeyUser>(_entities[1].properties[0]);

  /// see [KeyUser.keySecret]
  static final keySecret =
      QueryStringProperty<KeyUser>(_entities[1].properties[1]);

  /// see [KeyUser.token]
  static final token = QueryStringProperty<KeyUser>(_entities[1].properties[2]);

  /// see [KeyUser.refreshToken]
  static final refreshToken =
      QueryStringProperty<KeyUser>(_entities[1].properties[3]);

  /// see [KeyUser.userId]
  static final userId =
      QueryIntegerProperty<KeyUser>(_entities[1].properties[4]);
}

/// [Lang] entity fields to define ObjectBox queries.
class Lang_ {
  /// see [Lang.id]
  static final id = QueryIntegerProperty<Lang>(_entities[2].properties[0]);

  /// see [Lang.name]
  static final name = QueryStringProperty<Lang>(_entities[2].properties[1]);
}

/// [Localisation] entity fields to define ObjectBox queries.
class Localisation_ {
  /// see [Localisation.id]
  static final id =
      QueryIntegerProperty<Localisation>(_entities[3].properties[0]);

  /// see [Localisation.ville]
  static final ville =
      QueryStringProperty<Localisation>(_entities[3].properties[1]);

  /// see [Localisation.longitude]
  static final longitude =
      QueryStringProperty<Localisation>(_entities[3].properties[2]);

  /// see [Localisation.latitude]
  static final latitude =
      QueryStringProperty<Localisation>(_entities[3].properties[3]);

  /// see [Localisation.ip]
  static final ip =
      QueryStringProperty<Localisation>(_entities[3].properties[4]);
}

/// [Second] entity fields to define ObjectBox queries.
class Second_ {
  /// see [Second.id]
  static final id = QueryIntegerProperty<Second>(_entities[4].properties[0]);

  /// see [Second.name]
  static final name = QueryStringProperty<Second>(_entities[4].properties[1]);
}

/// [Theme] entity fields to define ObjectBox queries.
class Theme_ {
  /// see [Theme.id]
  static final id = QueryIntegerProperty<Theme>(_entities[5].properties[0]);

  /// see [Theme.value]
  static final value = QueryIntegerProperty<Theme>(_entities[5].properties[1]);
}

/// [User] entity fields to define ObjectBox queries.
class User_ {
  /// see [User.id]
  static final id = QueryIntegerProperty<User>(_entities[6].properties[0]);

  /// see [User.userId]
  static final userId = QueryIntegerProperty<User>(_entities[6].properties[1]);

  /// see [User.nom]
  static final nom = QueryStringProperty<User>(_entities[6].properties[2]);

  /// see [User.prenom]
  static final prenom = QueryStringProperty<User>(_entities[6].properties[3]);

  /// see [User.email]
  static final email = QueryStringProperty<User>(_entities[6].properties[4]);

  /// see [User.profile]
  static final profile = QueryStringProperty<User>(_entities[6].properties[5]);

  /// see [User.phone]
  static final phone = QueryStringProperty<User>(_entities[6].properties[6]);

  /// see [User.dateCreated]
  static final dateCreated =
      QueryStringProperty<User>(_entities[6].properties[7]);

  /// see [User.typeUser]
  static final typeUser =
      QueryIntegerProperty<User>(_entities[6].properties[8]);

  /// see [User.solde]
  static final solde = QueryDoubleProperty<User>(_entities[6].properties[9]);

  /// see [User.soldeBonus]
  static final soldeBonus =
      QueryDoubleProperty<User>(_entities[6].properties[10]);
}

/// [YourDataModel] entity fields to define ObjectBox queries.
class YourDataModel_ {
  /// see [YourDataModel.id]
  static final id =
      QueryIntegerProperty<YourDataModel>(_entities[7].properties[0]);

  /// see [YourDataModel.name]
  static final name =
      QueryStringProperty<YourDataModel>(_entities[7].properties[1]);
}

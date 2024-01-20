import 'dart:async';

import 'package:BananaExpress/controller/entity.dart';
import 'package:BananaExpress/objectbox.g.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

import 'package:path/path.dart';

String linkDb = 'FahKap0';

GetStorage box = GetStorage();

class DataBaseController extends GetxController {
  late final Store store;
  
  // Le constructeur est privé pour empêcher l'instanciation directe
  DataBaseController._create(this.store);

  // Instance unique du DataBaseController
  static DataBaseController? _instance;
  
  // Méthode pour obtenir l'instance unique du DataBaseController
  static Future<DataBaseController> getInstance() async {
    if (_instance == null) {
      _instance = await _createInstance();
    }
    return _instance!;
  }

  // Méthode interne pour créer l'instance du DataBaseController
  static Future<DataBaseController> _createInstance() async {
    final databasesPath = await getApplicationDocumentsDirectory();

    // Vérifier si le store existe déjà dans GetStorage
    // if (box.read('store') != 1) {
    //   box.write('store', 1);
    final store =
        await openStore(directory: p.join(databasesPath.path, linkDb));
    return DataBaseController._create(store);
    //  }s
  }

  // Insert operation
  insertCommande(int id, String codeCommande, String codeClient, String date) {
    final commandeBox = store.box<Commande>();
    store.box<Commande>().put(Commande(
        id: commandeBox.query().build().find().length + 1,
        codeCommande: codeCommande,
        codeClient: codeClient,
        date: date));
    return true;
  }

  saveUser(User user) async {
    print('----------------saveeeeeee');
    store.box<User>().put(user);
    return true;
  }

  // Get operations
  User? getUser() {
    final userBox = store.box<User>();
    final users = userBox.getAll();
    print(users.length);
    return users.isNotEmpty ? users.first : null;
  }

  List<Commande> getListCommande() {
    final commandeBox = store.box<Commande>();
    // commandeBox.query().build().find().forEach((e) => print(e.codeCommande));
    return commandeBox.query().build().find();
  }

  Future<Map<String, dynamic>?> getLonLat() async {
    final localisationBox = store.box<Localisation>();
    final localisations = localisationBox.getAll();
    return localisations.isNotEmpty ? localisations.first.toMap() : null;
  }

  saveLonLat(value) async {
    store.box<Localisation>().put(Localisation.fromJson(value));
    return true;
  }

  Future<Map<String, dynamic>?> getKeyKen() async {
    final keyUserBox = store.box<KeyUser>();
    final keyUsers = keyUserBox.getAll();
    return keyUsers.isNotEmpty ? keyUsers.first.toMap() : null;
  }

  saveKeyKen(value) async {
    print(Jwt.parseJwt(value['token']));
    store.box<KeyUser>().put(KeyUser.fromJson(value));
    return true;
  }

  Future<String?> getKey() async {
    final keyUserBox = store.box<KeyUser>();
    final keyUsers = keyUserBox.getAll();
    return keyUsers.isNotEmpty ? keyUsers.first.keySecret : null;
  }

  Future<String?> getLan() async {
    final langBox = store.box<Lang>();
    final langs = langBox.getAll();
    return langs.isNotEmpty ? langs.first.name : null;
  }

  getLanIs() async {
    final langBox = store.box<Lang>();
    return langBox.count() > 0;
  }

  saveLan(value) async {
    store.box<Lang>().put(Lang(
          name: value,
        ));
    return true;
  }

  Future<String?> getTheme() async {
    final themeBox = store.box<Theme>();
    final themes = themeBox.getAll();
    return themes.isNotEmpty ? themes.first.value.toString() : null;
  }

  saveTheme(value) async {
    store.box<Theme>().put(Theme(
          value: value,
        ));
    return true;
  }
  // ... autres méthodes

  // InsertAll operation
  insertAllCommandes() {
    var j = 8;
    for (var i = 10; i < 100; i++) {
      // final commandeBox =;
      print('-------ii--${i}');
      store.box<Commande>().put(Commande(
          codeCommande: 'codeCommande$i', codeClient: '', date: 'date$i'));
      j = i;
      update();
    }
    return true;
  }

  // Delete operation
  Future<void> deleteAll() async {
    await Box<User>(store).removeAll();
    await Box<KeyUser>(store).removeAll();
    final databasesPath = await getApplicationDocumentsDirectory();
    final path = join(databasesPath.path, linkDb);
    await databaseFactory.deleteDatabase(path);
    // store.close();
    store = await openStore(directory: p.join(databasesPath.path, linkDb));
    DataBaseController._create(store);
  }
}

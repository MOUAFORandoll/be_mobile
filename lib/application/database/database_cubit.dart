import 'package:BananaExpress/objectbox.g.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart' as p;
import 'package:BananaExpress/old/controller/entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'database_state.dart';
part 'database_cubit.freezed.dart';
      
class DatabaseCubit extends Cubit<DatabaseState> {
 final GetStorage box = GetStorage();
  final String linkDb = 'babana_express';
  late final Store _store;

  DatabaseCubit() : super(const DatabaseState.initial()) {
    _createInstance();
  }
  
  Future<void> _createInstance() async {
    emit(const DatabaseState.loading());

    try {
      final databasesPath = await getApplicationDocumentsDirectory();
      
      _store = await openStore(directory: p.join(databasesPath.path, linkDb));
      emit(DatabaseState.initialized(store: _store));
    } catch (e) {
      emit(DatabaseState.error(error: e.toString()));
    }
  }
  // Insert operation
  Future<bool> insertCommande(
      int id, String codeCommande, String codeClient, String date) async {
    try {
      final commandeBox = _store.box<Commande>();
      _store.box<Commande>().put(Commande(
            id: commandeBox.query().build().find().length + 1,
            codeCommande: codeCommande,
            codeClient: codeClient,
            date: date,
          ));
      return true;
    } catch (e) {
      print('Error inserting commande: $e');
      return false;
    }
  }

  Future<bool> saveUser(User user) async {
    try {
      print('----------------saveeeeeee');
      _store.box<User>().put(user);
      return true;
    } catch (e) {
      print('Error saving user: $e');
      return false;
    }
  }

  // Get operations
  User? getUser() {
    final userBox = _store.box<User>();
    final users = userBox.getAll();
    print(users.length);
    return users.isNotEmpty ? users.first : null;
  }

  List<Commande> getListCommande() {
    final commandeBox = _store.box<Commande>();
    // commandeBox.query().build().find().forEach((e) => print(e.codeCommande));
    return commandeBox.query().build().find();
  }

  Future<Map<String, dynamic>?> getLonLat() async {
    final localisationBox = _store.box<Localisation>();
    final localisations = localisationBox.getAll();
    return localisations.isNotEmpty ? localisations.first.toMap() : null;
  }

  saveLonLat(value) async {
    _store.box<Localisation>().put(Localisation.fromJson(value));
    return true;
  }

  Future<Map<String, dynamic>?> getKeyKen() async {
    final keyUserBox = _store.box<KeyUser>();
    final keyUsers = keyUserBox.getAll();
    return keyUsers.isNotEmpty ? keyUsers.first.toMap() : null;
  }

  saveKeyKen(value) async {
    print(Jwt.parseJwt(value['token']));
    _store.box<KeyUser>().put(KeyUser.fromJson(value));
    return true;
  }
  
  Future<int?> getId() async {
    final keyUserBox = _store.box<KeyUser>();
    final keyUsers = keyUserBox.getAll();
    return keyUsers.isNotEmpty ? keyUsers.first.id : 1;
  }
  Future<String?> getKey() async {
    final keyUserBox = _store.box<KeyUser>();
    final keyUsers = keyUserBox.getAll();
    return keyUsers.isNotEmpty ? keyUsers.first.keySecret : null;
  }

  Future<String?> getLan() async {
    final langBox = _store.box<Lang>();
    final langs = langBox.getAll();
    return langs.isNotEmpty ? langs.first.name : null;
  }

  getLanIs() async {
    final langBox = _store.box<Lang>();
    return langBox.count() > 0;
  }

  saveLan(value) async {
    _store.box<Lang>().put(Lang(
          name: value,
        ));
    return true;
  }

  Future<String?> getTheme() async {
    final themeBox = _store.box<Theme>();
    final themes = themeBox.getAll();
    return themes.isNotEmpty ? themes.first.value.toString() : null;
  }

  saveTheme(value) async {
    _store.box<Theme>().put(Theme(
          value: value,
        ));
    return true;
  }
  // ... autres méthodes

  // InsertAll operation
  insertAllCommandes() {
     
    for (var i = 10; i < 100; i++) {
      // final commandeBox =;
      print('-------ii--${i}');
      _store.box<Commande>().put(Commande(
          codeCommande: 'codeCommande$i', codeClient: '', date: 'date$i'));
     
    }
    return true;
  }

  @override
  Future<void> close() async {
    return super.close();
  }
}

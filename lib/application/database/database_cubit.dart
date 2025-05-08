import 'package:BabanaExpress/entity.dart';
import 'package:BabanaExpress/objectbox.g.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart' as p;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'database_state.dart';
part 'database_cubit.freezed.dart';

class DatabaseCubit extends Cubit<DatabaseState> {
  final GetStorage box = GetStorage();
  final String linkDb = 'babana_express_local';
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

  User? get user => getUser();
  // Get operations
  User? getUser() {
    final userBox = _store.box<User>();

    final users = userBox.getAll();
    print(users.length);

    return users.isNotEmpty ? users.last : null;
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
    print('---------------------Jwt.parseJwt )');
    print(Jwt.parseJwt(value['token']));
    _store.box<KeyUser>().put(KeyUser.fromJson(value));
    print('---------------------${getKey()}');
    return true;
  }

  Future<int?> getId() async {
    final keyUserBox = _store.box<KeyUser>();
    final keyUsers = keyUserBox.getAll();
    return keyUsers.isNotEmpty ? keyUsers.first.userId : null;
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

  // Insert operation
  Future<bool> saveLivraisonIdToGetPosition({required int livraison_id}) async {
    try {
      _store.box<LivraisonPosition>().put(LivraisonPosition(
            livraison_id: livraison_id,
          ));
      return true;
    } catch (e) {
      print('Error inserting LivraisonPosition: $e');
      return false;
    }
  }

  Future<int?> getLivraisonIdToGetPosition() async {
    final _storeLivraisonPosition = _store.box<LivraisonPosition>();
    final livraisonPosition = _storeLivraisonPosition.getAll();
    return livraisonPosition.isNotEmpty
        ? livraisonPosition.first.livraison_id
        : null;
  }

  // Insert operation
  Future<bool> endsaveLivraisonIdToGetPosition() async {
    try {
      _store.box<LivraisonPosition>().removeAll();

      return true;
    } catch (e) {
      print('Error end LivraisonPosition: $e');
      return false;
    }
  }

  Future<void> disconnect() async {
    box.erase();
    _store.box<Theme>().removeAll();
    _store.box<Lang>().removeAll();
    _store.box<Localisation>().removeAll();
    _store.box<KeyUser>().removeAll();
    _store.box<User>().removeAll();

    final users = _store.box<User>().getAll();
    print('--------------------users');
    print(users);
    // _createInstance();
    // return super.close();
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:BananaExpress/Views/Livraison/SuccesReceptionview.dart';
import 'package:BananaExpress/Views/Livraison/SuccesRecuperationview.dart';
import 'package:BananaExpress/components/Button/app_button.dart';
import 'package:BananaExpress/controller/DataBaseController.dart';
import 'package:BananaExpress/controller/managerController.dart';
import 'package:BananaExpress/model/data/PointLivraisonModel.dart';
import 'package:BananaExpress/model/data/LivraisonModel.dart';
import 'package:BananaExpress/repository/LivraisonRepo.dart';
import 'package:BananaExpress/repository/LivreurRepo.dart';
import 'package:BananaExpress/utils/Services/SocketService.dart';
import 'package:BananaExpress/utils/Services/routing.dart';
import 'package:BananaExpress/utils/Services/apiUrl.dart';
import 'package:dio/dio.dart' hide Response, MultipartFile, FormData;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../components/exportcomponent.dart';
import 'package:geolocator/geolocator.dart';

class Colis {
  String nom;
  String quantite;
  String contactRecepteur;
  String valeurColis;
  int countImage;
  int id;
  int category;
  String? libelleLocalisation;
  String? quartier;
  double? longitude;
  double? latitude;
  int? idPointLivraisonColis;
  List<File> listImgColis;

  Colis({
    required this.nom,
    required this.id,
    required this.quantite,
    required this.contactRecepteur,
    required this.valeurColis,
    required this.countImage,
    required this.category,
    this.libelleLocalisation,
    this.quartier,
    this.longitude,
    this.latitude,
    this.idPointLivraisonColis,
    required this.listImgColis,
  });

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'libelleLocalisation': libelleLocalisation,
      'quartier': quartier,
      'longitude': longitude,
      'latitude': latitude,
      'quantite': quantite,
      'countImage': countImage,
      'contactRecepteur': contactRecepteur,
      'valeurColis': valeurColis,
      'category': category,
      'idPointLivraisonColis': idPointLivraisonColis,
    };
  }
}

class LivraisonController extends GetxController {
  final LivraisonRepo livraisonRepo;
  LivraisonController({required this.livraisonRepo});
  String _paiementUrl = '';
  get paiementUrl => _paiementUrl;

  bool _isLoad = false;
  bool get isLoad => _isLoad;
  setLoadTransaction(val) {
    print('-----------------load---****************--${val}');
    _isLoad = val;
    update();
  }

  LivreurRepo livreurRepo = Get.find();

  checkVal(val) {
    if (val > 3) {
      return 3;
    } else if (val <= 0) {
      return 0;
    } else {
      return val;
    }
  }

/**
 * Recuperation colis pointttttt
 */

  List<PointLivraisonModel> _list_search_recuperation_point = [];
  List<PointLivraisonModel> get list_search_recuperation_point =>
      _list_search_recuperation_point;
  TextEditingController _searchPointRecuperationController =
      new TextEditingController();

  TextEditingController get searchPointRecuperationController =>
      _searchPointRecuperationController;

  void searchPointRecuperationPointLivraison() {
    String searchPointRecuperationText = searchController.text.toLowerCase();

    _list_search_recuperation_point.clear();

    if (searchPointRecuperationText.isEmpty) {
      _list_search_recuperation_point.addAll(list_recuperation_point);
    } else {
      _list_search_recuperation_point.addAll(
        list_recuperation_point.where(
          (element) =>
              element.libelle
                  .toLowerCase()
                  .contains(searchPointRecuperationText) ||
              element.quartier
                  .toLowerCase()
                  .contains(searchPointRecuperationText) ||
              element.ville.toLowerCase().contains(searchPointRecuperationText),
        ),
      );
    }

    update();
    print(_search_livraison_point.length);
  }

  TextEditingController _libelleLocalisation = new TextEditingController();

  TextEditingController get libelleLocalisation => _libelleLocalisation;
  TextEditingController _quartier = new TextEditingController();

  TextEditingController get quartier => _quartier;
  setLibelleAndQuartier(pl) {
    _libelleLocalisation.text = pl.libelle;
    _quartier.text = pl.quartier;
    update();
  }

  var _longitudeRecuperation = 0.0;
  get longitudeRecuperation => _longitudeRecuperation;
  var _latitudeRecuperation = 0.0;
  get latitudeRecuperation => _latitudeRecuperation;
  setPositionRecuperation(LatLng value) {
    _longitudeRecuperation = value.longitude;
    _latitudeRecuperation = value.latitude;

    update();
    print("-----------$latitudeRecuperation-------$longitudeRecuperation");
  }

  var _selected_recuperation_point;
  get selected_recuperation_point => _selected_recuperation_point;
  selectRecuperationPoint(point) {
    _selected_recuperation_point = point;
    update();
    verifyForm();
  }

  List<PointLivraisonModel> _list_recuperation_point = [];
  List<PointLivraisonModel> get list_recuperation_point =>
      _list_recuperation_point;
  int _isLoadedRecuperationPoint = 0;
  int get isLoadedRecuperationPoint => _isLoadedRecuperationPoint;

  getPointRecuperationUser() async {
    var getU = await dababase.getKey();
    if (getU != null) {
      try {
        print('*********debut get point');
        _list_recuperation_point.clear();
        _isLoadedRecuperationPoint = 0;
        update();
        print('*********3...... get point');

        Response response = await livraisonRepo.getPointRecuperationUser(getU);

        if (response.body != null) {
          _list_recuperation_point.addAll((response.body['data'] as List)
              .map((e) => PointLivraisonModel.fromJson(e))
              .toList());
          _isLoadedRecuperationPoint = 1;
          update();
        }
      } catch (e) {
        print(e);
        _isLoadedRecuperationPoint = 2;
        update();
      }
    }
  }

  @override
  void onInit() {
    super.onInit();

    _quantite.text = '0';
  }

/**
 * Point de livraison colis
 */

  TextEditingController _searchController = new TextEditingController();

  TextEditingController get searchController => _searchController;

  void searchPointLivraison() {
    String searchText = searchController.text.toLowerCase();

    _search_livraison_point.clear();

    if (searchText.isEmpty) {
      _search_livraison_point.addAll(livraison_point);
    } else {
      _search_livraison_point.addAll(
        livraison_point.where(
          (element) =>
              element.libelle.toLowerCase().contains(searchText) ||
              element.quartier.toLowerCase().contains(searchText) ||
              element.ville.toLowerCase().contains(searchText),
        ),
      );
    }

    update();
    print(_search_livraison_point.length);
  }

  TextEditingController _libelleLocalisationColis = new TextEditingController();

  TextEditingController get libelleLocalisationColis =>
      _libelleLocalisationColis;
  TextEditingController _quartierColis = new TextEditingController();

  TextEditingController get quartierColis => _quartierColis;
  var _selected_livraison_point;
  get selected_livraison_point => _selected_livraison_point;
  selectPoint(point) {
    _selected_livraison_point = point;
    update();
  }

  resetPointLivraison() {
    _selected_livraison_point = null;
    _libelleLocalisationColis.clear();
    _quartierColis.clear();
    update();
  }

  setLibelleAndQuartierColis(pl) {
    _libelleLocalisationColis.text = pl.libelle;
    _quartierColis.text = pl.quartier;
    update();
  }

  var _longitudeColis = 0.0;
  get longitudeColis => _longitudeColis;
  var _latitudeColis = 0.0;
  get latitudeColis => _latitudeColis;
  setPosition(LatLng value) {
    _longitudeColis = value.longitude;
    _latitudeColis = value.latitude;

    update();
    print(longitudeColis);
  }

  setClear() {
    _searchController.clear();
    update();
  }

  setPositionLabel(String value) {
    _searchController.text = value;
    update();
  }

  List<PointLivraisonModel> _search_livraison_point = [];
  List<PointLivraisonModel> get search_livraison_point =>
      _search_livraison_point;
  List<PointLivraisonModel> _livraison_point = [];
  List<PointLivraisonModel> get livraison_point => _livraison_point;
  int _isLoaded = 0;
  int get isLoaded => _isLoaded;

  getPointLivraisom() async {
    try {
      print('*********debut get point');
      _livraison_point.clear();
      _isLoaded = 0;
      update();
      print('*********3...... get point');

      Response response =
          await livraisonRepo.getLivraisonPointByVille(villeSelect.id);
      ;
      if (response.body != null) {
        _livraison_point.addAll((response.body['data'] as List)
            .map((e) => PointLivraisonModel.fromJson(e))
            .toList());
        _list_recuperation_point.addAll((response.body['data'] as List)
            .map((e) => PointLivraisonModel.fromJson(e))
            .toList());
        _isLoaded = 1;
        print(_livraison_point.length);
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  var position;
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    print(
        'ma position est-**************--${position.latitude}-----------*************-----${position.longitude}');
    return await Geolocator.getCurrentPosition();
  }

  bool _isOk = false;
  bool get isOk => _isOk;

  String _codeCommande = '';
  String get isIdCom => _codeCommande;
  var fn = new ViewFunctions();
  String _urlFacture = '';
  downloadFacture() async {
    try {
      DateTime now = DateTime.now(); // ProgressDialog progress;
      // progress =
      //     new ProgressDialog(context, type: ProgressDialogType.Download);
      // progress.style(message: "Téléchargement en du fichier ...");

      // Directory d = Directory('/storage/emulated/0/Download');

      final file = File(
          '/storage/emulated/0/Download/facture_${now.hour}_${now.minute}_${now.second}.pdf');

      await Dio().download(
        "${ApiUrl.baseUrl}" + _urlFacture,
        file.path,
        onReceiveProgress: (rec, total) {
          print(rec);
          print(total);
          if (rec == total) {
            fn.snackBar(
                'Facture',
                'Une facture de la livraison a ete enregistre dans votre portable',
                true);
          }
          // progressDowloading =
          //     ((rec / total) * 100).toStringAsFixed(0) + "%";
          // print(progressDowloading);
          // progress.update(message: "svp veillez patienter ");
        },
      );

      // progress.hide();
    } catch (e) {
      print(e);
    }
    // final taskId = await FlutterDownloader.enqueue(
    //     url: url,
    //     savedDir: '/storage/emulated/0/Download',
    //     showNotification: true, // afficher une notification de téléchargement
    //     openFileFromNotification:
    //         true // ouvrir le fichier après le téléchargement
    //     );
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryMonthController = TextEditingController();
  final TextEditingController _expiryYearController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _lieuxController = TextEditingController();
  TextEditingController get nameController => _nameController;
  TextEditingController get cardNumberController => _cardNumberController;
  TextEditingController get expiryMonthController => _expiryMonthController;
  TextEditingController get expiryYearController => _expiryYearController;
  TextEditingController get cvvController => _cvvController;
  TextEditingController get lieuxController => _lieuxController;

  final TextEditingController _prenameController = TextEditingController();
  TextEditingController get prenameController => _prenameController;
  final TextEditingController _phoneController = TextEditingController();
  TextEditingController get phoneController => _phoneController;
  final TextEditingController _dateController = TextEditingController();
  TextEditingController get dateController => _dateController;
  var manager = Get.find<ManagerController>();
  refresh0() {
    refresh();
  }

  setUserInfo() {
    print('--setinfo');
    if (manager.Userget != null &&
        _nameController.text.length == 0 &&
        _phoneController.text.length == 0) {
      _nameController.text = manager.Userget.nom;
      _prenameController.text = manager.Userget.prenom;

      _phoneController.text = manager.Userget.phone;
      update();
      print('--se*------------------------------tinfo-${idUser}--update');
    }
  }

  setDate() {
    _expiryMonthController.text = _dateController.text.split('')[0].toString() +
        _dateController.text.split('')[1].toString();
    _expiryYearController.text = _dateController.text.split('')[2].toString() +
        _dateController.text.split('')[3].toString();
    update();
  }

  var _Boutique;
  get Boutique => _Boutique;
  bool _isExist = false;
  bool get isExist => _isExist;

  List<File> _listImgColis = [];

  final dababase = Get.find<DataBaseController>();

  List<File> get listImgColis => _listImgColis;
  onInitData() {
    _listImgColis = [];
    _listImgColis.clear();

    // update();
  }

  File imageFile = new File('');

  Future getImageAppareil() async {
    try {
      //print("wwwwwwwww");

      var image = await ImagePicker().pickImage(
          source: ImageSource.camera,
          imageQuality: 100,
          maxHeight: 500,
          maxWidth: 500);

      // File? croppedFile = await ImageCropper().cropImage(
      //   aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      //   sourcePath: image.path,
      // );
      _listImgColis.add(File(image!.path));

      update();
    } catch (e) {
      // _showToastPictureError(context);
    }
  }

  Future getImageGalerie() async {
    try {
      //print("wwwwwwwww");

      var image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 100,
          maxHeight: 500,
          maxWidth: 500);

      // File? croppedFile = await ImageCropper().cropImage(
      //   aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      //   sourcePath: image.path,
      // );
      _listImgColis.add(File(image!.path));
      //print(_listImgColis.length);
      update();
    } catch (e) {
      // _showToastPictureError(context);
    }
  }

  deleteImage(index) {
    _listImgColis.remove(_listImgColis[index]);

    update();
  }

  socketMessageNegociation(data) {
    fn.snackBar('Message negociation', data['message'], true);
    // ici on doit faire l'ajout a la liste des message en locale dans le telephone du user
  }

  List<LivraisonModel> _userLivraisonList = [];
  List<LivraisonModel> get userLivraisonList => _userLivraisonList;
  int _isLoadedLivraison = 1;
  int get isLoadedPLivraison => _isLoadedLivraison;
  int idUser = 0;

  getListLivraisonsForUser() async {
    // _userLivraisonList = [];
    var key = await dababase.getKey();
    _isLoadedLivraison = 0;
    update();

    await livraisonRepo.getHistoryLivraisons(key).then((response) {
      _userLivraisonList.clear();
      print(response.body['data']);
      _userLivraisonList.addAll((response.body['data'] as List)
          .map((e) => LivraisonModel.fromJson(e))
          .toList());

      _isLoadedLivraison = 1;
      update();
    }).onError((e, h) {
      print(e);
      _isLoadedLivraison = 2;
      update();
    });
  }

  void fineListToUpdate(LivraisonModel data) {
    int index =
        _babanaLivraisonList.indexWhere((element) => element.id == data.id);

    if (index != -1) {
      _babanaLivraisonList[index] = data;
      update();
    }
    int index0 =
        _userLivraisonList.indexWhere((element) => element.id == data.id);
    print(index0);
    print(index);
    if (index0 != -1) {
      _userLivraisonList[index0] = data;
      update();
    }
  }

  void finishLivraion(message) {
    fn.snackBar('Livraison', message, true);
  }

  connectToSocketLivraison() async {
    var key = await dababase.getKey();

    new SocketService().listLivraison(key, fineListToUpdate);
  }

  livraisonFinish() async {
    var key = await dababase.getKey();

    new SocketService().livraisonFinish(key, finishLivraion);
  }

  TextEditingController _libelle = TextEditingController();
  get libelle => _libelle;
  TextEditingController _nomProduit = TextEditingController();
  get nomProduit => _nomProduit;

  TextEditingController _quantite = TextEditingController();
  get quantite => _quantite;

  TextEditingController _description = TextEditingController();
  get description => _description;
  setContactEmetteur(cont) {
    _contactEmetteur.text = cont;
    update();
  }

  TextEditingController _contactEmetteur = TextEditingController();
  get contactEmetteur => _contactEmetteur;
  TextEditingController _contactRecepteur = TextEditingController();
  get contactRecepteur => _contactRecepteur;
  TextEditingController _valeurColis = TextEditingController();
  get valeurColis => _valeurColis;
  mamageQte(val) {
    quantite.text = val
        ? check(int.parse(quantite.text) + 1)
        : check(int.parse(quantite.text) - 1);
    verifyFormColis();
    update();
  }

  check(val) {
    return val < 1 ? '1' : val.toString();
  }

  var _categorySelect;
  get categorySelect => _categorySelect;
  selectCategory(cat) {
    _categorySelect = cat;
    update();
  }

  var _villeSelect;
  get villeSelect => _villeSelect;
  selectVille(cat) {
    _villeSelect = cat;
    verifyForm();
    getPointLivraisom();
    update();
  }

  int service = 1;
  setService(s) async {
    service = s;
    var data = await dababase.getUser();
    if (s == 1) {
      _contactEmetteur.text = data!.phone;
      _contactRecepteur.text = '';

      update();
    } else {
      print('55');
      _contactRecepteur.text = data!.phone;
      _contactEmetteur.text = '';
      update();
    }
  }

  List<File> _imageColis = [];
  List<File> get imageColis => _imageColis;
  cleanImage() {
    // _imageColis.clear();
    update();
  }

  Future getImageColisAppareil() async {
    _imageColis.clear();
    update();
    try {
      print('----------***********-----addding');
      var image = await ImagePicker().pickImage(
          source: ImageSource.camera,
          imageQuality: 100,
          maxHeight: 500,
          maxWidth: 500);
      print('------fdfdf----***********-----addding');

      _imageColis.add(File(image!.path));
      print('--------ffd--***********-----addding');
      print(_imageColis.length);
      print('----------***********-----addding');
      verifyFormColis();
      Get.back();
      update();
    } catch (e) {}
  }

  Future getImageColisGalerie() async {
    _imageColis.clear();
    update();

    try {
      var image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 100,
          maxHeight: 500,
          maxWidth: 500);

      _imageColis.add(File(image!.path));
      verifyFormColis();
      Get.back();

      update();
    } catch (e) {}
  }

  setValueColis(Colis colis) {
    nomProduit.text = colis.nom;
    quantite.text = colis.quantite;
    _contactRecepteur.text = colis.contactRecepteur;
    valeurColis.text = colis.valeurColis;
    update();
  }

  updateColis(int id) {
    Colis colisToUpdate = _listColis.firstWhere((colis) => colis.id == id,
        orElse: () => Colis(
            nom: '',
            id: -1,
            quantite: '',
            contactRecepteur: '',
            valeurColis: '',
            countImage: 0,
            category: 0,
            listImgColis: []));

    if (colisToUpdate.id != -1) {
      // Mettez à jour les propriétés nécessaires
      colisToUpdate.nom = nomProduit.text;
      colisToUpdate.quantite = quantite.text;
      colisToUpdate.contactRecepteur = _contactRecepteur.text;
      colisToUpdate.valeurColis = valeurColis.text;

      // Vous pouvez également mettre à jour d'autres propriétés selon vos besoins

      // Mettez à jour la liste des colis
      int index = _listColis.indexOf(colisToUpdate);
      if (index != -1) {
        _listColis[index] = colisToUpdate;
      }

      update();
      Get.back();
    }
  }

  deleteColis(int id) {
    print(id);
    _listColis.removeWhere((colis) => colis.id == id);

    update();
  }

  Future updateAddImageColisAppareil(idColis) async {
    try {
      print('----------***********-----addding');
      var image = await ImagePicker().pickImage(
          source: ImageSource.camera,
          imageQuality: 100,
          maxHeight: 500,
          maxWidth: 500);
      addImageToColis(idColis, File(image!.path));

      update();
    } catch (e) {}
  }

  Future updateAddImageColisGalerie(idColis) async {
    try {
      var image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 100,
          maxHeight: 500,
          maxWidth: 500);

      addImageToColis(idColis, File(image!.path));
      update();
    } catch (e) {}
  }

  void addImageToColis(int id, File newImage) {
    Colis colisToUpdate = _listColis.firstWhere(
      (colis) => colis.id == id,
      orElse: () => Colis(
        nom: '',
        id: -1,
        quantite: '',
        contactRecepteur: '',
        valeurColis: '',
        countImage: 0,
        category: 0,
        listImgColis: [],
      ),
    );

    if (colisToUpdate.id != -1) {
      // Ajouter la nouvelle image à la liste des images du colis
      colisToUpdate.listImgColis.add(newImage);
      colisToUpdate.countImage++;

      // Mettre à jour la liste des colis
      int index = _listColis.indexOf(colisToUpdate);
      if (index != -1) {
        _listColis[index] = colisToUpdate;
      }

      // Mettre à jour l'interface utilisateur
      update();
    }
  }

  void removeImageFromColis(int id, int position) {
    print('-------------${id}--*${position}*------------*');

    Colis colisToUpdate = _listColis.firstWhere(
      (colis) => colis.id == id,
      orElse: () => Colis(
        nom: '',
        id: -1,
        quantite: '',
        contactRecepteur: '',
        valeurColis: '',
        countImage: 0,
        category: 0,
        listImgColis: [],
      ),
    );

    if (colisToUpdate.id != -1 &&
        position >= 0 &&
        position < colisToUpdate.listImgColis.length) {
      print('-------------sssssssssssss');
      colisToUpdate.listImgColis.removeAt(position);
      colisToUpdate.countImage--;

      // Mettre à jour la liste des colis
      int index = _listColis.indexOf(colisToUpdate);
      if (index != -1) {
        print('-----------${index}--sssssssssssss');

        _listColis[index] = colisToUpdate;
      }

      // Mettre à jour l'interface utilisateur
      update();
    }
  }

  void updateImageInColis(int id, int position, File updatedImage) {
    Colis colisToUpdate = _listColis.firstWhere(
      (colis) => colis.id == id,
      orElse: () => Colis(
        nom: '',
        id: -1,
        quantite: '',
        contactRecepteur: '',
        valeurColis: '',
        countImage: 0,
        category: 0,
        listImgColis: [],
      ),
    );

    if (colisToUpdate.id != -1 &&
        position >= 0 &&
        position < colisToUpdate.listImgColis.length) {
      // Mettre à jour l'image dans la liste des images du colis
      colisToUpdate.listImgColis[position] = updatedImage;

      // Mettre à jour la liste des colis
      int index = _listColis.indexOf(colisToUpdate);
      if (index != -1) {
        _listColis[index] = colisToUpdate;
      }

      // Mettre à jour l'interface utilisateur
      update();
    }
  }

  final _formKeyColis = new GlobalKey<FormState>();
  get formKeyColis => _formKeyColis;

  bool _isCategory = true;
  bool get isCategory => _isCategory;

  bool _isPointLivraison = true;
  bool get isPointLivraison => _isPointLivraison;

  bool _isQte = true;
  bool get isQte => _isQte;
  bool _isImage = true;
  bool get isImage => _isImage;
  verifyFormColis() {
    if (_categorySelect == null) {
      _isCategory = false;
    } else {
      _isCategory = true;
    }
    print("${_listImgColis.isEmpty}-----------------------");
    if (_imageColis.isEmpty) {
      _isImage = false;
    } else {
      _isImage = true;
    }
    if (quantite.text == '0' || quantite.text == 0) {
      _isQte = false;
    } else {
      _isQte = true;
    }
    if (selected_livraison_point == null &&
        libelleLocalisationColis.text.isEmpty &&
        quartierColis.text.isEmpty &&
        longitudeColis == 0.0 &&
        latitudeColis == 0.0) {
      _isPointLivraison = false;
    } else {
      _isPointLivraison = true;
    }
    update();
    return (formKeyColis.currentState.validate() &&
        _isCategory &&
        _isPointLivraison &&
        _isImage &&
        _isQte);
  }

  var frais = '1000';
  List<Colis> _listColis = [];
  List<Colis> get listColis => _listColis;
  int idColis = 1;
  addColis() {
    if (verifyFormColis()) {
      List<MultipartFile> imageFiles = [];

      for (int j = 0; j < listImgColis.length; j++) {
        File imageFile = listImgColis[j];
        imageFiles.add(MultipartFile(
          imageFile.path,
          filename: 'Image$j.jpg',
        ));
      }

      Colis newColis = Colis(
        id: idColis,
        nom: nomProduit.text,
        quantite: quantite.text,
        contactRecepteur: _contactRecepteur.text,
        valeurColis: valeurColis.text,
        category: _categorySelect.id,
        libelleLocalisation: libelleLocalisationColis.text,
        quartier: quartierColis.text,
        longitude: longitudeColis,
        latitude: latitudeColis,
        idPointLivraisonColis:
            selected_livraison_point != null ? selected_livraison_point.id : 0,
        listImgColis: _imageColis,
        countImage: _imageColis.length,
      );

      _listColis.add(newColis);
      idColis++;
      update();
      print(newColis.contactRecepteur);
      print(_listColis.length);
      Get.back();
    }
  }

  List<Map<String, dynamic>> convertListToJson(List<Colis> colisList) {
    return colisList.map((colis) => colis.toJson()).toList();
  }

  createFormData() async {
    print(jsonEncode(convertListToJson(listColis)));
    var key = await dababase.getKey();
    var data = {
      'keySecret': key,
      'idPointRecuperation': selected_recuperation_point != null
          ? selected_recuperation_point.id
          : 0,
      'libelleLocalisation': libelleLocalisation.text,
      'quartier': quartier.text,
      'longitude': longitudeRecuperation,
      'latitude': latitudeRecuperation,
      'libelle': libelle.text,
      'service': service,
      'contactEmetteur': contactEmetteur.text,
      'description': description.text,
      'ville': villeSelect.id,
      'colis': jsonEncode(convertListToJson(listColis)),
    };
    print(data['colis']);

    for (int i = 0; i < listColis.length; i++) {
      Colis colis = listColis[i];
      colis.listImgColis.forEach((e) {
        print("colis$i${colis.listImgColis.indexOf(e)}");
        data.addAll({
          "colis$i${colis.listImgColis.indexOf(e)}": MultipartFile(
            e.path,
            filename: "Image.jpg",
          )
        });
      });
    }
    FormData formData = FormData(data);
    return formData;
  }

  final _formKeyLivraison = new GlobalKey<FormState>();
  get formKeyLivraison => _formKeyLivraison;

  int _state = 0;

  int get state => _state;

  bool _isVille = true;
  bool get isVille => _isVille;

  bool _isPointRecuperation = true;
  bool get isPointRecuperation => _isPointRecuperation;
  verifyForm() {
    if (villeSelect == null) {
      _isVille = false;
    } else {
      _isVille = true;
    }
    if (selected_recuperation_point == null) {
      _isPointRecuperation = false;
    } else {
      _isPointRecuperation = true;
    }
    update();
    return (formKeyLivraison.currentState.validate() &&
        villeSelect != null &&
        selected_recuperation_point != null);
  }

  changeState(i) {
    if (i == 1) {
      verifyForm();
      if (verifyForm()) {
        _state = i;
        update();
      }
      print(i);
    }
  }

  newLivraison() async {
    _urlFacture = '';

    var key = await dababase.getKey();
    fn.loading('Livraison', 'Ajout d\'un nouveau produit en cours');
    if (key != null) {
      var data = await createFormData();
      print(data);
      _isUpdating = true;
      update();

      await livraisonRepo.newLivraison(data).then((response) {
        print(response.body);
        if (response.statusCode == 200) {
          Get.toNamed(AppLinks.SUCCESSLIVRAISON);
          // _urlFacture = response.body['facture'];
          getListLivraisonsForUser();
        } else {
          fn.snackBar('Livraison', response.body['message'], false);
        }

        _isUpdating = false;
        update();

        update();
      }).onError((e, h) {
        fn.closeLoader();

        fn.snackBar('Livraison', 'Une erreur est survenue', false);

        _isUpdating = false;
        update();
      });
    }
  }

  calculFraisDeLivraison() async {
    var key = await dababase.getKey();
    fn.loading('Calcul des frais de livraisons',
        'Ajout d\'un nouveau produit en cours');
    if (key != null) {
      var data = {
        'service': service,
        'description': description.text,
        'quantite': quantite.text,
        'valeurColis': valeurColis.text,
        'category': categorySelect.id,
      };

      await livraisonRepo.calculFraisLivraison(data).then((response) {
        print(response.body);
        fn.closeLoader();
        if (response.statusCode == 200) {
          frais = response.body['frais'];
          validateLivraison();
        } else {
          fn.snackBar('Calcul des frais', response.body['message'], false);
        }

        update();
      }).onError((e, s) {
        fn.closeLoader();

        fn.snackBar('Calcul des frais', 'Une erreur est survenue', false);
      });
    }
  }

  openModalLivraison() => Get.bottomSheet(
        Container(
            height: kHeight * .4,
            padding: EdgeInsets.symmetric(horizontal: kMarginX),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: ColorsApp.white,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top: kMarginY * 2),
                  // padding: EdgeInsets.symmetric(
                  //     horizontal: kMarginX / 2),
                  child: InkWell(
                    onTap: () => Get.back(),
                    child: Icon(Icons.close),
                  )),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
                  child: Text(
                    'Quel service vous interesse'.tr,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )),
              Container(
                  margin: EdgeInsets.only(top: kMarginY * 2),
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: AppButton(
                            text: 'Livrer mon colis'.tr,
                            // width: kWidth / 2.5,
                            size: MainAxisSize.max,
                            bgColor: ColorsApp.second,
                            onTap: () {
                              Get.toNamed(AppLinks.NEWLIVRAISON);
                              setService(1);
                            }),
                      ),
                      AppButton(
                          text: 'Me faire livrer'.tr,
                          // width: kWidth / 2.5,
                          size: MainAxisSize.max,
                          // bgColor: AppColors.secondarytext,
                          onTap: () {
                            Get.toNamed(AppLinks.NEWLIVRAISON);
                            setService(2);
                          }),
                    ],
                  ))
            ])),
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        backgroundColor: Colors.transparent,
      );

  validateLivraison() => Get.bottomSheet(
        Container(
            height: kHeight * .4,
            padding: EdgeInsets.symmetric(horizontal: kMarginX),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: ColorsApp.white,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top: kMarginY * 2),
                  // padding: EdgeInsets.symmetric(
                  //     horizontal: kMarginX / 2),
                  child: InkWell(
                    onTap: () => Get.back(),
                    child: Icon(Icons.close),
                  )),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
                  child: Row(
                    children: [
                      Text(
                        'Les frais de livraison seront de : '.tr,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        frais + ' FCFA  '.tr,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
                  child: Text(
                    ' a payer par l\'emetteur: '.tr,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )),
              Container(
                  margin: EdgeInsets.only(top: kMarginY),
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: AppButton(
                            text: 'Valider Ma Demande'.tr,
                            // width: kWidth / 2.5,
                            size: MainAxisSize.max,
                            bgColor: ColorsApp.second,
                            onTap: () => newLivraison()),
                      ),
                    ],
                  ))
            ])),
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        backgroundColor: Colors.transparent,
      );

/**
*
* Babana verification section
*/

  List<LivraisonModel> _babanaLivraisonList = [];
  List<LivraisonModel> get babanaLivraisonList => _babanaLivraisonList;

  getListLivraisonsForBabana() async {
    // _babanaLivraisonList = [];
    var key = await dababase.getKey();
    _isLoadedLivraison = 0;
    update();

    await livraisonRepo.getHistoryLivraisonsBabana(key).then((response) {
      _babanaLivraisonList.clear();

      _babanaLivraisonList.addAll((response.body['data'] as List)
          .map((e) => LivraisonModel.fromJson(e))
          .toList());

      _isLoadedLivraison = 1;
      update();
    }).onError((e, h) {
      print(e);
      _isLoadedLivraison = 1;
      update();
    });
  }

  bool _isUpdating = false;
  bool get isUpdating => _isUpdating;
  recuperationColis(data) async {
    _isUpdating = true;
    update();

    fn.loading(
        'Verification code recuperation', 'Livraison du produit en cours');

    try {
      Response response = await livraisonRepo.recuperationColis(data);
      print(response.body);
      if (response.statusCode == 200) {
        fn.closeLoader();
        // print(response.body['data']);
        // fineListToUpdate(LivraisonModel.fromJson(response.body['data']));

        Get.to(SuccesRecuperationview());
        fn.snackBar('Livraison', response.body['message'], true);
      } else {
        fn.snackBar('Livraison', response.body['message'], false);
      }
      fn.closeLoader();

      _isUpdating = false;
      // Get.back(closeOverlays: true);
      update();
    } catch (e) {
      fn.closeLoader();

      fn.snackBar('Livraison', 'Une erreur est survenue', false);
      //        fn.closeLoader();

      _isUpdating = false;
      update();
      //print(e);
    }
  }

  receptionColis(data) async {
    _isUpdating = true;
    update();

    fn.loading(
        'Verification code recuperation', 'Livraison du produit en cours');

    try {
      Response response = await livraisonRepo.receptionColis(data);
      //print(response.body);
      if (response.statusCode == 200) {
        fn.closeLoader();
        // fineListToUpdate(LivraisonModel.fromJson(response.body['data']));
        fn.snackBar('Livraison', response.body['message'], true);
        Get.to(SuccesReceptionview());
      } else {
        fn.snackBar('Livraison', response.body['message'], false);
      }
      fn.closeLoader();

      _isUpdating = false;
      // Get.back(closeOverlays: true);
      update();
    } catch (e) {
      fn.closeLoader();

      fn.snackBar('Livraison', 'Une erreur est survenue', false);
      //        fn.closeLoader();

      _isUpdating = false;
      update();
      //print(e);
    }
  }
}

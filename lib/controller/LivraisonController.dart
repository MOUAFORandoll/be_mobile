import 'dart:io';

import 'package:BananaExpress/controller/DataBaseController.dart';
import 'package:BananaExpress/controller/GeneralController.dart';
import 'package:BananaExpress/controller/managerController.dart';
import 'package:BananaExpress/model/data/PointLivraisonModel.dart';
import 'package:BananaExpress/model/data/ProduitBoutiqueModel.dart';
import 'package:BananaExpress/repository/LivraisonRepo.dart';
import 'package:BananaExpress/repository/LivreurRepo.dart';
import 'package:BananaExpress/utils/Services/routing.dart';
import 'package:BananaExpress/utils/Services/apiUrl.dart';
import 'package:BananaExpress/utils/functions/viewFunctions.dart';
import 'package:dio/dio.dart' hide Response, MultipartFile, FormData;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LivraisonController extends GetxController {
  final LivraisonRepo livraisonRepo;
  LivraisonController({required this.livraisonRepo});
  String _paiementUrl = '';
  get paiementUrl => _paiementUrl;

  var _controller;
  get controller => _controller;
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

  PointLivraisonModel _selected_livraison_point = new PointLivraisonModel(
      id: 0,
      libelle: '',
      ville: '',
      quartier: '',
      image: '',
      longitude: 0.0,
      latitude: 0.0);
  PointLivraisonModel get selected_livraison_point => _selected_livraison_point;
  selectPoint(point) {
    _selected_livraison_point = point;
    update();
  }

  selectPoint0(point) {
    _selected_livraison_point = point;
    update();
  }

  final TextEditingController _searchController = TextEditingController();
  get searchController => _searchController;
  searchPointLivraison() {
    _search_livraison_point = [];
    update();

    _search_livraison_point.addAll(livraison_point.where(
      (element) =>
          element.libelle
              .toLowerCase()
              .contains(searchController.text.toLowerCase()) ||
          element.quartier
              .toLowerCase()
              .contains(searchController.text.toLowerCase()) ||
          element.ville
              .toLowerCase()
              .contains(searchController.text.toLowerCase()),
    ));
    if (_search_livraison_point.isEmpty) {
      _search_livraison_point = livraison_point;
      update();
    }
    update();
    print(_search_livraison_point.length);
  }

  List<PointLivraisonModel> _search_livraison_point = [];
  List<PointLivraisonModel> get search_livraison_point =>
      _search_livraison_point;
  List<PointLivraisonModel> _livraison_point = [];
  List<PointLivraisonModel> get livraison_point => _livraison_point;
  int _isLoaded = 0;
  int get isLoaded => _isLoaded;
  // CategoryController({required this.service});
  getPointLivraisom() async {
    try {
      print('*********debut get point');
      _livraison_point.clear();
      _isLoaded = 0;
      update();
      print('*********3...... get point');

      Response response = await livraisonRepo.getLivraison_point();
      // print('*********fin get point ${response.body}');
      if (response.body != null) {
        // if (response.body['data'].length != 0) {

        _livraison_point.addAll((response.body['data'] as List)
            .map((e) => PointLivraisonModel.fromJson(e))
            .toList());
        _isLoaded = 1;
        update();
      }

      // }
      // //print(_livraison_point);
    } catch (e) {
      //print(e);
    }
  }

  bool _isOk = false;
  bool get isOk => _isOk;

  String _codeCommande = '';
  String get isIdCom => _codeCommande;
  var fn = new ViewFunctions();

  downloadFacture(url) async {
    try {
      DateTime now = DateTime.now(); // ProgressDialog progress;
      // progress =
      //     new ProgressDialog(context, type: ProgressDialogType.Download);
      // progress.style(message: "Téléchargement en du fichier ...");

      Directory d = Directory('/storage/emulated/0/Download');

      final file = File(
          '/storage/emulated/0/Download/facture_${now.hour}_${now.minute}_${now.second}.pdf');

      await Dio().download(
        "${ApiUrl.baseUrl}" + url,
        file.path,
        onReceiveProgress: (rec, total) {
          print(rec);
          print(total);
          if (rec == total) {
            fn.snackBar('Facture',
                'Une facture a ete enregistre dans votre portable', true);
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
      print('--setinfo---update');
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
  void onInit() async {
    // TODO: implement initState

    super.onInit();
    _quantite.text = '0';
  }

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

  bool _isImage = false;
  bool get isImage => _isImage;

  socketMessageNegociation(data) {
    fn.snackBar('Message negociation', data['message'], true);
    // ici on doit faire l'ajout a la liste des message en locale dans le telephone du user
  }

  List<ProduitBoutiqueModel> _userLivraisaonList = [];
  List<ProduitBoutiqueModel> get userLivraisaonList => _userLivraisaonList;
  int _isLoadedPB = 0;
  int get isLoadedPB => _isLoadedPB;
  getListLivraisonsForUser() async {
    int idUser = 0;
    // _userLivraisaonList = [];
    _isLoadedPB = 0;
    update();

    await livraisonRepo.getHistoryLivraisons(idUser).then((response) {
      _userLivraisaonList.clear();

      _userLivraisaonList.addAll((response.body['data'] as List)
          .map((e) => ProduitBoutiqueModel.fromJson(e))
          .toList());

      _isLoadedPB = 1;
      update();
    }).onError((e, h) {
      print(e);
      _isLoadedPB = 1;
      update();
    });
  }

  List<ProduitBoutiqueModel> _babanaLivraisaonList = [];
  List<ProduitBoutiqueModel> get babanaLivraisaonList => _babanaLivraisaonList;

  getListLivraisonsFoBabana() async {
    int idUser = 0;
    // _babanaLivraisaonList = [];
    _isLoadedPB = 0;
    update();

    await livraisonRepo.getHistoryLivraisonsBabana(idUser).then((response) {
      _babanaLivraisaonList.clear();

      _babanaLivraisaonList.addAll((response.body['data'] as List)
          .map((e) => ProduitBoutiqueModel.fromJson(e))
          .toList());

      _isLoadedPB = 1;
      update();
    }).onError((e, h) {
      print(e);
      _isLoadedPB = 1;
      update();
    });
  }

  bool _isUpdating = false;
  bool get isUpdating => _isUpdating;
  updateProduit(data) async {
    // _isUpdating = true;
    // update();

    // fn.loading('Produit', 'Mise a jour du produit en cours');

    // try {
    //   Response response = await boutiqueRepo.updateProduitFB(data);
    //   //print(response.body);
    //   if (response.statusCode == 200) {
    //     await getListProduitForBoutique();
    //     fn.closeLoader();
    //     fn.snackBar('Mise a jour', response.body['message'], true);
    //   }
    //   fn.closeLoader();

    //   _isUpdating = false;
    //   // Get.back(closeOverlays: true);
    //   update();
    // } catch (e) {
    //   fn.closeLoader();

    //   fn.snackBar('Mise a jour', 'Une erreur est survenue', false);
    //   //        fn.closeLoader();

    //   _isUpdating = false;
    //   update();
    //   //print(e);
    // }
  }

  TextEditingController _libelle = TextEditingController();
  get libelle => _libelle;

  TextEditingController _quantite = TextEditingController();
  get quantite => _quantite;

  TextEditingController _service = TextEditingController();
  get service => _service;

  TextEditingController _description = TextEditingController();
  get description => _description;

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
    update();
  }

  check(val) {
    return val < 0 ? '0' : val.toString();
  }

  newLivraison() async {
    try {
      fn.loading('Livraison', 'Ajout d\'un nouveau produit en cours');
      var key = await dababase.getKey();
      if (Boutique != null) {
        var dataS = {
          'keySecret': key,
          'libelle': libelle.text,
          'service': service.text,
          'contactEmetteur': contactEmetteur.text,
          'contactRecepteur': contactRecepteur.text,
          'description': description.text,
          'quantite': quantite.text,
          'valeurColis': valeurColis.text,
          'category': _controller.categorySelect.id,
          'countImage': listImgColis.length
        };
        //print(dataS);

        listImgColis.forEach((e) {
          dataS.addAll({
            "file${listImgColis.indexOf(e)}": MultipartFile(
              e.path,
              filename: "Image.jpg",
            )
          });
        });
        FormData data = new FormData(dataS);

        _isUpdating = true;
        update();

        Response response = await livraisonRepo.newLivraison(data);
        //print(response.body);
        if (response.statusCode == 200) {
          await getListLivraisonsForUser();
        }

        fn.closeLoader();

        fn.snackBar('Livraison', response.body['message'], true);
        _isUpdating = false;
        // Get.back(closeOverlays: true);
        update();
      }
    } catch (e) {
      fn.closeLoader();

      fn.snackBar('Mise a jour', 'Une erreur est survenue', false);
      //        fn.closeLoader();

      _isUpdating = false;
      update();
      //print(e);
    }
  }

  // deletteProduit(data) async {
  //   _isUpdating = true;
  //   update();
  //   fn.loading('Produit', 'Suppression du produit en cours');

  //   try {
  //     Response response = await boutiqueRepo.desibledProduitFB(data);
  //     //print(response.body);

  //     if (response.statusCode == 200) {
  //       await getListBoutique();
  //     }
  //     fn.closeLoader();

  //     fn.snackBar('Mise a jour', response.body['message'], true);
  //     _isUpdating = false;
  //     // Get.back(closeOverlays: true);
  //     update();
  //   } catch (e) {
  //     fn.closeLoader();

  //     fn.snackBar('Mise a jour', 'Une erreur est survenue', false);
  //     //        fn.closeLoader();

  //     _isUpdating = false;
  //     update();
  //     //print(e);
  //   }
  // }
}

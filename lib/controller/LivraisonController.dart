import 'dart:io';

import 'package:BananaExpress/Views/Livraison/SuccesReceptionview.dart';
import 'package:BananaExpress/Views/Livraison/SuccesRecuperationview.dart';
import 'package:BananaExpress/components/Button/app_button.dart';
import 'package:BananaExpress/controller/DataBaseController.dart';
import 'package:BananaExpress/controller/GeneralController.dart';
import 'package:BananaExpress/controller/managerController.dart';
import 'package:BananaExpress/model/data/PointLivraisonModel.dart';
import 'package:BananaExpress/model/data/LivraisonModel.dart';
import 'package:BananaExpress/repository/LivraisonRepo.dart';
import 'package:BananaExpress/repository/LivreurRepo.dart';
import 'package:BananaExpress/utils/Services/SocketService.dart';
import 'package:BananaExpress/utils/Services/routing.dart';
import 'package:BananaExpress/utils/Services/apiUrl.dart';
import 'package:BananaExpress/utils/functions/viewFunctions.dart';
import 'package:dio/dio.dart' hide Response, MultipartFile, FormData;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../components/exportcomponent.dart';
import 'dart:io';

class Colis {
  String nom;
  String quantite;
  String contactRecepteur;
  String valeurColis;
  int category;
  String pointLivraison; // Ajoutez le champ pointLivraison si nécessaire
  List<File> listImgColis;
  List<MultipartFile> listImgColisMultiPart;

  Colis({
    required this.nom,
    required this.quantite,
    required this.contactRecepteur,
    required this.valeurColis,
    required this.category,
    required this.pointLivraison,
    required this.listImgColis,
    required this.listImgColisMultiPart,
  });
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
  String _urlFacture = '';
  downloadFacture() async {
    try {
      DateTime now = DateTime.now(); // ProgressDialog progress;
      // progress =
      //     new ProgressDialog(context, type: ProgressDialogType.Download);
      // progress.style(message: "Téléchargement en du fichier ...");

      Directory d = Directory('/storage/emulated/0/Download');

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

  connectToSocketLivraison() async {
    var key = await dababase.getKey();

    new SocketService().listLivraison(key, fineListToUpdate);
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
        fineListToUpdate(LivraisonModel.fromJson(response.body['data']));

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
        fineListToUpdate(LivraisonModel.fromJson(response.body['data']));
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
    update();
  }

  check(val) {
    return val < 0 ? '0' : val.toString();
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
      _contactRecepteur.text = data!.phone;
      _contactEmetteur.text = '';
      update();
    }
  }

  int _state = 0;

  int get state => _state;
  changeState(i) {
    _state = i;
    update();
  }

  List<File> _imageColis = [];
  List<File> get imageColis => _imageColis;
  cleanImage() {
    _imageColis.clear();
    update();
  }

  Future getImageColisAppareil() async {
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

      update();
    } catch (e) {}
  }

  Future getImageColisGalerie() async {
    try {
      var image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 100,
          maxHeight: 500,
          maxWidth: 500);

      _imageColis.add(File(image!.path));

      update();
    } catch (e) {}
  }

  List _listColis = [];
  get listColis => _listColis;
  addColis(
      /*  String nom,
    String quantite,
    String contactRecepteur,
    String valeurColis,
    String category,
    String pointLivraison,
    List<File> listImgColis, */
      ) {
    List<MultipartFile> imageFiles = [];

    for (int i = 0; i < listColis.length; i++) {
      Colis colis = listColis[i];

      // data.addAll({
      //   'colis[$i][nom]': colis.nom,
      //   'colis[$i][quantite]': colis.quantite,
      //   'colis[$i][contactRecepteur]': colis.contactRecepteur,wxxsaad
      //   'colis[$i][valeurColis]': colis.valeurColis,
      //   'colis[$i][category]': colis.category,
      //   'colis[$i][contactRecepteur]': colis.contactRecepteur,
      //   'colis[$i][point_livraison]': colis.pointLivraison,
      //   'colis[$i][countImage]': colis.listImgColis.length,
      // });

      for (int j = 0; j < colis.listImgColis.length; j++) {
        File imageFile = colis.listImgColis[j];
        imageFiles.add(MultipartFile(
          imageFile.path,
          filename: 'Image$j.jpg',
        ));
      }

      Colis newColis = Colis(
        nom: nomProduit.text,
        quantite: quantite.text,
        contactRecepteur: _contactRecepteur.text,
        valeurColis: nomProduit.text,
        category: _categorySelect.id,
        pointLivraison: '10',
        listImgColis: _imageColis,
        listImgColisMultiPart: imageFiles,
      );

      _listColis.add(newColis);
      update();
      print(newColis.contactRecepteur);
      print(_listColis.length);
      Get.back();
    }
  }

  createFormData() async {
    var key = await dababase.getKey();
    var data = {
      'keySecret': key,
      'libelle': libelle.text,
      'service': service,
      'contactEmetteur': contactEmetteur.text,
      'description': description.text,
      'ville': villeSelect.id,
      'colis': listColis,
    };
    print(data);

    for (int i = 0; i < listColis.length; i++) {
      Colis colis = listColis[i];

      // data.addAll({
      //   'colis[$i][nom]': colis.nom,
      //   'colis[$i][quantite]': colis.quantite,
      //   'colis[$i][contactRecepteur]': colis.contactRecepteur,
      //   'colis[$i][valeurColis]': colis.valeurColis,
      //   'colis[$i][category]': colis.category,
      //   'colis[$i][contactRecepteur]': colis.contactRecepteur,
      //   'colis[$i][point_livraison]': colis.pointLivraison,
      //   'colis[$i][countImage]': colis.listImgColis.length,
      // });
      print(data['colis']);
      for (int j = 0; j < colis.listImgColis.length; j++) {
        File imageFile = colis.listImgColis[j];
        data.addAll({
          'file[$i][images][$j]': MultipartFile(
            imageFile.path,
            filename: 'Image$j.jpg',
          )
        });
      }
    }
    FormData dataF = FormData(data);
    return dataF;
  }

  var frais = '1000';
  newLivraison() async {
    _urlFacture = '';
    try {
      var key = await dababase.getKey();
      fn.loading('Livraison', 'Ajout d\'un nouveau produit en cours');
      if (key != null) {
        // var dataS = {
        //   'keySecret': key,
        //   'libelle': libelle.text,
        //   'service': service,
        //   'contactEmetteur': contactEmetteur.text,
        //   'contactRecepteur': contactRecepteur.text,
        //   'description': description.text,
        //   'quantite': quantite.text,
        //   'valeurColis': valeurColis.text,
        //   'category': categorySelect.id,
        //   'ville': villeSelect.id,
        //   'countImage': listImgColis.length
        // };
        // print(dataS);

        // listImgColis.forEach((e) {
        //   dataS.addAll({
        //     "file${listImgColis.indexOf(e)}": MultipartFile(
        //       e.path,
        //       filename: "Image.jpg",
        //     )
        //   });
        // });
        print("response.body");

        var data = createFormData();
        // FormData data = new FormData(dataS);
        print("response.body");

        _isUpdating = true;
        update();

        Response response = await livraisonRepo.newLivraison(data);
        //print(response.body);
        if (response.statusCode == 200) {
          Get.toNamed(AppLinks.SUCCESSLIVRAISON);
          _urlFacture = response.body['facture'];
          await getListLivraisonsForUser();
        } else {
          fn.snackBar('Livraison', response.body['message'], false);
        }

        fn.closeLoader();

        fn.snackBar('Livraison', response.body['message'], true);
        _isUpdating = false;
        // Get.back(closeOverlays: true);
        update();
      }
    } catch (e) {
      fn.closeLoader();

      fn.snackBar('Livraison', 'Une erreur est survenue', false);
      //        fn.closeLoader();

      _isUpdating = false;
      update();
      //print(e);
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
                              setService(1);
                              Get.toNamed(AppLinks.NEWLIVRAISON);
                            }),
                      ),
                      AppButton(
                          text: 'Me faire livrer'.tr,
                          // width: kWidth / 2.5,
                          size: MainAxisSize.max,
                          // bgColor: AppColors.secondarytext,
                          onTap: () {
                            setService(2);
                            Get.toNamed(AppLinks.NEWLIVRAISON);
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
}

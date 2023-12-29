import 'package:BananaExpress/Views/Home/HomeView.dart';
import 'package:BananaExpress/Views/Livraison/LivraisonView.dart';
import 'package:BananaExpress/Views/Notifications/NotificationView.dart';
import 'package:BananaExpress/Views/User/SettingView.dart';
import 'package:BananaExpress/Views/User/UserManageView.dart';
import 'package:BananaExpress/controller/DataBaseController.dart';
import 'package:BananaExpress/controller/managerController.dart';
import 'package:BananaExpress/model/data/CategoryModel.dart';
import 'package:BananaExpress/model/data/ModePaiementModel.dart';
import 'package:BananaExpress/model/data/VilleModel.dart';
import 'package:BananaExpress/model/socket/NotificationModel.dart';
import 'package:BananaExpress/repository/GeneralRepo.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/utils/Services/NotificationService.dart';
import 'package:BananaExpress/utils/Services/SocketService.dart';
import 'package:BananaExpress/utils/functions/viewFunctions.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:BananaExpress/Views/User/ManageView.dart';
import 'package:get_storage/get_storage.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/utils/constants/assets.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter_svg/flutter_svg.dart';

class GeneralController extends GetxController {
  final GeneralRepo generalRepo;
  GeneralController({required this.generalRepo});
  final dababase = Get.find<DataBaseController>();

  void onInit() async {
    super.onInit();

    fn.verifiedConnection();
    _controllerScrollNotification = ScrollController()
      ..addListener(_scrollListenerNotification);
    update();
  }

  openDrawer(context) {
    // _scaffoldKey.currentState!.openDrawer();
    Scaffold.of(context).openDrawer();
  }

  List<CategoryModel> _categoryList = [];
  List<CategoryModel> get categoryList => _categoryList;
  int _isLoadedCat = 0;
  int get isLoadedCat => _isLoadedCat;
  // CategoryController({required this.service});
  getCategory() async {
    try {
      _isLoadedCat = 0;
      update();

      Response response = await generalRepo.getCategory();
      if (response.body != null) {
        if (response.body['data'].length != 0) {
          _categoryList = [];
          print(response.body['data']);
          _categoryList.addAll((response.body['data'] as List)
              .map((e) => CategoryModel.fromJson(e))
              .toList());
          _isLoadedCat = 1;
          update();
        } else {
          _isLoadedCat = 1;
          update();
        }
      }
      // //print(_categoryList);
    } catch (e) {
      _isLoadedCat = 0;
      update();
    }
  }

  List<VilleModel> _villeList = [];
  List<VilleModel> get villeList => _villeList;
  int _isLoadedVille = 0;
  int get isLoadedVille => _isLoadedVille;
  // CategoryController({required this.service});
  getVille() async {
    try {
      _isLoadedVille = 0;
      update();

      Response response = await generalRepo.getVille();
      if (response.body != null) {
        if (response.body['data'].length != 0) {
          _villeList = [];
          print(response.body['data']);
          _villeList.addAll((response.body['data'] as List)
              .map((e) => VilleModel.fromJson(e))
              .toList());
          _isLoadedVille = 1;
          update();
        } else {
          _isLoadedVille = 1;
          update();
        }
      }
      // //print(_villeList);
    } catch (e) {
      _isLoadedVille = 0;
      update();
    }
  }

  ScrollController _scrollcontroller = new ScrollController();
  ScrollController get scrollcontroller => _scrollcontroller;
  bool _dark = false;
  bool get dark => _dark;
  List<ModePaiementModel> _lmodePaiement = [];
  List<ModePaiementModel> get lmodePaiement => _lmodePaiement;
  int _isLoadedMP = 0;
  int get isLoadedMP => _isLoadedMP;

  int _selected = 0;
  int get selected => _selected;
  ModePaiementModel _smode =
      new ModePaiementModel(id: 0, libelle: 'Selectionner', img: '');
  ModePaiementModel get smode => _smode;
  selectMode(mode) {
    _selected = mode.id;
    _smode = mode;
    update();
  }

  getListModePaiement() async {
    _isLoadedMP = 0;
    // refresh();
    try {
      Response response = await generalRepo.getModePaiement();
      _lmodePaiement.clear();
      if (response.body != null) {
        if (response.body['data'].length != 0) {
          _lmodePaiement.addAll((response.body['data'] as List)
              .map((e) => ModePaiementModel.fromJson(e))
              .toList());
        }
        // _isLoadedMP = 1;

        // update();
      }
      _isLoadedMP = 1;

      update();
      _isLoadedMP = 1;
      update();
    } catch (e) {
      //print(e);
    }
  }

  GetStorage box = GetStorage();

  changeTheme() async {
    // //print(box.read('theme') == '1');
    _dark = !_dark;
    update();

    await dababase.saveTheme(_dark ? "1" : "0");

    // _dark = box.read('theme') != null ? box.read('theme') == '1' : false;

    // Get.changeThemeMode(
    //   _dark ? ThemeMode.dark : ThemeMode.light,
    // );
    getTheme();
    //print(box.read('theme'));
  }

  getCurrentTheme() {
    return this.dark;
  }

  getTheme() async {
    var theme = await dababase.getTheme();
    _dark = theme != null ? theme == '1' : false;
    update();
    Get.changeTheme(!_dark ? ThemeData.light() : ThemeData.dark());
  }

  getThemeInit(context) async {
    var theme = await dababase.getTheme();
    _dark = theme != null
        ? theme == '1'
        : Theme.of(context).brightness == Brightness.dark;
    Get.changeTheme(!_dark ? ThemeData.light() : ThemeData.dark());
    update();
  }

  Locale _lan = Locale('fr', 'FR');
  Locale get lan => _lan;

  final List locale = [
    {'name': 'En', 'locale': const Locale('en', 'US')},
    {'name': 'Fr', 'locale': const Locale('fr', 'FR')},
  ];

  final lang = (Get.locale?.languageCode ?? 'Fr').obs;

  updateLanguage(String localLang) async {
    int index = locale.indexWhere((element) => element['name'] == localLang);
    if (index != -1) {
      lang.value = locale[index]['name'];
      //        fn.closeSnack();

      Get.updateLocale(locale[index]['locale']);

      await dababase.saveLan(lang.value);
    }
  }

  getLanguage(String localLang) {
    int index = locale.indexWhere((element) => element['name'] == localLang);
    if (index != -1) {
      return locale[index]['locale'];
    }
  }

  getLanguageInit() async {
    var lan = await dababase.getLan();
    int index = locale.indexWhere((element) => element['name'] == lan);
    if (index != -1) {
      lang.value = locale[index]['name'];
      Get.updateLocale(locale[index]['locale']);

      // return locale[index]['locale'];
    }
  }

  final CarouselController _controller = CarouselController();
  CarouselController get controller => _controller;
  int _index = 0;
  int get index => _index;
  var fn = new ViewFunctions();

  setIndex(index) {
    _index = index;
    update();
  }

  setIndexCurrent(index) {
    _currentIndex = index;
    update();
  }

  late ScrollController _controllerScrollNotification;
  get controllerScrollNotification => _controllerScrollNotification;
  int _currentIndex = 0;
  Widget buildContent() {
    switch (_currentIndex) {
      case 0:
        return HomeView();
      // case 1:
      //   return SearchView();
      case 1:
        return LivraisonView();

      default:
        return HomeView();
    }
  }

  Widget buildBorderRadiusDesign() {
    return /*GetBuilder<ProduitController>(builder: (_controller) {
      return  Offstage(
          offstage: _controller.isBottomBarVisible,
          child: */
        CustomNavigationBar(
      iconSize: 30.0,
      // elevation: 0.0,
      scaleFactor: 0.4,
      selectedColor: Color(0xff0c18fb),
      strokeColor: Color(0x300c18fb),
      unSelectedColor: Colors.grey[600],
      backgroundColor:
          /*     _currentIndex == 2 ? ColorsApp.primary : */ ColorsApp.bg,
      // borderRadius: Radius.circular(15.0),
      // isFloating: true,
      // blurEffect: true,
      items: [
        CustomNavigationBarItem(
            icon: Container(
              height: kSmHeight / 1.7,
              width: kSmWidth / 4.2,
              child: SvgPicture.asset(
                Assets.home,
                width: 90,
                height: 90,
                color: _currentIndex == 0 ? ColorsApp.second : ColorsApp.grey,
              ),
            ),
            title: Container(
                padding: EdgeInsets.only(bottom: 3),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: _currentIndex == 0
                            ? BorderSide(color: ColorsApp.second, width: 2)
                            : BorderSide.none,
                        top: BorderSide.none)),
                child: Text('home'.tr,
                    style: TextStyle(
                      fontSize: kMin,
                      fontWeight: FontWeight.w600,
                      color: _currentIndex == 0
                          ? ColorsApp.second
                          : ColorsApp.grey,
                    )))), // CustomNavigationBarItem(

        if (Get.find<ManagerController>().Userget != null)
          if (Get.find<ManagerController>().Userget.typeUser == 2)
            CustomNavigationBarItem(
              icon: Container(
                height: kSmHeight / 1.7,
                width: kSmWidth / 4.2,
                child: SvgPicture.asset(
                  Assets.grid1,
                  width: 80,
                  height: 80,
                  color: _currentIndex == 1 ? ColorsApp.second : ColorsApp.grey,
                ),
              ),
              title: Container(
                  padding: EdgeInsets.only(bottom: 3),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: _currentIndex == 1
                              ? BorderSide(color: ColorsApp.second, width: 2)
                              : BorderSide.none,
                          top: BorderSide.none)),
                  child: Text('historique'.tr,
                      style: TextStyle(
                        fontSize: kMin,
                        fontWeight: FontWeight.w600,
                        color: _currentIndex == 1
                            ? ColorsApp.second
                            : ColorsApp.grey,
                      ))),
            ),

        // CustomNavigationBarItem(
        //   icon: Container(
        //     height: kSmHeight / 1.7,
        //     width: kSmWidth / 4.2,
        //     child: Icon(
        //       Icons.settings,
        //       size: 25,
        //       color: _currentIndex == 2 ? ColorsApp.tird : ColorsApp.grey,
        //     ),
        //   ),
        //   title: Container(
        //       padding: EdgeInsets.only(bottom: 3),
        //       decoration: BoxDecoration(
        //           border: Border(
        //               bottom: _currentIndex == 4
        //                   ? BorderSide(color: ColorsApp.tird, width: 2)
        //                   : BorderSide.none,
        //               top: BorderSide.none)),
        //       child: Text('setting'.tr,
        //           style: TextStyle(
        //             fontSize: kMin,
        //             fontWeight: FontWeight.w600,
        //             color: _currentIndex == 2 ? ColorsApp.tird : ColorsApp.grey,
        //           ))),

        // badgeCount: _badgeCounts[4],
        // showBadge: _badgeShows[4],
        // ),
        // CustomNavigationBarItem(
        //   icon: Icon(Icons.hourglass_disabled),
        //   badgeCount: _badgeCounts[4],
        //   showBadge: _badgeShows[4],
        // ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        _currentIndex = index;
        update();
      },
    );
    //});
    // });
  }

  setGoHome() {
    _currentIndex = 0;
    update();
  }

  // generalSocket() {
  //   new SocketService().general(socketGeneralNotification);
  // }

  // socketGeneralNotification(data) {
  //   print('000-...............');
  //   print(data);
  //   new NotificationService().emitNotificationGenearal(data['message']);
  //   update();
  //   // ici on doit faire l'ajout a la liste des message en locale dans le telephone du user
  // }

  NotificationSocket() async {
    var getU = await dababase.getKey();
    new SocketService().notifications(getU, generalNotification);
  }

  generalNotification(notification) {
    print('000-...............');
    print(notification);
    new NotificationService().emitNotifications(notification);

    _notificationList.insert(0, notification);
    update();
    // ici on doit faire l'ajout a la liste des message en locale dans le telephone du user
  }

  void _scrollListenerNotification() {
    if (_controllerScrollNotification.offset + Get.height * 1.5 >=
        _controllerScrollNotification.position.maxScrollExtent) {
      getListNotifications();
    }
  }

  List<NotificationModel> _notificationList = [];
  List<NotificationModel> _notificationListSave = [];
  List<NotificationModel> get notificationList => _notificationList;

  int indexNotification = 1;
  int _isLoadNotification = 0;
  int get isLoadNotification => _isLoadNotification;

  bool _loaddata = false;
  bool get loaddata => _loaddata;
  getListNotifications() async {
    var getU = await dababase.getKey();
    if (getU != null) {
      await await generalRepo
          .getListNotifications(indexNotification, getU)
          .then((value) async {
        print(
            '----_isLoadNotification--------------value----------${value.body}-');
        _notificationList.clear();
        if (value.body != null) {
          if (value.body['data'].length != null) {
            if (value.body['data'].length != 0) {
              _notificationList.addAll((value.body['data'] as List)
                  .map((e) => NotificationModel.fromJson(e))
                  .toList());
            }
          }
          indexNotification++;
          _isLoadNotification = 1;
          print(
              '_isLoadNotification-----------------------${_isLoadNotification}');
          _loaddata = false;

          update();
        }
      }).catchError((error) {
        _loaddata = false;
        _isLoadNotification = 2;
        update();
        //print(e);
        print(error);
      });
    }
  }

  readNotification(idNotification) async {
    try {
      _notificationList
          .where((element) => element.id == idNotification)
          .first
          .read = true;
      update();
      Response response = await generalRepo.readNotifications(idNotification);
    } catch (e) {
      fn.closeLoader();

      fn.snackBar('Note', 'Erreur', false);
      //print(e);
    }
  }

  int _isLoadedHome = 0;
  int get isLoadedHome => _isLoadedHome;
}

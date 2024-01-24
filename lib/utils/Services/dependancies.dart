// import 'package:BananaExpress/old/controller/GeneralController.dart';
// import 'package:BananaExpress/old/controller/BuyShopController.dart';
// import 'package:BananaExpress/old/controller/CommandeController.dart';
// import 'package:BananaExpress/old/controller/ShortController.dart';
// import 'package:BananaExpress/old/controller/TransactionController.dart';
// import 'package:BananaExpress/old/controller/boutiqueController.dart';
// import 'package:BananaExpress/old/controller/cartController.dart';
// import 'package:BananaExpress/old/controller/categoryController.dart';
// import 'package:BananaExpress/old/controller/categoryBoutiqueController.dart';
// import 'package:BananaExpress/old/controller/managerController.dart';
// import 'package:BananaExpress/old/controller/produitController.dart';
// import 'package:BananaExpress/old/controller/searchController.dart';
// import 'package:BananaExpress/old/repository/GeneralRepo.dart';
// import 'package:BananaExpress/old/repository/BoutiqueRepo.dart';
// import 'package:BananaExpress/old/repository/BuyShoopingCartRepo.dart';
// import 'package:BananaExpress/old/repository/CommandeRepo.dart';
// import 'package:BananaExpress/old/repository/SearchRepo.dart';
// import 'package:BananaExpress/old/repository/ShortRepo.dart';
// import 'package:BananaExpress/old/repository/TransgeneralRepo.dart';
// import 'package:BananaExpress/old/repository/categoryBoutiqueRepo.dart';
// import 'package:BananaExpress/old/repository/LivreurRepo.dart';
// import 'package:BananaExpress/old/repository/ManageRepo.dart';
// import 'package:BananaExpress/old/repository/categoryRepo.dart';
// import 'package:BananaExpress/old/repository/popularProduitRepo.dart';
// import 'package:BananaExpress/utils/Services/ApiClient.dart';
// import 'package:BananaExpress/utils/Services/storageService2.dart';
// import 'package:BananaExpress/utils/database/DataBase.dart';
// import 'package:BananaExpress/utils/database/DataBase.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:sqflite/sqlite_api.dart';

// class MyBinding extends Bindings {
//   void dependencies() async {
//     Get.lazyPut(() => DB(), fenix: true);
//     Get.lazyPut(() => GeneralRepo(apiClient: Get.find()));

//     Get.lazyPut(() => GeneralController(generalRepo: Get.find()), fenix: true);
//     Get.lazyPut(() => LivreurRepo(apiClient: Get.find()), fenix: true);
//     // Get.lazyPut(() => StorageService(), fenix: true);
//     Get.lazyPut(() => GetStorage(), fenix: true);
//     Get.lazyPut(() => ApiClient(), fenix: true);

//     Get.lazyPut(() => CommandeRepo(apiClient: Get.find()), fenix: true);
//     Get.lazyPut(() => ManageRepo(apiClient: Get.find()), fenix: true);

//     Get.lazyPut(() => ManagerController(manageRepo: Get.find()), fenix: true);

//     Get.lazyPut(() => CommandeController(commandeRepo: Get.find()),
//         fenix: true);
//     Get.lazyPut(() => CategoryBoutiqueRepo(apiClient: Get.find()), fenix: true);
//     Get.lazyPut(() => ProduitRepo(apiClient: Get.find()), fenix: true);
//     Get.lazyPut(() => BoutiqueRepo(apiClient: Get.find()), fenix: true);
//     Get.lazyPut(() => CategoryBoutiqueRepo(apiClient: Get.find()), fenix: true);
//     Get.lazyPut(() => BuyShoopingCartRepo(apiClient: Get.find()), fenix: true);
//     Get.lazyPut(() => TransgeneralRepo(apiClient: Get.find()), fenix: true);

//     Get.lazyPut(() => ProduitController(produitRepo: Get.find()), fenix: true);
//     Get.lazyPut(() => CartController(), fenix: true);
//     Get.lazyPut(() => BuyShopController(buySoppingCartRepo: Get.find()),
//         fenix: true);
//     Get.lazyPut(() => BoutiqueController(boutiqueRepo: Get.find()),
//         fenix: true);
//     Get.lazyPut(
//         () => CategoryBoutiqueController(categoryBoutiqueRepo: Get.find()),
//         fenix: true);

//     Get.lazyPut(() => TransactionController(transgeneralRepo: Get.find()),
//         fenix: true);
//     Get.lazyPut(() => SearchRepo(apiClient: Get.find()), fenix: true);
//     Get.lazyPut(() => MySearchController(searchRepo: Get.find()), fenix: true);
//     Get.lazyPut(() => ShortRepo(apiClient: Get.find()), fenix: true);
//     Get.lazyPut(() => ShortController(shortRepo: Get.find()), fenix: true);

//     var database = dababase;
//     await database.init();
//     await Get.find<GeneralController>().getLanguageInit();
//   }

//   onInit() async {
//     Get.find<ManagerController>().chageN(true);
//     await requestPermission();

//     await GetStorage.init();
//     var database = dababase;
//     await database.init();
//     Get.find<ManagerController>().getKeyU();
//     Get.find<ManagerController>().getUser();

//     Get.find<ManagerController>().newLocalisation();

//     Get.find<ProduitController>().getPopularProduit();

//     Get.find<CartController>();

//     Get.find<BuyShopController>();
//     Get.find<BoutiqueController>().getListBoutique();
//     Get.find<CategoryBoutiqueController>().getCategory();
//     Get.find<CommandeController>().getListCommandes();
//     Get.find<CategoryBoutiqueController>().getListBoutiques();
//     Get.find<ShortController>().getListForYouShort();

//     Get.find<GeneralController>().getListModePaiement();
//     Get.find<BoutiqueController>().getListBoutique();

//     // Get.find<BuyShopController>().getListLivreur();
//   }

//   onGetAll() async {
//     // var database = dababase;
//     // await database.init();
//     // Get.find<StorageService>().init();
//     Get.lazyPut(() => GeneralRepo(apiClient: Get.find()));

//     Get.lazyPut(() => GeneralController(generalRepo: Get.find()));
//     Get.lazyPut(() => LivreurRepo(apiClient: Get.find<ApiClient>()));
//     // Get.lazyPut(() => StorageService());

//     Get.lazyPut(() => GetStorage());
//     Get.lazyPut(() => DB());
//     Get.lazyPut(() => ApiClient());
//     Get.lazyPut(() => CommandeRepo(apiClient: Get.find()));

//     Get.lazyPut(() => ManageRepo(apiClient: Get.find()));

//     Get.lazyPut(() => ManagerController(manageRepo: Get.find()));

//     Get.lazyPut(() => ProduitRepo(apiClient: Get.find()));
//     Get.lazyPut(() => BoutiqueRepo(apiClient: Get.find()));
//     Get.lazyPut(() => BuyShoopingCartRepo(apiClient: Get.find()));
//     Get.lazyPut(() => TransgeneralRepo(apiClient: Get.find()));
//     Get.lazyPut(() => ProduitController(produitRepo: Get.find()));
//     Get.lazyPut(() => CartController());
//     Get.lazyPut(() => CommandeController(commandeRepo: Get.find()));

//     Get.lazyPut(() => BuyShopController(buySoppingCartRepo: Get.find()));
//     Get.lazyPut(() => BoutiqueController(boutiqueRepo: Get.find()));
//     Get.lazyPut(() => CategoryBoutiqueRepo(apiClient: Get.find()));
//     Get.lazyPut(
//         () => CategoryBoutiqueController(categoryBoutiqueRepo: Get.find()));

//     Get.lazyPut(() => TransactionController(transgeneralRepo: Get.find()));
//     Get.lazyPut(() => ShortRepo(apiClient: Get.find()), fenix: true);
//     Get.lazyPut(() => ShortController(shortRepo: Get.find()), fenix: true);

//     Get.find<GeneralController>();
//     Get.find<ManagerController>().getKeyU();
//     Get.find<ManagerController>().getUser();

//     Get.find<ManagerController>().newLocalisation();

//     Get.find<CommandeController>().getListCommandes();
//     Get.find<ManagerController>().getUser();

//     Get.find<ProduitController>().getPopularProduit();
//     Get.find<BoutiqueController>().getCategory();
//     Get.find<CategoryBoutiqueController>().getCategory();
//     Get.find<CategoryBoutiqueController>().getListBoutiques();

//     Get.find<CartController>();

//     Get.find<BuyShopController>();
//     Get.lazyPut(
//         () => CategoryBoutiqueController(categoryBoutiqueRepo: Get.find()));

//     Get.find<TransactionController>().getTransactions();

//     Get.lazyPut(() => SearchRepo(apiClient: Get.find()), fenix: true);
//     Get.lazyPut(() => MySearchController(searchRepo: Get.find()), fenix: true);
//     Get.lazyPut(() => MySearchController(searchRepo: Get.find()), fenix: true);
//     Get.find<BoutiqueController>().getListBoutique();

//     Get.find<ShortController>().getListForYouShort();

//     // Get.find<CommandeController>().insertAll();
//   }

//   onGetDataNew() async {
//     var database = dababase;
//     await database.init();
//     Get.find<ManagerController>().newLocalisation();

//     Get.find<ManagerController>().getKeyU();

//     Get.find<CommandeController>().getListCommandes();
//     Get.find<BoutiqueController>().getListBoutique();
//     Get.find<ManagerController>().getUser();
//     Get.find<ShortController>().getListForYouShort();
//   }

//   requestPermission() async {
//     var status = await Permission.storage.status;
//     //print("voici le statut ,  $status");
//     if (!status.isGranted) {
//       await Permission.storage.request();
//     }
//   }
// }

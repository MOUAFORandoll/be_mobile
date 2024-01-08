import 'package:BananaExpress/controller/GeneralController.dart';
import 'package:BananaExpress/controller/LivraisonController.dart';
import 'package:BananaExpress/controller/managerController.dart';
import 'package:BananaExpress/repository/GeneralRepo.dart';
import 'package:BananaExpress/repository/LivreurRepo.dart';
import 'package:BananaExpress/repository/LivraisonRepo.dart';
import 'package:BananaExpress/repository/ManageRepo.dart';
import 'package:BananaExpress/utils/Services/ApiClient.dart';
import 'package:BananaExpress/utils/Services/UniLinkService.dart';
import 'package:BananaExpress/controller/DataBaseController.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uni_links/uni_links.dart';

import 'dart:async';
// ...
Future<void> initApp() async {
  await requestPermission();
  Get.find<ManagerController>().chageN(true);
  await GetStorage.init();

  await Get.find<ManagerController>().getUserDB();
  Get.find<ManagerController>().getUser();

  // await Get.find<GeneralController>().generalSocket();
  Get.find<GeneralController>().getCategory();
  Get.find<GeneralController>().getVille();
  if (Get.find<ManagerController>().Userget != null) {
    if (Get.find<ManagerController>().Userget.typeUser == 2) {
      Get.find<LivraisonController>().getListLivraisonsForUser();
    }
    if (Get.find<ManagerController>().Userget.typeUser == 3) {
      Get.find<LivraisonController>().getListLivraisonsForBabana();
    }
  }
  Get.find<LivraisonController>().connectToSocketLivraison();
  Get.find<LivraisonController>().livraisonFinish();

  await Get.find<LivraisonController>().determinePosition();
  await Get.find<LivraisonController>().getPointRecuperationUser();
}

Future<void> secondInit() async {
  // Get.find<CategoryBoutiqueController>().getListBoutiques();

  // Get.find<ManagerController>().newLocalisation();
  // Get.find<ManagerController>().getListFieul();

  // Get.find<GeneralController>().getListModePaiement();
}

// ...
Future<void> initAllApp() async {
  await requestPermission();
  await Get.find<LivraisonController>().determinePosition();

  Get.find<ManagerController>().chageN(true);
  await GetStorage.init();
  await Get.find<GeneralController>().getCategory();
  Get.find<GeneralController>().getVille();

  await Get.find<ManagerController>().getUserDB();
  Get.find<ManagerController>().getUser();
  Get.find<LivraisonController>().setUserInfo();
  // Get.find<GeneralController>().getListNotifications();

  // Get.find<ManagerController>().newLocalisation();
  if (Get.find<ManagerController>().Userget != null) {
    if (Get.find<ManagerController>().Userget.typeUser == 2) {
      Get.find<LivraisonController>().getListLivraisonsForUser();
    }
    if (Get.find<ManagerController>().Userget.typeUser == 3) {
      Get.find<LivraisonController>().getListLivraisonsForBabana();
    }
  }

  Get.find<LivraisonController>().livraisonFinish();
  Get.find<LivraisonController>().connectToSocketLivraison();
  await Get.find<LivraisonController>().getPointRecuperationUser();

  // Get.find<GeneralController>().getListModePaiement();
}

Future<void> initServices() async {
  Get.put(UniLinkService(), permanent: true);

  Get.put(await DataBaseController.getInstance(), permanent: true);

  Get.put(ApiClient(), permanent: true);

  Get.put(LivreurRepo(apiClient: Get.find()), permanent: true);
  // Get.put(  StorageService(), permanent: true);
  Get.put(GetStorage(), permanent: true);
  Get.put(ManageRepo(apiClient: Get.find()), permanent: true);

  Get.put(ManagerController(manageRepo: Get.find()), permanent: true);

  Get.put(GeneralRepo(apiClient: Get.find()));
  Get.put(GeneralController(generalRepo: Get.find()), permanent: true);
  Get.put(LivraisonRepo(apiClient: Get.find()));
  Get.put(LivraisonController(livraisonRepo: Get.find()), permanent: true);
}

requestPermission() async {
  var status = await Permission.storage.status;
  //print("voici le statut ,  $status");
  if (!status.isGranted) {
    await Permission.storage.request();
    await requestPermission();
  } else {
    await getData();
  }
}

getData() async {
  // await MyBinding().requestPermission();
  var status = await Permission.storage.status;
  //print("voici le statut ,  $status");

  if (status.isGranted) {
    await Get.find<GeneralController>().getLanguageInit();

    Get.find<ManagerController>().getUser();

    // Get.find<ManagerController>().newLocalisation();
  }
}

StreamSubscription? _sub;

Future<void> initUniLinks() async {
  // ... check initialLink
  print('------lien----------ici----------------------');

  // Attach a listener to the stream
  _sub = linkStream.listen((String? link) {
    print('--${link}---00-lien----------ici----------------------');

    // Parse the link and warn the user, if it is not correct
  }, onError: (err) {
    // Handle exception by warning the user their action did not succeed
  });

  // NOTE: Don't forget to call _sub.cancel() in dispose()
}

/// Handle the initial Uri - the one the app was started with
///
/// **ATTENTION**: `getInitialLink`/`getInitialUri` should be handled
/// ONLY ONCE in your app's lifetime, since it is not meant to change
/// throughout your app's life.
///
/// We handle all exceptions, since it is called from initState.
// ...
/* 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialiser le gestionnaire de liens pour gérer les liens externes
  uni_links.init();

  // Appeler la fonction handleRedirect() pour gérer la redirection
  handleRedirect();

  runApp(MyApp());
// } */
//   void _handleIncomingLinks() {
//     if (!kIsWeb) {
//       // It will handle app links while the app is already started - be it in
//       // the foreground or in the background.
//       _sub = uriLinkStream.listen((Uri? uri) {
//         if (!mounted) return;
//         print('got uri: $uri');
//         setState(() {
//           _latestUri = uri;
//           _err = null;
//         });
//       }, onError: (Object err) {
//         if (!mounted) return;
//         print('got err: $err');
//         setState(() {
//           _latestUri = null;
//           if (err is FormatException) {
//             _err = err;
//           } else {
//             _err = null;
//           }
//         });
//       });
//     }
//   }

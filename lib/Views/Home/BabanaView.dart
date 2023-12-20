import 'package:BananaExpress/components/Widget/ShimmerHome.dart';
import 'package:BananaExpress/components/Widget/ShimmerProduit.dart';
import 'package:BananaExpress/components/Widget/app_title_right.dart';
import 'package:BananaExpress/components/Widget/icon_svg.dart';
import 'package:BananaExpress/controller/GeneralController.dart';
import 'package:BananaExpress/controller/managerController.dart';
import 'package:BananaExpress/utils/constants/assets.dart';
import 'package:BananaExpress/components/Widget/categoryComponent.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/utils/Services/routing.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:new_version_plus/new_version_plus.dart';

class BabanaView extends StatefulWidget {
  BabanaView({Key? key}) : super(key: key);

  @override
  State<BabanaView> createState() => _BabanaViewState();
}

class _BabanaViewState extends State<BabanaView> with WidgetsBindingObserver {
  ScrollController _scrollController = new ScrollController();
  void initState() {
    super.initState();
    _checkForUpdate();

    WidgetsBinding.instance.addObserver(this);
  }

  Future<void> _checkForUpdate() async {
    final newVersionPlus = NewVersionPlus(
      iOSId:
          null, // Remplacez par l'ID de votre application sur l'App Store si nécessaire
      androidId: 'com.app.BananaExpressmobile',
    );
    final status = await newVersionPlus.getVersionStatus();

    print('*---------***--------------------**');
    print(status!.canUpdate);
    print(status.localVersion);
    print(status.storeVersion);
    print(status.appStoreLink);
    newVersionPlus.showAlertIfNecessary(context: context);
    print('*---------***--------------------**');
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("state*************************");
    print(AppLifecycleState.resumed);
    if (state == AppLifecycleState.paused) {}
    // You can also handle other lifecycle states if needed
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(
        builder: (generalController) => Container(
            margin: EdgeInsets.symmetric(horizontal: kMarginX),
            child: CustomScrollView(slivers: [])));
  }
}

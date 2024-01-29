import 'package:BananaExpress/old/Views/Home/BabanaView.dart';
import 'package:BananaExpress/old/Views/Home/SimpleUserView.dart';
import 'package:BananaExpress/old/controller/managerController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_version_plus/new_version_plus.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with WidgetsBindingObserver {
  void initState() {
    super.initState();
    _checkForUpdate();

    WidgetsBinding.instance.addObserver(this);
  }

  Future<void> _checkForUpdate() async {
    final newVersionPlus = NewVersionPlus(
      iOSId: null,
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
    print('state*************************');
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
    return GetBuilder<ManagerController>(
        builder: (_managerController) => (_managerController.Userget == null)
            ? SimpleUserView()
            : _managerController.Userget.typeUser == 2 ||
                    _managerController.Userget.typeUser == 1
                ? SimpleUserView()
                : BabanaView());
  }
}

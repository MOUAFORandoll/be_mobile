// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:BabanaExpress/common/bloc/user_cubit.dart';
import 'package:BabanaExpress/common/models/user.dart';
import 'package:BabanaExpress/presentation/callcenter/CallCenterPage.dart';
import 'package:BabanaExpress/presentation/components/Button/themeButton.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_current_livraison_item.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_pub_item.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_service_item.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_text_title.dart';
import 'package:BabanaExpress/presentation/home/FirstView.dart';
import 'package:BabanaExpress/presentation/user/politique_page.dart';
import 'package:BabanaExpress/utils/Services/GeolocatorService.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/utils/assets.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:new_version_plus/new_version_plus.dart';

import '../../presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  GoogleMapController? mapController;
  final GeolocationService _geolocationService = GeolocationService();
  double latitude = 0.0;
  double longitude = 0.0;

  @override
  void initState() {
    super.initState();

    _getPosition();
    _checkForUpdate();
    _listenToPositionStream();
  }

  Future<void> _checkForUpdate() async {
    final newVersionPlus = NewVersionPlus(
      iOSId: null,
      androidId: 'com.app.babanaexpress',
    );
    // final status = await newVersionPlus.getVersionStatus();
    newVersionPlus.showAlertIfNecessary(context: context);
  }

  void _listenToPositionStream() {
    _geolocationService.getPositionStream().listen((Position position) {
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
      });
      context
          .read<LivraisonBloc>()
          .add(SetLogLat(latLng: LatLng(latitude, longitude)));
      context.read<LivraisonBloc>().add(GetMapPlaceInfo());
    });
  }

  Future<void> _getPosition() async {
    final position = await _geolocationService.getCurrentPosition();
    if (position != null) {
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
      });
      context
          .read<LivraisonBloc>()
          .add(SetLogLat(latLng: LatLng(latitude, longitude)));
      context.read<LivraisonBloc>().add(GetMapPlaceInfo());
    } else {
      // Handle errors if the position could not be obtained
    }
  }

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          // controller: _scrollController,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  padding: EdgeInsets.symmetric(
                      vertical: kMarginY, horizontal: kMarginX),
                  child: getView(_currentIndex),
                ),
                childCount: 1,
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(
            iconSize: 24.0,
            selectedColor: ThemeApp.second,
            strokeColor: Color(0x30040307),
            unSelectedColor: Color(0xffacacac),
            backgroundColor: Colors.white,
            items: [
              CustomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
              ),
              CustomNavigationBarItem(
                icon: Icon(Icons.list),
                title: Text("Historique"),
              ),
              CustomNavigationBarItem(
                icon: Icon(Icons.lightbulb_outline),
                title: Text("Client"),
              ),
              CustomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                title: Text("Me"),
              ),
            ],
            currentIndex: _currentIndex,
            onTap: (index) {
              print('-==========${_currentIndex}');
              if (index == 2) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CallCenterPage()),
                );
              } else {
                setState(() {
                  _currentIndex = index;
                });
              }
            }));
  }

  getView(index) {
    switch (index) {
      case 0:
        return FirstView();

      case 2:
        return FirstView();

      default:
        return FirstView();
    }
  }
}

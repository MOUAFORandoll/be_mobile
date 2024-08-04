// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:BabanaExpress/presentation/components/Button/app_button_second.dart';
import 'package:BabanaExpress/presentation/components/Button/themeButton.dart';
import 'package:BabanaExpress/presentation/components/Widget/home_proposition_widget.dart';
import 'package:BabanaExpress/presentation/components/Widget/icon_svg.dart';
import 'package:BabanaExpress/presentation/components/Widget/k_home_info.dart';
import 'package:BabanaExpress/presentation/home/FirstView.dart';
import 'package:BabanaExpress/presentation/user/PolitiquePage.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
import 'package:BabanaExpress/utils/Services/GeolocatorService.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_version_plus/new_version_plus.dart';
import '../../presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Animation<double>? _animation;
  AnimationController? _animationController;

  GoogleMapController? mapController;
  late Marker _position;
  final GeolocationService _geolocationService =
      GeolocationService(); // Instance de la classe GeolocationService

  double latitude = 0.0;
  double longitude = 0.0;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  CameraPosition? _kLake;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

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
    final status = await newVersionPlus.getVersionStatus();
    newVersionPlus.showAlertIfNecessary(context: context);
  }

  void _listenToPositionStream() {
    _geolocationService.getPositionStream().listen((Position position) {
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;

        _updateCameraPosition();
        _updateMarker(latitude: latitude, longitude: longitude);
      });
      context
          .read<LivraisonBloc>()
          .add(SetLogLat(latLng: LatLng(latitude, longitude)));
      context.read<LivraisonBloc>().add(GetMapPlaceInfo());
    });
  }

  void _updateCameraPosition() {
    _kLake = CameraPosition(
      bearing: 0,
      target: LatLng(latitude, longitude),
      tilt: 0,
      zoom: 17.5,
    );

    if (mapController != null) {
      mapController!.animateCamera(CameraUpdate.newCameraPosition(_kLake!));
    }
  }

  Future<void> _getPosition() async {
    final position = await _geolocationService.getCurrentPosition();

    if (position != null) {
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;

        _updateCameraPosition();
        _updateMarker(latitude: latitude, longitude: longitude);
      });
      context
          .read<LivraisonBloc>()
          .add(SetLogLat(latLng: LatLng(latitude, longitude)));
      context.read<LivraisonBloc>().add(GetMapPlaceInfo());
    } else {
      // Gérez les erreurs ou les cas où la position n'a pas pu être obtenue
    }
  }

  // void _updateMarker() {
  //   _position = Marker(
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
  //     markerId: MarkerId('1'),
  //     draggable: true,
  //     infoWindow: InfoWindow(title: 'Vous êtes ici'),
  //     position: LatLng(latitude, longitude),
  //   );
  // }

  Future<BitmapDescriptor> _getMarkerIcon() async {
    return await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)), // Spécifiez la taille ici
      Assets.logo, // Chemin vers votre image dans les assets
    );
  }

  _updateMarker({required latitude, required longitude}) async {
    final markerIcon = await _getMarkerIcon();

    setState(() {
      _position = Marker(
        icon: BitmapDescriptor.defaultMarker,
        // icon: markerIcon,
        markerId: MarkerId('1'),
        draggable: true,
        infoWindow: InfoWindow(
          title: 'Vous êtes ici',
        ),
      
        position: LatLng(latitude, longitude),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocBuilder<LivraisonBloc, LivraisonState>(
          builder: (context, stateSLivraison) {
            return Scaffold(
              backgroundColor: ColorsApp.greyNew,
              drawer: CustomDrawer(user: state.user),
              body: Stack(
                children: [
                  _kLake == null
                      ? Center(child: CircularProgressIndicator())
                      : _buildGoogleMap(),
                  _buildFloatingAppBar(context, stateSLivraison),
                  _buildDraggableBottomSheet(),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildGoogleMap() {
    return GoogleMap(
      initialCameraPosition: _kLake!,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      indoorViewEnabled: true,
      markers: {_position},
      onMapCreated: (GoogleMapController mapController) async {
        _controller.complete(mapController);
        this.mapController = await _controller.future;
        _updateCameraPosition();
        mapController.animateCamera(CameraUpdate.newCameraPosition(_kLake!));
      },
      onTap: (LatLng value) {
        // setState(() {
        //   _position = Marker(
        //     icon: _getMarkerIcon(),
        //     // BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
        //     markerId: MarkerId('1'),
        //     draggable: true,
        //     infoWindow: InfoWindow(title: 'Vous êtes ici'),
        //     position: LatLng(value.latitude, value.longitude),
        //   );
        // });
        _updateMarker(latitude: value.latitude, longitude: value.longitude);
        context.read<LivraisonBloc>().add(SetLogLat(latLng: value));
        context.read<LivraisonBloc>().add(GetMapPlaceInfo());
      },
    );
  }

  Widget _buildFloatingAppBar(
      BuildContext context, LivraisonState stateSLivraison) {
    return Positioned(
      top: 50,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: EdgeInsets.all(8),
          margin:
              EdgeInsets.symmetric(vertical: kMarginY, horizontal: kMarginX),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: ColorsApp.white.withOpacity(0.9),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: SvgPicture.asset(Assets.menu, color: ColorsApp.primary),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
              Column(
                children: [
                  Text(
                    'Babana Express',
                    style: TextStyle(
                      color: ColorsApp.primary,
                      fontFamily: 'Lato',
                    ),
                  ),
                  if (stateSLivraison.loadingMapPlaceInfo == 0)
                    Skeletonizer(
                        enabled: true,
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Text(
                            'Douala-Douala',
                          ),
                        )),
                  if (stateSLivraison.mapPlaceInfo != null)
                    Text(
                      '${stateSLivraison.mapPlaceInfo!.ville} ${stateSLivraison.mapPlaceInfo!.quartier}',
                      style: TextStyle(
                        color: ColorsApp.second,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ],
              ),
              SizedBox(width: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDraggableBottomSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.42,
      minChildSize: 0.1,
      maxChildSize: 0.7,
      builder: (BuildContext context, ScrollController scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AnimatedBuilder(
                animation: _animationController!,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _animation!.value * 2 * 3.1415926535,
                    child: child,
                  );
                },
                child: InkWell(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: kMarginY, horizontal: kMarginX),
                    decoration: BoxDecoration(
                      color: ColorsApp.second,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.refresh, color: ColorsApp.white),
                  ),
                  onTap: () {
                    _animationController!.forward(from: 0.0);
                    _getPosition();
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
                  color: ColorsApp.white,
                ),
                padding: EdgeInsets.symmetric(
                    vertical: kMarginY, horizontal: kMarginX),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Que desirez vous ?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: kBasics * 1.3,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: kMarginY),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HomePropositionWidget(
                          title: 'Je veux faire livrer mon colis'.tr(),
                          icon: Assets.colis,
                          onTap: () {
                            AutoRouter.of(context)
                                .push(NewLivraisonType1Route());
                          },
                        ),
                        HomePropositionWidget(
                          title: 'Je veux qu\'on recuperer mon colis'.tr(),
                          icon: Assets.colis,
                          onTap: () {
                            AutoRouter.of(context)
                                .push(NewLivraisonType2Route());
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: kMarginY),
                    AppButtonSecond(
                      prefixIcon: Icons.library_books,
                      sufixIcon: Icons.arrow_circle_right,
                      size: MainAxisSize.max,
                      bgColor: ColorsApp.greyNew,
                      text: 'Mon Historique'.tr(),
                      textColor: ColorsApp.primary,
                      onTap: () {
                        AutoRouter.of(context).push(HistoriqueLivraisonRoute());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class CustomDrawer extends StatelessWidget {
  CustomDrawer({required this.user});
  final user;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state.isUpdateUserImage == 1) {
          EasyLoading.show(
              indicator: CircularProgressIndicator(
                color: ColorsApp.second,
              ),
              dismissOnTap: true,
              maskType: EasyLoadingMaskType.black);
        } else if (state.isUpdateUserImage == 3) {
          EasyLoading.dismiss();
          showError(state.authenticationFailedMessage!, context);
        } else if (state.isUpdateUserImage == 2) {
          showSuccess('Profil mis a jour', context);

          EasyLoading.dismiss();
          BlocProvider.of<HomeBloc>(context).add(UserDataEvent());
          print('-----44------find noe--446465465*******');
        }
      },
      builder: (context, state) => Drawer(
        width: getWidth(context) / 1.35,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                // padding: EdgeInsets.only(bottom: 18.0),
                margin: EdgeInsets.only(bottom: 8.0),
                decoration: BoxDecoration(
                    color: ColorsApp.primary,
                    border: Border(bottom: BorderSide.none)),
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: ColorsApp.bg,
                        child: InkWell(
                          onTap: () => BlocProvider.of<UserBloc>(context)
                              .add(UpdateUserImage()),
                          child: CachedNetworkImage(
                            height: getHeight(context) / 10,
                            width: getHeight(context) / 10,
                            fit: BoxFit.cover,
                            imageUrl: user.profile,
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                            placeholder: (context, url) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: ColorsApp.white.withOpacity(.5),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Center(
                                    child: CircularProgressIndicator(
                                        color: ColorsApp.primary)),
                              );
                            },
                            errorWidget: (context, url, error) {
                              return CircleAvatar(
                                  // backgroundColor: ColorsApp.tird,
                                  radius: 150,
                                  backgroundImage:
                                      AssetImage('assets/images/user.jpg'));
                            },
                          ),
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.only(top: kMarginY),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ViewFunctions().capitalizeFirstLetter(user.nom),
                              style: TextStyle(
                                  color: ColorsApp.greyNew,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                            ThemeButtonWidget()
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              user.phone,
                              style: TextStyle(
                                  color: ColorsApp.greyNew,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ]))),
            ListTile(
              // leading: Icon(Icons.home),
              title: AppLangButton(),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(color: ColorsApp.black, fontSize: kBasics),
              ),
              onTap: () {
                EasyLoading.show(
                    indicator: CircularProgressIndicator(
                      color: ColorsApp.second,
                    ),
                    dismissOnTap: true,
                    maskType: EasyLoadingMaskType.clear);

                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Settings',
                style: TextStyle(color: ColorsApp.black, fontSize: kBasics),
              ),
              onTap: () {
                // Navigate to the settings page or perform an action
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.policy),
              title: Text(
                'Politique',
                style: TextStyle(color: ColorsApp.black, fontSize: kBasics),
              ),
              onTap: () {
                AutoRouter.of(context).pushNamed(PolitiquePage.routeName);
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.whatsapp),
              title: Text(
                'WhatsApp',
                style: TextStyle(color: ColorsApp.black, fontSize: kBasics),
              ),
              onTap: () => launchUrl(Uri.parse(
                  'https://wa.me/690863838?text=Hello Je suis interesse par vos services')),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(
                'Logout'.tr(),
                style: TextStyle(
                    color: ColorsApp.red,
                    fontWeight: FontWeight.w700,
                    fontSize: kBasics),
              ),
              onTap: () {
                BlocProvider.of<UserBloc>(context)
                    .add(SignOutEvent(context: context));
              },
            ),
          ],
        ),
      ),
    );
  }
}

openUpdateMail(context) => showDialog(
    context: context,
    builder: (context) {
      TextEditingController mail = TextEditingController();

      return BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state.updating!) {
              EasyLoading.show(
                  indicator: CircularProgressIndicator(
                    color: ColorsApp.second,
                  ),
                  dismissOnTap: true,
                  maskType: EasyLoadingMaskType.black);
            } else {
              EasyLoading.dismiss();
              AutoRouter.of(context).pop();
              showSuccess('yupdate'.tr(), context);
            }
          },
          builder: (context, state) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: getWidth(context) * .6,
                      child: Text('recupmailtitle'.tr())),
                  InkWell(
                      child: Icon(Icons.close,
                          color: ColorsApp.primary, weight: 50),
                      onTap: () {
                        AutoRouter.of(context).pop();
                      })
                ],
              )),
              actions: [
                InkWell(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorsApp.primary),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        Text(
                          'yvalid'.tr(),
                          style: TextStyle(
                              color: ColorsApp.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        ),
                        Icon(Icons.check, color: ColorsApp.white, weight: 50)
                      ]),
                    ),
                    onTap: () {
                      if (mail.text.isNotEmpty) {
                        context.read<UserBloc>().add(UpdateUserInfo(
                              data: {'email': mail.text},
                            ));

                        context.read<HomeBloc>().add(UserDataEvent());
                      } else {
                        showError('recupmailtitle'.tr(), context);
                      }
                    })
              ],
              content: Container(
                  child: SingleChildScrollView(
                      child: Column(children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: kMarginY * 2,
                  ),
                  child: AppInput(
                    controller: mail,
                    onChanged: (value) {},
                    placeholder: 'labelemail'.tr(),
                    validator: (value) {
                      return Validators.isValidEmail(value!);
                    },
                  ),
                ),
              ])))));
    });

openUpdateCompletePhoneProfile(context) => showDialog(
    context: context,
    builder: (context) {
      TextEditingController phone = TextEditingController();

      return BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state.updating!) {
              EasyLoading.show(
                  indicator: CircularProgressIndicator(
                    color: ColorsApp.second,
                  ),
                  dismissOnTap: true,
                  maskType: EasyLoadingMaskType.black);
            } else {
              EasyLoading.dismiss();
              AutoRouter.of(context).pop();
              showSuccess('yupdate'.tr(), context);
            }
          },
          builder: (context, state) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: getWidth(context) * .6,
                      child: Text('recupmailtitle'.tr())),
                  InkWell(
                      child: Icon(Icons.close,
                          color: ColorsApp.primary, weight: 50),
                      onTap: () {
                        AutoRouter.of(context).pop();
                      })
                ],
              )),
              actions: [
                InkWell(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorsApp.primary),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        Text(
                          'yvalid'.tr(),
                          style: TextStyle(
                              color: ColorsApp.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        ),
                        Icon(Icons.check, color: ColorsApp.white, weight: 50)
                      ]),
                    ),
                    onTap: () {
                      if (phone.text.isNotEmpty) {
                        context.read<UserBloc>().add(UpdateUserInfo(
                              data: {'phone': phone.text},
                            ));

                        context.read<HomeBloc>().add(UserDataEvent());
                      } else {
                        showError('Error'.tr(), context);
                      }
                    })
              ],
              content: Container(
                  child: SingleChildScrollView(
                      child: Column(children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: kMarginY * 2,
                  ),
                  child: AppInput(
                    controller: phone,
                    onChanged: (value) {},
                    textInputType: TextInputType.phone,
                    placeholder: 'labelphone'.tr(),
                    validator: (value) {
                      return Validators.usPhoneValid(value!);
                    },
                  ),
                ),
              ])))));
    });

// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:BabanaExpress/presentation/components/Button/themeButton.dart';
import 'package:BabanaExpress/presentation/components/Widget/home_proposition_widget.dart';
import 'package:BabanaExpress/presentation/user/PolitiquePage.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
import 'package:BabanaExpress/utils/Services/GeolocatorService.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_version_plus/new_version_plus.dart';
import '../components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class LivraiSonMapPage extends StatefulWidget {
  static const routeName = '/livraison/map-page';

  const LivraiSonMapPage({Key? key}) : super(key: key);

  @override
  State<LivraiSonMapPage> createState() => _LivraiSonMapPageState();
}

class _LivraiSonMapPageState extends State<LivraiSonMapPage>
    with TickerProviderStateMixin {
  Animation<double>? _animation;
  AnimationController? _animationController;
  Set<Circle> circles = <Circle>{};
  Set<Marker> listPoint = <Marker>{};
  late Marker _positionStart;
  GoogleMapController? mapController;
  final GeolocationService _geolocationService = GeolocationService();
  double latitude = 0.0;
  double longitude = 0.0;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  CameraPosition? _kLake;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );
    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

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
      zoom: 13.5,
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
      // Handle errors if the position could not be obtained
    }
  }

  // Future<BitmapDescriptor> _getMarkerIcon() async {
  //   return await BitmapDescriptor.fromAssetImage(
  //     ImageConfiguration(size: Size(5, 8)),
  //     Assets.logo,
  //   );
  // }

  Future<void> _updateMarker(
      {required double latitude, required double longitude}) async {
    // final markerIcon = await _getMarkerIcon();

    setState(() {
      _positionStart = Marker(
        icon: BitmapDescriptor.defaultMarker, // icon: markerIcon,
        markerId: MarkerId('1'),
        draggable: true,
        infoWindow: InfoWindow(title: 'Vous êtes ici'),
        position: LatLng(latitude, longitude),
      );
      listPoint = <Marker>{_positionStart};
      circles = <Circle>{
        Circle(
          circleId: CircleId('current_location'),
          center: LatLng(latitude, longitude),
          radius: 40,
          fillColor: ColorsApp.second.withOpacity(0.1),
          strokeColor: ColorsApp.second.withOpacity(0.1),
          strokeWidth: 1,
        ),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocConsumer<LivraisonBloc, LivraisonState>(
          listener: (context, stateSLivraison) {
            if (stateSLivraison.findCurrentlyDelivery) {
              var points = <Marker>{};
              stateSLivraison.currentLivraison!.positionColis.forEach((point) {
                points.add(Marker(
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                  markerId: MarkerId(point.libelle),
                  draggable: true,
                  infoWindow: InfoWindow(title: point.libelle),
                  position: LatLng(point.latitude, point.longitude),
                ));
              });
              setState(() {
                listPoint.addAll(points);
                _updateCameraPosition(); // Update camera position to fit new markers
              });
            }
          },
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
      markers: listPoint,
      circles: circles,
      onMapCreated: (GoogleMapController mapController) async {
        _controller.complete(mapController);
        this.mapController = await _controller.future;
        _updateCameraPosition();
        mapController.animateCamera(CameraUpdate.newCameraPosition(_kLake!));
      },
      onTap: (LatLng value) {
        // Handle map tap events if needed
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
                      fontFamily: 'Helvetica',
                    ),
                  ),
                  if (stateSLivraison.loadingMapPlaceInfo == 0)
                    Skeletonizer(
                      enabled: true,
                      child: Container(
                        child: Text('Douala-Douala'),
                      ),
                    ),
                  if (stateSLivraison.mapPlaceInfo != null)
                    Text(
                      '${stateSLivraison.mapPlaceInfo!.ville} ${stateSLivraison.mapPlaceInfo!.quartier}',
                      style: TextStyle(
                        color: ColorsApp.second,
                        fontFamily: 'Helvetica',
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
                    BlocProvider.of<LivraisonBloc>(context)
                        .add(CurrentUserStateLivraison());
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
                        fontFamily: 'Helvetica',
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

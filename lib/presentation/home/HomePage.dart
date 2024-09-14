// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:BabanaExpress/entity.dart';
import 'package:BabanaExpress/presentation/callcenter/CallCenterPage.dart';
import 'package:BabanaExpress/presentation/components/Button/themeButton.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_current_livraison_item.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_pub_item.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_service_item.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_text_title.dart';
import 'package:BabanaExpress/presentation/home/FirstView.dart';
import 'package:BabanaExpress/presentation/livraison/HistoriqueLivraisonPage.dart';
import 'package:BabanaExpress/presentation/livraison/LivraisonView.dart';
import 'package:BabanaExpress/presentation/user/PolitiquePage.dart';
import 'package:BabanaExpress/utils/Services/GeolocatorService.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
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
            }
          },
          builder: (context, stateSLivraison) {
            return Scaffold(
              backgroundColor: ColorsApp.white,
              drawer:
                  CustomDrawer(user: context.read<HomeBloc>().database.user!),
              body: CustomScrollView(
                // controller: _scrollController,
                slivers: [
                  SliverAppBar(
                      backgroundColor: ThemeApp.second,
                      pinned: true,
                      automaticallyImplyLeading: false,
                      bottom: PreferredSize(
                        preferredSize: Size.fromHeight(30),
                        child: _buildFloatingAppBar(
                            context: context,
                            stateSLivraison: stateSLivraison,
                            user: context.read<HomeBloc>().database.user!),
                      )),
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
                    AutoRouter.of(context).push(CallCenterRoute());
                  } else {
                    setState(() {
                      _currentIndex = index;
                    });
                  }
                  print('-==========${_currentIndex}');
                },
              ),
            );
          },
        );
      },
    );
  }

  getView(index) {
    switch (index) {
      case 0:
        return FirstView();

      case 1:
        return HistoriqueLivraisonPage();

      case 2:
        return FirstView();

      default:
        return FirstView();
    }
  }

  Widget _buildFloatingAppBar(
      {required BuildContext context,
      required LivraisonState stateSLivraison,
      required User user}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kMarginX),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // width: MediaQuery.of(context).size.width * 0.9,
            // padding: EdgeInsets.all(8),
            margin: EdgeInsets.symmetric(
              vertical: kMarginY,
            ),

            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: ColorsApp.primary,
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
                    margin: EdgeInsets.symmetric(horizontal: kMarginX),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // margin: EdgeInsets.only(top: kMarginY),
                            child: Text(
                              ViewFunctions().capitalizeFirstLetter(user.nom),
                              style: TextStyle(
                                  color: ColorsApp.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          if (stateSLivraison.loadingMapPlaceInfo == 0)
                            Skeletonizer(
                              enabled: true,
                              child: Container(
                                child: Text(
                                  'Douala-Douala',
                                  style: TextStyle(
                                    color: ColorsApp.white,
                                  ),
                                ),
                              ),
                            ),
                          if (stateSLivraison.mapPlaceInfo != null)
                            Text(
                              '${stateSLivraison.mapPlaceInfo!.ville} ${stateSLivraison.mapPlaceInfo!.quartier}',
                              style: TextStyle(
                                color: ColorsApp.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                        ])),
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: ColorsApp.white,
                  )),
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.notifications,
                color: ColorsApp.white,
              )),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomDrawer extends StatelessWidget {
  CustomDrawer({required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state.isUpdateUserImage == 1) {
          EasyLoading.show(
              indicator: CircularProgressIndicator(
                color: ThemeApp.second,
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
                              user.phone!,
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
                      color: ThemeApp.second,
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
                    color: ThemeApp.second,
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
                    color: ThemeApp.second,
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

// ignore_for_file: deprecated_member_use

import 'package:BabanaExpress/presentation/components/Button/themeButton.dart';
import 'package:BabanaExpress/presentation/components/Widget/icon_svg.dart';
import 'package:BabanaExpress/presentation/components/Widget/k_home_info.dart';
import 'package:BabanaExpress/presentation/home/FirstView.dart';
import 'package:BabanaExpress/presentation/livraison/NewLivraisonPage.dart';
import 'package:BabanaExpress/presentation/pharmacy/NewLivraisonMedicamentPage.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_version_plus/new_version_plus.dart';
import '../../presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

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

  void initState() {
    super.initState();
    _checkForUpdate();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
  }

  Future<void> _checkForUpdate() async {
    final newVersionPlus = NewVersionPlus(
      iOSId: null,
      androidId: 'com.app.babanaexpress',
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
  }

  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this);
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MarketBloc, MarketState>(
        listener: (context, state) {},
        builder: (context, state) => BlocConsumer<LivraisonBloc,
                LivraisonState>(
            listener: (context, state) {},
            builder: (context, state) => BlocConsumer<PharmacyBloc,
                    PharmacyState>(
                listener: (context, state) {},
                builder: (context, state) => BlocConsumer<HomeBloc, HomeState>(
                    listener: (context, state) {
                      if (state.user!.email.isEmpty) {
                        return openUpdateMail(context);
                      } else if (state.user!.phone.isEmpty) {
                        return openUpdateCompletePhoneProfile(context);
                      } else {
                        print('-----44-- ---find noe--*is ok*******');
                      }
                    },
                    builder: (context, state) => Scaffold(
                          backgroundColor: ColorsApp.bg,
                          drawer: CustomDrawer(user: state.user),
                          body: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(Assets.bg_home))),
                              child: CustomScrollView(slivers: [
                                SliverAppBar(
                                  automaticallyImplyLeading: false,
                                  leading: Builder(builder: (context) {
                                    return InkWell(
                                        child: Container(
                                          width: 10,
                                          height: 10,
                                          child: SvgPicture.asset(Assets.menu,
                                              color: ColorsApp.white,
                                              fit: BoxFit.none),
                                        ),
                                        onTap: () =>
                                            Scaffold.of(context).openDrawer());
                                  }),
                                  title: Text(
                                    'Babana Express',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: ColorsApp.white,
                                        fontFamily: 'Lato',
                                        fontSize: kTitle,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  centerTitle: true,
                                  actions: [
                                    InkWell(
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: ColorsApp.white,
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            padding: EdgeInsets.all(8),
                                            margin: EdgeInsets.only(
                                                right: kMarginX),
                                            child: SvgIcon(
                                              icon: Assets.call_center,
                                              color: ColorsApp.primary,
                                            )),
                                        onTap: () {
                                          AutoRouter.of(context)
                                              .push(CallCenterRoute());
                                        }),
                                    // InkWell(
                                    //     child: Container(
                                    //         margin: EdgeInsets.only(
                                    //             right: kMarginX * 2),
                                    //         child: SvgIcon(
                                    //           icon: Assets.bell,
                                    //           color: ColorsApp.white,
                                    //         )),
                                    //     onTap: () {}),
                                  ],
                                  flexibleSpace: Container(
                                    margin: EdgeInsets.only(
                                      top: getHeight(context) * .13,
                                    ).add(EdgeInsets.symmetric(
                                        horizontal: kMarginY)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Solde du compte',
                                                style: TextStyle(
                                                  color: ColorsApp.white,
                                                  fontFamily: 'Lato',
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: ColorsApp.white
                                                            .withOpacity(.5)),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5.5,
                                                            vertical: 3),
                                                    margin: EdgeInsets.only(
                                                        right: kMarginY),
                                                    child: Text(
                                                      'FCFA',
                                                      style: TextStyle(
                                                          color:
                                                              ColorsApp.white,
                                                          fontFamily: 'Lato',
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      '${state.user!.solde}',
                                                      style: TextStyle(
                                                          color:
                                                              ColorsApp.white,
                                                          fontFamily: 'Lato',
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ]),
                                        KHomeInfo(),
                                      ],
                                    ),
                                  ),

                                  pinned: true,

                                  collapsedHeight: getHeight(context) * .153,
                                  elevation: 10.0,
                                  backgroundColor: Colors
                                      .transparent, // Set your desired background color
                                  // shape: RoundedRectangleBorder(
                                  //   borderRadius: BorderRadius.vertical(
                                  //     bottom: Radius.circular(30.0),
                                  //   ),
                                  // ),
                                ),
                                SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                        (_, ctx) => FirstView(),
                                        childCount: 1))
                              ])),
                          floatingActionButton: FloatingActionBubble(
                            items: <Bubble>[
                              // Floating action menu item
                              Bubble(
                                title: 'livraison'.tr(),
                                iconColor: Colors.white,
                                bubbleColor: ColorsApp.primary,
                                icon: Icons.collections,
                                titleStyle: TextStyle(
                                    fontSize: 16, color: Colors.white),
                                onPress: () {
                                  _animationController!.reverse();
                                  AutoRouter.of(context)
                                      .pushNamed(NewLivraisonPage.routeName);
                                },
                              ),
                              Bubble(
                                title: 'pharmacie'.tr(),
                                iconColor: Colors.white,
                                bubbleColor: ColorsApp.black,
                                icon: Icons.medical_information,
                                titleStyle: TextStyle(
                                    fontSize: 16, color: Colors.white),
                                onPress: () {
                                  _animationController!.reverse();
                                  AutoRouter.of(context).pushNamed(
                                      NewLivraisonMedicamentPage.routeName);
                                },
                              ),
                            ],
                            animation: _animation!,
                            onPress: () => _animationController!.isCompleted
                                ? _animationController!.reverse()
                                : _animationController!.forward(),
                            iconColor: ColorsApp.primary,
                            iconData: Icons.add,
                            backGroundColor: Colors.white,
                          ),
                          resizeToAvoidBottomInset: true,
                        )))));
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
              dismissOnTap: true,
              status: 'En cours',
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
                // Navigate to the home page or perform an action
                Navigator.pop(context);
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
                AutoRouter.of(context).replaceAll([PolitiqueRoute()]);
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
                  dismissOnTap: true,
                  status: 'En cours',
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
                  dismissOnTap: true,
                  status: 'En cours',
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

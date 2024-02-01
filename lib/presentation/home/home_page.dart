import 'package:BananaExpress/presentation/components/Button/app_button.dart';
import 'package:BananaExpress/presentation/components/Button/themeButton.dart';
import 'package:BananaExpress/presentation/components/Widget/k_home_info.dart';
import 'package:BananaExpress/presentation/livraison/LivraisonView.dart';
import 'package:BananaExpress/presentation/livraison/NewLivraisonPage.dart';
import 'package:BananaExpress/routes/app_router.gr.dart';
import 'package:BananaExpress/utils/constants/assets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_version_plus/new_version_plus.dart';
import '../../presentation/components/exportcomponent.dart';
import 'package:BananaExpress/application/export_bloc.dart';
import 'package:BananaExpress/presentation/components/Form/search_field.dart';
import 'package:BananaExpress/presentation/components/Widget/HomeModuleComponent.dart';
import 'package:BananaExpress/presentation/components/Widget/icon_svg.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
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
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Scaffold(
          backgroundColor: ColorsApp.bg,
          drawer: CustomDrawer(user: state.user),
          body: SafeArea(
              child: state.index == 0
                  ? Container(
                      child: CustomScrollView(slivers: [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        leading: Builder(builder: (context) {
                          return InkWell(
                              child: Container(
                                width: 10,
                                height: 10,
                                child: SvgPicture.asset(Assets.menu,
                                    color: ColorsApp.white, fit: BoxFit.none),
                              ),
                              onTap: () => Scaffold.of(context).openDrawer());
                        }),
                        title: Text(
                          'Babana Express',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: ColorsApp.white,
                              fontFamily: 'Lato',
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        centerTitle: true,
                        actions: [
                          InkWell(
                              child: Container(
                                  margin: EdgeInsets.only(right: kMarginX * 2),
                                  child: SvgIcon(
                                    icon: Assets.bell,
                                    color: ColorsApp.white,
                                  )),
                              onTap: () {
                                // Get.toNamed(AppLinks.NOTIFICATION);
                              }),
                        ],
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(18.0),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: kMarginX,
                            ).add(EdgeInsets.only(
                              bottom: kMarginY * 3,
                              right: kMarginX,
                            )),
                            child: KHomeInfo(user: state.user),
                          ),
                        ),

                        expandedHeight: getHeight(context) * .22,
                        elevation: 10.0,
                        backgroundColor: ColorsApp
                            .primary, // Set your desired background color
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.vertical(
                        //     bottom: Radius.circular(30.0),
                        //   ),
                        // ),
                      ),
                      SliverToBoxAdapter(
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: kMarginY, horizontal: kMarginX),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    HomeModuleComponent(
                                      title: 'ht1'.tr(),
                                      titleBtn: 'livraison'.tr(),
                                      image: Assets.shop2,
                                      onTap: () => openModalLivraison(context),
                                    ),
                                    HomeModuleComponent(
                                      title: 'ht2'.tr(),
                                      titleBtn: 'ordonnance'.tr(),
                                      image: Assets.medical,
                                      onTap: () => openModalLivraison(context),
                                    ),
                                  ])))
                    ]))
                  : LivraisonView()),
          bottomNavigationBar: CustomNavigationBar(
            iconSize: 30.0,
            // elevation: 0.0,
            scaleFactor: 0.4,
            selectedColor: Color(0xff0c18fb),
            strokeColor: Color(0x300c18fb),
            unSelectedColor: Colors.grey[600],
            backgroundColor:
                /*     state.index == 2 ? ColorsApp.primary : */ ColorsApp.bg,
            // borderRadius: Radius.circular(15.0),
            // isFloating: true,
            // blurEffect: true,
            items: [
              CustomNavigationBarItem(
                  icon: Container(
                    height: getHeight(context) / 1.7,
                    width: getWith(context) / 4.2,
                    child: SvgPicture.asset(
                      Assets.home,
                      width: 90,
                      height: 90,
                      // ignore: deprecated_member_use
                      color:
                          state.index == 0 ? ColorsApp.second : ColorsApp.grey,
                    ),
                  ),
                  title: Container(
                      padding: EdgeInsets.only(bottom: 3),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: state.index == 0
                                  ? BorderSide(
                                      color: ColorsApp.second, width: 2)
                                  : BorderSide.none,
                              top: BorderSide.none)),
                      child: Text('home'.tr(),
                          style: TextStyle(
                            fontSize: kMin,
                            fontWeight: FontWeight.w600,
                            color: state.index == 0
                                ? ColorsApp.second
                                : ColorsApp.grey,
                          )))), // CustomNavigationBarItem(

              if (state.user != null)
                if (state.user!.typeUser == 2 || state.user!.typeUser == 1)
                  CustomNavigationBarItem(
                    icon: Container(
                      height: getHeight(context) / 1.7,
                      width: getWith(context) / 4.2,
                      child: SvgPicture.asset(
                        Assets.grid1,
                        width: 80,
                        height: 80,
                        // ignore: deprecated_member_use
                        color: state.index == 1
                            ? ColorsApp.second
                            : ColorsApp.grey,
                      ),
                    ),
                    title: Container(
                        padding: EdgeInsets.only(bottom: 3),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: state.index == 1
                                    ? BorderSide(
                                        color: ColorsApp.second, width: 2)
                                    : BorderSide.none,
                                top: BorderSide.none)),
                        child: Text('historique'.tr(),
                            style: TextStyle(
                              fontSize: kMin,
                              fontWeight: FontWeight.w600,
                              color: state.index == 1
                                  ? ColorsApp.second
                                  : ColorsApp.grey,
                            ))),
                  ),
            ],
            currentIndex: state.index,
            onTap: (index) {
              print(index);
              context.read<HomeBloc>().add(SetIndexEvent(index: index));
            },
          ));
    });
  }
}

class CustomDrawer extends StatelessWidget {
  CustomDrawer({required this.user});
  final user;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: getWith(context) / 1.35,
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
                      backgroundColor: Colors.white,
                      child: InkWell(
                        onTap: () => context.setLocale(Locale('en', 'US')),
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
                                  color: ColorsApp.grey,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                  child: CircularProgressIndicator(
                                      color: ColorsApp.second)),
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
                                color: ColorsApp.grey,
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
                                color: ColorsApp.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ]))),
          ListTile(
            leading: Icon(Icons.home),
            title: AppLangButton(),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Navigate to the home page or perform an action
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Navigate to the settings page or perform an action
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.policy),
            title: Text('Politique'),
            onTap: () {
              AutoRouter.of(context).replaceAll([PolitiqueRoute()]);
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'.tr()),
            onTap: () {
              BlocProvider.of<UserBloc>(context)
                  .add(SignOutEvent(context: context));
            },
          ),
        ],
      ),
    );
  }
}

openModalLivraison(context) => showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => Container(
          height: getHeight(context) * .4,
          padding: EdgeInsets.symmetric(horizontal: kMarginX),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: ColorsApp.white,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(top: kMarginY * 2),
                // padding: EdgeInsets.symmetric(
                //     horizontal: kMarginX / 2),
                child: InkWell(
                  onTap: () => Navigator.of(context).pop,
                  child: Icon(Icons.close),
                )),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
                child: Text(
                  'yservice'.tr(),
                  style: TextStyle(fontWeight: FontWeight.w500),
                )),
            Container(
                margin: EdgeInsets.only(top: kMarginY * 2),
                child: Column(
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: AppButton(
                          text: 'ser1'.tr(),
                          // width: getWith(context) / 2.5,
                          size: MainAxisSize.max,
                          bgColor: ColorsApp.second,
                          onTap: () {
                            AutoRouter.of(context)
                                .pushNamed(NewLivraisonPage.routeName);
                            // setService(1);
                          }),
                    ),
                    AppButton(
                        text: 'ser2'.tr(),
                        // width: getWith(context) / 2.5,
                        size: MainAxisSize.max,
                        // bgColor: AppColors.secondarytext,
                        onTap: () {
                          // Get.toNamed(AppLinks.NEWLIVRAISON);
                          // setService(2);
                        }),
                  ],
                ))
          ])),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      backgroundColor: Colors.transparent,
    );

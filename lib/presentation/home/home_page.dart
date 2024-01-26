import 'package:BananaExpress/utils/constants/assets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_version_plus/new_version_plus.dart';

import '../../../components/exportcomponent.dart';
import 'package:BananaExpress/application/export_bloc.dart';

import '../../core.dart';
import '../livraison/LivraisonView.dart';
import 'SimpleUserView.dart';

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
    // _checkForUpdate();

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
    return  BlocBuilder<HomeBloc, HomeState>(builder: (context, state)   {
          return Scaffold(
              backgroundColor: ColorsApp.bg,
              drawer: CustomDrawer(user: state.user),
              body: SafeArea(
                  child: state.index == 0
                      ? state.user!.typeUser == 2 || state.user!.typeUser == 1
                          ? SimpleUserView()
                          : Text('b')
                      : LivraisonView() /*  BabanaView() */),
              bottomNavigationBar: CustomNavigationBar(
                iconSize: 30.0,
                // elevation: 0.0,
                scaleFactor: 0.4,
                selectedColor: Color(0xff0c18fb),
                strokeColor: Color(0x300c18fb),
                unSelectedColor: Colors.grey[600],
                backgroundColor:
                    /*     state.index == 2 ? ColorsApp.primary : */ ColorsApp
                        .bg,
                // borderRadius: Radius.circular(15.0),
                // isFloating: true,
                // blurEffect: true,
                items: [
                  CustomNavigationBarItem(
                      icon: Container(
                        height: kHeight / 1.7,
                        width: kWidth / 4.2,
                        child: SvgPicture.asset(
                          Assets.home,
                          width: 90,
                          height: 90,
                          color: state.index == 0
                              ? ColorsApp.second
                              : ColorsApp.grey,
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
                          child: Text('home'.tr,
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
                          height: kHeight / 1.7,
                          width: kWidth / 4.2,
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
                            child: Text('historique'.tr,
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
      width: kWidth / 1.35,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(user.nom),
            accountEmail: Text(user.phone),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: InkWell(
                // onTap: () => _controller.updateImageUser(),
                child: CachedNetworkImage(
                  height: kHeight / 10,
                  width: kHeight / 10,
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
                      ),
                      child: Center(
                          child: CircularProgressIndicator(
                        color: ColorsApp.tird,
                      )),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return CircleAvatar(
                        // backgroundColor: ColorsApp.tird,
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/user.jpg'));
                  },
                ),
              ),
            ),
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
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              // Perform logout logic
              // _controller.deconnectUser();
              // Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

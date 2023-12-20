import 'package:BananaExpress/Views/User/RegisterScreen.dart';
import 'package:BananaExpress/components/Text/TextBackSpace.dart';
import 'package:BananaExpress/components/exportcomponent.dart';
import 'package:BananaExpress/controller/managerController.dart';
import 'package:BananaExpress/utils/Services/routing.dart';
import 'package:BananaExpress/views/User/LoginScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:share_plus/share_plus.dart';

// ignore: must_be_immutable
class ManageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagerController>(
        builder: (_manager) => Container(
            padding: EdgeInsets.symmetric(horizontal: kMarginX),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SliverAppBar partie
                  Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(top: kMarginY * 2),
                      child: (_manager.Userget != null)
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  InkWell(
                                    onTap: () => _manager.updateImageUser(),
                                    child: CachedNetworkImage(
                                      height: kHeight / 10,
                                      width: kHeight / 10,
                                      fit: BoxFit.cover,
                                      imageUrl: _manager.Userget.profile,
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
                                            backgroundColor: ColorsApp.tird,
                                            radius: 50,
                                            backgroundImage: AssetImage(
                                                "assets/logo/logoNew.png"));
                                      },
                                    ),
                                  ),
                                  InkWell(
                                    child: Container(
                                        margin: EdgeInsets.symmetric(
                                          vertical: kMarginY * 2,
                                        ),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: TextBackSpace(
                                                  text:
                                                      _manager.Userget.prenom +
                                                          ' ' +
                                                          _manager.Userget.nom,
                                                  bolder: true,
                                                ),
                                              ),
                                            ])),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.phone,
                                          size: 18,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: kWidth * .010),
                                          child: TextBackSpace(
                                            text: _manager.Userget.phone,
                                            // bolder: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextValue(title: 'Affilies', value: 15),
                                        TextValue(title: 'Affilies', value: 15),
                                        TextValue(title: 'Affilies', value: 15),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: kMarginY),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ButtonAction(
                                                title: 'Modifier le profil',
                                                onTap: () {}),
                                            ButtonAction(
                                                title: 'Parametre',
                                                onTap: () {
                                                  Get.toNamed(AppLinks.SETTING);
                                                }),
                                            ButtonAction(
                                                icon: Icons.share,
                                                onTap: () {
                                                  Share.share(
                                                      'Inscris-toi avec mon lien et rejoins BananaExpress : ' +
                                                          _manager
                                                              .lienParrainnage,
                                                      subject:
                                                          'Look what I made!');
                                                }),
                                          ],
                                        ),
                                        InkWell(
                                          child: Container(
                                            width: kWidth * .5,
                                            margin:
                                                EdgeInsets.only(top: kMarginY),
                                            padding: EdgeInsets.all(10),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: ColorsApp.second,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                kMarginX),
                                                    child: Text(
                                                      'deconnecter'.tr,
                                                      style: TextStyle(
                                                          fontFamily: 'Lato',
                                                          color:
                                                              ColorsApp.white,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                  Icon(Icons.logout,
                                                      color: ColorsApp.white)
                                                ]),
                                          ),
                                          onTap: () => _manager.deconnectUser(),
                                        )
                                      ],
                                    ),
                                  ),
                                ])
                          : Container(
                              margin: EdgeInsets.only(top: kHeight / 2.5),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    child: Container(
                                      constraints:
                                          BoxConstraints(maxWidth: kWidth * .4),
                                      margin: EdgeInsets.only(top: kMarginY),
                                      padding: EdgeInsets.all(10),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: ColorsApp.tird,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Text(
                                        'Connectez vous',
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            color: ColorsApp.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    onTap: () => Get.bottomSheet(
                                      Container(
                                          margin: EdgeInsets.only(
                                            top: kMarginY * 8,
                                          ),
                                          decoration: BoxDecoration(
                                              color: ColorsApp.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  topRight:
                                                      Radius.circular(15))),
                                          height: 800,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: kMarginX),
                                          child: Column(children: [
                                            Container(
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    TextButton(
                                                      child: Text('Annuler'),
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                    ),
                                                    // TextButton(
                                                    //   child: Text('Ajouter'),
                                                    //   onPressed: () async {
                                                    //     // await _controller.addShort();
                                                    //     // _controller.chageState(!_controller.addProduit);
                                                    //   },
                                                    // )
                                                  ]),
                                            ),
                                            Expanded(
                                                child: SingleChildScrollView(
                                                    child: Column(children: [
                                              // _controller.listImgProduits.length != 0
                                              //     ? smallText(
                                              //         text: 'Listes images',
                                              //       )
                                              //     : Container(),

                                              Container(
                                                  margin: EdgeInsets.only(
                                                    top: 50,
                                                  ),
                                                  child: LoginScreen())
                                            ])))
                                          ])),
                                      isScrollControlled: true,
                                    ),
                                  ),
                                  InkWell(
                                    child: Container(
                                      constraints:
                                          BoxConstraints(maxWidth: kWidth * .4),
                                      margin: EdgeInsets.only(top: kMarginY),
                                      padding: EdgeInsets.all(10),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: ColorsApp.grey,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: kMarginX),
                                              child: Text(
                                                'Inscrivez vous',
                                                style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    color: ColorsApp.tird,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ]),
                                    ),
                                    onTap: () => Get.bottomSheet(
                                      Container(
                                          margin: EdgeInsets.only(
                                            top: kMarginY * 8,
                                          ),
                                          decoration: BoxDecoration(
                                              color: ColorsApp.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  topRight:
                                                      Radius.circular(15))),
                                          height: 800,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: kMarginX),
                                          child: Column(children: [
                                            Container(
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    TextButton(
                                                      child: Text('Annuler'),
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                    ),
                                                    // TextButton(
                                                    //   child: Text('Ajouter'),
                                                    //   onPressed: () async {
                                                    //     // await _controller.addShort();
                                                    //     // _controller.chageState(!_controller.addProduit);
                                                    //   },
                                                    // )
                                                  ]),
                                            ),
                                            Expanded(
                                                child: SingleChildScrollView(
                                                    child: Column(children: [
                                              // _controller.listImgProduits.length != 0
                                              //     ? smallText(
                                              //         text: 'Listes images',
                                              //       )
                                              //     : Container(),

                                              Container(
                                                  margin: EdgeInsets.only(
                                                    top: 0,
                                                  ),
                                                  child: RegisterScreen())
                                            ])))
                                          ])),
                                      isScrollControlled: true,
                                    ).then((onValue) {}),
                                  )
                                ],
                              ))),
                ])));
  }
}

class TextValue extends StatelessWidget {
  TextValue({this.title, this.value});
  var title, value;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: kMarginY, horizontal: kMarginX),
        child: Column(
          children: [
            Container(
              child: TextBackSpace(
                text: value.toString(),
                bolder: true,
              ),
            ),
            Container(
              child: Text(title),
            ),
          ],
        ));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.black,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

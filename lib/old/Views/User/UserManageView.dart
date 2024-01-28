import 'package:BananaExpress/old/components/Widget/app_input.dart';
import 'package:BananaExpress/old/components/Widget/app_text_divider.dart';

import 'package:BananaExpress/old/components/Button/customBtn.dart';
import 'package:BananaExpress/old/controller/managerController.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/utils/Services/validators.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
// import 'package:BananaExpress/components/informationComponent.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/old/components/Text/TextBackSpace.dart';
import 'package:cached_network_image/cached_network_image.dart';

// ignore: must_be_immutable
class UserManageView extends StatelessWidget {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagerController>(
      builder: (_manager) {
        return Scaffold(
            backgroundColor: ColorsApp.bg,
            body: CustomScrollView(controller: _scrollController, slivers: [
              SliverAppBar(
                backgroundColor: ColorsApp.bg,
                automaticallyImplyLeading: false,
                title: Container(
                    child: InkWell(
                  child: Container(
                    margin: EdgeInsets.zero,
                    // padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(

                        // borderRadius: BorderRadius.circular(20),
                        ),
                    child: Icon(Icons.arrow_back_ios_new,
                        color: ColorsApp.primary, size: 25.0),
                  ),
                  onTap: () {
                    Get.back();
                  },
                )),
                flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                        decoration: BoxDecoration(
                          color: ColorsApp.bg,
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (_manager.Userget != null)
                                InkWell(
                                  onTap: () => _manager.updateImageUser(),
                                  child: CachedNetworkImage(
                                    height: getHeight(context) / 10,
                                    width: getHeight(context) / 10,
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
                                              "assets/logo/logo.png"));
                                    },
                                  ),
                                ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      size: 18,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: getWith(context) * .010),
                                      child: TextBackSpace(
                                        text: _manager.Userget.phone,
                                        // bolder: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]))),
                expandedHeight: 180,
                pinned: true,
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: kMarginX),
                    child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          AppTextDivider(
                            texte: 'Informations personnels  ',
                          ),
                          Form(
                              key: _manager.formKeyUpdateU,
                              child: Column(
                                  // mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    AppInput(
                                      controller: _manager.nameU,
                                      placeholder: 'labelname'.tr,
                                      // icon: Icon(Icons.account_box),
                                      validator: (value) {
                                        return Validators.isValidUsername(
                                            value!);
                                      },
                                    ),
                                    AppInput(
                                      controller: _manager.surnameU,
                                      // icon: Icon(Icons.account_box),
                                      placeholder: 'labelsurname'.tr,
                                      validator: (value) {
                                        return Validators.isValidUsername(
                                            value!);
                                      },
                                    ),
                                    AppInput(
                                      controller: _manager.emailU,
                                      // icon: Icon(Icons.mail),
                                      placeholder: 'labelemail'.tr,
                                      validator: (value) {
                                        return Validators.isValidEmail(value);
                                      },
                                    ),
                                    AppInput(
                                      controller: _manager.phoneU,
                                      placeholder: 'labelphone'.tr,
                                      // icon: Icon(Icons.phone),
                                      validator: (value) {
                                        return Validators.usPhoneValid(value!);
                                      },
                                    ),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: kMarginY * 2,
                                        ),
                                        child: CustomBtn(
                                            color: ColorsApp.tird,
                                            title: 'Mettre a jour',
                                            onTap: () async {
                                              if (_manager
                                                  .formKeyUpdateU.currentState!
                                                  .validate()) {
                                                await _manager.updateUser();
                                              }
                                            }))
                                  ])),
                          AppTextDivider(
                            texte: 'Mot de passe ',
                          ),
                          Form(
                              key: _manager.formKeyUpdatePassU,
                              child: Column(
                                // mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: kMarginY * 2,
                                    ),
                                    child: AppInputPassword(
                                      controller: _manager.pwdCurrentU,
                                      placeholder: 'labelnewpassword'.tr,
                                      obscureText: true,
                                      validator: (value) {
                                        return Validators.isValidPassword(
                                            value!);
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: kMarginY * 2,
                                    ),
                                    child: AppInputPassword(
                                      controller: _manager.newpwdU,
                                      placeholder: 'labelpassword'.tr,
                                      obscureText: true,
                                      validator: (value) {
                                        return Validators.isValidPassword(
                                            value!);
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: kMarginY * 2,
                                    ),
                                    child: AppInputPassword(
                                      controller: _manager.rnewpwdU,
                                      placeholder: 'labelrpassword'.tr,
                                      obscureText: true,
                                      validator: (value) {
                                        return Validators.isValidRePassword(
                                            _manager.repass.text !=
                                                _manager.pass.text);
                                      },
                                    ),
                                  ),
                                  CustomBtn(
                                      color: ColorsApp.tird,
                                      title: 'Mettre a jour',
                                      onTap: () async {
                                        if (_manager
                                            .formKeyUpdatePassU.currentState!
                                            .validate()) {
                                          await _manager.updateUser();
                                        }
                                      })
                                ],
                              ))
                        ]))),
                childCount: 1,
              ))
            ]));
      },
    );
  }
}

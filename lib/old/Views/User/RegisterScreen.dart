import 'package:BananaExpress/old/components/Button/app_button.dart';
import 'package:BananaExpress/old/components/Widget/app_input.dart';
import 'package:BananaExpress/old/controller/managerController.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/utils/Services/validators.dart';
import 'package:flutter/material.dart';

import 'package:BananaExpress/utils/Services/routing.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ManagerController>(
        builder: (_manager) => SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: kMarginX),
            padding: EdgeInsets.only(
              top: kMarginY * 18,
            ),
            child: Form(
              key: _manager.formKeyReg1,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: Get.size.height * .02,
                      ),
                      child: Text(
                        'Mettons en place quelques détails !'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 19,
                          color: ColorsApp.orange,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            top: Get.size.height * .02,
                            bottom: Get.size.height * .025),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: kMarginY,
                              ),
                              child: AppInput(
                                controller: _manager.phoneLog,
                                onChanged: (value) {},
                                placeholder: 'Nom d’utilisateur'.tr,
                                validator: (value) {
                                  return Validators.isValidUsername(value!);
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: kMarginY,
                              ),
                              child: AppInput(
                                controller: _manager.phoneLog,
                                onChanged: (value) {},
                                placeholder: 'labelphone'.tr,
                                validator: (value) {
                                  return Validators.usPhoneValid(value!);
                                },
                              ),
                            ),
                            AppInputPassword(
                              controller: _manager.passwordLog,
                              placeholder: 'labelpassword'.tr,
                              obscureText: true,
                              validator: (value) {
                                //print(value);
                                return Validators.required(
                                    'Mot de passe', value!);
                              },
                            ),
                            AppInputPassword(
                              controller: _manager.passwordLog,
                              placeholder: 'labelrpassword'.tr,
                              obscureText: true,
                              validator: (value) {
                                //print(value);
                                return Validators.required(
                                    'Mot de passe', value!);
                              },
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: kMarginY),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Get.toNamed(AppLinks.FORGOT);
                                    },
                                    child: Text('forgotpass'.tr,
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          color: ColorsApp.primary,
                                        )),
                                  )
                                ],
                              ),
                            ),
                            AppButton(
                                size: MainAxisSize.max,
                                // bgColor: ColorsApp.primary,
                                text: 'regbtn'.tr,
                                onTap: () async {
                                  //print('dddddss');
                                  //print(_manager.formKeyLog.currentState);
                                  // Get.toNamed(AppLinks.FIRST);
                                  if (_manager.formKeyReg1.currentState!
                                      .validate()) {
                                    //print('dddddss');

                                    if (_manager.verifDataReg()) {
                                      await _manager.signUp();
                                      if (_manager.isSignUp) {
                                        // MyBinding().onGetDataNew();
                                      }
                                    }
                                  }
                                }),
                            InkWell(
                                onTap: () {
                                  Get.toNamed(AppLinks.LOGIN);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      bottom: kMarginY, top: kMarginX * 2),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('logbtn'.tr,
                                          style: TextStyle(
                                              fontFamily: 'Lato',
                                              color: ColorsApp.second,
                                              fontSize: 15)),
                                      Icon(
                                        Icons.keyboard_arrow_right_outlined,
                                        color: ColorsApp.second,
                                      )
                                    ],
                                  ),
                                )),
                          ],
                        )),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

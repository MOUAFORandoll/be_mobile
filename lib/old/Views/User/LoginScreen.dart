import 'package:BananaExpress/old/components/Button/app_button.dart';
import 'package:BananaExpress/old/components/Widget/app_input.dart';
import 'package:BananaExpress/old/controller/managerController.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/utils/Services/validators.dart';
import 'package:flutter/material.dart';

import 'package:BananaExpress/utils/Services/routing.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
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
              key: _manager.formKeyLog,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: Get.size.height * .02,
                      ),
                      child: Text(
                        'Acceder a votre compte et faites vous livrer !'.tr,
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
                        padding: EdgeInsets.symmetric(
                          vertical: kMarginY * 5,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: kMarginY * 2,
                              ),
                              child: AppInput(
                                controller: _manager.phoneLog,
                                onChanged: (value) {},
                                placeholder:
                                    'Nom d’utilisateur / labelphone'.tr,
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
                                text: 'logbtn'.tr,
                                onTap: () async {
                                  //print('dddddss');
                                  //print(_manager.formKeyLog.currentState);
                                  // Get.toNamed(AppLinks.FIRST);
                                  if (_manager.formKeyLog.currentState!
                                      .validate()) {
                                    //print('dddddss');

                                    await _manager.loginUser();
                                    if (_manager.isConnected) {
                                      Get.offNamedUntil(
                                          AppLinks.FIRST, (route) => false);
                                    }
                                  }
                                }),
                            InkWell(
                                onTap: () {
                                  Get.toNamed(AppLinks.REGISTER);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      bottom: kMarginY, top: kMarginX * 4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('regbtn'.tr,
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

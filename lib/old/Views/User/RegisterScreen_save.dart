import 'package:BananaExpress/components/Button/app_button.dart';
import 'package:BananaExpress/components/Widget/app_input.dart';
import 'package:BananaExpress/components/exportcomponent.dart';
import 'package:BananaExpress/old/controller/managerController.dart';
import 'package:BananaExpress/utils/Services/validators.dart';
import 'package:BananaExpress/utils/constants/assets.dart';

class RegisterScreen_0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagerController>(
        builder:
            (_manager) => /* Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: AppBackButton(),
                actions: [
                  Container(
                      margin: EdgeInsets.only(top: Get.height * .020),
                      padding: EdgeInsets.only(
                          left: Get.width * .030, right: Get.width * .030),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: AppTitleRight(
                                  title: 'regbtn'.tr,
                                  description: 'Welcome dear',
                                  icon: Assets.user),
                              margin: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * .005),
                            ),
                          ])),
                ]),
            body:  */
                SingleChildScrollView(
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: kMarginX),
                        child: Column(children: [
                          Container(
                              child: Container(
                                  margin: EdgeInsets.only(
                                      top: Get.size.height * .02,
                                      bottom: Get.size.height * .025),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  // padding: EdgeInsets.only(
                                  //   top: 25,
                                  // ),
                                  child: _manager.regStep == 0
                                      ? step1()
                                      : step2()))
                        ]))));
  }
}

Widget step1() => GetBuilder<ManagerController>(
    builder: (_manager) => Form(
        key: _manager.formKeyReg1,
        child: Column(
          children: [
            new Hero(
              tag: "login screen",
              child: new Container(
                  child: Image.asset(Assets.logImg, height: kHeight / 3.5)),
            ),
            Container(
              margin: EdgeInsets.only(bottom: kMarginY * 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('regText'.tr,
                      style: TextStyle(
                          fontFamily: 'Lato', fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            AppInput(
              controller: _manager.name,
              placeholder: 'labelname'.tr,
              validator: (value) {
                return Validators.isValidUsername(value!);
              },
            ),
            AppInput(
              controller: _manager.surname,
              placeholder: 'labelsurname'.tr,
              validator: (value) {
                return Validators.isValidUsername(value!);
              },
            ),
            AppInput(
              controller: _manager.phone,
              placeholder: 'labelphone'.tr,
              validator: (value) {
                return Validators.usPhoneValid(value!);
              },
            ),
            Padding(
                padding: EdgeInsets.only(
                  top: kMarginY * 2,
                ),
                child: GetBuilder<ManagerController>(
                    builder: (_manager) => AppButton(
                        size: MainAxisSize.max,
                        text: 'next'.tr,
                        onTap: () => _manager.setRegStep(true)))),
          ],
        )));
Widget step2() => GetBuilder<ManagerController>(
    builder: (_manager) => Form(
        key: _manager.formKeyReg2,
        child: Column(
          children: [
            AppInputPassword(
              controller: _manager.pass,
              placeholder: 'labelpassword'.tr,
              obscureText: true,
              validator: (value) {
                return Validators.isValidPassword(value!);
              },
            ),
            AppInputPassword(
              controller: _manager.repass,
              placeholder: 'labelrpassword'.tr,
              obscureText: true,
              validator: (value) {
                return Validators.isValidRePassword(
                    _manager.repass.text != _manager.pass.text);
              },
            ),
            AppInput(
              controller: _manager.userTag,
              placeholder: 'Anachronyme'.tr,
              prefix: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorsApp.grey,
                ),
                width: 10,
                height: 10,
                alignment: Alignment.center,
                child: Text(
                  '@',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                ),
              ),
              onChanged: (value) => _manager.verifDataReg(),
              validator: (value) {
                return Validators.usUserTagValid(value!);
              },
            ),
            Padding(
                padding: EdgeInsets.only(
                  top: kHeight / 3.4,
                ),
                child: GetBuilder<ManagerController>(
                    builder: (_manager) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            AppButton(
                                size: MainAxisSize.max,
                                text: 'back'.tr,
                                onTap: () => _manager.setRegStep(false)),
                            AppButton(
                                size: MainAxisSize.max,
                                text: 'regbtn'.tr,
                                onTap: () async {
                                  print(
                                      '-----------_manager.verifDataReg()----${_manager.verifDataReg()}');
                                  if (_manager.verifDataReg()) {
                                    await _manager.signUp();
                                    if (_manager.isSignUp) {
                                      // MyBinding().onGetDataNew();
                                    }
                                  }
                                }),
                          ],
                        ))),
          ],
        )));

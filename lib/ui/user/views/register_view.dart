import 'package:BananaExpress/components/Button/app_button.dart';
import 'package:BananaExpress/components/Button/app_button_icon.dart';
import 'package:BananaExpress/components/Widget/app_input.dart';
import 'package:BananaExpress/ui/user/bloc/user_bloc.dart';
import 'package:BananaExpress/ui/user/bloc/user_state.dart';
import 'package:BananaExpress/utils/Services/validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/exportcomponent.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          InitialDataState _userState = state as InitialDataState;

          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: kMarginX),
              child: Form(
                key: _userState.formKeyReg,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: kMarginY,
                        ),
                        child: Text(
                          "Mettons en place quelques détails !".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 19,
                            color: ColorsApp.orange,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                          margin:
                              EdgeInsets.only(top: kMarginY, bottom: kMarginY),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: kMarginY,
                                ),
                                child: AppInput(
                                  controller: _userState.name,
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
                                  controller: _userState.phone,
                                  onChanged: (value) {},
                                  placeholder: 'labelphone'.tr,
                                  validator: (value) {
                                    return Validators.usPhoneValid(value!);
                                  },
                                ),
                              ),
                              AppInputPassword(
                                controller: _userState.password,
                                placeholder: 'labelpassword'.tr,
                                obscureText: true,
                                validator: (value) {
                                  //print(value);
                                  return Validators.required(
                                      'Mot de passe', value!);
                                },
                              ),
                              AppInputPassword(
                                controller: _userState.re_password,
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
                                        // Get.toNamed(AppLinks.FORGOT);
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
                                    if (_userState.formKeyReg.currentState!
                                        .validate()) {
                                      // if (_userState.verifDataReg()) {
                                      //   await _userState.signUp();
                                      //   if (_userState.isSignUp) {
                                      //     // MyBinding().onGetDataNew();
                                      //   }
                                      // }
                                    }
                                  }),
                              // InkWell(
                              //     onTap: () {
                              //       // Get.toNamed(AppLinks.LOGIN);
                              //     },
                              //     child: Container(
                              //       margin: EdgeInsets.only(
                              //           bottom: kMarginY, top: kMarginX * 2),
                              //       child: Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.center,
                              //         children: [
                              //           Text('logbtn'.tr,
                              //               style: TextStyle(
                              //                   fontFamily: 'Lato',
                              //                   color: ColorsApp.second,
                              //                   fontSize: 15)),
                              //           Icon(
                              //             Icons.keyboard_arrow_right_outlined,
                              //             color: ColorsApp.second,
                              //           )
                              //         ],
                              //       ),
                              //     )),
                            ],
                          )),
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}

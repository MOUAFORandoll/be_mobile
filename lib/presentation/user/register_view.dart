import 'package:BananaExpress/old/components/Button/app_button.dart';
import 'package:BananaExpress/old/components/Widget/app_input.dart';
import 'package:BananaExpress/routes/app_router.gr.dart';
import 'package:BananaExpress/utils/Services/validators.dart';
import 'package:BananaExpress/utils/functions/app_loader.dart';
import 'package:auto_route/auto_route.dart';

import '../../../utils/functions/showToast.dart';
import 'package:BananaExpress/application/export_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../styles/colorApp.dart';
import '../../styles/textStyle.dart';
import 'package:BananaExpress/core.dart';

class RegisterView extends StatelessWidget {
  var loader = AppLoader.bounceLargeColorLoaderController();
  TextEditingController phone = TextEditingController();
  final formKey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController re_password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return PopScope(
        onPopInvoked: (value) {
          print(value);
          loader.close();
          BlocProvider.of<AppActionCubit>(context).toLogin();
        },
        child: Scaffold(
          appBar: AppBar(
            leading: InkWell(
                onTap: () => BlocProvider.of<AppActionCubit>(context).toLogin(),
                child: Container(
                  margin: EdgeInsets.zero,
                  // padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(

                      // borderRadius: BorderRadius.circular(20),
                      ),
                  child: Icon(Icons.arrow_back_ios_new, size: 25.0),
                )),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state.isLoading == 1) {
                loader.open(context);
              } else if (state.isLoading == 3) {
                loader.close();
                showError(state.authenticationFailedMessage!, context);
              } else if (state.isLoading == 2) {
                loader.close();
                AutoRouter.of(context).replaceAll([HomeRoute()]);

                showSuccess('Connecte', context);
                initLoad(context);
                print('-----44--------*********');
              }
            },
            builder: (context, state) {
              // if (state is InitialDataState) {
              //   InitialDataState _userState = state as InitialDataState;

              return SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: kMarginX),
                  child: Form(
                    key: formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: kMarginY,
                            ),
                            child: Text(
                              "Mettons en place quelques détails !".tr(),
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
                                  top: kMarginY, bottom: kMarginY),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: kMarginY,
                                    ),
                                    child: AppInput(
                                      controller: name,
                                      onChanged: (value) {},
                                      placeholder: 'Nom d’utilisateur'.tr(),
                                      validator: (value) {
                                        return Validators.isValidUsername(
                                            value!);
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: kMarginY,
                                    ),
                                    child: AppInput(
                                      controller: phone,
                                      onChanged: (value) {},
                                      placeholder: 'labelphone'.tr(),
                                      validator: (value) {
                                        return Validators.usPhoneValid(value!);
                                      },
                                    ),
                                  ),
                                  AppInputPassword(
                                    controller: password,
                                    placeholder: 'labelpassword'.tr(),
                                    obscureText: true,
                                    validator: (value) {
                                      //print(value);
                                      return Validators.required(
                                          'Mot de passe', value!);
                                    },
                                  ),
                                  AppInputPassword(
                                    controller: re_password,
                                    placeholder: 'labelrpassword'.tr(),
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
                                          child: Text('forgotpass'.tr(),
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
                                      text: 'regbtn'.tr(),
                                      onTap: () async {
                                        if (formKey.currentState!.validate()) {
                                          context.read<UserBloc>().add(
                                              RegisterEvent(
                                                  name: name.text,
                                                  phone: phone.text,
                                                  password: password.text,
                                                  re_password:
                                                      re_password.text));
                                        }
                                      }),
                                ],
                              )),
                        ]),
                  ),
                ),
              );
              // } else {
              //   return Container();
              // }
            },
          ),
        ));
  }
}

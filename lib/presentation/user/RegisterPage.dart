// ignore_for_file: must_be_immutable

import 'package:BabanaExpress/presentation/components/Text/TitleComponent.dart';
import 'package:BabanaExpress/presentation/user/ForgotPasswordPage.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';

import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:BabanaExpress/core.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  static const routeName = '/register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
        onPopInvoked: (value) {
          EasyLoading.dismiss();
          AutoRouter.of(context).pop();
        },
        child: Scaffold(
          appBar: AppBarCustom(
            title: 'regbtn'.tr(),
          ),
          backgroundColor: Colors.transparent,
          body: BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state.isLoading == 1) {
                EasyLoading.show(
                    indicator: CircularProgressIndicator(
                      color: ColorsApp.second,
                    ),
                    dismissOnTap: true,
                    maskType: EasyLoadingMaskType.black);
              } else if (state.isLoading == 3) {
                EasyLoading.dismiss();
                showError(state.authenticationFailedMessage!, context);
              } else if (state.isLoading == 2) {
                EasyLoading.dismiss();
                AutoRouter.of(context).replaceAll([HomeRoute()]);

                showSuccess('Connecte', context);
                initLoad(context);
                print('-----44--------*********');
              }
            },
            builder: (context, state) {
              // if (state is InitialDataState) {
              //   InitialDataState _userState = state as InitialDataState;

              return Container(
                margin: EdgeInsets.symmetric(horizontal: kMarginX),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleComponent(
                                  title: 'Renseignez vos informations',
                                  subTitle: 'regTitle'.tr(),
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
                                            controller: state.name,
                                            onChanged: (value) {
                                              formKey.currentState!.validate();
                                            },
                                            placeholder: 'labelname'.tr(),
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
                                            controller: state.phone,
                                            onChanged: (value) {
                                              formKey.currentState!.validate();
                                            },
                                            placeholder: 'labelphone'.tr(),
                                            validator: (value) {
                                              return Validators.usPhoneValid(
                                                  value!);
                                            },
                                          ),
                                        ),
                                        AppInputPassword(
                                          controller: state.password,
                                          placeholder: 'labelpassword'.tr(),
                                          onChanged: (value) {
                                            formKey.currentState!.validate();
                                          },
                                          obscureText: true,
                                          validator: (value) {
                                            //print(value);
                                            return Validators.required(
                                                'Mot de passe', value!);
                                          },
                                        ),
                                        AppInputPassword(
                                          controller: state.re_password,
                                          placeholder: 'labelrpassword'.tr(),
                                          onChanged: (value) {
                                            formKey.currentState!.validate();
                                          },
                                          obscureText: true,
                                          validator: (value) {
                                            //print(value);
                                            return Validators.required(
                                                'Mot de passe', value!);
                                          },
                                        ),
                                      ],
                                    )),
                              ]),
                        ),
                      ),
                      AppButtonSecond(
                          size: MainAxisSize.max,
                          // bgColor: ColorsApp.primary,
                          text: 'regbtn'.tr(),
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              if (state.password.text !=
                                  state.re_password.text) {
                                showError('Les mots de passes sont differents',
                                    context);

                                return;
                              }
                              context.read<UserBloc>().add(RegisterEvent());
                            }
                          }),
                    ],
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

// ignore_for_file: must_be_immutable

import 'package:BananaExpress/presentation/components/Button/app_button.dart';
import 'package:BananaExpress/utils/Services/validators.dart';
import 'package:BananaExpress/utils/functions/showToast.dart';
import 'package:auto_route/auto_route.dart';
import 'package:BananaExpress/application/export_bloc.dart';
import 'package:BananaExpress/presentation/components/exportcomponent.dart';

import 'package:BananaExpress/core.dart';
import 'package:BananaExpress/routes/app_router.gr.dart';

@RoutePage()
class ForgotPasswordPage extends StatelessWidget {
  static const routeName = '/forgot';

  var loader = AppLoader.bounceLargeColorLoaderController();
  TextEditingController phoneormail = TextEditingController();

  TextEditingController otpCode = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          't1Reini'.tr(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
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
            if (state.successReset == true) {
              AutoRouter.of(context).replaceAll([HomeRoute()]);
              showSuccess('Connecte', context);
              initLoad(context);
              loader.close();
              print('-----44--------*********');
            }
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: kMarginX),
              padding: EdgeInsets.only(
                top: kMarginY,
              ),
              child: Form(
                key: formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (state.isCode == 0)
                        Container(
                          margin: EdgeInsets.only(
                            top: kMarginY,
                          ),
                          child: Text(
                            'tilterecu'.tr(),
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 13,
                              // color: ColorsApp.orange,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      if (state.isCode == 1 && state.isCorrectCode != 1)
                        Container(
                          margin: EdgeInsets.only(
                            top: kMarginY,
                          ),
                          child: Text(
                            'verifydescrip'.tr(),
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 13,
                              // color: ColorsApp.orange,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      if (state.isCorrectCode == 1)
                        Container(
                          margin: EdgeInsets.only(
                            top: kMarginY,
                          ),
                          child: Text(
                            'logTilte'.tr(),
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 13,
                              // color: ColorsApp.orange,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      Container(
                          margin:
                              EdgeInsets.only(top: kMarginY, bottom: kMarginY),
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
                                  controller: phoneormail,
                                  onChanged: (value) {},
                                  placeholder: 'labelphone_recup'.tr(),
                                  validator: (value) {
                                    // return Validators.usPhoneValid(value!);
                                  },
                                ),
                              ),
                              if (state.isCode == 1 && state.isCorrectCode == 1)
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: kMarginY * 2,
                                  ),
                                  child: AppInput(
                                    controller: phoneormail,
                                    onChanged: (value) {},
                                    placeholder: 'labelphone_recup'.tr(),
                                    validator: (value) {
                                      // return Validators.usPhoneValid(value!);
                                    },
                                  ),
                                ),
                              if (state.isCorrectCode == 1)
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
                              Container(
                                margin: EdgeInsets.only(bottom: kMarginY),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () =>
                                          context.read<UserBloc>().add(SendCode(
                                                data: phoneormail.text,
                                              )),
                                      child: Text('resendCode'.tr(),
                                          style: TextStyle(
                                            fontFamily: 'Lato',
                                            color: ColorsApp.second,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              if (state.isCode == 0 || state.isCode == 2)
                                AppButton(
                                    size: MainAxisSize.max,
                                    text: 'logForgot'.tr(),
                                    onTap: () async {
                                      print({
                                        'data': phoneormail.text,
                                      });

                                      context.read<UserBloc>().add(SendCode(
                                            data: phoneormail.text,
                                          ));
                                    }),
                              if (state.isCode == 1 && state.isCorrectCode != 1)
                                AppButton(
                                    size: MainAxisSize.max,
                                    text: 'Verifier Code'.tr(),
                                    onTap: () async {
                                      print({
                                        'code': otpCode.text,
                                      });

                                      context.read<UserBloc>().add(VerifyCode(
                                            code: phoneormail.text,
                                          ));
                                    }),
                              if (state.isCorrectCode == 1)
                                AppButton(
                                    size: MainAxisSize.max,
                                    text: 'New Password'.tr(),
                                    onTap: () async {
                                      context
                                          .read<UserBloc>()
                                          .add(ResetPassword(
                                            password: phoneormail.text,
                                          ));
                                    }),
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

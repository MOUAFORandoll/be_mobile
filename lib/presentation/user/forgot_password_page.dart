// ignore_for_file: must_be_immutable

import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:BabanaExpress/core.dart';
import 'package:pinput/pinput.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';

@RoutePage()
class ForgotPasswordPage extends StatelessWidget {
  static const routeName = '/forgot';

  var loader = AppLoader.bounceLargeColorLoaderController();
  TextEditingController phoneormail = TextEditingController();

  TextEditingController otpCode = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final focusedBorderColor = ColorsApp.primary;
  final fillColor = ColorsApp.primary;
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(fontSize: 22, color: ColorsApp.white),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: ColorsApp.second),
    ),
  );
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
          if (state.isLoadingForgot == 1) {
            EasyLoading.show(
                dismissOnTap: true,
                status: 'En cours',
                maskType: EasyLoadingMaskType.black);
          } else if (state.isLoadingForgot == 3) {
            EasyLoading.dismiss();
            showError(state.authenticationFailedMessage!, context);
          } else if (state.isLoadingForgot == 2) {
            EasyLoading.dismiss();
            if (state.successReset! == true) {
              AutoRouter.of(context).replaceAll([HomeRoute()]);
              showSuccess('Connecte', context);
              initLoad(context);

              print('-----44---${state.successReset}-----*********');
            }
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: kMarginX),
              padding: EdgeInsets.only(
                top: kMarginY * 2,
              ),
              child: Form(
                key: formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (state.isCode == 0 || state.isCode == 2)
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
                            vertical: kMarginY,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: kMarginY * 2,
                                  bottom: kMarginY,
                                ),
                                child: AppInput(
                                  controller: phoneormail,
                                  onChanged: (value) {},
                                  placeholder: 'labelphone_recup'.tr(),
                                  validator: (value) {
                                    return null;

                                    // return Validators.usPhoneValid(value!);
                                  },
                                ),
                              ),
                              if (state.isCode == 1 && state.isCorrectCode != 1)
                                Container(
                                    margin: EdgeInsets.only(
                                      top: kMarginY,
                                    ),
                                    child: Column(children: [
                                      // Container(
                                      //     alignment: Alignment.centerLeft,
                                      //     margin: EdgeInsets.symmetric(
                                      //         vertical: kMarginY),
                                      //     child: Text('code'.tr(),
                                      //         textAlign: TextAlign.center,
                                      //         style: TextStyle(
                                      //             fontFamily: 'Lato',
                                      //             color: ColorsApp.primary,
                                      //             fontWeight:
                                      //                 FontWeight.w600))),
                                      Container(
                                          child: Pinput(
                                        length: 4,
                                        focusedPinTheme:
                                            defaultPinTheme.copyWith(
                                          decoration: defaultPinTheme
                                              .decoration!
                                              .copyWith(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: focusedBorderColor),
                                          ),
                                        ),
                                        controller: otpCode,
                                        submittedPinTheme:
                                            defaultPinTheme.copyWith(
                                          decoration: defaultPinTheme
                                              .decoration!
                                              .copyWith(
                                            color: fillColor,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: focusedBorderColor),
                                          ),
                                        ),
                                        errorPinTheme:
                                            defaultPinTheme.copyBorderWith(
                                          border: Border.all(
                                              color: Colors.redAccent),
                                        ),
                                        onCompleted: (pin) async {},
                                      ))
                                    ])),
                              if (state.isCorrectCode == 1)
                                AppInputPassword(
                                  controller: password,
                                  placeholder: 'newPass'.tr(),
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
                                      if (phoneormail.text.isEmpty) {
                                        showError('invmailphone'.tr(), context);
                                        return;
                                      }
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
                                    text: 'verifCode'.tr(),
                                    onTap: () async {
                                      if (otpCode.text.isEmpty) {
                                        showError('invotp'.tr(), context);
                                        return;
                                      }
                                      if (phoneormail.text.isEmpty) {
                                        showError('invmailphone'.tr(), context);
                                        return;
                                      }
                                      print({
                                        'code': otpCode.text,
                                      });

                                      context.read<UserBloc>().add(VerifyCode(
                                            data: phoneormail.text,
                                            code: otpCode.text,
                                          ));
                                    }),
                              if (state.isCorrectCode == 1)
                                AppButton(
                                    size: MainAxisSize.max,
                                    text: 'yvalid'.tr(),
                                    onTap: () async {
                                      if (phoneormail.text.isEmpty) {
                                        showError('invmailphone'.tr(), context);
                                        return;
                                      }
                                      if (password.text.isEmpty) {
                                        showError('invpass'.tr(), context);
                                        return;
                                      }
                                      context
                                          .read<UserBloc>()
                                          .add(ResetPassword(
                                            data: phoneormail.text,
                                            password: password.text,
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

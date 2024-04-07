// ignore_for_file: must_be_immutable

import 'package:BabanaExpress/presentation/user/ForgotPasswordPage.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';

import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:BabanaExpress/core.dart';

@RoutePage()
class RegisterPage extends StatelessWidget {
  static const routeName = '/register';

  TextEditingController phone = TextEditingController();
  final formKey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController re_password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return PopScope(
        onPopInvoked: (value) {
          EasyLoading.dismiss();
          AutoRouter.of(context).pop();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'regbtn'.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
            leading: InkWell(
                onTap: () {
                  EasyLoading.dismiss();
                  AutoRouter.of(context).pop();
                },
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
                EasyLoading.show(
                    dismissOnTap: true,
                    status: 'En cours',
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
                              'regTitle'.tr(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                // color: ColorsApp.orange,
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
                                          onPressed: () =>
                                              AutoRouter.of(context).pushNamed(
                                                  ForgotPasswordPage.routeName),
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
                                          if (password.text !=
                                              re_password.text) {
                                            showError(
                                                'Les mots de passes sont differents',
                                                context);

                                            return;
                                          }
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

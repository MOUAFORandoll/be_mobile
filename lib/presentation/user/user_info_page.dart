import 'package:BabanaExpress/presentation/user/ForgotPasswordPage.dart';
import 'package:BabanaExpress/presentation/user/RegisterPage.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:BabanaExpress/core.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';

@RoutePage()
class UserInfoPage extends StatefulWidget {
  static const routeName = '/user/info';
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  TextEditingController phone = TextEditingController();

  TextEditingController password = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'logbtn'.tr(),
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
            EasyLoading.show(
                dismissOnTap: true,
                status: 'En cours',
                maskType: EasyLoadingMaskType.black);
          } else if (state.isLoading == 3) {
            EasyLoading.dismiss();
            showError(state.authenticationFailedMessage!, context);
          } else if (state.isLoading == 2) {
            AutoRouter.of(context).replaceAll([HomeRoute()]);
            showSuccess('Connecte', context);
            initLoad(context);
            EasyLoading.dismiss();
            print('-----44--------*********');
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
                      Container(
                        margin: EdgeInsets.only(
                          top: kMarginY,
                        ),
                        child: Text(
                          'logTilte'.tr(),
                          textAlign: TextAlign.center,
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
                              Container(
                                margin: EdgeInsets.only(bottom: kMarginY),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () => AutoRouter.of(context)
                                          .pushNamed(
                                              ForgotPasswordPage.routeName),
                                      child: Text('forgotpass'.tr(),
                                          style: TextStyle(
                                            fontFamily: 'Lato',
                                            color: ColorsApp.second,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              AppButton(
                                  size: MainAxisSize.max,
                                  // loading: _userState.isLoading,
                                  // bgColor: ColorsApp.primary,
                                  text: 'logbtn'.tr(),
                                  onTap: () async {
                                    print({
                                      'password': password.text,
                                      'phone': phone.text,
                                    });

                                    if (formKey.currentState!.validate()) {
                                      context.read<UserBloc>().add(SignInEvent(
                                            password: password.text,
                                            phone: phone.text,
                                          ));
                                    }
                                  }),
                              InkWell(
                                  onTap: () => AutoRouter.of(context)
                                      .pushNamed(RegisterPage.routeName),
                                  child: Container(
                                    margin: EdgeInsets.only(top: kMarginX * 3),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('regbtn'.tr(),
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
          );
        },
      ),
    );
  }
}

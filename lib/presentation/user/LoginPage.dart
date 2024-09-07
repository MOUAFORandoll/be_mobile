import 'package:BabanaExpress/presentation/components/Text/TitleComponent.dart';
import 'package:BabanaExpress/presentation/user/ForgotPasswordPage.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:BabanaExpress/core.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  static const routeName = '/auth-verify';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phone = TextEditingController();

  TextEditingController password = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(
          title: 'Connexion',
        ),
        body: BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state.isLoading == 1) {
                // Loader().openModal(
                //   context: context,
                //   title: 'Connexion',
                //   description:
                //       'Veuillez patienter pendant que nous vérifions vos informations de connexion...',
                // );
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
                AutoRouter.of(context).replaceAll([HomeRoute()]);
                showSuccess('Connecte', context);
                initLoad(context);
                EasyLoading.dismiss();
                print('-----44--------*********');
              }
            },
            builder: (context, state) => Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: kMarginX / 2, vertical: kMarginY),
                  child: Form(
                    key: formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleComponent(
                                title: 'Renseignez votre mot de passe',
                                subTitle:
                                    'Renseignez votre mot de passe pour acceder a ton compte',
                              ),
                              Container(
                                  margin: EdgeInsets.only(bottom: kMarginY),
                                  child: Column(children: [
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
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            onPressed: () =>
                                                AutoRouter.of(context)
                                                    .pushNamed(
                                                        ForgotPasswordPage
                                                            .routeName),
                                            child: Text('forgotpass'.tr(),
                                                style: TextStyle(
                                                  color: ColorsApp.second,
                                                )),
                                          )
                                        ],
                                      ),
                                    )
                                  ])),
                            ],
                          )),
                          AppButtonSecond(
                              size: MainAxisSize.max,
                              marginAdd: EdgeInsets.symmetric(
                                horizontal: kMarginX,
                              ),
                              text: 'logbtn'.tr(),
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  context.read<UserBloc>().add(SignInEvent());
                                }
                              }),
                        ]),
                  ),
                )));
  }
}

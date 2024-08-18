import 'package:BabanaExpress/presentation/components/Button/app_button_second.dart';
import 'package:BabanaExpress/presentation/layer/onboardingcomponent.dart';
import 'package:BabanaExpress/presentation/user/ForgotPasswordPage.dart';
import 'package:BabanaExpress/presentation/user/RegisterPage.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/core.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';

@RoutePage()
class AuthPage extends StatefulWidget {
  // @CustomRoute(
  //     transitionsBuilder: TransitionsBuilders.slideBottom,
  //     durationInMilliseconds: 400)
  static const routeName = '/auth';
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final phone = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsApp.primary,
        body: BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state.isExistLoading == 0) {
                EasyLoading.show(
                    indicator: CircularProgressIndicator(
                      color: ColorsApp.second,
                    ),
                    dismissOnTap: true,
                    maskType: EasyLoadingMaskType.black);
              } else if (state.isExistLoading == 1) {
                print('ooooooooo');
                EasyLoading.dismiss();
                AutoRouter.of(context).push(LoginRoute());
              } else if (state.isExistLoading == 2) {
                EasyLoading.dismiss();
                AutoRouter.of(context).push(RegisterRoute());

                print('-----44--------*********');
              }
            },
            builder: (context, state) => SingleChildScrollView(
                    child: Column(children: [
                  OnBoardingComponent(),
                  Container(
                    decoration: BoxDecoration(
                        color: ColorsApp.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    padding: EdgeInsets.symmetric(
                      horizontal: kMarginX / 2,
                    ),
                    child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: kMarginX / 2,
                                    ).add(EdgeInsets.only(top: kMarginY * 2)),
                                    child: Text(
                                      'Renseigne ton numero de telephone',
                                      style: TextStyle(
                                          fontSize: kTitle * 1.3,
                                          fontWeight: FontWeight.w700),
                                    )),
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: kMarginX / 2,
                                ),
                                child: Text(
                                  'Renseigne ton numero de telephone pour creer ton compte ou pour te connecter',
                                  style: TextStyle(
                                    fontSize: kBasics,
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: kMarginY,
                              ),
                              child: AppInput(
                                controller: state
                                    .phone, // Changed from state.phone to phone
                                onChanged: (value) {
                                  formKey.currentState!.validate();
                                },
                                textInputType: TextInputType.phone,
                                placeholder: 'labelphone'.tr(),
                                validator: (value) {
                                  return Validators.usPhoneValid(value!);
                                },
                              ),
                            ),
                            AppButtonSecond(
                                size: MainAxisSize.max,
                                // loading: _userState.isLoading,
                                // bgColor: ColorsApp.primary,
                                text: 'Poursuivre'.tr(),
                                onTap: () async {
                                  if (formKey.currentState!.validate()) {
                                    context
                                        .read<UserBloc>()
                                        .add(VerifUserExist());
                                  }
                                }),
                          ],
                        )),
                  ),
                ]))));
  }
}

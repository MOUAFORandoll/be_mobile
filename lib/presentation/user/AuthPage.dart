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
  static const routeName = '/auth';
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController phone = TextEditingController();

  TextEditingController password = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            builder: (context, state) => CustomScrollView(slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,

                    title: Text(
                      'Babana Express',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: ColorsApp.white,
                          fontFamily: 'Lato',
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    centerTitle: true,

                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(getHeight(context) * .35),
                      child: Container(
                        // margin: EdgeInsets.symmetric(
                        //   horizontal: kMarginX,
                        // ).add(EdgeInsets.only(
                        //   bottom: kMarginY * 3,
                        //   right: kMarginX,
                        // )),
                        height: getHeight(context) * .40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Assets.login),
                              fit: BoxFit.contain),
                        ),
                      ),
                    ),

                    expandedHeight: getHeight(context) * .40,
                    elevation: 10.0,
                    // backgroundColor:
                    //     ColorsApp.primary,
                  ),
                  SliverToBoxAdapter(
                      child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: kMarginX / 2, vertical: kMarginY),
                      child: Form(
                        key: formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: kMarginX, vertical: kMarginY),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: kMarginY,
                                      ),
                                      child: Text(
                                        'Connectez-vous'.tr(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          // color: ColorsApp.orange,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                          bottom: kMarginY,
                                        ),
                                        child: Text(
                                          'logTilte'.tr(),
                                          style: TextStyle(
                                            color:
                                                ColorsApp.black.withOpacity(.3),
                                            fontSize: 12,
                                            fontFamily: 'Lato',
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(bottom: kMarginY),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: kMarginY * 2,
                                        ),
                                        child: AppInput(
                                          controller: phone,
                                          onChanged: (value) {},
                                          textInputType: TextInputType.phone,
                                          placeholder: 'labelphone'.tr(),
                                          validator: (value) {
                                            return Validators.usPhoneValid(
                                                value!);
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
                                        margin:
                                            EdgeInsets.only(bottom: kMarginY),
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
                                                    fontFamily: 'Lato',
                                                    color: ColorsApp.primary,
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
                                            // Loader().openModal(
                                            //   context: context,
                                            //   title: 'Connexion',
                                            //   description:
                                            //       'Veuillez patienter pendant que nous vérifions vos informations de connexion...',
                                            // );
                                            // // print({
                                            //   'password': password.text,
                                            //   'phone': phone.text,
                                            // });

                                            if (formKey.currentState!
                                                .validate()) {
                                              context
                                                  .read<UserBloc>()
                                                  .add(SignInEvent(
                                                    password: password.text,
                                                    phone: phone.text,
                                                  ));
                                            }
                                          }),
                                      InkWell(
                                          onTap: () => AutoRouter.of(context)
                                              .pushNamed(
                                                  RegisterPage.routeName),
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                top: kMarginX * 3),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('regbtn'.tr(),
                                                    style: TextStyle(
                                                        fontFamily: 'Lato',
                                                        color:
                                                            ColorsApp.primary,
                                                        fontSize: 15)),
                                                Icon(
                                                  Icons
                                                      .keyboard_arrow_right_outlined,
                                                  color: ColorsApp.primary,
                                                )
                                              ],
                                            ),
                                          )),
                                    ],
                                  )),
                            ]),
                      ),
                    ),
                  ))
                ])));
  }
}

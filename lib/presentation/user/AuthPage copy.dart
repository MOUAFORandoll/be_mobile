import 'package:BabanaExpress/presentation/components/Button/AppIconButton.dart';
import 'package:BabanaExpress/presentation/components/Text/TitleComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/icon_svg.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';

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
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state.isExistLoading == 0) {
          EasyLoading.show(
              indicator: CircularProgressIndicator(
                color: ThemeApp.second,
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
        if (state.isLoading == 1) {
          // Loader().openModal(
          //   context: context,
          //   title: 'Connexion',
          //   description:
          //       'Veuillez patienter pendant que nous vérifions vos informations de connexion...',
          // );
          EasyLoading.show(
              indicator: CircularProgressIndicator(
                color: ThemeApp.second,
              ),
              dismissOnTap: true,
              maskType: EasyLoadingMaskType.black);
        } else if (state.isLoading == 3) {
          EasyLoading.dismiss();
          showError(state.authenticationFailedMessage!, context);
        } else if (state.isLoading == 2) {
          if (state.completeprofil != null) {
            if (state.completeprofil!) {
              print(
                  '-----state.completeprofil----------------${state.completeprofil}--------*********');

              AutoRouter.of(context).replaceAll([CompleteProfilRoute()]);
            } else {
              AutoRouter.of(context).replaceAll([HomeRoute()]);
            }
          }
          showSuccess('Connecte', context);

          EasyLoading.dismiss();
          print('-----44--------*********');
        }
      },
      builder: (context, state) => SafeArea(
          child: Scaffold(
              backgroundColor: ThemeApp.second,
              bottomSheet: Container(
                height: 300,
                decoration: BoxDecoration(
                    color: ColorsApp.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                padding: EdgeInsets.symmetric(
                    horizontal: kMarginX / 2, vertical: kMarginY / 2),
                child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleComponent(
                          title: 'Renseignez votre numero de telephone',
                          subTitle:
                              'Renseignez votre numero de telephone pour creer un compte ou pour se connecter',
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: kMarginY,
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
                        Container(
                            margin: EdgeInsets.only(
                              top: kMarginY,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: kMarginX),
                                    width: getWidth(context) * .8,
                                    child: AppButton(
                                      // buttonStyle: state.phone.text.isEmpty
                                      //     ? ButtonStyle.disabled
                                      //     : ButtonStyle.primary,
                                      text: 'Poursuivre'.tr(),
                                      onTap: () async {
                                        if (formKey.currentState!.validate()) {
                                          context
                                              .read<UserBloc>()
                                              .add(VerifUserExist());
                                        }
                                      },
                                    )),
                                Container(
                                    padding: EdgeInsets.only(
                                      right: kMarginX,
                                    ),
                                    child: AppIconButton(
                                      icon: SvgIcon(icon: Assets.google),
                                      borderColor: ThemeApp.second,
                                      onTap: () {
                                        context
                                            .read<UserBloc>()
                                            .add(SignInSocialEvent());
                                      },
                                    )),
                              ],
                            )),
                      ],
                    )),
              ),
              body: SingleChildScrollView(
                  child: Column(children: [
                AppCarrousselItemSecond(
                  title: 'Livraison de vos colis'.tr(),
                  description: 'cdescription1'.tr(),
                  image: Assets.onb2,
                ),
              ])))),
    );
  }
}

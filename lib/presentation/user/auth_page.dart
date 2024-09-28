import 'package:BabanaExpress/common/bloc/user_cubit.dart';
import 'package:BabanaExpress/presentation/components/Button/buttons.dart';
import 'package:BabanaExpress/presentation/components/Widget/icon_svg.dart';
import 'package:BabanaExpress/presentation/user/register_page.dart';
import 'package:BabanaExpress/utils/dialogs.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:potatoes/common/widgets/loaders.dart';

@RoutePage()
class AuthPage extends StatefulWidget {
  static const routeName = '/auth';
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with CompletableMixin {
  final formKey = GlobalKey<FormState>();
  late final userCubit = context.read<UserCubit>();
  final TextEditingController identifintuserNameController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // loadingDialogCompleter?.dispose();
    // if (loadingDialogCompleter != null) {
    //   Navigator.of(context).pop();
    // }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
        listener: onEventReceived,
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ).add(EdgeInsets.only(bottom: 16.0, top: 48)),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgIcon(
                          icon: Assets.logo_second,
                          height: 32,
                          width: 32,
                        ),
                        Text(
                          'Babana Express',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Container(),
                      ],
                    ),
                    SizedBox(height: 64),
                    AppInput(
                      controller:
                          identifintuserNameController, // Changed from state.phone to phone
                      onChanged: (value) {
                        userCubit.resetState();
                      },

                      label: 'Email ou numéro de téléphone',
                      placeholder: 'Ex : 690863838',
                      validator: (value) {
                        // return Validators.usPhoneValid(value!);
                      },
                    ),
                    if (state is AuthUserExistState) SizedBox(height: 16),
                    if (state is AuthUserExistState)
                      AppInput(
                        controller:
                            passwordController, // Changed from state.phone to phone
                        onChanged: (value) {
                          formKey.currentState!.validate();
                        },

                        label: 'Mot de passe',
                        placeholder: 'Ex : BabanaExpress237',
                        validator: (value) {
                          return Validators.isValidPassword(value!);
                        },
                      ),
                    SizedBox(height: 16),
                    BEButton(
                      style: BEButtonStyle.secondary,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (!(state is AuthUserExistState))
                            userCubit.verifyUserExist(
                              identifiant: identifintuserNameController.text,
                            );
                          if (state is AuthUserExistState)
                            userCubit.login(
                              identifiant: identifintuserNameController.text,
                              password: passwordController.text,
                            );
                        }
                      },
                      text: 'Continuer',
                    ),
                    SizedBox(height: 16),
                    TextButton(
                        onPressed: () =>
                            AutoRouter.of(context).push(ForgotPasswordRoute()),
                        child: Text('Problème de connexion ?',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: ThemeApp.second))),
                    SizedBox(height: 84),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: ThemeApp.grey,
                            thickness: .4,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('OU',
                              style: TextStyle(
                                color: ThemeApp.grey,
                              )),
                        ),
                        Expanded(
                          child: Divider(
                            color: ThemeApp.grey,
                            thickness: .4,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 84),
                    _buildSocialLoginButtons(),
                    SizedBox(height: 16),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'En créant un compte, tu acceptes nos ',
                          style: Theme.of(context).textTheme.bodySmall,
                          children: [
                            TextSpan(
                              text: "conditions d'utilisation ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: ThemeApp.second,
                                  ),
                            ),
                            TextSpan(
                              text: 'et ',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            TextSpan(
                              text: 'notre politique de confidentialité.',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: ThemeApp.second,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void onEventReceived(BuildContext context, UserState state) async {
    await waitForDialog();

    if (state is AuthLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is AuthUserNotExistState) {
      AutoRouter.of(context)
          .push(RegisterRoute(identifiant: identifintuserNameController.text));
    } else if (state is AuthUserSuccessState) {
      AutoRouter.of(context).push(HomeRoute());
    } else if (state is CompleteUserProfileState) {
      AutoRouter.of(context).push(CompleteProfilRoute());
    } else if (state is AuthErrorState) {
      showErrorToast(state.error);
    }
  }

  Widget _buildSocialLoginButtons() {
    return Column(
      children: [
        BEButton(
          style: BEButtonStyle.auth,
          onPressed: () {
            userCubit.socialLogin();
          },
          text: 'Continuer avec Google',
          authProvider: AuthProvider.google,
        ),
        SizedBox(height: 16),
        BEButton(
          style: BEButtonStyle.auth,
          onPressed: () {},
          text: 'Continuer avec Facebook',
          authProvider: AuthProvider.facebook,
        ),
        SizedBox(height: 16),
        BEButton(
          style: BEButtonStyle.auth,
          onPressed: () {},
          text: 'Continuer avec Apple',
          authProvider: AuthProvider.apple,
        ),
      ],
    );
  }
}

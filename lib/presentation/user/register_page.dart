import 'package:BabanaExpress/presentation/components/Button/AppIconButton.dart';
import 'package:BabanaExpress/presentation/components/Button/buttons.dart';
import 'package:BabanaExpress/presentation/components/Text/TitleComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/icon_svg.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';

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
        child: BlocConsumer<UserBloc, UserState>(listener: (context, state) {
          if (state.isLoading == 1) {
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
            EasyLoading.dismiss();
            AutoRouter.of(context).replaceAll([HomeRoute()]);

            showSuccess('Connecte', context);

            print('-----44--------*********');
          }
        }, builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: ThemeApp.white,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  AutoRouter.of(context).pop();
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Créer votre compte',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  AppInput(
                    controller:
                        state.phone, // Changed from state.phone to phone
                    onChanged: (value) {
                      formKey.currentState!.validate();
                    },
                    textInputType: TextInputType.phone,
                    label: 'Votre nom',
                    placeholder: 'Ex : 690863838',
                    validator: (value) {
                      return Validators.usPhoneValid(value!);
                    },
                  ),
                  SizedBox(height: 24),
                  AppInput(
                    controller:
                        state.phone, // Changed from state.phone to phone
                    onChanged: (value) {
                      formKey.currentState!.validate();
                    },
                    textInputType: TextInputType.phone,
                    label: 'Email ou numéro de téléphone',
                    placeholder: 'Ex : 690863838',
                    validator: (value) {
                      return Validators.usPhoneValid(value!);
                    },
                  ),
                  SizedBox(height: 24),
                  AppInput(
                    controller:
                        state.phone, // Changed from state.phone to phone
                    onChanged: (value) {
                      formKey.currentState!.validate();
                    },
                    textInputType: TextInputType.phone,
                    label: 'Mot de passe',
                    placeholder: 'Ex : BabanaExpress237',
                    validator: (value) {
                      return Validators.usPhoneValid(value!);
                    },
                  ),
                  SizedBox(height: 24),
                  AppInput(
                    controller:
                        state.phone, // Changed from state.phone to phone
                    onChanged: (value) {
                      formKey.currentState!.validate();
                    },
                    textInputType: TextInputType.phone,
                    label: 'Code de parrainage',
                    placeholder: 'Ex : BabanaExpress237',
                    validator: (value) {
                      return Validators.usPhoneValid(value!);
                    },
                  ),
                  SizedBox(height: 16),
                  Spacer(),
                  BEButton(
                    style: BEButtonStyle.secondary,
                    onPressed: () {
                      AutoRouter.of(context).push(AuthRoute());
                    },
                    text: "Créer votre compte",
                  ),
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
          );
        }));
  }
}

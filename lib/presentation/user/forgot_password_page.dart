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
import 'package:pinput/pinput.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:potatoes/common/widgets/loaders.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  static const routeName = '/forgot';

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with CompletableMixin {
  TextEditingController phoneormail = TextEditingController();

  TextEditingController otpCode = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late final userCubit = context.read<UserCubit>();

  final focusedBorderColor = ColorsApp.primary;
  final fillColor = ColorsApp.primary;
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(fontSize: 22, color: ColorsApp.white),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: ThemeApp.second),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: onEventReceived,
      builder: (context, state) {
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16)
                .add(EdgeInsets.only(bottom: 32)),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 62),
                    child: Text(
                      'Vous avez oublié votre mot de passe ?',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Entrez votre le numéro de téléphone ou l’adresse mail associe(e) a votre compte, un code vous sera envoyé a votre numéro de téléphone.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: ThemeApp.grey,
                        ),
                  ),
                  SizedBox(height: 24),
                  AppInput(
                    controller:
                        phoneormail, // Changed from state.phone to phone
                    onChanged: (value) {
                      userCubit.resetState();
                    },
                    textInputType: TextInputType.text,
                    label: 'Email ou numéro de téléphone',
                    placeholder: 'Ex : 690863838',
                    validator: (value) {
                      return Validators.isValidEmailOrNum(value!);
                    },
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              userCubit.sendRecoveryCode(
                                identifiant: phoneormail.text,
                              );
                            }
                          },
                          child: Text('Renvoyer le code',
                              textAlign: TextAlign.end,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: ThemeApp.second)))
                    ],
                  ),
                  SizedBox(height: 24),
                  if (state is SendedState)
                    Text('Renseignez le code otp reçu via sms ou mail',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: ThemeApp.second)),
                  if (state is SendedState) SizedBox(height: 24),
                  if (state is SendedState)
                    Container(
                        child: Pinput(
                      length: 5,
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      controller: otpCode,
                      submittedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: fillColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      errorPinTheme: defaultPinTheme.copyBorderWith(
                        border: Border.all(color: Colors.redAccent),
                      ),
                      onCompleted: (pin) async {},
                    )),
                  Spacer(),
                  BEButton(
                    style: BEButtonStyle.secondary,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (!(state is SendedState))
                          userCubit.sendRecoveryCode(
                            identifiant: phoneormail.text,
                          );
                        if (state is SendedState)
                          userCubit.verifyCode(
                            identifiant: phoneormail.text,
                            code: otpCode.text,
                          );
                      }

                      // AutoRouter.of(context).push(NewPasswordRoute());
                    },
                    text: "Continuer",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void onEventReceived(BuildContext context, UserState state) async {
    await waitForDialog();

    if (state is AuthLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is SendedState) {
      // AutoRouter.of(context)
      //     .push(RegisterRoute(identifiant: identifintuserNameController.text));
    } else if (state is ValidCodeState) {
      AutoRouter.of(context)
          .push(NewPasswordRoute(identifiant: phoneormail.text));
    } else if (state is AuthErrorState) {
      showErrorToast(state.error);
    }
  }
}

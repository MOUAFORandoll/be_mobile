// ignore_for_file: must_be_immutable

import 'package:BabanaExpress/presentation/components/Button/buttons.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:BabanaExpress/core.dart';
import 'package:pinput/pinput.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';

@RoutePage()
class NewPasswordPage extends StatelessWidget {
  static const routeName = '/newpassword';

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
      border: Border.all(color: ThemeApp.second),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (value) {
        EasyLoading.dismiss();
        AutoRouter.of(context).pop();
      },
      child: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state.isLoadingForgot == 1) {
            EasyLoading.show(
                indicator: CircularProgressIndicator(
                  color: ThemeApp.second,
                ),
                dismissOnTap: true,
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
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16)
                      .add(EdgeInsets.only(bottom: 32)),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 42),
                      child: Text(
                        'Renseignez votre nouveau mot de passe ? ',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      )),
                  SizedBox(height: 56),
                  AppInput(
                    controller:
                        state.phone, // Changed from state.phone to phone
                    onChanged: (value) {
                      formKey.currentState!.validate();
                    },
                    textInputType: TextInputType.phone,
                    label: 'Mot de passe',
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
                    label: 'Répéter le mot de passe',
                    placeholder: 'Ex : 690863838',
                    validator: (value) {
                      return Validators.usPhoneValid(value!);
                    },
                  ),
                  Spacer(),
                  BEButton(
                    style: BEButtonStyle.secondary,
                    onPressed: () {},
                    text: "Continuer",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

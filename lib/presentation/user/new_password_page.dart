// ignore_for_file: must_be_immutable

import 'package:BabanaExpress/presentation/components/Button/buttons.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:BabanaExpress/core.dart';
import 'package:pinput/pinput.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
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
class NewPasswordPage extends StatefulWidget {
  static const routeName = '/newpassword';
  NewPasswordPage({required this.identifiant});
  final String identifiant;
  @override
  _NewPasswordPageState createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage>
    with CompletableMixin {
  late final userCubit = context.read<UserCubit>();

  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
          body: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Padding(
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
                    controller: password, // Changed from state.phone to phone
                    onChanged: (value) {},
                    textInputType: TextInputType.text,
                    label: 'Mot de passe',
                    placeholder: 'Ex : 690863838',
                    validator: (value) {
                      return Validators.required('Mot de passe ', value!);
                    },
                  ),
                  SizedBox(height: 24),
                  AppInput(
                    controller: repassword, // Changed from state.phone to phone
                    onChanged: (value) {},
                    textInputType: TextInputType.text,
                    label: 'Répéter le mot de passe',
                    placeholder: 'Ex : 690863838',
                    validator: (value) {
                      if (value != password.text) {
                        return 'Les mots de passe ne correspondent pas';
                      }
                      return Validators.required(
                          'Répéter le mot de passe', value!);
                    },
                  ),
                  Spacer(),
                  BEButton(
                    style: BEButtonStyle.secondary,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        userCubit.newPassword(
                          identifiant: widget.identifiant,
                          password: password.text,
                        );
                      }
                    },
                    text: 'Continuer',
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
    } else if (state is SuccesChangePasswordState) {
      showSuccessToast('Informations mis a jour avec succes');
      AutoRouter.of(context).pushAndPopUntil(
        HomeRoute(),
        predicate: (_) => false,
      );
    } else if (state is AuthErrorState) {
      showErrorToast(state.error);
    }
  }
}

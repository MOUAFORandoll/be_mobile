import 'package:BabanaExpress/common/bloc/user_cubit.dart';
import 'package:BabanaExpress/presentation/components/Button/AppIconButton.dart';
import 'package:BabanaExpress/presentation/components/Button/buttons.dart';
import 'package:BabanaExpress/presentation/components/Text/TitleComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/icon_svg.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
import 'package:BabanaExpress/common/bloc/user_cubit.dart';
import 'package:BabanaExpress/presentation/components/Button/buttons.dart';
import 'package:BabanaExpress/presentation/components/Widget/icon_svg.dart';
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
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.identifiant});
  final String identifiant;
  static const routeName = '/register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with CompletableMixin {
  final formKey = GlobalKey<FormState>();
  late final userCubit = context.read<UserCubit>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final identifiant = widget.identifiant;
    if (int.tryParse(identifiant) != null) {
      phoneController.text = identifiant;
    } else {
      mailController.text = identifiant;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: onEventReceived,
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ).add(EdgeInsets.only(bottom: 16.0, top: 48)),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
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
                    controller: nameController,
                    textInputType: TextInputType.text,
                    label: 'Votre nom',
                    placeholder: 'Ex : MOUAFO',
                    validator: (value) {
                      // return Validators.required(value);
                    },
                  ),
                  SizedBox(height: 24),
                  AppInput(
                    controller: phoneController,
                    onChanged: (value) {
                      formKey.currentState!.validate();
                    },
                    textInputType: TextInputType.phone,
                    label: 'Numéro de téléphone',
                    placeholder: 'Ex : 690863838',
                    validator: (value) {
                      return Validators.usPhoneValid(value!);
                    },
                  ),
                  AppInput(
                    controller: mailController,
                    onChanged: (value) {
                      formKey.currentState!.validate();
                    },
                    textInputType: TextInputType.phone,
                    label: 'Email',
                    placeholder: 'Ex : 690863838',
                    validator: (value) {
                      return Validators.isValidEmail(value!);
                    },
                  ),
                  SizedBox(height: 24),
                  AppInput(
                    controller: passwordController,
                    onChanged: (value) {
                      formKey.currentState!.validate();
                    },
                    textInputType: TextInputType.visiblePassword,
                    label: 'Mot de passe',
                    placeholder: 'Ex : BabanaExpress237',
                    validator: (value) {
                      return Validators.isValidPassword(value!);
                    },
                  ),
                  SizedBox(height: 24),
                  AppInput(
                    controller: passwordController,
                    textInputType: TextInputType.phone,
                    label: 'Code de parrainage',
                    placeholder: 'Ex : BabanaExpress237',
                  ),
                  SizedBox(height: 16),
                  BEButton(
                    style: BEButtonStyle.secondary,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        userCubit.register(
                          phone: phoneController.text,
                          name: nameController.text,
                          mail: mailController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                    text: 'Créer votre compte',
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
          ),
        ),
      ),
    );
  }

  void onEventReceived(BuildContext context, UserState state) async {
    await waitForDialog();
    print('-lll-------------====');

    if (state is AuthLoadingState) {
      print('--------------====');
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is AuthUserSuccessState) {
      AutoRouter.of(context).push(HomeRoute());
    } else if (state is AuthErrorState) {
      print('----${state.error}------showErrorToast');
      showErrorToast(state.error);
    }
  }
}

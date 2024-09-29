import 'package:BabanaExpress/presentation/components/Button/buttons.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
import 'package:BabanaExpress/common/bloc/user_cubit.dart';
import 'package:BabanaExpress/utils/dialogs.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:potatoes/common/widgets/loaders.dart';

@RoutePage()
class CompleteProfilPage extends StatefulWidget {
  // @CustomRoute(
  //     transitionsBuilder: TransitionsBuilders.slideBottom,
  //     durationInMilliseconds: 400)
  static const routeName = '/completeprofil';
  const CompleteProfilPage({super.key});

  @override
  State<CompleteProfilPage> createState() => _CompleteProfilPageState();
}

class _CompleteProfilPageState extends State<CompleteProfilPage>
    with CompletableMixin {
  final phone = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late final userCubit = context.read<UserCubit>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // appBar: AppBarCustom(
          //   title: 'Completer votre profil',
          // ),
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
          body: BlocConsumer<UserCubit, UserState>(
            listener: onEventReceived,
            builder: (context, state) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16)
                      .add(EdgeInsets.only(bottom: 32)),
              child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 62),
                        child: Text(
                          'Renseignez votre numero de telephone',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Renseignez votre numero de telephone pour  termier la creation de votre compte',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: ThemeApp.grey,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: kMarginY,
                        ),
                        child: AppInput(
                          controller:
                              phone, // Changed from state.phone to phone
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
                      Spacer(),
                      BEButton(
                        style: BEButtonStyle.secondary,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            userCubit.completeProfil(phone: phone.text);
                          }

                          // AutoRouter.of(context).push(NewPasswordRoute());
                        },
                        text: "Poursuivre",
                      ),
                    ],
                  )),
            ),
          )),
    );
  }

  void onEventReceived(BuildContext context, UserState state) async {
    await waitForDialog();

    if (state is UserUpdatingState) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is UserUpdatedState) {
      showSuccessToast('Informations mis a jour avec succes');
      AutoRouter.of(context).push(HomeRoute());
    } else if (state is AuthErrorState) {
      showErrorToast(state.error);
    }
  }
}

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
          appBar: AppBarCustom(
            title: 'Completer votre profil',
          ),
          body: BlocConsumer<UserCubit, UserState>(
              listener: onEventReceived,
              builder: (context, state) => SingleChildScrollView(
                      child: Column(children: [
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
                              TitleComponent(
                                title: 'Renseignez votre numero de telephone',
                                subTitle:
                                    'Renseignez votre numero de telephone pour  termier la creation de votre compte',
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
                              AppButtonSecond(
                                marginAdd: EdgeInsets.symmetric(
                                  horizontal: kMarginX,
                                ),
                                text: 'Poursuivre'.tr(),
                                onTap: () async {
                                  if (formKey.currentState!.validate()) {
                                    userCubit.updateUser(phone: phone.text);
                                  }
                                },
                              )
                            ],
                          )),
                    ),
                  ])))),
    );
  }

  void onEventReceived(BuildContext context, UserState state) async {
    await waitForDialog();

    if (state is UserUpdatingState) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is UserUpdatedState) {
      AutoRouter.of(context).push(HomeRoute());
    } else if (state is AuthErrorState) {
      showErrorToast(state.error);
    }
  }
}

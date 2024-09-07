import 'package:BabanaExpress/presentation/components/Button/AppIconButton.dart';
import 'package:BabanaExpress/presentation/components/Text/TitleComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/icon_svg.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';

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

class _CompleteProfilPageState extends State<CompleteProfilPage> {
  final phone = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBarCustom(
            title: 'Completer votre profil',
          ),
          body: BlocConsumer<UserBloc, UserState>(
              listener: (context, state) {
                if (state.isUpdateUserInfo == 0) {
                  EasyLoading.show(
                      indicator: CircularProgressIndicator(
                        color: ColorsApp.second,
                      ),
                      dismissOnTap: true,
                      maskType: EasyLoadingMaskType.black);
                } else if (state.isUpdateUserInfo == 1) {
                  EasyLoading.dismiss();

                  BlocProvider.of<HomeBloc>(context).add(UserDataEvent());
                  AutoRouter.of(context).replaceAll([HomeRoute()]);
                } else {
                  EasyLoading.dismiss();
                  if (state.authenticationFailedMessage != null &&
                      state.authenticationFailedMessage!.isNotEmpty) {
                    showError(state.authenticationFailedMessage!, context);
                  }
                }
              },
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
                              AppButtonSecond(
                                size: MainAxisSize.max,
                                marginAdd: EdgeInsets.symmetric(
                                  horizontal: kMarginX,
                                ),
                                text: 'Poursuivre'.tr(),
                                onTap: () async {
                                  if (formKey.currentState!.validate()) {
                                    context.read<UserBloc>().add(UpdateUserInfo(
                                        data: {'phone': state.phone.text}));
                                  }
                                },
                              )
                            ],
                          )),
                    ),
                  ])))),
    );
  }
}

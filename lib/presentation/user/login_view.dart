// ignore_for_file: must_be_immutable

import 'package:BananaExpress/presentation/components/Button/app_button.dart'; 
import 'package:BananaExpress/utils/Services/validators.dart';
import 'package:BananaExpress/utils/functions/showToast.dart';
import 'package:auto_route/auto_route.dart';
import 'package:BananaExpress/application/export_bloc.dart';
import 'package:BananaExpress/presentation/components/exportcomponent.dart';

import 'package:BananaExpress/core.dart';
import 'package:BananaExpress/routes/app_router.gr.dart';

import '../../../utils/functions/app_loader.dart';

class LoginView extends StatelessWidget {
  var loader = AppLoader.bounceLargeColorLoaderController();
  TextEditingController phone = TextEditingController();

  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state.isLoading == 1) {
            loader.open(context);
          } else if (state.isLoading == 3) {
            loader.close();
            showError(state.authenticationFailedMessage!, context);
          } else if (state.isLoading == 2) {
            AutoRouter.of(context).replaceAll([HomeRoute()]);
            showSuccess('Connecte', context);
            initLoad(context);
            loader.close();
            print('-----44--------*********');
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: kMarginX),
              padding: EdgeInsets.only(
                top: kMarginY,
              ),
              child: Form(
                key: formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: kMarginY,
                        ),
                        child: Text(
                          'Acceder a votre compte et faites vous livrer !'.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 19,
                            color: ColorsApp.orange,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                          margin:
                              EdgeInsets.only(top: kMarginY, bottom: kMarginY),
                          padding: EdgeInsets.symmetric(
                            vertical: kMarginY * 5,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: kMarginY * 2,
                                ),
                                child: AppInput(
                                  controller: phone,
                                  onChanged: (value) {},
                                  placeholder: 'labelphone'.tr(),
                                  validator: (value) {
                                    return Validators.usPhoneValid(value!);
                                  },
                                ),
                              ),
                              AppInputPassword(
                                controller: password,
                                placeholder: 'labelpassword'.tr(),
                                obscureText: true,
                                validator: (value) {
                                  //print(value);
                                  return Validators.required(
                                      'Mot de passe', value!);
                                },
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: kMarginY),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        // Get.toNamed(AppLinks.FORGOT);
                                      },
                                      child: Text('forgotpass'.tr(),
                                          style: TextStyle(
                                            fontFamily: 'Lato',
                                            color: ColorsApp.primary,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              AppButton(
                                  size: MainAxisSize.max,
                                  // loading: _userState.isLoading,
                                  // bgColor: ColorsApp.primary,
                                  text: 'logbtn'.tr(),
                                  onTap: () async {
                                    print({
                                      'password': password.text,
                                      'phone': phone.text,
                                    });

                                    if (formKey.currentState!.validate()) {
                                      context.read<UserBloc>().add(SignInEvent(
                                            password: password.text,
                                            phone: phone.text,
                                          ));
                                    }
                                  }),
                              InkWell(
                                  onTap: () =>
                                      BlocProvider.of<AppActionCubit>(context)
                                          .toRegister(),
                                  child: Container(
                                    margin: EdgeInsets.only(top: kMarginX * 3),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('regbtn'.tr(),
                                            style: TextStyle(
                                                fontFamily: 'Lato',
                                                color: ColorsApp.second,
                                                fontSize: 15)),
                                        Icon(
                                          Icons.keyboard_arrow_right_outlined,
                                          color: ColorsApp.second,
                                        )
                                      ],
                                    ),
                                  )),
                            ],
                          )),
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}

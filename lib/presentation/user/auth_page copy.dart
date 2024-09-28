// import 'package:BabanaExpress/presentation/components/Button/AppIconButton.dart';
// import 'package:BabanaExpress/presentation/components/Button/buttons.dart';
// import 'package:BabanaExpress/presentation/components/Text/TitleComponent.dart';
// import 'package:BabanaExpress/presentation/components/Widget/icon_svg.dart';
// import 'package:BabanaExpress/utils/Services/validators.dart';
// import 'package:BabanaExpress/application/export_bloc.dart';
// import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
// import 'package:BabanaExpress/utils/constants/assets.dart';
// import 'package:BabanaExpress/routes/app_router.gr.dart';

// @RoutePage()
// class AuthPage extends StatefulWidget {
//   // @CustomRoute(
//   //     transitionsBuilder: TransitionsBuilders.slideBottom,
//   //     durationInMilliseconds: 400)
//   static const routeName = '/auth';
//   const AuthPage({super.key});

//   @override
//   State<AuthPage> createState() => _AuthPageState();
// }

// class _AuthPageState extends State<AuthPage> {
//   final formKey = GlobalKey<FormState>();

//   final TextEditingController identifintuserNameController;
//   final TextEditingController passwordController;
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<UserBloc, UserState>(
//       listener: (context, state) {
//         if (state.isExistLoading == 0) {
//           EasyLoading.show(
//               indicator: CircularProgressIndicator(
//                 color: ThemeApp.second,
//               ),
//               dismissOnTap: true,
//               maskType: EasyLoadingMaskType.black);
//         } else if (state.isExistLoading == 1) {
//           print('ooooooooo');
//           EasyLoading.dismiss();
//         } else if (state.isExistLoading == 2) {
//           EasyLoading.dismiss();
//           AutoRouter.of(context).push(RegisterRoute());

//           print('-----44--------*********');
//         }
//         if (state.isLoading == 1) {
//           EasyLoading.show(
//               indicator: CircularProgressIndicator(
//                 color: ThemeApp.second,
//               ),
//               dismissOnTap: true,
//               maskType: EasyLoadingMaskType.black);
//         } else if (state.isLoading == 3) {
//           EasyLoading.dismiss();
//           showError(state.authenticationFailedMessage!, context);
//         } else if (state.isLoading == 2) {
//           if (state.completeprofil != null) {
//             if (state.completeprofil!) {
//               AutoRouter.of(context).replaceAll([CompleteProfilRoute()]);
//             } else {
//               AutoRouter.of(context).replaceAll([HomeRoute()]);
//             }
//           }
//           showSuccess('Connecte', context);

//           EasyLoading.dismiss();
//           print('-----44--------*********');
//         }
//       },
//       builder: (context, state) => Scaffold(
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 16.0,
//           ).add(EdgeInsets.only(bottom: 16.0, top: 48)),
//           child: Form(
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             key: formKey,
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     SvgIcon(
//                       icon: Assets.logo_second,
//                       height: 32,
//                       width: 32,
//                     ),
//                     Text(
//                       'Babana Express',
//                       style: Theme.of(context).textTheme.titleMedium,
//                     ),
//                     Container(),
//                   ],
//                 ),
//                 SizedBox(height: 64),
//                 AppInput(
//                   controller: identifintuserNameController, // Changed from state.phone to phone
//                   onChanged: (value) {},
//                   textInputType: TextInputType.phone,
//                   label: 'Email ou numéro de téléphone',
//                   placeholder: 'Ex : 690863838',
//                   validator: (value) {
//                     return Validators.usPhoneValid(value!);
//                   },
//                 ),
//                 if (state.loginUser != null && state.loginUser == true)
//                   SizedBox(height: 16),
//                 if (state.loginUser != null && state.loginUser == true)
//                   AppInput(
//                     controller:
//                        passwordController, // Changed from state.phone to phone
//                     onChanged: (value) {
//                       formKey.currentState!.validate();
//                     },
//                     textInputType: TextInputType.phone,
//                     label: 'Mot de passe',
//                     placeholder: 'Ex : BabanaExpress237',
//                     validator: (value) {
//                       return Validators.isValidPassword(value!);
//                     },
//                   ),
//                 SizedBox(height: 16),
//                 BEButton(
//                   style: BEButtonStyle.secondary,
//                   onPressed: () {
//                     if (formKey.currentState!.validate()) {
//                       context.read<UserBloc>().add(state.loginUser == true
//                           ? SignInEvent()
//                           : VerifUserExist());
//                     }
//                   },
//                   text: 'Continuer',
//                 ),
//                 SizedBox(height: 16),
//                 TextButton(
//                     onPressed: () =>
//                         AutoRouter.of(context).push(ForgotPasswordRoute()),
//                     child: Text('Problème de connexion ?',
//                         style: Theme.of(context)
//                             .textTheme
//                             .bodySmall!
//                             .copyWith(color: ThemeApp.second))),
//                 SizedBox(height: 84),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Divider(
//                         color: ThemeApp.grey,
//                         thickness: .4,
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 10),
//                       child: Text('OU',
//                           style: TextStyle(
//                             color: ThemeApp.grey,
//                           )),
//                     ),
//                     Expanded(
//                       child: Divider(
//                         color: ThemeApp.grey,
//                         thickness: .4,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 84),
//                 _buildSocialLoginButtons(),
//                 SizedBox(height: 16),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 16),
//                   child: RichText(
//                     textAlign: TextAlign.center,
//                     text: TextSpan(
//                       text: 'En créant un compte, tu acceptes nos ',
//                       style: Theme.of(context).textTheme.bodySmall,
//                       children: [
//                         TextSpan(
//                           text: "conditions d'utilisation ",
//                           style:
//                               Theme.of(context).textTheme.titleSmall!.copyWith(
//                                     color: ThemeApp.second,
//                                   ),
//                         ),
//                         TextSpan(
//                           text: 'et ',
//                           style: Theme.of(context).textTheme.bodySmall,
//                         ),
//                         TextSpan(
//                           text: 'notre politique de confidentialité.',
//                           style:
//                               Theme.of(context).textTheme.titleSmall!.copyWith(
//                                     color: ThemeApp.second,
//                                   ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSocialLoginButtons() {
//     return Column(
//       children: [
//         BEButton(
//           style: BEButtonStyle.auth,
//           onPressed: () {
//             context.read<UserBloc>().add(SignInSocialEvent());
//           },
//           text: 'Continuer avec Google',
//           authProvider: AuthProvider.google,
//         ),
//         SizedBox(height: 16),
//         BEButton(
//           style: BEButtonStyle.auth,
//           onPressed: () {},
//           text: 'Continuer avec Facebook',
//           authProvider: AuthProvider.facebook,
//         ),
//         SizedBox(height: 16),
//         BEButton(
//           style: BEButtonStyle.auth,
//           onPressed: () {},
//           text: 'Continuer avec Apple',
//           authProvider: AuthProvider.apple,
//         ),
//       ],
//     );
//   }
// }

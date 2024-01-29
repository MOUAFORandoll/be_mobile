import 'package:BananaExpress/presentation/user/login_view.dart';
import 'package:BananaExpress/presentation/user/register_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../old/components/exportcomponent.dart';
import 'package:BananaExpress/application/export_bloc.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  static const routeName = '/auth';
  const AuthPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppActionCubit, AppActionState>(
        builder: (context, state) {
      

      if (state.isLogin) {
        return LoginView();
      } else {
        return RegisterView();
      }
    });
  }
}

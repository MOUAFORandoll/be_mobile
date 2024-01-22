import 'package:BananaExpress/components/Button/app_button.dart';
import 'package:BananaExpress/components/Widget/app_input.dart';
import 'package:BananaExpress/ui/general_action/cubit/app_action_cubit.dart';
import 'package:BananaExpress/ui/general_action/cubit/app_action_state.dart';
import 'package:BananaExpress/ui/user/bloc/user_bloc.dart';
import 'package:BananaExpress/ui/user/bloc/user_event.dart';
import 'package:BananaExpress/ui/user/bloc/user_state.dart';
import 'package:BananaExpress/ui/user/views/login_view.dart';
import 'package:BananaExpress/ui/user/views/register_view.dart';
import 'package:BananaExpress/utils/Services/validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/exportcomponent.dart';
import '../../../utils/Services/routes.dart';

class AuthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppActionCubit, AppActionState>(
        builder: (context, state) {
      if (state is ToRegisterState) {
        return RegisterView();
      } else {
        return LoginView();
      }
    });
  }
}

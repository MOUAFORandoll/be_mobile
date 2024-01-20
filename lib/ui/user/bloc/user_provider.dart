// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'user_bloc.dart';
// import 'user_state.dart';

// class UserProvider extends BlocProvider<UserBloc> {
//   UserProvider({
//     Key? key,
//   }) : super(
//           key: key,
//           create: (context) => UserBloc(),
//           child: UserView(),
//         );
// }

// class UserView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // ignore: close_sinks
//     final userBloc = BlocProvider.of<UserBloc>(context);

//     final scaffold = Scaffold(
//       body: BlocBuilder<UserBloc, UserState>(
//         buildWhen: (pre, current) => true,
//         builder: (context, state) {
//           return Center(
//             child: Text("Hi...Welcome to BLoC"),
//           );
//         },
//       ),
//     );

//     return MultiBlocListener(
//       listeners: [
//         BlocListener<UserBloc, UserState>(
//           listenWhen: (pre, current) => pre.error != current.error,
//           listener: (context, state) {
//             if (state.error?.isNotEmpty ?? false)
//               print("ERROR: ${state.error}");
//           },
//         ),
//       ],
//       child: scaffold,
//     );
//   }
// }

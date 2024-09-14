import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import '../../../application/export_bloc.dart';

// ignore: must_be_immutable
class KHomeInfo extends StatelessWidget {
  // KHomeInfo({required this.user});
  // final user;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
        builder: (context, state) => Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ColorsApp.white),
              margin: EdgeInsets.only(right: kMarginY),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    state.isVilleQuartier == 0
                        ? Skeletonizer(
                            enabled: true,
                            child: Container(
                              child: Column(children: [
                                BlocBuilder<AppActionCubit, AppActionState>(
                                    builder: (context, state) => Container(
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: state.isInternetConnection
                                                  ? ThemeApp.second
                                                  : ColorsApp.orange),
                                        )),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          child: Icon(
                                        Icons.location_on,
                                        color: ColorsApp.white,
                                        size: 25,
                                      )),
                                      Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    child: Text(
                                                        'Votre quartierVotre',
                                                        style: TextStyle(
                                                            color:
                                                                ColorsApp.white,
                                                            fontSize: 8,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal))),
                                                Container(
                                                    child: Text(
                                                        'Votre villeVotre',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color:
                                                              ColorsApp.white,
                                                          fontSize: 8,
                                                        ))),
                                              ])),
                                    ]),
                              ]),
                            ))
                        : state.isVilleQuartier == 1
                            ? Container(
                                child: Column(
                                  children: [
                                    BlocBuilder<AppActionCubit, AppActionState>(
                                        builder: (context, state) => Container(
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color:
                                                      state.isInternetConnection
                                                          ? ThemeApp.second
                                                          : ColorsApp.orange),
                                            )),
                                    Row(children: [
                                      Container(
                                          child: Icon(
                                        Icons.location_on,
                                        color: ColorsApp.primary,
                                        size: 20,
                                      )),
                                      Container(
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                            Container(
                                                child: Text(state.quartierUser!,
                                                    style: TextStyle(
                                                        color:
                                                            ColorsApp.primary,
                                                        fontSize: 8,
                                                        fontWeight: FontWeight
                                                            .normal))),
                                            Container(
                                                child: Text(state.villeUser!,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: ColorsApp.primary,
                                                      fontSize: 11,
                                                    ))),
                                          ])),
                                    ]),
                                  ],
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  BlocProvider.of<UserBloc>(context)
                                      .add(GetVilleQuartier());
                                },
                                child: Row(
                                  children: [
                                    Container(
                                        child: Text('Retry',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              color: ColorsApp.red,
                                              fontSize: 11,
                                            ))),
                                    Icon(
                                      Icons.refresh,
                                      color: ColorsApp.red,
                                    ),
                                  ],
                                ),
                              )
                  ]),
            ));
  }
}

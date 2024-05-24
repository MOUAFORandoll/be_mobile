import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import '../../../application/export_bloc.dart';

// ignore: must_be_immutable
class KHomeInfo extends StatelessWidget {
  // KHomeInfo({required this.user});
  // final user;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: ColorsApp.white.withOpacity(.9)),
        margin: EdgeInsets.only(right: kMarginY),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<UserBloc, UserState>(
                builder: (context, state) => state.isVilleQuartier == 0
                    ? Shimmer.fromColors(
                        baseColor: ColorsApp.greyNew,
                        highlightColor: ColorsApp.primary,
                        child: Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    child: Icon(
                                  Icons.location_on,
                                  color: ColorsApp.white,
                                  size: 25,
                                )),
                                Container(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                      Container(
                                          child: Text('Votre quartier',
                                              style: TextStyle(
                                                  color: ColorsApp.white,
                                                  fontSize: 8,
                                                  fontWeight:
                                                      FontWeight.normal))),
                                      Container(
                                          child: Text('Votre ville',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                color: ColorsApp.white,
                                                fontSize: 11,
                                              ))),
                                    ])),
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
                                              color: state.isInternetConnection
                                                  ? ColorsApp.second
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
                                                    color: ColorsApp.primary,
                                                    fontSize: 8,
                                                    fontWeight:
                                                        FontWeight.normal))),
                                        Container(
                                            child: Text(state.villeUser!,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w800,
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
                          )),
          ],
        ));
  }
}

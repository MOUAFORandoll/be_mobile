import 'package:BananaExpress/presentation/components/exportcomponent.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../application/export_bloc.dart';

// ignore: must_be_immutable
class KHomeInfo extends StatelessWidget {
  KHomeInfo({required this.user});
  final user;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<UserBloc, UserState>(
            builder: (context, state) => state.isVilleQuartier == 0
                ? Shimmer.fromColors(
                    baseColor: ColorsApp.grey,
                    highlightColor: ColorsApp.primary,
                    child: Container(
                      child: Row(children: [
                        Container(
                            child: Icon(
                          Icons.location_on,
                          color: ColorsApp.white,
                          size: 25,
                        )),
                        Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Container(
                                  child: Text('Votre quartier',
                                      style: TextStyle(
                                          color: ColorsApp.white,
                                          fontSize: 8,
                                          fontWeight: FontWeight.normal))),
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
                        child: Row(children: [
                          Container(
                              child: Icon(
                            Icons.location_on,
                            color: ColorsApp.white,
                            size: 25,
                          )),
                          Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Container(
                                    child: Text(state.quartierUser!,
                                        style: TextStyle(
                                            color: ColorsApp.white,
                                            fontSize: 8,
                                            fontWeight: FontWeight.normal))),
                                Container(
                                    child: Text(state.villeUser!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: ColorsApp.white,
                                          fontSize: 11,
                                        ))),
                              ])),
                        ]),
                      )
                    : InkWell(
                        onTap: () {
                          BlocProvider.of<UserBloc>(context)
                              .add(GetVilleQuartier());
                        },
                        child: Row(
                          children: [
                            Container(
                                child: Text('Error',
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
        Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: ColorsApp.white, width: 2))),
            padding: EdgeInsets.symmetric(vertical: kMarginY / 4),
            child: Text('Hey, ' + user.nom,
                style: TextStyle(
                  color: ColorsApp.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 11,
                )))
      ],
    ));
  }
}

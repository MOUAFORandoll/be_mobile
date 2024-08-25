import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/application/model/exportmodel.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

// ignore: must_be_immutable
class LivraisonUserHomeComponent extends StatelessWidget {
  LivraisonUserHomeModel livraison;

  LivraisonUserHomeComponent({required this.livraison});
  GlobalKey globalKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            height: getHeight(context) * .1,
            width: getWidth(context) * .8,
            padding: EdgeInsets.symmetric(vertical: kMarginY),
            margin: EdgeInsets.symmetric(
              vertical: kMarginY,
            ).add(EdgeInsets.only(right: kMarginX)),
            decoration: BoxDecoration(
                color: ColorsApp.white.withOpacity(0.9),
                boxShadow: [
                  BoxShadow(
                    color: ColorsApp.primary.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(8)),
            alignment: Alignment.center,
            child: Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      height: getHeight(context) * .2,
                      width: getWidth(context) * .15,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(
                            Assets.login,
                          ),
                        ),
                      ),
                    )),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: kMarginY),
                      child: Text(
                        livraison.libelle,
                        style: TextStyle(
                            // color: ColorsApp.white,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: kMarginY / 3),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: kMarginY),
                            child: Text(
                              livraison.description,
                              style: TextStyle(
                                // color: ColorsApp.white,
                                fontSize: 11,
                                fontFamily: 'Helvetica',
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: ([0, 1].contains(livraison.status_int)
                                        ? ColorsApp.red
                                        : livraison.status_int == 2
                                            ? ColorsApp.second
                                            : ColorsApp.second)
                                    .withOpacity(0.9),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorsApp.primary.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                top: kMarginY / 3, left: kMarginY),
                            padding: EdgeInsets.all(3),
                            child: Text(livraison.status,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: ColorsApp.white,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
              ],
            )),
        onTap: () {
          BlocProvider.of<HomeBloc>(context)
              .add(FindLivraisonById(idLivraison: livraison.id));
          AutoRouter.of(context)
              .push(LivraisonDataHomeRoute(livraison: livraison));
        });
  }
}

import 'package:BabanaExpress/routes/app_router.gr.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../application/export_bloc.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage()
class SuccesLivraisonType2Page extends StatelessWidget {
  const SuccesLivraisonType2Page({super.key});
  static const routeName = '/livraison/success-type2';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LivraisonBloc, LivraisonState>(
        listener: (context, state) {
          // if (state.isDownloadFacture == 1) {
          //   EasyLoading.dismiss();
          //   showSuccess('successaveFacture'.tr(), context);
          // } else if (state.isDownloadFacture == 2) {
          //   EasyLoading.dismiss();
          //   showError('errorsaveFature'.tr(), context);
          // } else if (state.isDownloadFacture == 3) {
          //    EasyLoading.show(
          // indicator: CircularProgressIndicator(
          //   color: ThemeApp.second,
          // ),
          //       dismissOnTap: true,
          //
          //       maskType: EasyLoadingMaskType.black);
          // }
        },
        builder: (context, state) => Container(
            child: Scaffold(
                backgroundColor: ColorsApp.white,
                body: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: kMarginY * 4, horizontal: kMarginX),
                    child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TitleComponent(
                            title: 'Confirmation de livraison'.tr(),
                            subTitle:
                                'Vous avez confirme cette livraison de colis'
                                    .tr(),
                          ),
                          SizedBox(
                            height: getHeight(context) * .15,
                          ),
                          SvgPicture.asset(
                            Assets.livraison_success,
                            height: getHeight(context) * .30,
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                vertical: kMarginY * 2,
                              ),
                              child: Text('succesLivraison'.tr(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: ColorsApp.primary))),
                          Column(
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(
                                      vertical: kMarginY / 2),
                                  child: Text(
                                    'Envoyer ce lien au detenteur du colis pour validation'
                                        .tr(),
                                    textAlign: TextAlign.center,
                                  )),
                              InkWell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        vertical: kMarginY,
                                        horizontal: kMarginX),
                                    margin: EdgeInsets.symmetric(
                                        vertical: kMarginY,
                                        horizontal: kMarginX),
                                    decoration: BoxDecoration(
                                        color: ColorsApp.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                ColorsApp.grey.withOpacity(0.8),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(),
                                        Container(
                                          child: Text(
                                            state.urlLivraison!,
                                          ),
                                        ),
                                        Icon(FontAwesomeIcons.shareNodes),
                                      ],
                                    ),
                                  ),
                                  onTap: () async =>
                                      _shareCode(state.urlLivraison)),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: kMarginY * 4,
                                ),
                                child: AppButtonSecond(
                                  // border: Border.all(color: ColorsApp.primary),
                                  text: 'yMenu'.tr(),
                                  onTap: () async {
                                    context
                                        .read<HomeBloc>()
                                        .add(SetIndexEvent(index: 0));

                                    BlocProvider.of<HomeBloc>(context)
                                        .add(UserDataEvent());

                                    AutoRouter.of(context)
                                        .replaceAll([HomeRoute()]);
                                  },
                                ),
                              )
                            ],
                          )
                        ])))));
  }

  Future<void> _shareCode(lienLivraison) async {
    await Share.share(
        'Une livraison dont vous etes en pocession du colis nous a ete signale, suivez ce lien pour validation :  ${lienLivraison}'
            .tr(),
        subject:
            'Cliquer sur ce lien pour valider la recuperation du colis'.tr() +
                '${lienLivraison}');
    print('save');
  }
}

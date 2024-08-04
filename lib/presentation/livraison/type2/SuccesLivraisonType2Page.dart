import 'package:BabanaExpress/routes/app_router.gr.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

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
          //   color: ColorsApp.second,
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
                        vertical: 10, horizontal: kMarginX),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: ColorsApp.second,
                              borderRadius: BorderRadius.circular(60),
                            ),
                            padding: EdgeInsets.all(kMarginY * 1.5),
                            child: Icon(Icons.check,
                                color: Colors.white, size: 40.0),
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
                                        Icon(
                                          Icons
                                              .switch_access_shortcut_add_outlined,
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () async =>
                                      _shareCode(state.urlLivraison)),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: kMarginY * 4,
                                ),
                                child: AppButton(
                                  size: MainAxisSize.max,
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
        'Envoyer ce lien au detenteur du colis pour validation :  ${lienLivraison}'
            .tr(),
        subject:
            'Cliquer sur ce lien pour valider la recuperation du colis'.tr() +
                '${lienLivraison}');
    print('save');
  }
}

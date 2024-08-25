import 'package:BabanaExpress/routes/app_router.gr.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../application/export_bloc.dart';

@RoutePage()
class SuccesLivraisonType1Page extends StatelessWidget {
  const SuccesLivraisonType1Page({super.key});
  static const routeName = '/livraison/success';
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
                              vertical: kMarginY * 4,
                            ),
                            child: Text('succesLivraison'.tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(color: ColorsApp.primary))),
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: kMarginY * 4,
                          ),
                          child: AppButtonSecond(
                            size: MainAxisSize.max,
                            // border: Border.all(color: ColorsApp.primary),
                            text: 'yMenu'.tr(),
                            onTap: () async {
                              context
                                  .read<HomeBloc>()
                                  .add(SetIndexEvent(index: 0));

                              BlocProvider.of<HomeBloc>(context)
                                  .add(UserDataEvent());

                              AutoRouter.of(context).replaceAll([HomeRoute()]);
                            },
                          ),
                        )
                      ],
                    )))));
  }
}

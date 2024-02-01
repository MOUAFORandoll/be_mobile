import 'package:BananaExpress/presentation/components/Button/app_button.dart';
import 'package:BananaExpress/routes/app_router.gr.dart';
import 'package:BananaExpress/utils/functions/app_loader.dart';
import 'package:BananaExpress/utils/functions/showToast.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:BananaExpress/presentation/components/exportcomponent.dart';

import '../../application/export_bloc.dart';

@RoutePage()
class SuccesLivraisonPage extends StatelessWidget {
  const SuccesLivraisonPage({super.key});
  static const routeName = '/livraison/success';
  @override
  Widget build(BuildContext context) {
    var loader = AppLoader.bounceLargeColorLoaderController();
    return BlocConsumer<LivraisonBloc, LivraisonState>(
        listener: (context, state) {
          if (state.isDownloadFacture == 1) {
            loader.close();
            showSuccess('successaveFacture'.tr(), context);
          } else if (state.isDownloadFacture == 2) {
            loader.close();
            showError('errorsaveFature'.tr(), context);
          } else if (state.isDownloadFacture == 3) {
            loader.open(context);
          }
        },
        builder: (context, state) => Container(
            child: Scaffold(
                backgroundColor: ColorsApp.white,
                appBar:
                    AppBar(backgroundColor: Colors.transparent, elevation: 0),
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
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: kMarginY * 2,
                          ),
                          child: AppButton(
                            size: MainAxisSize.max,
                            // border: Border.all(color: ColorsApp.primary),
                            text: 'ydFacture'.tr(),
                            onTap: () async {
                              context
                                  .read<LivraisonBloc>()
                                  .add(DownloadFacture());
                            },
                          ),
                        ),
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
                                  .add(SetIndexEvent(index: 1));
                              AutoRouter.of(context).replaceAll([HomeRoute()]);
                            },
                          ),
                        )
                      ],
                    )))));
  }
}

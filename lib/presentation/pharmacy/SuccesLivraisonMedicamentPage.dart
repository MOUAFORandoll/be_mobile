import 'package:BabanaExpress/routes/app_router.gr.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import '../../application/export_bloc.dart';

@RoutePage()
class SuccesLivraisonMedicamentPage extends StatelessWidget {
  const SuccesLivraisonMedicamentPage({super.key});
  static const routeName = '/livraison/medicament/success';
  @override
  Widget build(BuildContext context) { 
    return BlocConsumer<PharmacyBloc, PharmacyState>(
        listener: (context, state) {
          if (state.isDownloadFacture == 1) {
            EasyLoading.dismiss();
            showSuccess('successaveFacture'.tr(), context);
          } else if (state.isDownloadFacture == 2) {
            EasyLoading.dismiss();
            showError('errorsaveFature'.tr(), context);
          } else if (state.isDownloadFacture == 3) {
            EasyLoading.show(
                dismissOnTap: true,
                status: 'En cours',
                maskType: EasyLoadingMaskType.black);
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
                            child: Text('succesLivraisonMedoc'.tr(),
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
                              // context
                              //     .read<LivraisonBloc>()
                              //     .add(DownloadFacture());
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

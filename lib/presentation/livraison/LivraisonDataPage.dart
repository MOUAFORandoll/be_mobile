// ignore_for_file: must_be_immutable

import 'package:BabanaExpress/application/model/exportmodel.dart';
import 'package:BabanaExpress/core.dart'; 
import 'package:BabanaExpress/presentation/components/Widget/custom_alert.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:open_filex/open_filex.dart';
import '../../application/export_bloc.dart';

@RoutePage()
class LivraisonDataPage extends StatelessWidget {
  LivraisonModel livraison;
  LivraisonDataPage({required this.livraison});
  static const routeName = '/livraison/data';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LivraisonBloc, LivraisonState>(
        listener: (context, state) async {
          if (state.isDownloadFacture == 1) {
            EasyLoading.dismiss();
            if (state.launchUrl != null && state.launchUrl!.isNotEmpty) {
              OpenFilex.open(state.launchUrl!);
            }
            showSuccess('successaveFacture'.tr(), context);
          } else if (state.isDownloadFacture == 2) {
            EasyLoading.dismiss();
            showError('errorsaveFature'.tr(), context);
          } else if (state.isDownloadFacture == 0) {
            EasyLoading.show(
                dismissOnTap: true,
                status: 'En cours',
                maskType: EasyLoadingMaskType.black);
          }
        },
        builder: (context, state) => Scaffold(
            appBar: AppBarCustom(
              title: 'Vos Colis'.tr(),
              actions: [
                InkWell(
                    child: Container(
                        margin: EdgeInsets.only(right: kMarginX),
                        child: Icon(Icons.print)),
                    onTap: () {
                      CustomArlert().comfirm(
                          context: context,
                          content:
                              'Voulez-vous imprimer le recu de livraison'.tr(),
                          onpressed: (() {
                            context
                                .read<LivraisonBloc>()
                                .add(DownloadFacture(id: livraison.id));
                          }));
                    })
              ],
            ),
            body: RefreshIndicator(
              color: ColorsApp.second,
              onRefresh: () =>
                  Future.delayed(Duration(seconds: 5), () => initLoad(context)),
              child: Container(
                margin: EdgeInsets.only(top: kMarginY * 2)
                    .add(EdgeInsets.symmetric(horizontal: kMarginX * 2)),
                child: SingleChildScrollView(
                    child: Column(children: [
                  GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15.0,
                          childAspectRatio: 5,
                          mainAxisExtent: 200,
                          mainAxisSpacing: 15.0),
                      itemCount: livraison.colis.length,
                      itemBuilder: (_ctx, index) =>
                          ColisComponentUser(colis: livraison.colis[index])),
                ])),
              ),
            )));
  }
}

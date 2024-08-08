// ignore_for_file: must_be_immutable

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
import 'package:open_filex/open_filex.dart';
import '../../application/export_bloc.dart';

@RoutePage()
class LivraisonDataHomePage extends StatelessWidget {
  var livraison;
  LivraisonDataHomePage({required this.livraison});
  static const routeName = '/livraison/data-home';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        listener: (context, stateH) async {
          if (stateH.isLoadLivraison == 2) {
            showError('Une erreur est survenue'.tr(), context);
          }
        },
        builder: (contextH, stateH) => BlocConsumer<LivraisonBloc,
                LivraisonState>(
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
                    indicator: CircularProgressIndicator(
                      color: ColorsApp.second,
                    ),
                    dismissOnTap: true,
                    maskType: EasyLoadingMaskType.black);
              }
            },
            builder: (context, state) => Scaffold(
                appBar: AppBarCustom(
                  title: 'Votre Livraison'.tr(),
                ),
             
                body: RefreshIndicator(
                  color: ColorsApp.second,
                  onRefresh: () => Future.delayed(
                      Duration(seconds: 5),
                      () => context
                          .read<HomeBloc>()
                          .add(FindLivraisonById(idLivraison: livraison.id))),
                  child: Container(
                      margin: EdgeInsets.only(top: kMarginY * 2)
                          .add(EdgeInsets.symmetric(horizontal: kMarginX * 2)),
                      child: stateH.isLoadLivraison == 0
                          ? ShimmerLivraison()
                          : SingleChildScrollView(
                              child: Column(
                                children: [
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 15.0,
                                      childAspectRatio: 5,
                                      mainAxisExtent: 200,
                                      mainAxisSpacing: 15.0,
                                    ),
                                    itemCount: _getItemCount(stateH),
                                    itemBuilder: (_ctx, index) =>
                                        _getComponentForIndex(stateH, index),
                                  ),
                                ],
                              ),
                            )),
                ))));
  }

  int _getItemCount(stateH) {
    if ([1, 2].contains(stateH.service_id)) {
      print('--------');
      return stateH.livraison.colis.length;
    } else if (stateH.service_id == 3) {
      return stateH.livraison.medicaments.length;
    } else {
      return stateH.livraison.produits.length;
    }
  }

  Widget _getComponentForIndex(stateH, int index) {
    if ([1, 2].contains(stateH.service_id)) {
      return ColisComponentUser(colis: stateH.livraison.colis[index]);
    } else if (stateH.service_id == 3) {
      return MedicamentComponentUser(
          medicament: stateH.livraison.medicaments[index]);
    } else {
      return ProduitComponentUser(produit: stateH.livraison.produits[index]);
    }
  }
}

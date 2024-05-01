 
import 'package:BabanaExpress/presentation/market/ListProduitsView.dart'; 
import '../../presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';

class MarketView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketBloc, MarketState>(
        builder: (context, state) => Container(
            padding: EdgeInsets.symmetric(horizontal: kMarginX),
            child: Column(children: [
              // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              // Container(
              //   child: Text('Market Place',
              //       style:
              //           TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              // ),
            /*   Container(
                  margin: EdgeInsets.only(
                    top: kMarginY,
                  ),
                  padding: EdgeInsets.all(6)
                      .add(EdgeInsets.symmetric(horizontal: 5)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BtnTextIcon(
                            title: 'Historique'.tr(),
                            icon: Icons.list,
                            onTap: () => AutoRouter.of(context)
                                .push(HistoriqueLivraisonMarketRoute())),
                        BtnTextIcon(
                            title: 'Shopping Cart'.tr(),
                            icon: Icons.shopping_cart_outlined,
                            onTap: () =>
                                AutoRouter.of(context).push(ShoppingRoute())),
                        BtnTextIcon(
                            title: 'Actualiser'.tr(),
                            icon: Icons.refresh,
                            onTap: () => BlocProvider.of<MarketBloc>(context)
                                .add(GetProduits())),
                      ])),
             */  // ]),
              SingleChildScrollView(child: ListProduitsView())
            ])));
  }
}

import 'package:BabanaExpress/presentation/components/Text/bigtitleText.dart';
import 'package:BabanaExpress/presentation/components/Widget/EmptyLivraisonsComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/ErrorReloadComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/LivraisonMarketUserComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/ShimmerLivraison.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_bar_custom.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';

@RoutePage()
// ignore: must_be_immutable
class HistoriqueLivraisonMarketPage extends StatefulWidget {
  HistoriqueLivraisonMarketPage({super.key});
  static const routeName = '/historique/livraison-view';

  @override
  State<HistoriqueLivraisonMarketPage> createState() =>
      _HistoriqueLivraisonMarketPageState();
}

class _HistoriqueLivraisonMarketPageState
    extends State<HistoriqueLivraisonMarketPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketBloc, MarketState>(
        builder: (contextM, state) => Scaffold(
            appBar: AppBarCustom(
              title: 'Historique de livraisons',
            ),
            body: Container(
                margin: EdgeInsets.symmetric(horizontal: kMarginX),
                child: state.isLoadedLivraison == 0
                    ? ShimmerLivraison()
                    : state.isLoadedLivraison == 2
                        ? ErrorReloadComponent(
                            onTap: () => BlocProvider.of<MarketBloc>(context)
                                .add(GetLivraisonProduit()),
                          )
                        : state.userLivraisonList!.length == 0
                            ? EmptyLivraisonsComponent()
                            : ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: state.userLivraisonList!.length,
                                // controller: state,
                                itemBuilder: (_, index) =>
                                    LivraisonMarketUserComponent(
                                      livraison:
                                          state.userLivraisonList![index],
                                    )))));
  }
}

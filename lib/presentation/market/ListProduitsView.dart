import 'package:BabanaExpress/presentation/components/Widget/ShimmerProduit.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';

class ListProduitsView extends StatelessWidget {
  ListProduitsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketBloc, MarketState>(
        builder: (context, state) =>  Column(children: [
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        // horizontal: kMarginX,
                        ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20.0,
                          childAspectRatio: 15,
                          mainAxisExtent: 200,
                          mainAxisSpacing: 25.0),
                      itemCount: state.listProduits!.length,
                      itemBuilder: (BuildContext context, int index) =>
                          ProduitComponent(
                        key: ValueKey<int>(state.listProduits![index].id),
                        produit: state.listProduits![index],
                        index: index,
                      ),
                    ),
                  ),
                ),
                state.isLoadedProduit == 0 ? ShimmerProduit() : Container()
              ]),
            );
  }
}

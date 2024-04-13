import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/livraison/HistoriqueLivraisonView.dart';
import '../../presentation/components/exportcomponent.dart';

class LivraisonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: kMarginX),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              child: Text('Historiques de livraisons'),
            ),
            InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorsApp.primary,
                      borderRadius: BorderRadius.circular(50)),
                  margin: EdgeInsets.only(
                    top: kMarginY,
                  ),
                  padding: EdgeInsets.all(6)
                      .add(EdgeInsets.symmetric(horizontal: 5)),
                  child: Text(
                    'Actualiser',
                    style: TextStyle(color: ColorsApp.white),
                  ),
                ),
                onTap: () {
                  BlocProvider.of<LivraisonBloc>(context)
                      .add(HistoriqueUserLivraison());
                })
          ]),
          SingleChildScrollView(child: HistoriqueLivraisonView()),
        ]));
  }
}

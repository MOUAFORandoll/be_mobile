
import 'package:BabanaExpress/presentation/components/Widget/BtnNextComponent.dart';
import 'package:BabanaExpress/presentation/livraison/HistoriqueLivraisonMin.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
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
            BtnNextComponent(onTap: ()=> AutoRouter.of(context).push(HistoriqueLivraisonRoute()),)
          ]),
          SingleChildScrollView(child: HistoriqueLivraisonMin()),
        ]));
  }
}

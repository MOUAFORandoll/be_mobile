import 'package:BabanaExpress/presentation/livraison/HistoriqueLivraisonView.dart';
import '../../presentation/components/exportcomponent.dart';

class LivraisonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: kMarginX),
        child: Column(children: [
          Container(
           
            child: Text('Historiques de livraisons'),
          ),
          SingleChildScrollView(child: HistoriqueLivraisonView()),
        ]));
  }
}

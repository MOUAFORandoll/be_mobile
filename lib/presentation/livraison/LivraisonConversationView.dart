import 'package:BabanaExpress/presentation/components/Widget/BtnNextComponent.dart';
import 'package:BabanaExpress/presentation/livraison/HistoriqueLivraisonMin.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
import '../../presentation/components/exportcomponent.dart';

@RoutePage()
class LivraisonConversationPage extends StatefulWidget {
  LivraisonConversationPage();
  static const routeName = '/livraison/colis';

  @override
  State<LivraisonConversationPage> createState() =>
      _LivraisonConversationPageState();
}

class _LivraisonConversationPageState extends State<LivraisonConversationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(
          title: 'Vos livraisons'.tr(),
        ),
        body: Container(
            margin: EdgeInsets.only(top: kMarginY * 2)
                .add(EdgeInsets.symmetric(horizontal: kMarginX * 2)),
            child: Column(children: [
              SingleChildScrollView(child: HistoriqueLivraisonMin()),
            ])));
  }
}

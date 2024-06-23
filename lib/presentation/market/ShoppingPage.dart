import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/Widget/EmptyShopComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_bar_custom.dart';
import 'package:BabanaExpress/presentation/components/Widget/shoppingproduitComponent.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';

@RoutePage()
class ShoppingPage extends StatefulWidget {
  ShoppingPage({Key? key}) : super(key: key);
  static const routeName = '/shop/view';

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketBloc, MarketState>(
        builder: (contextM, state) => Scaffold(
            appBar: AppBarCustom(
              title: 'My Shopping Bag',
            ),
            body: state.paniers!.length == 0
                ? EmptyShopComponent()
                : Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                            child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.paniers!.length,
                          // controller: state,
                          itemBuilder: (_, index) => ShoppingproduitComponent(
                            cartM: state.paniers![index],
                          ),
                        )),
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: kMarginY),
                          child: AppButton(
                            size: MainAxisSize.min,
                            bgColor: ColorsApp.primary,
                            text: 'Suivant',
                            onTap: () => AutoRouter.of(context)
                                .push(InfoLieuxLivraisonMarketRoute()),
                          ))
                    ],
                  ),
            bottomNavigationBar: state.paniers!.length == 0
                ? null
                : null /*  Container(
                    decoration: BoxDecoration(
                      color: ColorsApp.grey,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: kMarginX,
                      horizontal: kMarginY,
                     
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    // width: Get.size.width * 0.1,

                                    margin: EdgeInsets.only(
                                      bottom: 2,
                                    ),
                                    child: Text(
                                      'Nombre de produits : ${state.paniers!.length}',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: ColorsApp.black,
                                      ),
                                    )),
                                Container(
                                    width: getWidth(context) * 0.65,
                                    child: Text(
                                      'Montant du panier :  state.totalPrix} XAF',
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: ColorsApp.black,
                                          fontSize: 11),
                                    )),
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.only(bottom: kMarginY),
                                child: AppButton(
                                  size: MainAxisSize.min,
                                  bgColor: ColorsApp.primary,
                                  text: 'Buy',
                                  onTap: () {},
                                ))
                          ],
                        )
                      ],
                    )) */
            ));
  }
}

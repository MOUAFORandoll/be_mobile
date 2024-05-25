import 'package:BabanaExpress/presentation/components/Widget/btn_text_icon.dart';
import 'package:BabanaExpress/presentation/market/ListProduitsView.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
import '../../presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';

@RoutePage()
class MarketPage extends StatefulWidget {
  MarketPage({
    Key? key,
  }) : super(key: key);
  static const routeName = '/market/page';

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage>
    with SingleTickerProviderStateMixin {
  Animation<double>? _animation;
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketBloc, MarketState>(
        builder: (context, state) => Scaffold(
              backgroundColor: ColorsApp.bg,
              body: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverAppBar(
                    backgroundColor: ColorsApp.bg,
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    title: Text(
                      'Market Place',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    leading: Container(
                        child: InkWell(
                      child: Container(
                        margin: EdgeInsets.zero,
                        // padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(

                            // borderRadius: BorderRadius.circular(20),
                            ),
                        child: Icon(Icons.arrow_back_ios_new,
                            color: ColorsApp.black, size: 25.0),
                      ),
                      onTap: () {
                        AutoRouter.of(context).pop();
                      },
                    )),
                    pinned: true,
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(50),
                      child: Container(
                          margin: EdgeInsets.only(
                            top: kMarginY,
                          ),
                          decoration: BoxDecoration(
                            color: ColorsApp.white,
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: kMarginX),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BtnTextIcon(
                                    title: 'Historique'.tr(),
                                    icon: Icons.list,
                                    onTap: () => AutoRouter.of(context).push(
                                        HistoriqueLivraisonMarketRoute())),
                                BtnTextIcon(
                                    title: 'Shopping Cart'.tr(),
                                    icon: Icons.shopping_cart_outlined,
                                    onTap: () => AutoRouter.of(context)
                                        .push(ShoppingRoute())),
                                BtnTextIcon(
                                    title: 'Actualiser'.tr(),
                                    icon: Icons.refresh,
                                    onTap: () =>
                                        BlocProvider.of<MarketBloc>(context)
                                            .add(GetProduits())),
                              ])),
                    ),

                    // pinned: true,
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Container(
                          padding: EdgeInsets.symmetric(horizontal: kMarginX),
                          child: Column(children: [
                            SingleChildScrollView(child: ListProduitsView())
                          ])),
                      childCount: 1,
                    ),
                  ),
                ],
              ),
            ));
  }
}

import 'package:BabanaExpress/presentation/components/Form/search_field.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_bar_custom.dart';
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
  ScrollController _scrollController = new ScrollController();
  TextEditingController _searchController = TextEditingController();

  bool isSearch = false;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Method to handle scroll events
  void _scrollListener() {
    // Check if the user has reached the bottom of the list
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // Load more data or trigger an action
      print('okkok');
      BlocProvider.of<MarketBloc>(context).add(isSearch
          ? GetProduits(false)
          : FilterProduits(search: _searchController.text));
      print('okkok');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketBloc, MarketState>(
        builder: (context, state) => Scaffold(
              backgroundColor: ColorsApp.bg,
              appBar: AppBarCustom(title: 'Market Place', actions: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isSearch = !isSearch;
                    });
                    BlocProvider.of<MarketBloc>(context).add(InitFilter(true));
                  },
                  child: Container(
                      margin: EdgeInsets.only(right: kMarginX),
                      child: isSearch
                          ? Icon(Icons.close, color: ColorsApp.red)
                          : Icon(
                              Icons.search,
                            )),
                )
              ]),
              body: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverAppBar(
                    backgroundColor: ColorsApp.bg,
                    automaticallyImplyLeading: false,

                    pinned: true,
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(10),
                      child: Container(
                          // margin: EdgeInsets.only(
                          //   top: kMarginY,
                          // ),
                          decoration: BoxDecoration(
                            color: ColorsApp.white,
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: kMarginX),
                          child: isSearch
                              ? KSearchField(
                                  controller: _searchController,
                                  onChange: (value) =>
                                      BlocProvider.of<MarketBloc>(context).add(
                                          FilterProduits(
                                              search: _searchController.text)),
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                              BlocProvider.of<MarketBloc>(
                                                      context)
                                                  .add(GetProduits(true))),
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



import '../../presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';

import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class PaiementMarketPage extends StatefulWidget {
  static const routeName = '/paiement/market';

  const PaiementMarketPage({super.key});
  @override
  State<PaiementMarketPage> createState() => _PaiementMarketPageState();
}

class _PaiementMarketPageState extends State<PaiementMarketPage> {
  WebViewController? controller;
  int _progress = 0;

  void initState() {
    super.initState();

    setState(() {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              // Update loading bar.
              print(progress);
              setState(() {
                _progress = progress;
              });
            },
            onPageStarted: (String url) {
              print('start------${url}');
            },
            onPageFinished: (String url) {
              print('fichinin------${_progress}');
            },
            onWebResourceError: (WebResourceError error) {},
            onNavigationRequest: (NavigationRequest request) {
              if (request.url.startsWith('https://www.youtube.com/')) {
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          ),
        )
        ..loadRequest(Uri.parse(
            BlocProvider.of<MarketBloc>(context).state.paiement_url!));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MarketBloc, MarketState>(listener: (ctx, state) {
      // print('-------${state.successMarket}--------Market_validate--');
      // if (state.successLivraison == true) {
      //   showSuccess('Market Validee avec succes', context);
      //   BlocProvider.of<MarketBloc>(context).add(HistoriqueUserMarket());
      //   AutoRouter.of(context).replaceAll([SuccesMarketRoute()]);
      // }
    }, builder: (context, state) {
      return Scaffold(
          appBar: AppBarCustom(
            title: 'Paiement de votre Facture'.tr(),
          ),
          // backgroundColor: ColorsApp.bg,
          body: controller == null || _progress != 100
              ? Center(
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: ColorsApp.primary,
                        ),
                        Container(
                            margin: EdgeInsets.only(top: kMarginY),
                            child: Text(
                              'En cours ...',
                              style: TextStyle(
                                  // color: ColorsApp.second,
                                  ),
                            ))
                      ],
                    ),
                  ), // Afficher un indicateur de chargement si controller est null
                )
              : WebViewWidget(controller: controller!));
    });
  }
}

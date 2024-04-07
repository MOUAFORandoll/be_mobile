import 'package:BabanaExpress/routes/app_router.gr.dart';

import '../../presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';

import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class PaimentDepotPage extends StatefulWidget {
  static const routeName = '/paiement/depot';

  const PaimentDepotPage({super.key});
  @override
  State<PaimentDepotPage> createState() => _PaimentDepotPageState();
}

class _PaimentDepotPageState extends State<PaimentDepotPage> {
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
              if (mounted) {
                setState(() {
                  _progress = progress;
                });
              }
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
            BlocProvider.of<CompteBloc>(context).state.paiement_url!));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompteBloc, CompteState>(listener: (ctx, state) {
      // if (state.successCompte == true) {
      //   showSuccess('Livraison Validee avec succes', context);
      //   BlocProvider.of<LivraisonBloc>(context).add(HistoriqueUserLivraison());
      //   AutoRouter.of(context).replaceAll([SuccesLivraisonRoute()]);
      // }
    }, builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            leading: AppBackButton(),
            title: const Text('REcharge de votre compte'),
            centerTitle: true,
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
//237654434782
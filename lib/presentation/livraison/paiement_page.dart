import 'package:BabanaExpress/routes/app_router.gr.dart';

import '../../presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';

import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class PaimentPage extends StatefulWidget {
  static const routeName = '/paiement';

  const PaimentPage({super.key});
  @override
  State<PaimentPage> createState() => _PaimentPageState();
}

class _PaimentPageState extends State<PaimentPage> {
  WebViewController? controller;

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
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) {},
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
            BlocProvider.of<LivraisonBloc>(context).state.paiement_url!));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LivraisonBloc, LivraisonState>(listener: (ctx, state) {
      print('-------${state.successLivraison}--------livraison_validate--');
      if (state.successLivraison == true) {
        showSuccess('Livraison Validee avec succes', context);
        BlocProvider.of<LivraisonBloc>(context).add(HistoriqueUserLivraison());
        AutoRouter.of(context).replaceAll([SuccesLivraisonRoute()]);
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          leading: AppBackButton(),
          title: const Text('Paiement de votre livraison'),
          centerTitle: true,
        ),
        // backgroundColor: ColorsApp.bg,
        body: controller != null // Vérifier si controller n'est pas null
            ? WebViewWidget(controller: controller!)
            : Center(
                child:
                    CircularProgressIndicator(), // Afficher un indicateur de chargement si controller est null
              ),
      );
    });
  }
}

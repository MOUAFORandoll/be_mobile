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
  late WebViewController? controller;

  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LivraisonBloc, LivraisonState>(listener: (ctx, state) {
      // if (state.paiement_url != null) {
      //   controller = WebViewController()
      //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
      //     ..setBackgroundColor(const Color(0x00000000))
      //     ..setNavigationDelegate(
      //       NavigationDelegate(
      //         onProgress: (int progress) {
      //           // Update loading bar.
      //         },
      //         onPageStarted: (String url) {},
      //         onPageFinished: (String url) {},
      //         onWebResourceError: (WebResourceError error) {},
      //         onNavigationRequest: (NavigationRequest request) {
      //           if (request.url.startsWith('https://www.youtube.com/')) {
      //             return NavigationDecision.prevent;
      //           }
      //           return NavigationDecision.navigate;
      //         },
      //       ),
      //     )
      //     ..loadRequest(Uri.parse(state.paiement_url!));
      // }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          leading: AppBackButton(),
          title: const Text('Paiement de votre livraison'),
          centerTitle: true,
        ),
        // backgroundColor: ColorsApp.bg,
        body: state.controller != null // Vérifier si controller n'est pas null
            ? WebViewWidget(controller: state.controller!)
            : Center(
                child:
                    CircularProgressIndicator(), // Afficher un indicateur de chargement si controller est null
              ),
      );
    });
  }
}

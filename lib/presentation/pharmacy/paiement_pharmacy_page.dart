
import '../../presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';

import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class PaimentPharmacyPage extends StatefulWidget {
  static const routeName = '/paiement/pharmacy';

  const PaimentPharmacyPage({super.key});
  @override
  State<PaimentPharmacyPage> createState() => _PaimentPharmacyPageState();
}

class _PaimentPharmacyPageState extends State<PaimentPharmacyPage> {
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
            BlocProvider.of<PharmacyBloc>(context).state.paiement_url!));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyBloc, PharmacyState>(listener: (ctx, state) {
      // print('-------${state.successPharmacy}--------Pharmacy_validate--');
      // if (state.successLivraison == true) {
      //   showSuccess('Pharmacy Validee avec succes', context);
      //   BlocProvider.of<PharmacyBloc>(context).add(HistoriqueUserPharmacy());
      //   AutoRouter.of(context).replaceAll([SuccesPharmacyRoute()]);
      // }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          leading: AppBackButton(),
          title: const Text('Paiement de votre Facture de  Pharmacy'),
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

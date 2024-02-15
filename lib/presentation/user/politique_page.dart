import  '../../presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';

import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class PolitiquePage extends StatefulWidget {
  static const routeName = '/politique-confidentialite';

  const PolitiquePage({super.key});
  @override
  State<PolitiquePage> createState() => _PolitiquePageState();
}

class _PolitiquePageState extends State<PolitiquePage> {
  var controller;
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
            'https://be-dashboard-orcin.vercel.app/politique-de-confidentialite'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            leading: AppBackButton(),
            title: const Text('Politique de confidentialite'),
            centerTitle: true,
          ),
          // backgroundColor: ColorsApp.bg,
          body: WebViewWidget(controller: controller));
    });
  }
}

import '../../presentation/components/exportcomponent.dart';
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
            'https://dashboard-babanaexpress.bcom.cm/politique-de-confidentialite'));
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
          body: controller == null || _progress != 100
              ? Center(
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: ColorsApp.second,
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
              : WebViewWidget(controller: controller));
    });
  }
}

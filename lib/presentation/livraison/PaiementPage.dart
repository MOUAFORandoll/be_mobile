import 'package:BabanaExpress/routes/app_router.gr.dart';

import '../../presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';

import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class PaiementPage extends StatefulWidget {
  static const routeName = '/paiement';

  const PaiementPage({super.key});
  @override
  State<PaiementPage> createState() => _PaiementPageState();
}

class _PaiementPageState extends State<PaiementPage> {
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
            BlocProvider.of<LivraisonBloc>(context).state.paiement_url!));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LivraisonBloc, LivraisonState>(listener: (ctx, state) {
      print('-------${state.successLivraison}--------livraison_validate--');
      if (state.isRequest == 1) {
        EasyLoading.show(
            indicator: CircularProgressIndicator(
              color: ColorsApp.second,
            ),
            dismissOnTap: true,
            maskType: EasyLoadingMaskType.black);
      } else if (state.isRequest == 3) {
        EasyLoading.dismiss();

        showError(state.errorMessage!, context);
      } else if (state.isRequest == 2) {
        EasyLoading.dismiss();
        if (state.successLivraison == true) {
          showSuccess('Livraison Validee avec succes', context);
          BlocProvider.of<LivraisonBloc>(context)
              .add(HistoriqueUserLivraison());
          AutoRouter.of(context).replaceAll([
            state.selectedService == 1
                ? SuccesLivraisonType1Route()
                : SuccesLivraisonType2Route()
          ]);
        }
        print('-----44--------*********');
      }
    }, builder: (context, state) {
      return Scaffold(
          appBar:
              AppBarCustom(title: 'Paiement de votre livraison'.tr(), actions: [
            InkWell(
                child: Container(
                    margin: EdgeInsets.only(right: kMarginX),
                    child: Icon(Icons.verified)),
                onTap: () => BlocProvider.of<LivraisonBloc>(context)
                    .add(VerifyLivraisonState()))
          ]),

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
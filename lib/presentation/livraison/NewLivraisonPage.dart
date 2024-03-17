import 'package:BabanaExpress/core.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/livraison/paiement_page.dart';
import 'InfoColis.dart';
import 'InfoLIvraison.dart';

@RoutePage()
class NewLivraisonPage extends StatefulWidget {
  const NewLivraisonPage({super.key});
  static const routeName = '/livraison/new';

  @override
  State<NewLivraisonPage> createState() => _NewLivraisonPageState();
}

class _NewLivraisonPageState extends State<NewLivraisonPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LivraisonBloc, LivraisonState>(
        listener: (context, state) {
         if (state.isRequest == 1) {
            EasyLoading.show(
                dismissOnTap: true,
                status: 'En cours',
                maskType: EasyLoadingMaskType.black);
          } else if (state.isRequest == 3) {
            EasyLoading.dismiss();

            showError('Une erreur est survenue', context);
          } else if (state.isRequest == 2) {
            EasyLoading.dismiss();

            validateLivraison(context);
            print('-----44--------*********');
          } else if (state.isRequest == 4) {
            // AutoRouter.of(context).pop();
            EasyLoading.show(
                dismissOnTap: true,
                status: 'En cours',
                maskType: EasyLoadingMaskType.black);
          } else if (state.isRequest == 5) {
            AutoRouter.of(context).pop();
            EasyLoading.dismiss();
            if (state.paiement_url != null) {
              AutoRouter.of(context).pushNamed(PaimentPage.routeName);
            }

            // context.read<LivraisonBloc>().add(HistoriqueUserLivraison());
            //

            print('-----44--------*********');
          }
        },
        builder: (context, state) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: AppBackButton(),
              title: Text('yNewLivraison'.tr()),
              centerTitle: true,
            ),
            body: RefreshIndicator(
                color: ColorsApp.second,
                onRefresh: () => Future.delayed(
                    Duration(seconds: 5), () => initLoad(context)),
                child: Container(
                    height: getHeight(context),
                    margin: EdgeInsets.symmetric(
                        horizontal: kMarginX, vertical: kMarginY),
                    child: Column(
                      children: [
                        Expanded(
                          child:
                              state.index == 0 ? InfoLIvraison() : InfoColis(),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(
                              vertical: kMarginY * 1.5,
                              horizontal: kMarginX / 2,
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppButton(
                                      size: MainAxisSize.max,
                                      bgColor: state.index == 0
                                          ? ColorsApp.grey
                                          : ColorsApp.primary,
                                      text: 'yback'.tr(),
                                      onTap: () {
                                        context
                                            .read<LivraisonBloc>()
                                            .add(BackIndexEvent());
                                      }),
                                  AppButton(
                                    size: MainAxisSize.max,
                                    bgColor: ColorsApp.second,
                                    text: state.index == 0
                                        ? 'ynext'.tr()
                                        : 'yeval'.tr(),
                                    onTap: () {
                                      state.index == 0
                                          ? context
                                              .read<LivraisonBloc>()
                                              .add(VerifyFormLivraisonEvent())
                                          : context
                                              .read<LivraisonBloc>()
                                              .add(CalculFrais());
                                    },
                                  ),
                                ])),
                      ],
                    )))));
  }

  validateLivraison(contextA) => showModalBottomSheet(
        context: contextA,
        builder: (BuildContext context) => BlocBuilder<LivraisonBloc,
                LivraisonState>(
            builder: (context, state) => Container(
                height: getHeight(context) * .4,
                padding: EdgeInsets.symmetric(horizontal: kMarginX),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: ColorsApp.white,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(top: kMarginY * 2),
                          // padding: EdgeInsets.symmetric(
                          //     horizontal: kMarginX / 2),
                          child: InkWell(
                            onTap: () {
                              AutoRouter.of(context).pop();

                              context.read<LivraisonBloc>().add(NoValidate());
                            },
                            child: Icon(Icons.close),
                          )),
                      Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
                          child: Row(
                            children: [
                              Text(
                                'yfrais'.tr(),
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '${state.frais} FCFA  ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ],
                          )),
                      // Container(
                      //     margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
                      //     child: Text(
                      //       ' a payer par l\'emetteur: '.tr(),
                      //       style: TextStyle(fontWeight: FontWeight.w500),
                      //     )),
                      Container(
                          margin: EdgeInsets.only(top: kMarginY),
                          child: Column(
                            // mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: AppButton(
                                    text: 'yvalidate'.tr(),
                                    // width: getWith(context) / 2.5,
                                    size: MainAxisSize.max,
                                    bgColor: ColorsApp.second,
                                    onTap: () => context
                                        .read<LivraisonBloc>()
                                        .add(NewLivraison())),
                              ),
                            ],
                          ))
                    ]))),
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        backgroundColor: Colors.transparent,
      ).whenComplete(() {
        BlocProvider.of<LivraisonBloc>(context).add(NoValidate());
      });
}

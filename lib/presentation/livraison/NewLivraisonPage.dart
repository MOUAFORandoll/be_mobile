import 'package:BananaExpress/old/components/Button/app_button.dart';
import 'package:BananaExpress/old/components/Widget/app_back_button.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:BananaExpress/application/export_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

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
    return BlocBuilder<LivraisonBloc, LivraisonState>(
        builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: AppBackButton(),
            title: Text('Bon de livraison'),
            centerTitle: true,
          ),
          body: Container(
              height: getHeight(context),
              margin: EdgeInsets.symmetric(
                  horizontal: kMarginX, vertical: kMarginY),
              child: Column(
                children: [
                  Expanded(
                    child: state.index == 0 ? InfoLIvraison() : InfoColis(),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(
                        vertical: kMarginY * 1.5,
                        horizontal: kMarginX / 2,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppButton(
                                size: MainAxisSize.max,
                                bgColor: state.index == 0
                                    ? ColorsApp.grey
                                    : ColorsApp.primary,
                                text: 'Back'.tr(),
                                onTap: () {
                                  context
                                      .read<LivraisonBloc>()
                                      .add(BackIndexEvent());
                                }),
                            AppButton(
                              size: MainAxisSize.max,
                              bgColor: ColorsApp.primary,
                              text: state.index == 0
                                  ? 'Next'.tr()
                                  : 'Evaluer'.tr(),
                              onTap: () {
                                context
                                    .read<LivraisonBloc>()
                                    .add(VerifyFormEvent());
                              },
                            ),
                          ])),
                ],
              )));
    });
  }
}

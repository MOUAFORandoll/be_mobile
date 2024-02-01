import 'package:BananaExpress/core.dart';
import 'package:BananaExpress/presentation/components/Button/app_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:BananaExpress/presentation/components/exportcomponent.dart';

import 'package:BananaExpress/application/export_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'InfoColis.dart';
import 'InfoLIvraison.dart';

@RoutePage()
class NewLivraisonPage extends StatelessWidget {
  const NewLivraisonPage({super.key});
  static const routeName = '/livraison/new';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: AppBackButton(),
          title: Text('yNewLivraison'.tr()),
          centerTitle: true,
        ),
        body: RefreshIndicator(
            color: ColorsApp.second,
            onRefresh: () =>
                Future.delayed(Duration(seconds: 5), () => initLoad(context)),
            child: BlocBuilder<LivraisonBloc, LivraisonState>(
                builder: (context, state) => Container(
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
}

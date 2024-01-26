import 'package:BananaExpress/components/Button/app_button.dart';
import 'package:BananaExpress/components/Widget/app_carroussel_item.dart';
import 'package:BananaExpress/core.dart';
import 'package:BananaExpress/presentation/user/auth_page.dart';
import 'package:BananaExpress/routes/app_router.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/utils/Services/routing.dart';
import 'package:BananaExpress/utils/constants/assets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:BananaExpress/application/export_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

@RoutePage()
class OnBoardingPage extends StatelessWidget {
  static const routeName = '/onboarding';
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    final CarouselController controller = CarouselController();

    return BlocBuilder<AppActionCubit, AppActionState>(
        builder: (context, state) {
      return Scaffold(
          backgroundColor: ColorsApp.tird,
          body: SingleChildScrollView(
              child: Stack(
            children: [
              CarouselSlider(
                carouselController: controller,
                items: [
                  AppCarrousselItem(
                    title: 'ctitle1'.tr(),
                    description: 'cdescription1'.tr(),
                    image: Assets.onb1,
                  ),
                  AppCarrousselItem(
                      title: 'ctitle2'.tr(),
                      description: 'cdescription2'.tr(),
                      image: Assets.onb2,
                      index: state.index!)
                ],
                options: CarouselOptions(
                    aspectRatio: 4 / 4,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    reverse: false,
                    onPageChanged: (index, reason) {
                      context.read<AppActionCubit>().setIndex(index);
                    },
                    disableCenter: true,
                    height: kHeight,
                    // enlargeCenterPage: true,
                    // autoPlay: true,

                    // autoPlayCurve: Curves.fastOutSlowIn,
                    // enableInfiniteScroll: true,
                    viewportFraction: 1.0,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal),
              ),
              Positioned(
                  bottom: kHeight / 5,
                  left: 0,
                  right: 0,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: ['0', '1'].asMap().entries.map((entry) {
                        return GestureDetector(
                            onTap: () {
                              controller.animateToPage(
                                entry.key,
                                duration: Duration(seconds: 10),
                                curve: Curves.linearToEaseOut,
                              );
                            },
                            child: Container(
                              width: 15.0,
                              height: 15.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: state.index == entry.key
                                      ? Colors.white
                                      : ColorsApp.primary.withOpacity(0.2)),
                            ));
                      }).toList(),
                    ),
                  )),
              Positioned(
                  bottom: kHeight / 8,
                  left: 0,
                  right: 0,
                  child: AppButton(
                    text: state.index == 0 ? 'Suivant' : "Continuer",
                    onTap: () {
                      if (state.index == 1) {
                        // final AppActionCubit action =
                        //     BlocProvider.of<AppActionCubit>(context);
                        // action.toLogin();

                        AutoRouter.of(context).replaceAll([AuthRoute()]);
                        GetStorage box = sl.get<GetStorage>();
                        box.write('first', 1);
                      } else {
                        // context.read<AppActionCubit>().setIndex(1);

                        controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      }
                    },
                  )),
            ],
          )));
    });
  }
}

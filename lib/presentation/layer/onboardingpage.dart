import 'package:BabanaExpress/presentation/components/Widget/app_carroussel_item.dart';
import 'package:BabanaExpress/core.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';

import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:get_storage/get_storage.dart';
import 'package:BabanaExpress/application/export_bloc.dart';

@RoutePage()
class OnBoardingPage extends StatelessWidget {
  static const routeName = '/onboarding';
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CarouselController controller = CarouselController();

    return BlocBuilder<AppActionCubit, AppActionState>(
        builder: (context, state) {
      return Scaffold(
          backgroundColor: ColorsApp.second,
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
                      index: state.index)
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
                    height: getHeight(context),
                    // enlargeCenterPage: true,
                    // autoPlay: true,

                    // autoPlayCurve: Curves.fastOutSlowIn,
                    // enableInfiniteScroll: true,
                    viewportFraction: 1.0,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal),
              ),
              Positioned(
                  bottom: getHeight(context) / 10,
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
                                      : ColorsApp.black.withOpacity(0.2)),
                            ));
                      }).toList(),
                    ),
                  )),
              Positioned(
                  bottom: getHeight(context) / 40,
                  left: 0,
                  right: 0,
                  child: AppButton(
                    text: state.index == 0 ? 'Suivant' : 'Continuer',
                    textColor: ColorsApp.primary,
                    bgColor: Colors.white,
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

// 658392349

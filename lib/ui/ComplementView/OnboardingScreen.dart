import 'package:BananaExpress/components/Button/app_button.dart';
import 'package:BananaExpress/components/Widget/app_carroussel_item.dart';
import 'package:BananaExpress/controller/GeneralController.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/ui/general_action/cubit/GeneralAction_event.dart';
import 'package:BananaExpress/utils/Services/routing.dart';
import 'package:BananaExpress/utils/constants/assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../general_action/cubit/GeneralAction_cubit.dart';
import '../general_action/cubit/GeneralAction_state.dart';

class OnBoardingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return BlocBuilder<GeneralActionCubit, GeneralActionState>(
        builder: (context, state) {
      var action = state as GeneralActionState;
      return Scaffold(
          backgroundColor: ColorsApp.tird,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                CarouselSlider(
                  carouselController: action.controller,
                  items: [
                    AppCarrousselItem(
                      title: 'ctitle1'.tr,
                      description: 'cdescription1'.tr,
                      image: Assets.onb1,
                    ),
                    AppCarrousselItem(
                        title: 'ctitle2'.tr,
                        description: 'cdescription2'.tr,
                        image: Assets.onb2,
                        index: action.index!),
                  ],
                  options: CarouselOptions(
                      aspectRatio: 4 / 4,
                      enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      onPageChanged: (index, reason) {
                        context.read<GeneralActionCubit>().setIndex(index);
                        ;
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
                                action.controller.animateToPage(
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
                                    color: action.index == entry.key
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
                      text: action.index == 0 ? 'Suivant' : "Continuer",
                      onTap: () {
                        if (action.index == 1) {
                          Navigator.of(context).popAndPushNamed(AppLinks.LOGIN);
                          box.write('first', 1);
                        } else {
                          action.controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );
                        }
                      },
                    )),
              ],
            ),
          ));
    });
  }
}

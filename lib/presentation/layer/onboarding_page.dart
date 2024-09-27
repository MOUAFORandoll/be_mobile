import 'package:BabanaExpress/core.dart';
import 'package:BabanaExpress/presentation/components/Button/buttons.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';

import 'package:BabanaExpress/utils/constants/assets.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:get_storage/get_storage.dart';
import 'package:BabanaExpress/application/export_bloc.dart';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class OnBoardingPage extends StatefulWidget {
  static const routeName = '/onboarding';
  OnBoardingPage({super.key});

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _controller = PageController();
  bool isLastPage = false;
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeApp.second,
      body: SafeArea(
        minimum: const EdgeInsets.only(bottom: 42),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                    isLastPage = (index == 2);
                  });
                },
                children: [
                  buildOnboardingPage(
                    image: Assets.onboarding1,
                    title: 'Livraison de colis',
                    description:
                        'Que vous ayez un colis à expédier ou à recevoir, notre service de livraison rapide et sécurisé est là pour vous. En un clic, envoyez ou recevez vos colis sans souci, à n\'importe quelle destination.',
                  ),
                  buildOnboardingPage(
                    image: Assets.onboarding2,
                    title: 'Livraison de médicaments',
                    description:
                        'Commandez vos médicaments en ligne et faites-les livrer directement chez vous, rapidement et en toute sécurité. Profitez de notre service de livraison fiable pour vos besoins en santé.',
                  ),
                  buildOnboardingPage(
                    image: Assets.onboarding3,
                    title: 'Blanchisserie en ligne',
                    description:
                        'Gagnez du temps avec notre service de blanchisserie en ligne. Nous récupérons vos vêtements, les nettoyons avec soin et vous les livrons impeccablement. Faites de la lessive une tâche sans effort !',
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: WormEffect(
                  activeDotColor: Colors.white,
                  dotColor: ThemeApp.grey,
                  dotHeight: 10,
                  dotWidth: 50,
                ),
              ),
            ),
            Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: isLastPage
                  ? BEButton(
                      style: BEButtonStyle.primary,
                      onPressed: () {
                        AutoRouter.of(context).push(AuthRoute());
                      },
                      text: "Poursuivre",
                    )
                  : BEButton(
                      style: BEButtonStyle.primary,
                      onPressed: () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      text: "Suivant",
                    ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildOnboardingPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          image,
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        // SizedBox(height: 40),
        // Text(
        //   title,
        //   style: TextStyle(
        //     fontSize: 24,
        //     fontWeight: FontWeight.bold,
        //     color: Colors.black,
        //   ),
        // ),
        SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            description,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 16,
              color: ThemeApp.white,
            ),
          ),
        ),
      ],
    );
  }
}

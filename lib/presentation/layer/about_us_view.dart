import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: 'AboutUs'.tr(),
      ),
      body: Center(child: smallText(text: 'AboutUs')),
    );
  }
}

 
import 'package:BananaExpress/presentation/components/exportcomponent.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("AboutUs"),
      //   centerTitle: true,
      // ),
      body: Center(child: smallText(text: 'AboutUs')),
    );
  }
}

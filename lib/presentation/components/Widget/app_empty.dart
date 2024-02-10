// ignore: must_be_immutable import 'package:BabanaExpress/presentation/model/data/CategoryModel.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

// ignore: must_be_immutable
class AppEmpty extends StatelessWidget {
  AppEmpty({this.title = 'Vide'});
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.warning, size: 50),
            SizedBox(height: 10),
            Text(title),
          ],
        ),
      ),
    );
  }
}

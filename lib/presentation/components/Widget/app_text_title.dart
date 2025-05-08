import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class AppTextTitle extends StatelessWidget {
  AppTextTitle(
      {required this.text,
      required this.bolder,
      this.color = ColorsApp.primary,
      this.percent = 1.0,
      this.big = false});
  final bool bolder;
  final bool big;
  final String text;
  final Color color;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}

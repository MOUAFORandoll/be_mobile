import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class ThemeButtonWidget extends StatefulWidget {
  @override
  _ThemeButtonWidgetState createState() => _ThemeButtonWidgetState();
}

class _ThemeButtonWidgetState extends State<ThemeButtonWidget> {
  Color icon = ColorsApp.primary;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(
        Theme.of(context).brightness == Brightness.dark
            ? FontAwesomeIcons.sun
            : FontAwesomeIcons.moon,
        color: ColorsApp.grey,
      ),
      onTap: () {
        // ViewFunctions().changeTheme(context);
      },
    );
  }
}

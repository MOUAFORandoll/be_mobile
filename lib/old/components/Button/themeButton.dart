import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:BananaExpress/utils/functions/viewFunctions.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:flutter/material.dart';

class ThemeButtonWidget extends StatefulWidget {
  @override
  _ThemeButtonWidgetState createState() => _ThemeButtonWidgetState();
}

class _ThemeButtonWidgetState extends State<ThemeButtonWidget> {
  Color icon = ColorsApp.primary;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Theme.of(context).brightness == Brightness.dark
          ? FontAwesomeIcons.sun
          : FontAwesomeIcons.moon),
      onPressed: () {
        ViewFunctions().changeTheme(context);
      },
    );
  }
}

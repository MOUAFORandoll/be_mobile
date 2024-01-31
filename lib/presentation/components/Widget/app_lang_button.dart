import 'package:flutter/material.dart';
import 'package:BananaExpress/main.dart';
import 'package:BananaExpress/presentation/components/exportcomponent.dart';
import 'package:easy_localization/easy_localization.dart'; // Assurez-vous d'avoir easy_localization

class AppLangButton extends StatelessWidget {
  final List<Map<String, dynamic>> supportedLocales = [
    {'code': 'en', 'c1': 'US', 'name': 'English'},
    {'code': 'fr', 'c1': 'FR', 'name': 'Français'},
    // Ajoutez d'autres langues ici
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: context.locale
          .languageCode, // Utilisez le code de langue actuel comme valeur initiale
      borderRadius: BorderRadius.circular(10),
      icon: Container(
        child: Icon(
          Icons.keyboard_arrow_down_outlined,
          color: ColorsApp.primary,
        ),
      ),
      iconSize: 25,
      underline: SizedBox(),
      style: TextStyle(color: ColorsApp.primary, fontSize: 20),
      onChanged: (newValue) {
        if (newValue != null) {
          final selectedLocale = supportedLocales.firstWhere(
            (locale) => locale['code'] == newValue,
            orElse: () => supportedLocales[0],
          );

          context.setLocale(Locale(
            selectedLocale['code'],
            selectedLocale['c1'],
          )); // Changez la langue ici
        }
      },
      items: supportedLocales.map<DropdownMenuItem<String>>((locale) {
        return DropdownMenuItem(
          value: locale['code'],
          child: Center(
            child: Text(
              locale['name'] ?? '',
              style: TextStyle(color: ColorsApp.primary, fontSize: 15),
            ),
          ),
        );
      }).toList(),
    );
  }
}

import 'package:BananaExpress/old/components/Button/AppIconButton.dart';
import 'package:BananaExpress/styles/colorApp.dart';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
 

// ignore: must_be_immutable
class ShareButton extends StatelessWidget {
  var libelle;
  ShareButton({this.libelle});

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      onTap: () {
        Share.share(libelle, subject: 'Look what I made!');
      },
      icon: Icons.share,
      color: ColorsApp.tird,
    );
  }
}

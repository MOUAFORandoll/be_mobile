import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';

enum BEButtonStyle { primary, secondary, social, auth }

class BEButton extends StatelessWidget {
  final BEButtonStyle style;
  final VoidCallback? onPressed;
  final String? text;
  final bool large;
  final Widget? icon;
  final AuthProvider? authProvider;

  const BEButton({
    Key? key,
    required this.style,
    required this.onPressed,
    required this.text,
    this.large = true,
    this.icon,
    this.authProvider,
  }) : super(key: key);

  Color _backgroundColor(BuildContext context) {
    switch (style) {
      case BEButtonStyle.primary:
        return ThemeApp.primary;
      case BEButtonStyle.secondary:
        return ThemeApp.second;
      case BEButtonStyle.social:
      case BEButtonStyle.auth:
        return ThemeApp.white;
    }
  }

  Color _foregroundColor(BuildContext context) {
    switch (style) {
      case BEButtonStyle.primary:
        return ThemeApp.primary_second;
      case BEButtonStyle.secondary:
      case BEButtonStyle.social:
      case BEButtonStyle.auth:
        return ThemeApp.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget buttonIcon = icon ??
        (style == BEButtonStyle.auth && authProvider != null
            ? SvgPicture.asset(
                authProvider!.asset,
                height: 24.0,
              )
            : Container());

    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: _backgroundColor(context),
        foregroundColor: _foregroundColor(context),
        textStyle: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(color: ThemeApp.white),
        side: style == BEButtonStyle.auth
            ? BorderSide(color: ThemeApp.grey, width: .2)
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (buttonIcon != null) buttonIcon,
          if (buttonIcon != null) const SizedBox(width: 8),
          Expanded(
            child: AutoSizeText(
              style == BEButtonStyle.auth && authProvider != null
                  ? authProvider!.name
                  : text!,
              maxLines: 1,
              minFontSize: 10,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: style == BEButtonStyle.auth && authProvider != null
                      ? ThemeApp.primary_second
                      : ThemeApp.white),
            ),
          ),
        ],
      ),
    );
  }
}

enum AuthProvider { apple, google, facebook }

extension AuthProviderExtension on AuthProvider {
  String get asset {
    switch (this) {
      case AuthProvider.apple:
        return Assets.apple;
      case AuthProvider.google:
        return Assets.google;
      case AuthProvider.facebook:
        return Assets.facebook;
    }
  }

  String get name {
    switch (this) {
      case AuthProvider.apple:
        return "Se connecter avec Apple";
      case AuthProvider.google:
        return "Se connecter avec Google";
      case AuthProvider.facebook:
        return "Se connecter avec Facebook";
    }
  }
}

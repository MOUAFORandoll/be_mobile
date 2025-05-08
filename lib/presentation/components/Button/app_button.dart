import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

enum ButtonStyle { primary, secondary, disabled }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final ButtonStyle buttonStyle;

  const AppButton({
    Key? key,
    required this.text,
    this.onTap,
    this.buttonStyle = ButtonStyle.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDisabled = buttonStyle == ButtonStyle.disabled;

    return OutlinedButton(
      style: theme.filledButtonTheme.style!.copyWith(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (isDisabled) return ThemeApp.disabledGrey;
          return buttonStyle == ButtonStyle.secondary
              ? ThemeApp.second
              : null; // Utilise la couleur par défaut pour primary
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (isDisabled) return ThemeApp.primary;
          return buttonStyle == ButtonStyle.secondary
              ? ThemeApp.primary
              : null; // Utilise la couleur par défaut pour primary
        }),
      ),
      onPressed: isDisabled ? null : onTap,
      child: AutoSizeText(
        text,
        maxLines: 1,
        style: theme.textTheme.labelLarge!.copyWith(color: ThemeApp.white),
      ),
    );
  }
}

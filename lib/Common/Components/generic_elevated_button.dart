import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class GenericElevatedButton extends StatelessWidget {
  final String? title;
  final Color? titleColor;
  final Color? borderColor;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final OutlinedBorder? shape;
  final bool? isVisible;
  final bool isDisabled;
  const GenericElevatedButton(
      {super.key,
      required this.isDisabled,
      this.title,
      this.titleColor,
      this.onPressed,
      this.borderColor,
      this.backgroundColor,
      this.shape,
      this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Visibility(
        visible: isVisible ?? true,
        child: ElevatedButton(
          onPressed: isDisabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            side: BorderSide(
                color: borderColor ?? Theme.of(context).colorScheme.primary),
            shape: shape ?? const StadiumBorder(),
            backgroundColor: backgroundColor ??
                Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Text(
            title ?? "Entrar",
            style: TextStyle(
                color: titleColor ??
                    Theme.of(context).colorScheme.onPrimaryContainer),
          ),
        ),
      );
    });
  }
}

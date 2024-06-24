import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class GenericTextButton extends StatelessWidget {
  final String? title;
  final Color? titleColor;
  final Color? borderColor;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final OutlinedBorder? shape;
  final bool? isVisible;
  final bool isDisabled;
  const GenericTextButton(
      {super.key,
      required this.isDisabled,
      this.title,
      this.titleColor,
      this.onPressed,
      this.borderColor,
      this.shape,
      this.backgroundColor,
      this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Visibility(
        visible: isVisible ?? true,
        child: TextButton(
          style: OutlinedButton.styleFrom(
            shape: shape,
            backgroundColor: backgroundColor ?? Colors.transparent,
          ),
          onPressed: isDisabled ? null : onPressed,
          child: Text(
            title ?? "Entrar",
            style: TextStyle(
              color: titleColor ??
                  Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ),
      );
    });
  }
}

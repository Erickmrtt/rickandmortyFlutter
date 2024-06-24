import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class GenericOutlinedButton extends StatelessWidget {
  final String? title;
  final Color? titleColor;
  final Color? borderColor;
  final VoidCallback? onPressed;
  final OutlinedBorder? shape;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final bool? isVisible;
  final bool isDisabled;
  const GenericOutlinedButton(
      {super.key,
      required this.isDisabled,
      this.title,
      this.titleColor,
      this.onPressed,
      this.borderColor,
      this.shape,
      this.textStyle,
      this.backgroundColor,
      this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Visibility(
        visible: isVisible ?? true,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: borderColor ?? Theme.of(context).colorScheme.primary,
            ),
            shape: shape,
            backgroundColor: backgroundColor ?? Colors.transparent,
          ),
          onPressed: isDisabled ? null : onPressed,
          child: Text(title ?? "Entrar", style: textStyle),
        ),
      );
    });
  }
}

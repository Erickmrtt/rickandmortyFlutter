import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class GenericIconButton extends StatelessWidget {
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback? onPressed;
  final bool? isVisible;
  final bool isDisabled;
  final double? iconSize;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  const GenericIconButton(
      {super.key,
      this.iconColor,
      this.onPressed,
      this.isVisible,
      required this.isDisabled,
      this.icon,
      this.iconSize,
      this.alignment,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible ?? true,
      child: Observer(builder: (context) {
        return IconButton(
          padding: padding ?? const EdgeInsets.all(0),
          onPressed: isDisabled ? null : onPressed,
          icon: Icon(
            icon,
            color:
                iconColor ?? Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          color: iconColor ?? Theme.of(context).colorScheme.onPrimaryContainer,
          iconSize: iconSize ?? 30.0,
          alignment: alignment ?? Alignment.center,
          disabledColor: isDisabled ? Colors.grey : null,
        );
      }),
    );
  }
}

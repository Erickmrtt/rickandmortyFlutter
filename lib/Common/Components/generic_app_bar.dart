import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class GenericAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final TextStyle? titleTextStyle;
  final bool? centerTitle;
  final bool? primary;
  final bool? automaticallyImplyLeading;
  final Color? backgroundColor;
  final bool? excludeHeaderSemantics;
  final bool? forceMaterialTransparency;
  final double? bottomOpacity;
  final Color? shadowColor;
  final double? elevation;
  final ShapeBorder? shape;
  final double? titleSpacing;
  final double? toolbarHeight;
  final Color? foregroundColor;
  const GenericAppBar(
      {super.key,
      required this.title,
      this.actions,
      this.leading,
      this.titleTextStyle,
      this.centerTitle,
      this.primary,
      this.automaticallyImplyLeading,
      this.backgroundColor,
      this.excludeHeaderSemantics,
      this.forceMaterialTransparency,
      this.bottomOpacity,
      this.shadowColor,
      this.elevation,
      this.shape,
      this.titleSpacing,
      this.toolbarHeight,
      this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return AppBar(
        title: Text(title),
        titleTextStyle: titleTextStyle ??
            const TextStyle(color: Colors.black, fontSize: 12),
        centerTitle: centerTitle ?? false,
        titleSpacing: titleSpacing,
        primary: primary ?? false,
        toolbarHeight: toolbarHeight,
        foregroundColor: foregroundColor,
        automaticallyImplyLeading: automaticallyImplyLeading ?? false,
        backgroundColor: backgroundColor ?? Colors.transparent,
        excludeHeaderSemantics: excludeHeaderSemantics ?? false,
        forceMaterialTransparency: forceMaterialTransparency ?? false,
        bottomOpacity: bottomOpacity ?? 1.0,
        shadowColor: shadowColor ?? Colors.transparent,
        elevation: elevation ?? 0.0,
        shape: shape,
        actions: actions,
        leading: leading,
      );
    });
  }
}

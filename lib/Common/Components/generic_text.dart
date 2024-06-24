import 'package:flutter/material.dart';
import 'package:rick_and_morty/Common/Utils/app_colors.dart';

class GenericText extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final TextScaler? textScaler;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;

  final TextStyle defaultTextStyle = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 18,
    fontStyle: FontStyle.normal,
    color: AppColors.blackColor,
  );
  final StrutStyle defaultStrutStyle = const StrutStyle();

  const GenericText(
      {super.key,
      this.text = "Empty Text",
      this.style,
      this.strutStyle,
      this.textAlign = TextAlign.center,
      this.textDirection = TextDirection.ltr,
      this.locale,
      this.softWrap = true,
      this.overflow,
      this.textScaler,
      this.maxLines = 5,
      this.semanticsLabel,
      this.textWidthBasis = TextWidthBasis.parent,
      this.textHeightBehavior = const TextHeightBehavior(
          applyHeightToFirstAscent: true, applyHeightToLastDescent: true),
      this.selectionColor = DefaultSelectionStyle.defaultColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: style ?? defaultTextStyle,
      strutStyle: strutStyle ?? defaultStrutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale ?? Localizations.localeOf(context),
      softWrap: softWrap,
      overflow: overflow,
      textScaler: textScaler ?? MediaQuery.textScalerOf(context),
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
    );
  }
}

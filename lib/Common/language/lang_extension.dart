import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';

extension BuildContextHelper on BuildContext {
  AppLocalizations get lang {
    // if no locale was found, returns a default
    return AppLocalizations.of(this) ?? AppLocalizationsEn();
  }
}

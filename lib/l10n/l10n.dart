import 'package:flutter/material.dart';
import 'package:osama_core/internal/sak_core_localization.dart';

extension AppLocalizationsX on BuildContext {
  SakCoreLocalization get l10n => SakCoreLocalization.of(this)!;
}

const delegates = SakCoreLocalization.delegate;

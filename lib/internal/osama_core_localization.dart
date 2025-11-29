import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'osama_core_localization_ar.dart';
import 'osama_core_localization_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of SakCoreLocalization
/// returned by `SakCoreLocalization.of(context)`.
///
/// Applications need to include `SakCoreLocalization.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'internal/osama_core_localization.dart';
///
/// return MaterialApp(
///   localizationsDelegates: SakCoreLocalization.localizationsDelegates,
///   supportedLocales: SakCoreLocalization.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the SakCoreLocalization.supportedLocales
/// property.
abstract class SakCoreLocalization {
  SakCoreLocalization(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static SakCoreLocalization? of(BuildContext context) {
    return Localizations.of<SakCoreLocalization>(context, SakCoreLocalization);
  }

  static const LocalizationsDelegate<SakCoreLocalization> delegate =
      _SakCoreLocalizationDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @locale.
  ///
  /// In en, this message translates to:
  /// **'en'**
  String get locale;

  /// No description provided for @dragDownToRefresh.
  ///
  /// In en, this message translates to:
  /// **'Drag down to refresh'**
  String get dragDownToRefresh;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// No description provided for @kb.
  ///
  /// In en, this message translates to:
  /// **'KB'**
  String get kb;

  /// No description provided for @gb.
  ///
  /// In en, this message translates to:
  /// **'GB'**
  String get gb;

  /// No description provided for @mb.
  ///
  /// In en, this message translates to:
  /// **'MB'**
  String get mb;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend Code'**
  String get resendCode;

  /// No description provided for @resendTheCodeAfter.
  ///
  /// In en, this message translates to:
  /// **'Resend the code after'**
  String get resendTheCodeAfter;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'This field is required.'**
  String get requiredField;

  /// No description provided for @emptySearchResult.
  ///
  /// In en, this message translates to:
  /// **'Sorry, we couldn\'t find any matching results for your search!'**
  String get emptySearchResult;

  /// No description provided for @loadError.
  ///
  /// In en, this message translates to:
  /// **'Load Error'**
  String get loadError;

  /// No description provided for @loadErrorPleaseTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Tap to reload.'**
  String get loadErrorPleaseTryAgain;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @riyal.
  ///
  /// In en, this message translates to:
  /// **'Sar'**
  String get riyal;

  /// No description provided for @secondOfTime.
  ///
  /// In en, this message translates to:
  /// **'second'**
  String get secondOfTime;

  /// No description provided for @minute.
  ///
  /// In en, this message translates to:
  /// **'دقيقة'**
  String get minute;

  /// No description provided for @oneMinute.
  ///
  /// In en, this message translates to:
  /// **'1 minute'**
  String get oneMinute;

  /// No description provided for @twoMinutes.
  ///
  /// In en, this message translates to:
  /// **'2 minutes'**
  String get twoMinutes;

  /// No description provided for @oneMin.
  ///
  /// In en, this message translates to:
  /// **'One minute away'**
  String get oneMin;

  /// No description provided for @twoMin.
  ///
  /// In en, this message translates to:
  /// **'mins'**
  String get twoMin;

  /// No description provided for @mins.
  ///
  /// In en, this message translates to:
  /// **'minutes'**
  String get mins;

  /// No description provided for @dontShowAgain.
  ///
  /// In en, this message translates to:
  /// **'Don\'\'t show again'**
  String get dontShowAgain;
}

class _SakCoreLocalizationDelegate
    extends LocalizationsDelegate<SakCoreLocalization> {
  const _SakCoreLocalizationDelegate();

  @override
  Future<SakCoreLocalization> load(Locale locale) {
    return SynchronousFuture<SakCoreLocalization>(
        lookupSakCoreLocalization(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_SakCoreLocalizationDelegate old) => false;
}

SakCoreLocalization lookupSakCoreLocalization(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return SakCoreLocalizationAr();
    case 'en':
      return SakCoreLocalizationEn();
  }

  throw FlutterError(
      'SakCoreLocalization.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}

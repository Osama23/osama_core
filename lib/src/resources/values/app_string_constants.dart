// ignore_for_file: constant_identifier_names

// import 'package:flutter/services.dart';

//All the keys should start with prefix 'k' eg. kFoo

//Should be used to keep all the AppLocalization keys

//Should be used to keep all the shared preference keys
// class AppPreferencesConstants {
//   AppPreferencesConstants._();
//   static const String languageKey = 'language';
//   static const String flavorKey = 'flavor';
//   static const String sentryFlavorKey = 'sentryFlavor';
//   static const String recentlyViewedKey = 'recentlyViewed';
//   static const String kIsMute = 'isMute';
//   static const String themeOptionKey = 'kThemeOption';
//   static const String authToken = 'kAuthToke';
//   static const String nationalId = 'kNationalId';
//   static const String lastWatchedVideoDate = 'kFirstWatchedVideoDate';
//   static const String firstWatchedVideoDate = 'kLastWatchedVideoDate';
//   static const String refreshToken = 'kRefreshToke';
//   static const String userDetails = 'kUserDetails';
//   static const String userId = 'kUserId';
//   static const String onBoardingShown = 'kOnBoardingShown';
//   static const String recentSearches = 'kRecentSearches';
//   static const String algoliaRecentSearches = 'kAlgoliaRecentSearches';
//   static const String recentPropertiesSearches = 'kRecentPropertiesSearches';
//   static const String videoRecentSearches = 'kVideoRecentSearches';
//   static const String kSkipLogin = 'skip';
//   static const String kHasSkipLogin = 'hasSkipLogin';
//   static const String kPreviousRequestExists = 'previousRequestExists';
//   static const String kIsPublicApiCMSApi = 'isPublicCMSApi';
//   static const String kIsAllowToRecordingAndCapture =
//       'AllowScreenRecordingAndCapture';
//   static const String videoThumbnailMap = 'kVideoThumbnailMap';
//   static const String isFirstInstall = 'isFirstInstall';
//   static const String strapiToken = 'strapiToken';
//   static const String kCurrentEnv = 'CurrentEnv';
//   static const String kFavouriteStatus = 'kFavouriteStatus';
//   static const String kFavouriteNumber = 'kFavouriteNumber';
//   static const String onBoardingMapViewed = 'kOnBoardingMapViewed';
//   static const String onBoardingMapCardViewed = 'kOnBoardingMapCardViewed';
//   static const String mapViewedBefore = 'kMapViewedBefore';
//   static const String comparisonSetupViewed = 'kComparisonSetupViewed';
//   static const String comparisonEnabled = 'kComparisonEnabled';
//   static const String comparisonIds = 'kComparisonIds';

//   static const String investmentDefinitionShown = 'kInvestmentDefinitionShown';
//   static const String nameAlreadyRegistered = 'kNameAlreadyRegistered';
//   static const String hasRegistered = 'kHasRegistered';
//   static const String viewWelcomeSheet = 'kViewWelcomeSheet';
//   static const String hasCompleteRegistration = 'kHasCompleteRegistration';
//   static const String userMobileNumber = 'kUserMobileNumber';
//   static const String notificationEnabled = 'kNotificationEnabled';
//   static const String notificationsCount = 'kNotificationsCount';
//   static const String followDeveloperNotificationCount =
//       'kFollowDeveloperNotificationCount';
//   static const String purchaseNotificationCount = 'kPurchaseNotificationCount';
//   static const String numberOfTimesNafathCodeDisplayed =
//       'kNumberOfTimesNafathCodeDisplayed';
//   // static const String reminderProjectNotificationCount = 'kReminderProjectNotificationCount';
//   // static const String reminderPropertyNotificationCount = 'kReminderPropertyNotificationCount';
//   static const String reminderProjectPropertyNotificationCount =
//       'kReminderProjectPropertyNotificationCount';
//   static const String notificationInstallmentsPaid =
//       'kNotificationInstallmentsPaid';
//   static const String notificationInstallmentsOrderId =
//       'kNotificationInstallmentsOrderId';
//   static const String notificationDepositPaid = 'kNotificationDepositPaid';
//   static const String notificationDepositOrderId =
//       'kNotificationDepositOrderId';
//   static const String notificationTaxPaid = 'kNotificationTaxPaid';
//   static const String notificationTaxOrderId = 'kNotificationTaxOrderId';

//   static const String notificationFirstInstallmentPaid =
//       'kNotificationFirstInstallmentPaid';
//   static const String notificationSecondInstallmentPaid =
//       'kNotificationSecondInstallmentPaid';
//   static const String notificationThirdInstallmentPaid =
//       'kNotificationThirdInstallmentPaid';
//   static const String notificationForthInstallmentPaid =
//       'kNotificationForthInstallmentPaid';
//   static const String notificationFifthInstallmentPaid =
//       'kNotificationFifthInstallmentPaid';
//   static const String notificationSixthInstallmentPaid =
//       'kNotificationSixthInstallmentPaid';
//   static const String notificationSeventhInstallmentPaid =
//       'kNotificationSeventhInstallmentPaid';

//   static const String isMapOnboardingSkip = 'isMapOnboardingSkip';
//   static const String shouldViewOnBoardingMapLands =
//       'shouldViewOnBoardingMapLands';
//   static const String shouldViewOnBoardingMapUnits =
//       'shouldViewOnBoardingMapUnits';
//   static const String blockPiecesDisplayed = 'blockPiecesDisplayed';
// }

//Should be used to keep all the Strings which don't need localization

// class AdjustEventConstants {
//   static const kBookEvent = 'q9brtt';
//   static const kFavouriteEvent = 'kxtgsb';
//   static const kDepositPaidEvent = '60vkgm';
//   static const kKYCDoneEvent = 'ki5fdp';
//   static const kShareVideoEvent = 'f33n8n';
//   static const kShareProjectEvent = 's8x1p1';
//   static const kSharePropertyEvent = 'uo2guv';
//   static const kLikeVideoEvent = 'ooj5kj';
// }

// class ProjectTypeEnum {
//   static const kSubdivision = 'Subdivision';
//   static const kBuilding = 'Building';
// }

// class PropertyTypeEnum {
//   static const kLand = 'Land';
//   static const kVilla = 'Villa';
//   static const kApartment = 'Apartment';
//   static const kShop = 'Shop';
// }

// class PaymentStringConstants {
//   static const String kCurrency = 'SAR';
//   static const String kCountryCode = 'SA';
//   static const String requestType = 'card';
//   static const String paymentMethod = 'card';
//   static const String applePaymentMethod = 'apple';
//   static const String sadadPaymentMethod = 'sadad';
//   static const String type = 'CARD';
//   static const String source = 'INTERNET';
//   static const String walletProvider = 'APPLE_PAY';
//   static const String kMerchantIdentifierProd = 'merchant.getsak.sak';
//   static const invalid = 'INVALID';
//   static const statusPayment = 'StatusPayment';
//   static const String apiOperationPAY = 'PAY';
//   static const String apiOperationAuthPayer = 'AUTHENTICATE_PAYER';
//   static const String apiOperationInitAuth = 'INITIATE_AUTHENTICATION';
//   static const String kTransactionId = 'TxnID_';
//   static const String kReferenceId = 'TrxRef_';
//   static const String kOrderReferenceId = 'OrdRef_';
//   static const String kDepositPaymentMethod = 'SADAD_PAY';

//   static const String defaultApplePay = '''{
//     "provider": "apple_pay",
//     "data": {
//       "merchantIdentifier": "merchant.getsak.sak",
//       "displayName": "منصه صك العقاريه",
//       "merchantCapabilities": ["3DS", "debit", "credit"],
//       "supportedNetworks": [
//           "visa",
//           "masterCard",
//           "amex",
//           "discover",
//           "jcb",
//           "mada",
//           "cartesBancaires",
//           "eftpos",
//           "elo",
//           "interac",
//           "privateLabel",
//           "vPay",
//           "maestro",
//           "mir",
//           "unionPay"
//       ],
//       "countryCode": "SA",
//       "currencyCode": "SAR"
//     }
//   }''';
// }

abstract class FontFamily {
  static const String kDinNext = 'DINNext';
}

// class ArabicStringConstant {
//   static const String kHoursLeftToPay = 'ساعة متبقية للدفع';
//   static const String kDays = 'ساعة';
//   static const String kPaySum = 'دفع مبلغ';
//   static const String kInFull = 'بالكامل';
//   static const String kCompleteYourTaxAmount = 'أكمل مبلغ الضريبة';
//   static const String kPay = 'دفع';
//   static const String kAmountSuccessfully = 'مبلغ بنجاح';
//   static const String kDeposited = 'تم إيداع';
//   static const String kDepositPayment = 'إيداع دفع';
//   static const String kAmount = 'مبلغ';
//   static const String kBlock = 'بلوك';
// }

// abstract class PaymentStrings {
//   PaymentStrings._();
//   // static const String apiOperation='INITIATE_AUTHENTICATION';
//   static const String coRelationId = 'production';
//   static const String currency = 'SAR';
//   static const String countryCode = 'SA';
//   static const String acceptVersions = '3DS1,3DS2';
//   static const String channel = 'PAYER_BROWSER';
//   static const String purpose = 'PAYMENT_TRANSACTION';
//   static const String requestType = 'card';
//   static const String paymentMethod = 'card';
//   static const String type = 'CARD';
//   static const String description = 'sak app';

//   static const String source = 'INTERNET';
//   static const String walletProvider = 'APPLE_PAY';
//   // static const String merchantIdentifier = 'merchant.awaed';

//   static const invalid = 'INVALID';
//   static const statusPayment = 'StatusPayment';

//   static const String apiOperationPAY = 'PAY';
//   static const String apiOperationAuthPayer = 'AUTHENTICATE_PAYER';
//   static const String apiOperationInitAuth = 'INITIATE_AUTHENTICATION';
//   // static String redirectResponseUrl =
//   //     'https://api-staging.payment.co/wallet/redirection_page/index.php';
//   static String redirectResponseUrl(
//     String baseUrl,
//     // was EnvVariables.instance.baseUrl
//   ) =>
//       '$baseUrl/payment/payment-confirmation-redirect-url';

//   static String transactionId(dynamic attemptNum) => 'TxnID_$attemptNum';

//   static String referenceId(dynamic attemptNum) => 'TrxRef_$attemptNum';

//   static String orderReferenceId(dynamic attemptNum) => 'OrdRef_$attemptNum';
// }

// class FirebaseCollections {
//   static const String videoFeeds = 'SAKProjectVideos';
//   static const String likedVideos = 'UserLikedVideos';
// }

// class FirebaseCollectionKeys {
//   static const String videos = 'videos';
// }

// class AlgoliaConstants {
//   static const String projectIndexName = "development_api::project.project";
//   static const String propertyIndexName = "development_api::property.property";
//   static const String homeVideosIndexName =
//       "development_api::home-screen-video.home-screen-video";
// }

// import 'package:network_manager/generated/l10n.dart';
// import 'package:osama_core/internal/internal.dart';
//
// ///This file will contain all the endpoints of application
// class ApiConstants{
//   ApiConstants._();
//
//   //Common
//   static const String baseUrl = 'http://localhost:5000/api';
//   static const String headerAuthorization = 'Authorization';
//   static const String cmsGraphQLUrl = 'https://cms-dev.getsak.com/graphql';
//   static const String authToken = '';
//   static const String versionV2 = 'v2';
//   static const String versionV3 = 'v3';
//   static const String appVersion = 'App-Version';
//   static const String deedTransfer = 'v2.1';
//   static const String pageSize = 'page_size';
//   static const String page = 'page';
//   static const String publicIpAddress = '103.98.78.138';
//   // static const String publicIpAddress = '197.37.13.186';
//   // static const String publicIpAddress = '34.154.39.147';
//
//   /// end points
//   // Projects
//  static const String getProjectList = '/projects';
//  static const String getProjectDetail = '/projects';
//  static const String mapboxProperty = '/project/mapbox-data/{id}';
//
//
//   // properties EndPoint
//
//   static const String viewProperties = '/properties';
//   static const String viewProperty = '/properties';
//
//   // My Orders
//   static const String myOrders = '/order/list';
//   static const String orderDetail = '/order/detail';
//   static const String taxExemption = '/tax/tax-exempt';
//   static const String cancelOrder = '/order/cancel';
//   static const String setDeedTransferMethod = '/order/deed-method-field';
//   // static const String deedTransferMethod = '/deed-transfer-methods';
//   static const String deedTransferMethod = '/order/deed-method-field';
//   static const String uploadTaxExemption = '/tax/upload/tax-exempt';
//   static const String uploadBankFile = '/upload/';
//   static const String expireOrder = '/order/expired-order';
//   static const String sharedOrderPracticipant = '/shared_order/participants';
//   static const String sharedOrderDetails = '/shared_order/shared_order_details';
//   static const String inviteMember = '/shared_order_invitations/invite_member';
//   static const String remindUser = '/shared_order_invitations/send_reminder';
//   static const String redistribute = '/shared_order_invitations/redistribute';
//
//   // Payment
//
//   static const String purchase = '/purchase';
//   static const String sadadCreateBill = '/payment/create-bill';
//   static const String initiatePurchase  = '/initiate-purchase';
//   static const String transactions = '/payment';
//   static const String getPaymentMethod = '/payment/payment-methods';
//   static const String booking = '/order/book/{propertyId}';
//   static const String bookSharedOrder = '/shared_order/book/{propertyId}';
//   static const String paymentReceipt = '/payment/payment-receipt';
//   static const String getPaymentPlan = '/property/payment-plan-detail/{propertyId}';
//   static const String explorePaymentPlan = '/property/explore-payment-plan-detail/{propertyId}';
//
//
// //authentication
//  static const String userExist = '/profile/exist';
//  static const String otpAuthGenerate = '/otp/generate';
//  static const String otpUpdateNumber = '/profile/update-phone-number';
//  static const String otpAuthVerify = '/otp/verify';
//  static const String kyc = '/kyc';
//  static const String crVerification = '/cr-verification';
//  static const String register = '/profile/register';
//   static const String setLanguage = '/profile/language';
//   static const String refreshAuthToken = '/profile/refresh';
//   static const String activateAccount = '/profile/activate-user';
//   static const String activateUser = '/profile/user-activate';
//   static const String resendCode = '/otp/resend-otp';
//
//  // Favourites
//  static const String favourites = '/favourite/';
//  static const String favouriteProjects = '/favourite/project';
//  static const String favouriteProperties = '/favourite/property';
//  static const String favouritePropertyIds = '/favourite/property-ids';
//
//  // Rent
//  static const String getRentProperties = '/rent-request/';
//  static const String rentCities = '/rent-request/cities';
//
//  // Notifications
//  static const String notifications = '/notification/';
//  static const String notificationProperties = '/notification/property';
//  static const String notificationPropertyIds = '/notification/property-ids';
//
//  // Profile
//   static const String getProfilePicture = '/profile/profile-picture';
//   static const String getAccount = '/profile/';
//   static const String logout = '/profile/logout';
//   static const String updateUser = '/profile/update_user/{user_id}';
//   static const String deactivateAccount = '/profile/update_user/{user_id}';
//   static const String absherOtp = '/kyc/generate-absher-otp';
//   static const String sendFeedback = '/contact-us/';
//
//   // Terms and conditions
//
//  static const String getTermsAndConditions = '/terms-and-conditions';
//  static const String privacyPolicies = '/privacy-policies';
//
//
//
//
//  // Help and Support
//  static const String getHelpAndSupport = '/help-and-supports';
//  static const String getFAQ = '/faqs';
//
//  // about sak
//  static const String getAboutSak = '/sak-details';
//
//
//  // Filters
//  static const String getProjectFilter = '/project/filter';
//  static const String getPropertyFilter = '/property/filter';
//  static const String getPropertyFavoriteFilter = '/property/favorite/filter';
//
//  //notification
//  static const String notification = '/notification/';
//
//  static const String unreadNotificationCount = '/profile/unread-notification-count';
//
//  //Payment Endpoints
//  static const String addFund = '/payment/fund_operations/add_fund';
//  static const String confirmAddFund = '/payment/fund_operations/confirm_add_fund';
//
//  //video feeds
//  static const String homeScreenVideos =  '/home-screen-videos';
//
//
//  static const String videoComments =  '/comments';
//  static const String likeUnlikeVideo =  '/home-screen-videos/{id}';
//
//
//  static const String appConfig =  '/initial-app-configs';
//  // faq
//  static const String faq =  '/static/faq';
//
//    // shared order
//    static const String acceptInvitation = '/shared_order_invitations/accept_invitation';
//    static const String rejectInvitation = '/shared_order_invitations/reject-invitation';
//    static const String groupPropertyDetails = '/shared_property/group_property_details';
//    static const String sharedOrderParticipants = '/shared_order/participants';
//    static const String invitationDetails = '/shared_order_invitations/details';
//
//
// }
// //This class contains all the query params of api's
// class QueryConstants {
//  static const String page = 'page';
//  static const String startDate = 'start_date';
//  static const String endDate = 'end_date';
//  static const String userId = 'user_id';
//  static const String onlyLiked = 'only_liked';
//  static const String sharedId = 'shared_id';
//  static const String pagePagination = 'pagination[page]';
//  static const String pageSizePagination = 'pagination[pageSize]';
//  static const String hashtag = 'hashtag';
//  static const String available = 'Available';
//  static const String showProjectAvailableUnits = 'filters[Number_Of_Units_Available][\$gte]';
//  static const String showPropertiesAvailableUnits = 'filters[Property_Status][\$eq]';
//
//  String search = 'filters[\$or][0][Name_${context.l10n.languageCode}][\$containsi]';
//  String developer = 'filters[\$or][1][Developer][Name_${AppLocalizationDelegate.locale.languageCode}][\$containsi]';
//  //'filters[Name_${AppLocalizationDelegate.locale.languageCode}][\$containsi]';
//  String city = 'filters[City][Name_${AppLocalizationDelegate.locale.languageCode}][\$eq]';
//  String projectType = 'filters[Project_Type][Name_${AppLocalizationDelegate.locale.languageCode}][\$eq]';
//  String propertyType = 'filters[Property_Type][Name_${AppLocalizationDelegate.locale.languageCode}][\$eq]]';
//  static const String minSize = 'filters[Area][\$gte]';
//  static const String maxSize = 'filters[Area][\$lte]';
//  static const String bedrooms = 'filters[No_Of_Bedrooms][\$eq]';
//  static const String minPricePerMeter = 'filters[Price_Per_Meter][\$gte]';
//  static const String maxPricePerMeter = 'filters[Price_Per_Meter][\$lte]';
//  static const String minFloor = 'filters[Floor][\$gte]';
//  static const String maxFloor = 'filters[Floor][\$eq]';
//  static const String minStreetWidth = 'filters[Street_Width][\$gte]';
//  static const String maxStreetWidth = 'filters[Street_Width][\$lte]';
//  static const String minStreetCount = 'filters[No_Of_Streets][\$gte]';
//  static const String maxStreetCount = 'filters[No_Of_Streets][\$eq]';
//  static const String facade = 'filters[Facade][\$eq]';
//  static const String elevator = 'filters[Elevator][\$eq]';
//  static const String locale = 'locale';
//  static const String propertyId = 'property_id';
//  static const String osType = 'os_type';
//  static const String orderId = 'order_id';
//  static const String voucherId = 'voucher_id';
//  static const String excludeUserTax = 'exclude_user_tax';
//  static const String paginationPage = 'pagination[page]';
//  static const String paginationPageSize = 'pagination[pageSize]';
//  static const String projectId = 'filters[Project][id][\$eq]';
//  static const String taxExemptionFiles = 'tax_exemption_files';
//  static const String documentType = 'document_type';
//  static const String files = 'files';
//  static const String filterProjectId = 'project_id';
//  static const String projectFilterType = 'project_type';
//  static const String filterPropertiesIds = 'properties_ids';
//
//
//  // Comments
//  static const String parentCommentId = 'parent_comment_id';
//  static const String contentId = 'content_id';
//  static const String contentName = 'content_name';
//  static const String comment = 'comment';
//
// }
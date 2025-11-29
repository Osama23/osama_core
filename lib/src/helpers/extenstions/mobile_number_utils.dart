extension MobileNumberUtils on String {
  String formattedMobileNumber([String countryCode = "+966"]) {
    final mobileWithoutZero = this[0] == "0" ? substring(1) : this;
    return "$countryCode$mobileWithoutZero";
  }

  String removeCountryCode([String countryCode = "+966"]) {
    return replaceAll(countryCode, "").replaceAll(" ", "");
  }
}

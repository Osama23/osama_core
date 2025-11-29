extension DoubleUtils on num {
  num shouldShowDecimal() {
    final floored = floor();
    final value = this / floored;
    return value == 1 ? toInt() : this;
  }

  String shouldShowDecimalWithDigits([int digits = 3]) {
      final floored = floor();
    final value = this / floored;

    // If the value is an integer (no decimal part)
    if (value == 1 || this == toInt()) return toInt().toString();

    // Use toStringAsFixed to handle rounding and limiting decimal places
    String valueString = toStringAsFixed(digits);

    // Remove unnecessary trailing zeros in the decimal part
    if (valueString.contains('.')) {
      valueString = valueString.replaceAll(RegExp(r'0*$'), ''); // Remove trailing zeros
      valueString = valueString.replaceAll(RegExp(r'\.$'), ''); // Remove the dot if no decimal places remain
    }

    return valueString;
  }
}

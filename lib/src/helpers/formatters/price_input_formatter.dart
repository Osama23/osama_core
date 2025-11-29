import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PriceInputFormatter extends TextInputFormatter {
  PriceInputFormatter({this.decimalRange = 9});

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // If the new value is empty or just contains whitespace, return an empty TextEditingValue
    if (newValue.text.trim().isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    // Allow digits, commas, and a single dot (.)
    final regex = RegExp(r'^[0-9,]*\.?[0-9]*$');
    if (!regex.hasMatch(newValue.text)) {
      return oldValue; // Reject invalid input
    }

    // Split input into whole and decimal parts
    final parts = newValue.text.split('.');
    String formattedWholePart = '';

    // Handle whole part
    if (parts.isNotEmpty) {
      final wholePart = parts[0].replaceAll(',', ''); // Remove existing commas
      if (wholePart.isNotEmpty) {
        final wholeNumber = int.tryParse(wholePart);
        if (wholeNumber != null) {
          final f = NumberFormat("#,###");
          formattedWholePart = f.format(wholeNumber);
        }
      }
    }

    // Handle decimal part
    String formattedDecimalPart = '';
    if (parts.length == 2) {
      formattedDecimalPart = parts[1];
      if (formattedDecimalPart.length > decimalRange) {
        formattedDecimalPart = formattedDecimalPart.substring(0, decimalRange);
      }
    }

    // Combine the formatted whole and decimal parts
    String newString =
        formattedDecimalPart.isNotEmpty || newValue.text.endsWith('.')
            ? '$formattedWholePart.$formattedDecimalPart'
            : formattedWholePart;

    // Calculate cursor position after reformatting
    int newCursorPosition = newString.length;
    if (newValue.text.length > oldValue.text.length) {
      // Adjust the cursor to account for any commas added
      final addedCommas = formattedWholePart.length - parts[0].length;
      newCursorPosition =
          newValue.selection.end + addedCommas.clamp(0, newString.length);
    } else {
      // Maintain the cursor position from the right side when deleting
      final selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.end;
      newCursorPosition = newString.length - selectionIndexFromTheRight;
    }

    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(
          offset: newCursorPosition.clamp(0, newString.length)),
    );
  }
}

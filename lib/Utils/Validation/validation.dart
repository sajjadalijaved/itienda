import 'package:flutter/services.dart';

class FieldValidator {
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email is Required';
    }
    if (!RegExp(r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
        .hasMatch(value)) {
      return 'Please enter a valid Email';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) return "Password is required";
    if (value.length < 6) return "Password is too short";
    return null;
  }

  static String? validatePasswordMatch(String value, String pass2) {
    if (value.isEmpty) return "Confirm password is required";
    if (value != pass2) {
      return "Password doesn't match";
    }
    return null;
  }

  static String? validateName(String value) {
    if (value.isEmpty) return "First name is required";
    if (value.length <= 2) {
      return "First name is too short";
    }

    return null;
  }

  static String? validateLastName(String value) {
    if (value.isEmpty) return "Last name is required";
    if (value.length <= 1) {
      return "Last name is too short";
    }

    return null;
  }

  static String? validatePinCode(String? value) {
    if (value!.isEmpty) {
      return "Incorrect PIN CODE";
    }
    return null;
  }

  static String? validatePhoneNumber(String value) {
    if (value.isEmpty) return "Phone number is required";
    Pattern pattern = r'(^(?:[+0]9)?[0-9]{9,20}$)';
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value.trim())) {
      return "Please enter a valid phone number";
    }
    return null;
  }

  static String? validateDate(String? input) {
    RegExp dateRegex = RegExp(
      r'^\d{2}-\d{2}-\d{4}$',
    );
    if (input!.isEmpty) {
      return "Birth date is required";
    }
    if (!dateRegex.hasMatch(input)) {
      return 'Invalid date format';
    }

    final parts = input.split('-');
    if (parts.length != 3) {
      return 'Invalid date format';
    }

    final day = int.tryParse(parts[0]);
    final month = int.tryParse(parts[1]);
    final year = int.tryParse(parts[2]);

    if (day == null || month == null || year == null) {
      return 'Invalid date format';
    }

    // if (year < 1600 || year > 3100) {
    //   errorText = 'Year Must be between 1600 to 3100';
    //   return false;
    // }

    if (month < 1 || month > 12) {
      return 'Month Must be between 01 to 12';
    }

    if (day < 1 || day > 31) {
      return 'Day Must be between 01 to 31';
    }

    // Check for February and leap years
    if (month == 2) {
      if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
        // Leap year
        if (day > 29) {
          return 'Invalid day for February in a leap year';
        }
      } else {
        // Not a leap year
        if (day > 28) {
          return 'Invalid day for February';
        }
      }
    }

    return null;
  }
}

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // If the new value is shorter than the old value, check and adjust the formatting
    if (oldValue.text.length > newValue.text.length) {
      // Check if the last character is "/" and remove it along with the previous digit
      if (oldValue.text.endsWith('-') && oldValue.text.length > 1) {
        final newString = oldValue.text.substring(0, oldValue.text.length - 2);
        return TextEditingValue(
          text: newString,
          selection: TextSelection.collapsed(offset: newString.length),
        );
      }
    }

    // If the new value is longer than the old value, apply the usual formatting
    if (newValue.text.length == 2 || newValue.text.length == 5) {
      final newText = '${newValue.text}-';
      return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }

    return newValue;
  }
}

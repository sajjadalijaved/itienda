import 'package:flutter/services.dart';

class FieldValidator {
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Correo electronico es requerido';
    }
    if (!RegExp(r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
        .hasMatch(value)) {
      return 'Please enter a valid Email';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) return "se requiere contraseña";
    if (value.length < 8) return "Contraseña is too short";
    return null;
  }

  static String? validatePasswordMatch(String value, String pass2) {
    if (value.isEmpty) return "Se requiere confirmar la contraseña";
    if (value != pass2) {
      return "Contraseña doesn't match";
    }
    return null;
  }

  static String? validateName(String value) {
    if (value.isEmpty) return "Se requiere el primer nombre";
    if (value.length <= 2) {
      return "Nombre de pila is too short";
    }

    return null;
  }

  static String? validateBusinessName(String value) {
    if (value.isEmpty) return "Nombre del Negocio";
    if (value.length <= 2) {
      return "Nombre del Negocio is too short";
    }

    return null;
  }

  static String? validateLastName(String value) {
    if (value.isEmpty) return "Se requiere apellido";
    if (value.length <= 1) {
      return "Apellido is too short";
    }

    return null;
  }

  static String? validatePinCode(String? value) {
    if (value!.isEmpty) {
      return "CÓDIGO PIN incorrecto";
    }
    return null;
  }

  static String? validatePhoneNumber(String value) {
    if (value.isEmpty) return "Se requiere número de teléfono";
    Pattern pattern = r'(^(?:[+0]9)?[0-9]{9,20}$)';
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value.trim())) {
      return "Por favor ingrese un número de teléfono válido";
    }
    return null;
  }

  static String? validateDate(String? input) {
    RegExp dateRegex = RegExp(
      r'^\d{2}-\d{2}-\d{4}$',
    );
    if (input!.isEmpty) {
      return "Se requiere fecha de nacimiento";
    }
    if (!dateRegex.hasMatch(input)) {
      return 'Por favor ingrese este tipo 24-12-2023 de fecha';
    }

    final parts = input.split('-');
    if (parts.length != 3) {
      return 'Formato de fecha no válido';
    }

    final day = int.tryParse(parts[0]);
    final month = int.tryParse(parts[1]);
    final year = int.tryParse(parts[2]);

    if (day == null || month == null || year == null) {
      return 'Formato de fecha no válido';
    }

    // if (year < 1600 || year > 3100) {
    //   errorText = 'Year Must be between 1600 to 3100';
    //   return false;
    // }

    if (month < 1 || month > 12) {
      return 'Mes Debe ser entre 01 y 12';
    }

    if (day < 1 || day > 31) {
      return 'El día debe ser entre el 01 y el 31.';
    }

    // Check for February and leap years
    if (month == 2) {
      if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
        // Leap year
        if (day > 29) {
          return 'Día no válido para febrero en un año bisiesto.';
        }
      } else {
        // Not a leap year
        if (day > 28) {
          return 'Día no válido para febrero.';
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

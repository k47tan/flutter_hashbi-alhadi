import 'package:flutter/material.dart';

class NameEditingController extends TextEditingController {
  String? validate(String? value) {
    String patternNumber = r'[0-9!@#\$%^&*(),.?":{}|<>]';
    RegExp regexNumbers = RegExp(patternNumber);
    String patternLetter = r"^[A-Z][a-z]*(?:\s[A-Z][a-z]*)*$";
    RegExp regexLetters = RegExp(patternLetter);

    if (value == null || value.isEmpty) {
      return "Data is empty";
    }
    if (regexNumbers.hasMatch(value)) {
      return "Data contains number and symbol";
    }
    if (value.trim() != value) {
      return "Blank Letter detected";
    }
    if (!regexLetters.hasMatch(value)) {
      return "Each word must start with a capital letter";
    }

    // Return null if validation passes
    return null;
  }
}

class NumberEditingController extends TextEditingController {
  String? validate(String? value) {
    String patternLetter = r'[A-Za-z!@#\$%^&*(),.?":{}|<>]';
    RegExp regexLetters = RegExp(patternLetter);
    String patternNumber = r'^[0-9]*$';
    RegExp regexNumbers = RegExp(patternNumber);

    if (value == null || value.isEmpty) {
      return "Data is empty";
    }
    if (regexLetters.hasMatch(value)) {
      return "Data contains letter and symbol";
    }
    if (value.trim() != value) {
      return "Blank Letter detected";
    }
    if (!regexNumbers.hasMatch(value)) {
      return "Data must be a number";
    }
    if (value.length < 8) {
      return "Data is less than 8 digits";
    }
    if (value.length > 15) {
      return "Data is more than 15 digits";
    }
    if (value.substring(0, 1) != '0') {
      return "Data is not start with 0";
    }
    // Return null if validation passes
    return null;
  }
}

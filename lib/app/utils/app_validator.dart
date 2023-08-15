import 'package:flutter/material.dart';
import 'constants/app_strings.dart';

class AppValidator {
  static String? validateName(String? value, String label) {
    if (value == null || value.isEmpty) {
      return '$label should not be blank';
    }
    return null;
  }

  static String? validatePin(String? value, String label) {
    if (value == null || value.isEmpty) {
      return '$label should not be blank';
    } else if (value.length < 4) {
      return '$label should contain 4 digits';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Enter password";
    }
    return null;
  }

  static String? validatePhone(String? value, String label) {
    if (value == null || value.isEmpty) {
      return '$label should not be blank';
    } else if (value.length < 9) {
      return '$label should contain 9 digits';
    }
    return null;
  }

  static String? validateEmail(String? value, String label) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return label;
    } else {
      if (!regExp.hasMatch(value)) {
        return label;
      } else {
        return null;
      }
    }
  }

  static String? validateAddress(String? value) {
    if (value!.isEmpty || value.length < 5) {
      return "Enter address";
    }
    return null;
  }

  String? validateString(String fieldType, ErrorType validationType) {
    if (toString()
        .trim()
        .isEmpty) {
      return messageBuilder(fieldType);
    }
    return null;
  }

  static String? messageBuilder(String fieldType,
      {ErrorType validationType = ErrorType.EMPTY,
        int minDigits = 0,
        int maxDigits = 0}) {
    switch (validationType) {
      case ErrorType.EMPTY:
        return "Please Enter $fieldType";
      case ErrorType.INVALID:
        return "Please Enter Valid $fieldType";
      case ErrorType.PASSWORD:
        return "Password must contain one uppercase,lowercase,number and special character and at least 8 characters in length $fieldType";
      case ErrorType.SELECT:
        return "Please Select $fieldType";
      case ErrorType.NONE:
        return null;
      case ErrorType.MIN_DIGIT:
        return "$fieldType must contains minimum $minDigits";
      case ErrorType.MAX_DIGIT:
        return "$fieldType only contains maximum $maxDigits";
    }
  }
}

enum ErrorType { EMPTY, INVALID, MIN_DIGIT, MAX_DIGIT, SELECT, NONE, PASSWORD }

extension StringExtensions on String {
  bool validateEmpty() {
    return (trim()
        .isEmpty);
  }
  bool validateEmailAddress() {
    String emailValidator =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return (!RegExp(emailValidator).hasMatch(this));
  }
  bool validatePassword(){
    String passwordValidator =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    return (!RegExp(passwordValidator).hasMatch(this));
  }

  bool validateBothPassword(String oldPassword) {
    return this != oldPassword;
  }

  bool  validateName (){
    String nameValidator = r"^[a-zA-z]";
    return (!RegExp(nameValidator).hasMatch(this));

  }

  bool validateAge (){
    String ageValidator = r"^([1-9]\d?|100)$";
    return (!RegExp(ageValidator).hasMatch(this));
  }

  bool validatePhoneNumber(){
    String phoneNumberValidator = r"^[6-9]\d{9}$";
    //r"^([0-9])\1{2}\1{3}\1{4}$";
    return (!RegExp(phoneNumberValidator).hasMatch(this));
  }

  bool validatePhoneNumberMaxDigit(){
    //r"^([0-9])\1{2}\1{3}\1{4}$";
    return this.length<10;
  }

  bool validateVerification(){
    String verificationValidator = r"^[0-9]{4}$";
    return (!RegExp(verificationValidator).hasMatch(this));
  }
}

extension TextEditingControllerExtension on TextEditingController {
  bool isEmpty() {
    return text.validateEmpty();
  }

  bool validateEmailAddress() {
    return text.validateEmailAddress();
  }

  bool validatePassword (){
    return text.validatePassword();
  }

  bool validateBothPassword(String oldPassword) {
    return text.validateBothPassword(oldPassword);
  }
  bool validateName(){
    return text.validateName();
  }

  bool validateAge(){
    return text.validateAge();
  }
  bool validatePhone(){
    return text.validatePhoneNumber();
  }

  bool validatePhoneMaxDigit(){
    return text.validatePhoneNumberMaxDigit();
  }

  bool validateOTP(){
    return text.validateVerification();
  }

}
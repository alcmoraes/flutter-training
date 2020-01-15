import 'package:flutter/material.dart';

class Validators {

  static String notEmptyValidator(String v) {
    if (v.isEmpty) {
      return "Preencha este campo";
    }
    return null;
  }

}
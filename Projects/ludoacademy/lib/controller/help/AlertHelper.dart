import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AlertHelper {
  static showAlert(
      BuildContext context, String title, String description, List<DialogButton> buttons, AlertStyle style, State state) {
    Alert(
        context: context,
        title: title,
        desc: description,
        buttons: buttons,
        style: style
    ).show();
  }
}

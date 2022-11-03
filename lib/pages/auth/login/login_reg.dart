import 'package:flutter/material.dart';

import '../../../base/reg_exp.dart';
import '../../../base/routes.dart';
import 'login_page.dart';

void onLogin(context) {
  final regExp = RegExp(RegularExpressions.email);

  if (usernameCtrl.text.isNotEmpty && passwordCtrl.text.isNotEmpty) {
    if (regExp.hasMatch(usernameCtrl.text)) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.pageview);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return _dialog(
            context,
            title: 'Error',
            content: 'Username is invalid',
          );
        },
      );
    }
  } else {
    showDialog(
      context: context,
      builder: (context) {
        return _dialog(
          context,
          title: 'Error',
          content: 'Some of the credentials are empty',
        );
      },
    );
  }
}

Widget _dialog(
  context, {
  required String title,
  String? content,
}) {
  return AlertDialog(
    title: Text(title),
    content: Text(content ?? 'Some of the credentials are empty'),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('OK'),
      ),
    ],
  );
}
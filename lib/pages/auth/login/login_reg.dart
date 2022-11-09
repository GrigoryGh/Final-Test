import 'package:flutter/material.dart';
import '../../../base/routes.dart';
import 'bloc/login_bloc.dart';

void onLogin(context, LoginState state) {
  state.formGroup.valid
      ? Navigator.of(context).pushReplacementNamed(AppRoutes.pageview)
      : state.formGroup.markAllAsTouched();
}

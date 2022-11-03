import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  bool isChecked = false;
  LoginBloc() : super(const LoginState()) {
    on<ViewPassword>((event, emit) {
      emit(state.copyWith(showPassword: !state.showPassword));
    });
    on<ChangeCheckBox>(((event, emit) {
      emit(state.copyWith(checkBox: !state.checkBox));
    }));
  }
}

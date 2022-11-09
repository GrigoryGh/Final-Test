import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_test/pages/auth/login/form.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState(form)) {
    on<ViewPassword>((event, emit) {
      emit(state.copyWith(showPassword: !state.showPassword));
    });
    on<ChangeCheckBox>(((event, emit) {
      emit(state.copyWith(checkBox: !state.checkBox));
    }));
  }
}

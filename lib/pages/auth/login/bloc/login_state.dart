part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool showPassword;
  final bool checkBox;
  const LoginState({this.showPassword = true, this.checkBox = false});

  LoginState copyWith({
    bool? showPassword,
    bool? checkBox,
  }) {
    return LoginState(
      showPassword: showPassword ?? this.showPassword,
      checkBox: checkBox ?? this.checkBox,
    );
  }

  @override
  List<Object> get props => [showPassword, checkBox];
}

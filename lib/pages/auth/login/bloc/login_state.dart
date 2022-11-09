part of 'login_bloc.dart';



class LoginState extends Equatable {

  final bool showPassword;
  final bool checkBox;
  final FormGroup formGroup;
  const LoginState(this.formGroup, {this.showPassword = true, this.checkBox = false,});

  LoginState copyWith({
    bool? showPassword,
    bool? checkBox,
    FormGroup? formGroup
  }) {
    return LoginState(
      formGroup ?? this.formGroup,
      showPassword: showPassword ?? this.showPassword,
      checkBox: checkBox ?? this.checkBox,
    );
  }

  @override
  List<Object> get props => [showPassword, checkBox];
}

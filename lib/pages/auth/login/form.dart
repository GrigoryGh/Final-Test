import 'package:reactive_forms/reactive_forms.dart';

const passwordRegEx = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$";

final form = FormGroup({
  'email':
      FormControl<String>(validators: [Validators.email, Validators.required]),
  'password': FormControl<String>(
      validators: [Validators.required, Validators.pattern(passwordRegEx)]),
  'passwordConfirmation': FormControl<String>(validators: [
    Validators.required,
  ])
}, validators: [
  Validators.mustMatch('password', 'passwordConfirmation')
]);

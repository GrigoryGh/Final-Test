import 'package:reactive_forms/reactive_forms.dart';

final form = FormGroup({
  'email':
      FormControl<String>(validators: [Validators.email, Validators.required]),
  'password': FormControl<String>(validators: [
    Validators.required,
  ]),
  'passwordConfirmation': FormControl<String>(validators: [
    Validators.required,
  ])
}, validators: [
  Validators.mustMatch('password', 'passwordConfirmation')
]);

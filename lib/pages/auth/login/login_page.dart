import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'bloc/login_bloc.dart';
import 'login_fields.dart';
import 'login_reg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }
}

Widget _buildBody(BuildContext context) {
  return ReactiveFormConfig(
      validationMessages: {
        ValidationMessage.required: (error) => 'Field must not be empty',
        ValidationMessage.email: (error) => 'Must enter a valid email',
        ValidationMessage.mustMatch: (error) =>
            'Cannot pack! The passwords are different!',
        ValidationMessage.pattern: (error) =>
            'The password must have \n one capital letter, one lowercase letter, one number \n [minimum length 8]'
      },
      child: SafeArea(
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => LoginBloc(),
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset('assets/images/login.png')),
                    fields(context, state),
                    SizedBox(
                      height: 35,
                      width: 120,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.red),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                    side: BorderSide(color: Colors.red)))),
                        onPressed: () {
                          onLogin(context, state);
                        },
                        child: const Text("Login"),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.grey, fontSize: 30),
                        )),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ));
}

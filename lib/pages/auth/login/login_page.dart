import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc.dart';
import 'login_reg.dart';

TextEditingController usernameCtrl = TextEditingController();
TextEditingController passwordCtrl = TextEditingController();

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }
}

Widget _buildBody(BuildContext context) {
  return SafeArea(
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                    side: BorderSide(color: Colors.red)))),
                    onPressed: () {
                      onLogin(context);
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
  );
}

Widget fields(BuildContext context, LoginState state) {

  return Container(
    padding: const EdgeInsets.only(
      right: 25,
      left: 25,
      bottom: 20,
    ),
    child: Column(
      children: [
        const SizedBox(height: 30),
        TextField(
          controller: usernameCtrl,
          decoration: const InputDecoration(
            labelText: 'Email*',
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: passwordCtrl,
          obscureText: state.showPassword,
          decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: IconButton(
              onPressed: () =>
                  BlocProvider.of<LoginBloc>(context).add(ViewPassword()),
              icon: state.showPassword
                  ? const Icon(
                      Icons.visibility,
                    )
                  : const Icon(
                      Icons.visibility_off,
                    ),
            ),
          ),
        ),
        CheckboxListTile(
          title: const Text('Remember Password'),
          value: state.checkBox,
          onChanged: (value) =>
              BlocProvider.of<LoginBloc>(context).add(ChangeCheckBox()),
          activeColor: Colors.red,
          controlAffinity: ListTileControlAffinity.leading,
          checkboxShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
        )
      ],
    ),
  );
}





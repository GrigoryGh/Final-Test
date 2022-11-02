import 'package:final_test/base/reg_exp.dart';
import 'package:final_test/base/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('assets/images/login.png')),
            _fields(context),
            SizedBox(
              height: 35,
              width: 120,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            side: BorderSide(color: Colors.red)))),
                onPressed: () {
                  _onLogin(context);
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
        ),
      ),
    );
  }

  Widget _fields(BuildContext context) {
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
            obscureText: !showPassword,
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: IconButton(
                onPressed: _onShowPassword,
                icon: showPassword
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
            value: true,
            onChanged: (value) {},
            activeColor: Colors.red,
            controlAffinity: ListTileControlAffinity.leading,
            checkboxShape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
          )
        ],
      ),
    );
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

  void _onLogin(context) {
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

  void _onShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }
}

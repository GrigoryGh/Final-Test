import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc.dart';
import 'login_page.dart';

Widget fields(BuildContext context, LoginState state) {
  // return BlocBuilder<LoginBloc, LoginState>(
  //   builder: (context, state) {
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
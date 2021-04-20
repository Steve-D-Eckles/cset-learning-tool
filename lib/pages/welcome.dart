import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';

import 'login.dart';
import 'register.dart';

class Welcome extends StatelessWidget {

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context) /*!*/ .push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              'Welcome to the CSET Learning Tool',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50, fontFamily: 'sans-serif')
            )
          ),
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: SignInButtonBuilder(
              height: 50,
              width: 250,
              icon: Icons.person_add,
              backgroundColor: Colors.indigo,
              text: 'Register',
              fontSize: 18,
              onPressed: () => _pushPage(context, Register()),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: SignInButtonBuilder(
              height: 50,
              width: 250,
              icon: Icons.verified_user,
              backgroundColor: Colors.orange,
              text: 'Sign In',
              fontSize: 18,
              onPressed: () => _pushPage(context, Login()),
            )
          )
        ]
      )
    );
  }
}
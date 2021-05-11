import 'package:clt/models/concept.dart';
import 'package:clt/pages/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

// ignore: must_be_immutable
class ConceptView extends StatelessWidget {
  Concept concept;
  ConceptView(this.concept);

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context) /*!*/ .push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(concept.title),
          actions: <Widget>[
            Builder(builder: (BuildContext context) {
              return TextButton(
                onPressed: () async {
                  final User user = _auth.currentUser;
                  if (user == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('No one has signed in.'),
                    ));
                    return;
                  }
                  await _signOut(context);

                  final String email = user.email;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('$email has successfully signed out.'),
                  ));
                },
                child: const Text('Sign out'),
              );
            })
          ]
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: SingleChildScrollView(
            child: Text(concept.body, style: TextStyle(fontSize: 18))
        ),
      )
    );
  }

  Future<void> _signOut(context) async {
    await _auth.signOut();
    _pushPage(context, Welcome());
  }
}
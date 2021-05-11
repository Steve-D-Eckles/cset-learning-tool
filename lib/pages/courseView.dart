import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clt/models/concept.dart';
import 'package:clt/models/course.dart';
import 'package:clt/pages/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'conceptView.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

// ignore: must_be_immutable
class CourseView extends StatelessWidget {
  Course course;
  CourseView(this.course);

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context) /*!*/ .push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(course.full),
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
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: Text(
                      'Concepts:',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 50, fontFamily: 'sans-serif')
                  )
              ),
              Expanded(
                  child: _buildBody(context)
              )
            ]
        )
    );
  }

  _buildTile(context, Concept concept) {
    return ListTile(
        title: Text(concept.title),
        onTap: () {
          _pushPage(context, ConceptView(concept));
        }
    );
  }

  _buildList(context, List list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return _buildTile(context, list[index]);
      },
    );
  }

  _buildBody(context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('courses').doc(course.short.substring(course.short.length - 3)).collection('concepts').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        List concepts = [];
        for (DocumentSnapshot doc in snapshot.data.docs) {
          concepts.add(Concept.fromSnapshot(doc));
        }

        return _buildList(context, concepts);
      },
    );
  }

  Future<void> _signOut(context) async {
    await _auth.signOut();
    _pushPage(context, Welcome());
  }
}
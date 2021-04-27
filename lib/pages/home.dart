import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clt/models/course.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'courseView.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Home extends StatelessWidget {

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context) /*!*/ .push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Home'),
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
                    await _signOut();

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
                      'Choose a course',
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

  _buildTile(context, Course course) {
    return ListTile(
        title: Text(course.full),
        leading: Text(course.short),
        onTap: () {
          _pushPage(context, CourseView(course));
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
      stream: FirebaseFirestore.instance.collection('courses').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        List courses = [];
        for (DocumentSnapshot doc in snapshot.data.docs) {
          courses.add(Course.fromSnapshot(doc));
        }

        return _buildList(context, courses);
      },
    );
  }

  Future<void> _signOut() async {
    await _auth.signOut();
  }
}
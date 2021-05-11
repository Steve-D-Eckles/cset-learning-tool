import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';

class Quiz1 extends StatelessWidget {

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context) /*!*/.push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  @override Widget build(BuildContext context) {

    List<String> questions = new List<String>(5);
    questions[0]= "Who's the greatest of them all?";
    questions[1]= "What is your quest?";
    questions[2]= "In Australia, is your left actually your right?";
    questions[3]= "2 + 2 = ";
    questions[4]= "How much wood does a woodchuck chuck?";
    List<int> ans = new List<int>(5);
    ans[0] = 1;
    ans[1] = 3;
    ans[2] = 2;
    ans[3] = 0;
    ans[4] = 2;

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(

            ),
            Container(
              child: Column(
                children: <Widget>[
                  Card(),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Card(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    questions[0],
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
                                 ),
                              ),
                            Container()
                      ],
                          ),
                        ),
                        Container(),
                        Container(),
                        Container()
                      ],
                    ),
                  )
                ],

              ),

            ),
            Container(

            ),
            Container(

            ),
            Container(

            ),
            Container(

            ),
            Container(),
            Container()
          ],
        ),
      ),

    );
  }
}
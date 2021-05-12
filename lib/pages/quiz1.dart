import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Color myColor1 = HexColor('#0b3240');
Color myColor2 = HexColor('#03668a');
Color myColor3 = HexColor('#029ad1');
Color myColor4 = HexColor('#8a0808');

class Quiz extends StatefulWidget {

  @override
  _QuizState createState() => _QuizState();
  bool _hasBeenPressed = false;

}

class _QuizState extends State<Quiz>{

  bool _hasBeenPressed = false;
  bool _answerTrue = false;
  bool _answerTrue2 = false;
  bool _answerTrue3 = false;
  bool _answerTrue4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 50.0, left: 10.0),
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    'Quiz',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                Center(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom:40.0),
                          child: Card(
                            elevation: 50,
                            shadowColor: Colors.black,
                            color: _answerTrue ? myColor3 : myColor1,
                            child: SizedBox(
                              width: 375,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(bottom: 20.0, top: 20.0),
                                      child: Text(
                                        "Who's the greatest of them all?",
                                        style: TextStyle(fontSize: 25, color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                      child: SizedBox(
                                        width: 200,
                                        child: ElevatedButton(
                                          onPressed: () => {
                                            setState(() {
                                              _answerTrue = !_answerTrue;
                                            })
                                          },
                                          child: Text('Mickey'),
                                          style: ElevatedButton.styleFrom(
                                            primary: myColor2,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: SizedBox(
                                        width: 200,
                                        child: ElevatedButton(
                                          onPressed: (){
                                            print('Pressed');
                                          },
                                          child: Text('Donald'),
                                          style: ElevatedButton.styleFrom(
                                            primary: myColor2,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: SizedBox(
                                        width: 200,
                                        child: ElevatedButton(
                                          onPressed: (){
                                            print('Pressed');
                                          },
                                          child: Text('Goofy'),
                                          style: ElevatedButton.styleFrom(
                                            primary: myColor2,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(bottom:20.0),
                                      child: SizedBox(
                                        width: 200,
                                        child: ElevatedButton(
                                          onPressed: (){
                                            print('Pressed');
                                          },
                                          child: Text('Daisey'),
                                          style: ElevatedButton.styleFrom(
                                            primary: myColor2,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom:40.0),
                          child: Card(
                            elevation: 50,
                            shadowColor: Colors.black,
                            color: _answerTrue2 ? myColor3 : myColor1,
                            child: SizedBox(
                              width: 375,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(bottom: 20.0, top: 20.0),
                                      child: Text(
                                        'What is your quest?',
                                        style: TextStyle(fontSize: 25, color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                      child: SizedBox(
                                        width: 300,
                                        child: ElevatedButton(
                                          onPressed: (){
                                            print('Pressed');
                                          },
                                          child: Text('To find the cure for smelling of elderberries',
                                            textAlign: TextAlign.center,),
                                          style: ElevatedButton.styleFrom(
                                            primary: myColor2,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(bottom:20.0),
                                      child: SizedBox(
                                        width: 300,
                                        child: ElevatedButton(
                                          onPressed: () => {
                                            setState(() {
                                              _answerTrue2 = !_answerTrue2;
                                            })
                                          },
                                          child: Text('To find the holy grail'),
                                          style: ElevatedButton.styleFrom(
                                            primary: myColor2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom:40.0),
                          child: Card(
                            elevation: 50,
                            shadowColor: Colors.black,
                            color: _answerTrue3 ? myColor3 : myColor1,
                            child: SizedBox(
                              width: 375,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(bottom: 20.0, top: 20.0),
                                      child: Text(
                                        'Roses are red, violets are...',
                                        style: TextStyle(fontSize: 25, color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                      child: SizedBox(
                                        width: 200,
                                        child: ElevatedButton(
                                          onPressed: (){
                                            print('Pressed');
                                          },
                                          child: Text('Mauve'),
                                          style: ElevatedButton.styleFrom(
                                            primary: myColor2,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: SizedBox(
                                        width: 200,
                                        child: ElevatedButton(
                                          onPressed: () => {
                                            setState(() {
                                              _answerTrue3 = !_answerTrue3;
                                            })
                                          },
                                          child: Text('Blue'),
                                          style: ElevatedButton.styleFrom(
                                            primary: myColor2,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: SizedBox(
                                        width: 200,
                                        child: ElevatedButton(
                                          onPressed: (){
                                            print('Pressed');
                                          },
                                          child: Text('Indifferent'),
                                          style: ElevatedButton.styleFrom(
                                            primary: myColor2,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(bottom:20.0),
                                      child: SizedBox(
                                        width: 200,
                                        child: ElevatedButton(
                                          onPressed: (){
                                            print('Pressed');
                                          },
                                          child: Text('Pink'),
                                          style: ElevatedButton.styleFrom(
                                            primary: myColor2,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom:40.0),
                          child: Card(
                            elevation: 50,
                            shadowColor: Colors.black,
                            color: _answerTrue4 ? myColor3 : myColor1,
                            child: SizedBox(
                              width: 375,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(bottom: 20.0, top: 20.0),
                                      child: Text(
                                        'Is that parrot dead?',
                                        style: TextStyle(fontSize: 25, color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                      child: SizedBox(
                                        width: 200,
                                        child: ElevatedButton(
                                          onPressed: (){
                                            print('Pressed');
                                          },
                                          child: Text('Nope'),
                                          style: ElevatedButton.styleFrom(
                                            primary: myColor2,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(bottom:20.0),
                                      child: SizedBox(
                                        width: 200,
                                        child: ElevatedButton(
                                          onPressed: () => {
                                            setState(() {
                                              _answerTrue4 = !_answerTrue4;
                                            })
                                          },
                                          child: Text('Yup'),
                                          style: ElevatedButton.styleFrom(
                                            primary: myColor2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 50.0),
                          child: ElevatedButton(
                            child: Text('Back'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]
          ),
        )
    );
  }
}

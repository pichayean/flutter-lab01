import 'package:flutter/material.dart';
import './question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<QuestionText> _question = [
    new QuestionText('1.Who is your daddy?',
        ['A.กมลชนก เวโรจน์', 'B.กมลเนตร เรืองศรี', 'C.กศิญา ค่อมสิงห์'], 1),
    new QuestionText('2.Who is your mama?',
        ['A.คริส หอวัง', 'B.เจมี่ บูเฮอร์', 'C.ชาวดี เชอร์ม็อค'], 0),
    new QuestionText('2.Who is your mama?',
        ['A.คริส หอวัง', 'B.เจมี่ บูเฮอร์', 'C.ชาวดี เชอร์ม็อค'], 0),
    new QuestionText('2.Who is your mama?',
        ['A.คริส หอวัง', 'B.เจมี่ บูเฮอร์', 'C.ชาวดี เชอร์ม็อค'], 0),
    new QuestionText('2.Who is your mama?',
        ['A.คริส หอวัง', 'B.เจมี่ บูเฮอร์', 'C.ชาวดี เชอร์ม็อค'], 0)
  ];
  // var _question = ['Who is your daddy?', '', 'Who is your mama?'];
  var _answerText = '';
  int _questionIndex = 0;
  int _corected = 0;
  // This widget is the root of your application.
  void onPressAns(index) {
    if (_question[_questionIndex].ans == index) {
      setState(() {
        _corected++;
        _answerText = 'true';
        _questionIndex =
            _questionIndex < _question.length - 1 ? _questionIndex + 1 : 0;
      });
    } else {
      setState(() {
        _answerText = 'false';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int _total = _question.length;
    int seq = _questionIndex + 1;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: Column(
          children: <Widget>[
            Container(
                width: double.infinity,
                margin: EdgeInsets.all(20),
                child: Text(
                  'แบบทดสอบ $seq / $_total',
                  style: TextStyle(fontSize: 28),
                  textAlign: TextAlign.center,
                )),
            Container(
                width: double.infinity,
                margin: EdgeInsets.all(20),
                child: Text(
                  'คะแนน $_corected / $_total',
                  style: TextStyle(fontSize: 28),
                  textAlign: TextAlign.center,
                )),
            Question(_question[_questionIndex].title),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                  child: Text(_question[_questionIndex].choices[0]),
                  onPressed: () => {onPressAns(0)}),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                  child: Text(_question[_questionIndex].choices[1]),
                  onPressed: () => {onPressAns(1)}),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                  child: Text(_question[_questionIndex].choices[2]),
                  onPressed: () => {onPressAns(2)}),
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionText {
  String title;
  List<String> choices;
  int ans;

  QuestionText(this.title, this.choices, this.ans);
}

import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ยินดีต้อนรับสู่ QuizApp 10 ข้อ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizQuestionScreen()),
                );
              },
              child: Text('เริ่มทำแบบทดสอบ'),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizQuestionScreen extends StatefulWidget {
  @override
  _QuizQuestionScreenState createState() => _QuizQuestionScreenState();
}

class _QuizQuestionScreenState extends State<QuizQuestionScreen> {
  int _questionIndex = 0;
  int _score = 0;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': ' 1. ในภาษา Dart, วิธีการประกาศตัวแปรชนิด int คืออะไร? ',
      'options': {'a': 'int x;', 
      'b': 'integer x;', 
      'c': 'declare x as int;'
      },
      'answer': 'a'
    },
    {
      'question': ' 2. ฟังก์ชันที่ใช้สำหรับพิมพ์ข้อความคืออะไร? ',
      'options': {'a': 'print()', 
      'b': 'show()', 
      'c': 'display()'
      },
      'answer': 'a'
    },
    {
      'question': ' 3. การใช้คำสั่ง if-else ใน Dart ทำอะไร? ',
      'options': {
        'a': 'ทำซ้ำโค้ด',
        'b': 'ทำงานเมื่อเงื่อนไขเป็นจริง',
        'c': 'สร้างฟังก์ชัน'
      },
      'answer': 'b'
    },
    {
      'question': ' 4. ใน Dart, การเรียกใช้ฟังก์ชันจะต้องทำอย่างไร? ',
      'options': {'a': 'call functionName();', 
      'b': 'functionName;', 
      'c': 'functionName();'
      },
      'answer': 'c'
    },
    {
      'question': ' 5. ลำดับของวงเล็บในภาษา Dart คืออะไร? ',
      'options': {'a': '()', 
      'b': '{}', 
      'c': '[]'
      },
      'answer': 'a'
    },
    {
      'question': ' 6. ใน Dart, สำหรับการวนซ้ำมีวงเล็บสำหรับการกำหนดเงื่อนไขคือ? ',
      'options': {'a': '()', 
      'b': '{}', 
      'c': '[]'
      },
      'answer': 'a'
    },
    {
      'question': ' 7. ฟังก์ชันที่ใช้สำหรับเรียกดูค่าย้อนกลับคือ? ',
      'options': {'a': 'return()', 
      'b': 'yield()', 
      'c': 'back()'
      },
      'answer': 'b'
    },
    {
      'question': ' 8. ชนิดข้อมูลที่ใช้เก็บข้อความใน Dart คือ? ',
      'options': {'a': 'string', 
      'b': 'text', 
      'c': 'char'
      },
      'answer': 'a'
    },
    {
      'question': ' 9. วิธีการเรียกใช้ค่าของลิสต์ใน Dart คือ? ',
      'options': {'a': 'list[index]', 
      'b': 'list(index)', 
      'c': 'list.value(index)'
      },
      'answer': 'a'
    },
    {
      'question': ' 10. ใน Dart, การเรียกใช้ฟังก์ชันที่อยู่ภายในคลาสจะต้องทำอย่างไร? ',
      'options': {'a': 'functionName;', 
      'b': 'call functionName();', 
      'c': 'className.functionName();'
      },
      'answer': 'c'
    },
  ];
    // เพิ่มคำถามเพิ่มเติมตามต้องการ

  void _answerQuestion(String option) {
    if (_questions[_questionIndex]['answer'] == option) {
      _score++;
    }
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${_questionIndex + 1}'),
      ),
      body: _questionIndex < _questions.length
          ? Column(
              children: [
                Text(
                  _questions[_questionIndex]['question'],
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                ...( _questions[_questionIndex]['options'] as Map<String, dynamic>).entries.map((entry) {
                  return ElevatedButton(
                    onPressed: () => _answerQuestion(entry.key),
                    child: Text('${entry.key}. ${entry.value}'),
                  );
                }).toList(),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'คุณได้ทำแบบทดสอบเสร็จสิ้นแล้ว!',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'คะแนนของคุณ: $_score / ${_questions.length}',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
    );
  }
}
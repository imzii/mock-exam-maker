import 'package:flutter/material.dart';
import 'package:mock_exam_maker/models/question.dart';
import 'package:mock_exam_maker/screens/question_detail_screen.dart';

// 시험 편집 화면
class ExamEditScreen extends StatefulWidget {
  const ExamEditScreen({super.key});

  @override
  _ExamEditScreenState createState() => _ExamEditScreenState();
}

class _ExamEditScreenState extends State<ExamEditScreen> {
  List<Question> questions = []; // 문제 목록

  // 문제 추가 함수
  void addQuestion() {
    setState(() {
      questions.add(Question());
    });
  }

  // 문제 삭제 함수
  void deleteQuestion(int index) {
    setState(() {
      questions.removeAt(index);
    });
  }

  // 문제 편집 화면으로 이동 함수
  void navigateToQuestionEditScreen(int index) async {
    debugPrint('이동!');
    final editedQuestion = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuestionEditScreen(question: questions[index]),
      ),
    );

    if (editedQuestion != null) {
      setState(() {
        questions[index] = editedQuestion;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    for (var question in questions) {
      debugPrint(question.questionText ?? 'null');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('시험 편집'),
      ),
      body: ReorderableListView(
        // 드래그로 항목 재배열 가능한 목록
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final Question item = questions.removeAt(oldIndex);
            questions.insert(newIndex, item);
          });
        },
        children: List.generate(
          questions.length,
          (index) {
            return ListTile(
              key: Key('$index'), // 항목 키
              title: Text(questions[index].questionText ?? '문제를 입력하세요.'),
              onTap: () {
                // 문제 편집 화면으로 이동
                navigateToQuestionEditScreen(index);
              },
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    questions.removeAt(index);
                  });
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addQuestion,
        child: const Icon(Icons.add),
      ),
    );
  }
}

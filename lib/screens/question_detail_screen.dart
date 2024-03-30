import 'package:flutter/material.dart';
import 'package:mock_exam_maker/models/question.dart';

// 문제 편집 화면
class QuestionEditScreen extends StatelessWidget {
  final Question question;

  const QuestionEditScreen({super.key, required this.question});

  // 문제 저장 함수
  void saveQuestion(BuildContext context, String newText) {
    debugPrint('saveQuestion에서 $newText');
    final editedQuestion = Question(questionText: newText); // 수정된 문제 생성
    Navigator.pop(context, editedQuestion); // 수정된 문제 반환
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController =
        TextEditingController(text: question.questionText);
    return Scaffold(
      appBar: AppBar(
        title: const Text('문제 편집'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () => saveQuestion(context, textEditingController.text),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: textEditingController,
          decoration: const InputDecoration(labelText: '문제 내용 입력'),
          maxLines: null,
        ),
      ),
    );
  }
}

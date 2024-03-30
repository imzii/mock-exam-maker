import 'package:mock_exam_maker/models/question.dart';

class MockExam {
  final String title;
  final String author;
  final List<Question> questions;

  MockExam({
    required this.title,
    required this.author,
    required this.questions,
  });
}

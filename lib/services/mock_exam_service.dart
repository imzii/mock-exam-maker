import 'package:mock_exam_maker/models/mock_exam.dart';

class MockExamService {
  static Future<List<MockExam>> fetchMockExams() async {
    // 여기에서는 임의의 데이터를 반환하도록 하겠습니다.
    // 실제로는 네트워크 요청 등을 통해 데이터를 불러와야 합니다.
    return Future.delayed(const Duration(seconds: 1), () {
      return [];
    });
  }
}

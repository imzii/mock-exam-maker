// 문제 클래스
class Question {
  final String? questionText; // 문제 내용
  final List<String>? options; // 선택지 목록
  final int? correctOptionIndex; // 정답 선택지 인덱스

  Question({
    this.questionText,
    this.options,
    this.correctOptionIndex,
  });
}

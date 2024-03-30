import 'package:flutter/material.dart';
import 'package:mock_exam_maker/models/mock_exam.dart';
import 'package:mock_exam_maker/screens/create_question_screen.dart';
import 'package:mock_exam_maker/services/mock_exam_service.dart';
import 'package:mock_exam_maker/screens/view_exam_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MockExam> mockExams = []; // 다른 사용자가 제작한 모의고사 목록

  @override
  void initState() {
    super.initState();
    loadMockExams(); // 모의고사 목록을 불러오는 함수 호출
  }

  void loadMockExams() async {
    // 모의고사 서비스를 통해 모의고사 목록을 불러옴
    List<MockExam> fetchedExams = await MockExamService.fetchMockExams();
    setState(() {
      mockExams = fetchedExams;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('모의고사 제작기'),
        leading: const Icon(Icons.create),
        actions: [
          IconButton(
            icon: const Icon(Icons.create),
            onPressed: () {
              // 모의고사 제작 화면으로 이동
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExamEditScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.my_library_books),
            onPressed: () {
              // 내 모의고사 화면으로 이동
              // 이동하는 코드 추가
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: mockExams.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(mockExams[index].title),
            subtitle: Text('By: ${mockExams[index].author}'),
            onTap: () {
              // 모의고사 상세 화면으로 이동
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewExamScreen(mockExams[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

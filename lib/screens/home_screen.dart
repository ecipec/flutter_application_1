// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final String studentIndex = "123456"; // Пример број на индекс

  final List<Exam> exams = [
    Exam(subject: 'Математика', dateTime: DateTime(2025, 11, 11, 9, 0), rooms: ['101']),
    Exam(subject: 'Физика', dateTime: DateTime(2025, 11, 22, 11, 0), rooms: ['202']),
    Exam(subject: 'Хемија', dateTime: DateTime(2025, 11, 25, 14, 0), rooms: ['105']),
    Exam(subject: 'Информатика', dateTime: DateTime(2025, 11, 27, 10, 0), rooms: ['303']),
    Exam(subject: 'Историја', dateTime: DateTime(2025, 11, 30, 12, 0), rooms: ['201']),
    Exam(subject: 'Географија', dateTime: DateTime(2025, 12, 2, 9, 0), rooms: ['102']),
    Exam(subject: 'Биологија', dateTime: DateTime(2025, 12, 5, 13, 0), rooms: ['203']),
    Exam(subject: 'Aнглиски јазик', dateTime: DateTime(2025, 12, 7, 15, 0), rooms: ['204']),
    Exam(subject: 'Македонски јазик', dateTime: DateTime(2025, 12, 10, 10, 0), rooms: ['101']),
    Exam(subject: 'Филозофија', dateTime: DateTime(2025, 12, 12, 11, 0), rooms: ['105']),
  ];

  @override
  Widget build(BuildContext context) {
    // Хронолошко сортирање
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: Text('Распоред за испити - $studentIndex'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) {
                return ExamCard(exam: exams[index]);
              },
            ),
          ),
          Container(
            color: Colors.green,
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            child: Center(
              child: Text(
                'Вкупно испити: ${exams.length}',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

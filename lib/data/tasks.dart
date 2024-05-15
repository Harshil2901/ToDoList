import 'package:flutter/material.dart';

class Task {
  String taskNumber;
  String title;
  Color progresscolor;
  double value;

  Task({
    required this.taskNumber,
    required this.title,
    required this.progresscolor,
    required this.value,
  });
}

List<Task> tasklist = [
  Task(
      taskNumber: "40 tasks",
      title: "Business",
      progresscolor: Colors.purple,
      value: 0.5),
  Task(
      taskNumber: "16 tasks",
      title: "Personal",
      progresscolor: Colors.blue,
      value: 0.1),
  Task(
      taskNumber: "10 tasks",
      title: "Programming",
      progresscolor: Colors.green,
      value: 0.1),
  Task(
      taskNumber: "2 tasks",
      title: "Sports",
      progresscolor: Colors.red,
      value: 0.1),
  Task(
      taskNumber: "30 tasks",
      title: "Family",
      progresscolor: Colors.orange,
      value: 0.8),
];

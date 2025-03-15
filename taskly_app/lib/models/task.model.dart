import 'package:flutter/foundation.dart';

class TaskModel {
  String content;
  DateTime timeStamp;
  bool isCompleted;

  TaskModel({
    required this.content,
    required this.timeStamp,
    required this.isCompleted,
  });

  factory TaskModel.fromMap(Map task) {
    return TaskModel(
      content: task['content'],
      timeStamp: task['timeStamp'],
      isCompleted: task['isCompleted'],
    );
  }

  Map toMap() {
    return {
      'content': content,
      'timeStamp': timeStamp,
      'isCompleted': isCompleted,
    };
  }
}

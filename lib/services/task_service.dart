import 'dart:convert';

import '../models/task_model.dart';
import 'package:http/http.dart' as http;

class TaskService {
  static Future<List> getTasks() async {
    final response = await http.get(
      Uri.parse("https://api-tugas-athallahmaajid.vercel.app/tugas"),
    );
    List result = [];
    final data = json.decode(response.body);
    for (var i = 0; i < data.length; i++) {
      result.add(TaskModel.fromMap(data[i]));
    }
    return result;
  }
}

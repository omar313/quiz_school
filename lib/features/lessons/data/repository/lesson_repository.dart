import 'package:flutter/foundation.dart';
import 'package:quiz_school/core/constants/strings.dart';
import 'package:quiz_school/core/network/api_util.dart';
import 'package:quiz_school/features/lessons/domain/entity/lesson_list_model.dart';
import 'package:quiz_school/features/lessons/domain/entity/quiz_model.dart';
import 'package:quiz_school/features/lessons/domain/entity/word_model.dart';
import 'package:quiz_school/features/lessons/domain/repository/lesson_repository.dart';
import 'package:quiz_school/injection_container.dart';
import 'dart:convert';

class LessonRepositoryImpl implements LessonRepository {
  @override
  Future<List<Lesson>> fetchLessons() async {
    final dio = di.get<ApiUtil>().dio;
    final response = await dio.get('lesson');
    print(response.data.toString());
    final jsonString = response.data.toString();

    if (response.statusCode == 200) {
      return compute(_parseLessons, jsonString);
    } else {
      return Future.error(kServerErrorMsg);
    }
  }

  static Future<List<Lesson>> _parseLessons(String jsonString) {
    final jsonObj = json.decode(jsonString);
    return Future.value(LessonResponse.fromJson(jsonObj).allLesson);
  }

  @override
  Future<List<Questions>> fetchQuestions(int id) async {
    final dio = di.get<ApiUtil>().dio;
    final response = await dio.get('question/$id');
    print(response.data.toString());
    final jsonString = response.data.toString();

    if (response.statusCode == 200) {
      return compute(_parseQuestions, jsonString);
    } else {
      return Future.error(kServerErrorMsg);
    }
  }

  static Future<List<Questions>> _parseQuestions(String jsonString) {
    final jsonObj = json.decode(jsonString);
    return Future.value(QuizResponse.fromJson(jsonObj).questions);
  }

  @override
  Future<List<Word>> fetchWords(String id) async {
    final dio = di.get<ApiUtil>().dio;
    final response = await dio.get('word/$id');
    print(response.data.toString());
    final jsonString = response.data.toString();

    if (response.statusCode == 200) {
      return compute(_parseWords, jsonString);
    } else {
      return Future.error(kServerErrorMsg);
    }
  }

  static  Future<List<Word>> _parseWords(String jsonString)  {
    List jsonList = json.decode(jsonString);
    final list = jsonList.map((word) => Word.fromJson(word)).toList();
    return Future.value(list);
  }

}

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
      Map<String, dynamic> jsonObj = json.decode(jsonString);
      return LessonResponse.fromJson(jsonObj).allLesson;
    } else {
      return Future.error(kServerErrorMsg);
    }
  }

  @override
  Future<List<Questions>> fetchQuestions(int id) async {
    final dio = di.get<ApiUtil>().dio;
    final response = await dio.get('question/$id');
    print(response.data.toString());
    final jsonString = response.data.toString();

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonObj = json.decode(jsonString);
      return QuizResponse.fromJson(jsonObj).questions;
    } else {
      return Future.error(kServerErrorMsg);
    }
  }

  @override
  Future<List<Word>> fetchWords(String id) async {
    final dio = di.get<ApiUtil>().dio;
    final response = await dio.get('word/$id');
    print(response.data.toString());
    final jsonString = response.data.toString();

    if (response.statusCode == 200) {
      List jsonList = json.decode(jsonString);
      final list = jsonList.map((word) => Word.fromJson(word)).toList();
      final tempList = <Word>[];
      

      return list;
    } else {
      return Future.error(kServerErrorMsg);
    }
  }
}

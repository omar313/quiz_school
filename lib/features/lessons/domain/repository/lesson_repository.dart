import 'package:quiz_school/features/lessons/domain/entity/lesson_list_model.dart';
import 'package:quiz_school/features/lessons/domain/entity/quiz_model.dart';
import 'package:quiz_school/features/lessons/domain/entity/word_model.dart';

abstract class LessonRepository{
  Future<List<Lesson>> fetchLessons();
  Future<List<Questions>> fetchQuestions(int id);
  Future<List<Word>> fetchWords(String id);


}


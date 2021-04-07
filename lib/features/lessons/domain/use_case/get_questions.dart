import 'package:quiz_school/features/lessons/domain/entity/quiz_model.dart';
import 'package:quiz_school/features/lessons/domain/repository/lesson_repository.dart';

abstract class GetQuestions{
  Future<List<Questions>> questions(int id);
}

class GetQuestionsImpl implements GetQuestions{
  final LessonRepository repository;

  GetQuestionsImpl(this.repository);
  @override
  Future<List<Questions>> questions(int id) {
    return repository.fetchQuestions(id);
  }

}
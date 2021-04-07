import 'package:quiz_school/features/lessons/domain/entity/word_model.dart';
import 'package:quiz_school/features/lessons/domain/repository/lesson_repository.dart';

abstract class GetWords{
  Future<List<Word>> words(String id);
}

class GetWordsImpl implements GetWords{
  final LessonRepository repository;

  GetWordsImpl(this.repository);
  @override
  Future<List<Word>> words(String id) {
    return repository.fetchWords(id);
  }

}
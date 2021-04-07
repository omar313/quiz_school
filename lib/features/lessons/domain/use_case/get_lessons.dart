import 'package:quiz_school/features/lessons/domain/entity/lesson_list_model.dart';
import 'package:quiz_school/features/lessons/domain/repository/lesson_repository.dart';

abstract class GetLessons{
   Future<List<Lesson>> lessons();
}

class GetLessonsImpl implements GetLessons{
  final LessonRepository repository;

  GetLessonsImpl(this.repository);
  @override
  Future<List<Lesson>> lessons() {
    return repository.fetchLessons();
  }

}
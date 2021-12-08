import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_school/features/lessons/domain/entity/lesson_list_model.dart';
import 'package:quiz_school/features/lessons/domain/entity/lesson_singleton.dart';
import 'package:quiz_school/features/lessons/domain/use_case/get_lessons.dart';
import 'package:quiz_school/injection_container.dart';

part 'lessonlist_event.dart';
part 'lessonlist_state.dart';

class LessonlistBloc extends Bloc<LessonlistEvent, LessonlistState> {
  final LessonsSingleton lessonsSingleton;
  LessonlistBloc( this.lessonsSingleton) : super(LessonlistLoading());

  List<Lesson> lessons = [];

  @override
  Stream<LessonlistState> mapEventToState(
    LessonlistEvent event,
  ) async* {
    if (event is LessonRequestEvent) {
      try {
        var lessons = await di.get<GetLessons>().lessons();
        this.lessons.addAll(lessons);
        lessonsSingleton.lessons = lessons;
        yield LessonlistLoaded(this.lessons);
      } catch (e) {
        yield LessonError(e.toString());
      }
    } else if (event is LessonTap) {
      lessonsSingleton.selectedPosition = event.position;
      yield LessonSelected(this.lessons[event.position]);
    }

  }
}

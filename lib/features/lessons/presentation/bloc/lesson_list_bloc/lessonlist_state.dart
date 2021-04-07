part of 'lessonlist_bloc.dart';

abstract class LessonlistState  {
  const LessonlistState();
  
  @override
  List<Object> get props => [];
}

class LessonlistLoading extends LessonlistState {}

class LessonlistLoaded extends LessonlistState {
  final List<Lesson> lessons;

  LessonlistLoaded(this.lessons);
  @override
  List<Object> get props => [this.lessons];
}

class LessonSelected extends LessonlistState{
  final Lesson selectedLesson;

  LessonSelected(this.selectedLesson);
   @override
  List<Object> get props => [this.selectedLesson];
}

class LessonError extends LessonlistState {
  final String error;

  LessonError(this.error);

  List<Object> get props => [this.error];


}
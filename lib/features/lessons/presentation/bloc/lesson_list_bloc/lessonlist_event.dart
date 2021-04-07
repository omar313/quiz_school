part of 'lessonlist_bloc.dart';

abstract class LessonlistEvent extends Equatable {
  const LessonlistEvent();

  @override
  List<Object> get props => [];
}

class LessonRequestEvent extends LessonlistEvent{
  
}


class LessonTap extends LessonlistEvent{
   final int position;

  LessonTap(this.position);

   @override
  List<Object> get props => [this.position];


}

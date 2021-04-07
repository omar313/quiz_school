import 'package:flutter/material.dart';
import 'package:quiz_school/features/lessons/domain/entity/lesson_list_model.dart';
import 'package:quiz_school/features/lessons/presentation/bloc/lesson_list_bloc/lessonlist_bloc.dart';
import 'package:quiz_school/features/lessons/presentation/widget/item_lesson_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LessonList extends StatelessWidget {
  final List<Lesson> lessons;
  const LessonList({
    Key key, @required this.lessons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ListView.builder(
          itemCount: lessons.length,
          itemBuilder: (context, position) {
            return GestureDetector(onTap: (){
              context.read<LessonlistBloc>().add(LessonTap(position));
            }, child: ItemLessonList(lesson: lessons[position]));
          }),
    );
  }
}


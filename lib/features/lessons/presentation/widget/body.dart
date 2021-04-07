import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_school/features/lessons/presentation/bloc/lesson_list_bloc/lessonlist_bloc.dart';
import 'package:quiz_school/features/lessons/presentation/pages/lesson_list_detail.dart';
import 'lesson_list.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LessonlistBloc, LessonlistState>(
      listener: (context, state) {
        if (state is LessonSelected) {
          //  print("select: ${state.selectedLesson.lessonName}");
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LessonListDetail(
                    lesson: state.selectedLesson,
                  )));
        }
      },
      builder: (context, state) {
        if (state is LessonlistLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LessonlistLoaded) {
          return LessonList(
            lessons: state.lessons,
          );
        } else if (state is LessonError) {
          return Center(
            child: Text(
              'Lesson error ${state.error}',
              style: TextStyle(color: Colors.black),
            ),
          );
        }
      },
      buildWhen: (previous, current) {
        if (current is LessonSelected) {
          return false;
        } else
          return true;
      },
    );
  }
}

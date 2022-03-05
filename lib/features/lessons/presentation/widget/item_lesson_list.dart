import 'package:flutter/material.dart';
import 'package:quiz_school/core/constants/color_constant.dart';
import 'package:quiz_school/features/lessons/domain/entity/lesson_list_model.dart';

class ItemLessonList extends StatelessWidget {
  const ItemLessonList({
    Key key,
    @required this.lesson,
  }) : super(key: key);

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 16, right: 16),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: kBorderColor, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(lesson.lessonName , style: TextStyle(fontSize: 15),)
            ),
          ),
        ],
      ),
    );
  }
}

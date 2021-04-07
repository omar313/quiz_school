import 'package:flutter/material.dart';
import 'package:quiz_school/core/constants/color_constant.dart';
import 'package:quiz_school/core/constants/strings.dart';
import 'package:quiz_school/features/lessons/presentation/widget/words/words_body.dart';

class WordsBottomSheet extends StatelessWidget {
  const WordsBottomSheet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      builder: (context, controller) {
        return LayoutBuilder(builder: (context, constraint) {
          // print(
          //     'size: ${constraint.minHeight} ${constraint.maxHeight}');
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: kBorderColor, width: 1)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(kWord),
                    ],
                  ),
                ),
                Expanded(
                  child: WordsBody(
                    scrollController: controller,
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}

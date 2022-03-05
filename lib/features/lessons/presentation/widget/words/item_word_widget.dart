import 'package:flutter/material.dart';
import 'package:quiz_school/features/lessons/domain/entity/word_model.dart';

class ItemWordWidget extends StatelessWidget {
  const ItemWordWidget({
    Key key,
    @required this.word,
  }) : super(key: key);

  final Word word;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Center(child: Text(word.word))),
        Expanded(flex: 1, child: Center(child: Text(word.yomikata))),
        Expanded(
            flex: 2,
            child: Center(
              child: Text(word.meaning),
            )),
      ],
    );
  }
}
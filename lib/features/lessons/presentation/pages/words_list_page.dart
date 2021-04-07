import 'package:flutter/material.dart';
import 'package:quiz_school/core/constants/strings.dart';
import 'package:quiz_school/features/lessons/presentation/widget/words/words_body.dart';

class WordsListPage extends StatelessWidget {
  const WordsListPage({Key key, this.title, this.id}) : super(key: key);
  final String title, id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('$title\n$kWord ', textAlign: TextAlign.center,),
      ),
      body: WordsBody(),
    );
  }
}

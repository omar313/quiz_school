import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_school/features/lessons/presentation/bloc/words/words_cubit.dart';
import 'package:quiz_school/features/lessons/presentation/widget/words/word_header_widget.dart';

import 'item_word_widget.dart';

class WordsBody extends StatelessWidget {
  const WordsBody({Key key, this.scrollController, this.margin = 30})
      : super(key: key);
  final ScrollController scrollController;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordsCubit, WordsState>(
      builder: (context, state) {
        if (state is WordsLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else if (state is WordsStateLoaded) {
          // return ListView.builder(
          //   itemCount: state.words.length,
          //   itemBuilder: (context, position){
          //     return Text(state.words[position].word);
          // });
          return SingleChildScrollView(
            controller: scrollController,
            child: Container(
                margin: EdgeInsets.all(margin),
                padding: const EdgeInsets.all(1),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    WordHeaderWidget(),
                    Divider(),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.words.length,
                      itemBuilder: (context, position) {
                        final word = state.words[position];
                        return ItemWordWidget(word: word);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider();
                      },
                    ),
                    SizedBox(height: 10,)
                  ],
                )),
          );
        } else if (state is WordsStateError) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return Container();
        }
      },
    );
  }
}





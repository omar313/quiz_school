import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_school/core/constants/color_constant.dart';
import 'package:quiz_school/features/lessons/presentation/bloc/words/words_cubit.dart';

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
            child: CircularProgressIndicator(),
          );
        } else if (state is WordsStateLoaded) {
          // return ListView.builder(
          //   itemCount: state.words.length,
          //   itemBuilder: (context, position){
          //     return Text(state.words[position].word);
          // });
          return SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.all(margin),
                  padding: const EdgeInsets.all(1),
                  color: Colors.white,
                  child: GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.words.length % 3 == 0
                          ? state.words.length
                          : state.words.length + (3 - state.words.length % 3),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 3,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1),
                      itemBuilder: (context, position) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Align(
                              alignment: Alignment.center,
                              child: position >= state.words.length
                                  ? Text('')
                                  : FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        '${state.words[position].word}',
                                        style: TextStyle(color: Colors.white),
                                        maxLines: 1,
                                      ))),
                          color: kScaffoldBGColor,
                        );
                      }),
                ),
              ],
            ),
          );
        } else if (state is WordsStateError) {
          return Center(
            child: Text(state.error),
          );
        }else {
          return Container();
        }
      },
    );
  }
}

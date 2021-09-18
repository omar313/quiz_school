import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_school/features/lessons/domain/entity/word_model.dart';
import 'package:quiz_school/features/lessons/domain/use_case/get_words.dart';

import '../../../../../injection_container.dart';

part 'words_state.dart';

class WordsCubit extends Cubit<WordsState> {
  WordsCubit() : super(WordsLoading());

  void wordRequest(String id) async {
    try {
      final words = await di.get<GetWords>().words(id);
      // final wordsTemp = <Word>[];
      // wordsTemp.addAll(words);
      // words.addAll(wordsTemp);
      // words.addAll(wordsTemp);
      // words.addAll(wordsTemp);
      // words.addAll(wordsTemp);
      // words.addAll(wordsTemp);
      // words.addAll(wordsTemp);
      // words.addAll(wordsTemp);
      // words.addAll(wordsTemp);
      // words.addAll(wordsTemp);
      emit(WordsStateLoaded(words));
    } catch (e) {
      emit(WordsStateError(e.toString()));
    }
  }
}

part of 'words_cubit.dart';

abstract class WordsState extends Equatable {
  const WordsState();

  @override
  List<Object> get props => [];
}

class WordsLoading extends WordsState {}
class WordsStateLoaded extends WordsState {
  final List<Word> words;

  const WordsStateLoaded(this.words);

  @override
  List<Object> get props => [this.words];
}

class WordsStateError extends WordsState{
  final String error;

 const  WordsStateError(this.error);


  @override
  List<Object> get props => [this.error];

}
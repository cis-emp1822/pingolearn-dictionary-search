part of 'search_words_cubit.dart';

@immutable
abstract class SearchWordsState extends Equatable {}

class SearchWordsInitial extends SearchWordsState {
  @override
  List<Object> get props => [];
}

class LoadingState extends SearchWordsState {
  @override
  List<Object> get props => [];
}

class LoadedState extends SearchWordsState {
  LoadedState(this.dictionaryModel);

  final DictionaryModel dictionaryModel;

  @override
  List<Object> get props => [dictionaryModel];
}

class ErrorState extends SearchWordsState {
  ErrorState({this.errorMessage});
  final String? errorMessage;
  @override
  List<Object> get props => [];
}

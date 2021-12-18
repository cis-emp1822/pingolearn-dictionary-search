import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pingolearn_parikshit/models/dictionary_model.dart';
import 'package:equatable/equatable.dart';
import 'package:pingolearn_parikshit/repositories/dictionary_repo.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

part 'search_words_state.dart';

class SearchWordsCubit extends Cubit<SearchWordsState> {
  SearchWordsCubit({this.dictionaryRepo}) : super(SearchWordsInitial());
  final DictionaryRepo? dictionaryRepo;
  stt.SpeechToText speech = stt.SpeechToText();
  void getMeaningFromWord() async {
    try {
      if (speech.isListening) {
        speech.stop();
      }
      emit(LoadingState());
      bool available = await speech.initialize();
      if (available) {
        speech.listen(onResult: (text) async {
          final movies =
              await dictionaryRepo!.getMeanings(text.recognizedWords);
          emit(LoadedState(movies));
        });
      } else {
        emit(ErrorState(
            errorMessage:
                "The user has denied the use of speech recognition."));
        log("The user has denied the use of speech recognition.");
      }
      // some time later...

    } catch (e) {
      emit(ErrorState(errorMessage: "Something Went Wrong"));
    }
  }
}

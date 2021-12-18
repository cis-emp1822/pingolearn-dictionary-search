import 'package:dio/dio.dart';
import 'package:pingolearn_parikshit/models/dictionary_model.dart';

class DictionaryRepo {
  const DictionaryRepo(this.client);

  final Dio client;

  Future<DictionaryModel> getMeanings(String searchKeyword) async {
    try {
      final response = await client.get('/dictionary/$searchKeyword');
      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        final DictionaryModel dictionaryModel =
            DictionaryModel.fromJson(response.data);

        return dictionaryModel;
      } else {
        throw Exception("Unable to load from dictionary!");
      }
    } catch (e) {
      rethrow;
    }
  }
}

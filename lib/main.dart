import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pingolearn_parikshit/healers/globals.dart';
import 'package:pingolearn_parikshit/pages/dashboard_page.dart';
import 'package:pingolearn_parikshit/cubits/search_words/search_words_cubit.dart';
import 'package:pingolearn_parikshit/repositories/dictionary_repo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchWordsCubit(
          dictionaryRepo: DictionaryRepo(Dio(BaseOptions(
              baseUrl: Globals.base_url,
              headers: {'Authorization': 'Token ${Globals.token}'})))),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'PingoLearn-Round 1'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pingolearn_parikshit/cubits/search_words/search_words_cubit.dart';
import 'package:pingolearn_parikshit/healers/animated_button.dart';
import 'package:pingolearn_parikshit/healers/globals.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<SearchWordsCubit, SearchWordsState>(
          builder: (context, state) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 28.0, vertical: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  if (state is SearchWordsInitial)
                    const Text('Press the button to start speaking',
                        textAlign: TextAlign.center,
                        style: Globals.basicTextStyle),
                  if (state is ErrorState)
                    Text('${state.errorMessage}',
                        textAlign: TextAlign.center,
                        style: Globals.basicTextStyle),
                  if (state is LoadedState &&
                      state.dictionaryModel.word!.isNotEmpty)
                    const Text('Your Word',
                        textAlign: TextAlign.center,
                        style: Globals.basicTextStyle),
                  if (state is LoadedState &&
                      state.dictionaryModel.word!.isNotEmpty)
                    Text(state.dictionaryModel.word!,
                        textAlign: TextAlign.center,
                        style: Globals.basicTextStyle),
                  if (state is LoadedState &&
                      state.dictionaryModel.definitions!.isNotEmpty)
                    Expanded(
                      child: realContainer("Meaning",
                          state.dictionaryModel.definitions![0].definition),
                    ),
                  if (state is LoadedState &&
                      state.dictionaryModel.definitions!.isNotEmpty)
                    Expanded(
                      child: realContainer("Example",
                          state.dictionaryModel.definitions![0].example),
                    ),
                  if (state is LoadedState &&
                      state.dictionaryModel.definitions!.isNotEmpty &&
                      state.dictionaryModel.definitions![0].imageUrl != null)
                    Image(
                        width: 140,
                        height: 140,
                        image: NetworkImage(
                            state.dictionaryModel.definitions![0].imageUrl!)),
                  GestureDetector(
                    onTap: () => callfunction(context),
                    child: const Ripples(
                      child: Icon(Icons.mic_sharp),
                      color: Colors.blueAccent,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void callfunction(BuildContext context) {
    context.read<SearchWordsCubit>().getMeaningFromWord();
  }

  Widget realContainer(String? title, String? description) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(14),
      decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title!,
              style: Globals.basicTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description!,
              style: Globals.smallTextStyle,
            ),
          )
        ],
      ),
    );
  }
}

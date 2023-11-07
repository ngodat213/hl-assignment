import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joke_app/screens/joke_screen/cubit/joke_cubit.dart';
import 'package:joke_app/screens/joke_screen/widgets/selection_button.dart';
import 'package:joke_app/screens/joke_screen/widgets/content.dart';
import 'package:joke_app/screens/joke_screen/widgets/footer.dart';
import 'package:joke_app/screens/joke_screen/widgets/header.dart';
import 'package:joke_app/screens/joke_screen/widgets/joke_content.dart';

class JokeScreen extends StatefulWidget {
  const JokeScreen({super.key});

  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<JokeCubit>().getJokes();
    context.read<JokeCubit>().initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Header(),
              Content(),
              JokeContent(),
              SelectionButton(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

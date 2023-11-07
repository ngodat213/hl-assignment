import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:joke_app/screens/joke_screen/cubit/joke_cubit.dart';
import 'package:joke_app/screens/joke_screen/widgets/answer_button.dart';
import 'package:joke_app/themes/app_colors.dart';
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

  void showNoMoreJokesToast() {
    Fluttertoast.showToast(
      msg: "That's all the jokes for today!\n Come back another day!",
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const Header(),
              const Content(),
              BlocBuilder<JokeCubit, JokeState>(
                builder: (context, state) {
                  return JokeContent(jokeCounter: state.jokeCounter);
                },
              ),
              BlocBuilder<JokeCubit, JokeState>(
                builder: (context, state) {
                  print(
                      "${state.hasVoted} ${state.jokeCounter >= state.jokes.length - 1}");
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AnswerButton(
                        text: 'This is Funny!',
                        bgColor: AppColors.colorBlue,
                        onTap: () {
                          if (!state.hasVoted &&
                              state.jokeCounter <= state.jokes.length - 1) {
                            context.read<JokeCubit>().voteForJoke(true);
                          } else {
                            showNoMoreJokesToast();
                          }
                        },
                      ),
                      AnswerButton(
                        text: 'This is not funny.',
                        bgColor: AppColors.colorGreen,
                        onTap: () {
                          if (!state.hasVoted &&
                              state.jokeCounter <= state.jokes.length - 1) {
                            context.read<JokeCubit>().voteForJoke(false);
                          } else {
                            showNoMoreJokesToast();
                          }
                        },
                      ),
                    ],
                  );
                },
              ),
              const Footer()
            ],
          ),
        ),
      ),
    );
  }
}

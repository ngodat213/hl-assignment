import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:joke_app/screens/joke_screen/cubit/joke_cubit.dart';
import 'package:joke_app/screens/joke_screen/widgets/answer_button.dart';
import 'package:joke_app/themes/app_colors.dart';

class SelectionButton extends StatelessWidget {
  const SelectionButton({super.key});

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
    return BlocBuilder<JokeCubit, JokeState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AnswerButton(
                text: 'This is Funny!',
                bgColor: AppColors.colorBlue,
                onTap: () {
                  if (state.hasVoted ||
                      state.jokeCounter >= state.jokes.length - 1) {
                    showNoMoreJokesToast();
                  } else {
                    context.read<JokeCubit>().voteForJoke(true);
                  }
                },
              ),
              AnswerButton(
                text: 'This is not funny.',
                bgColor: AppColors.colorGreen,
                onTap: () {
                  if (state.hasVoted ||
                      state.jokeCounter >= state.jokes.length - 1) {
                    showNoMoreJokesToast();
                  } else {
                    context.read<JokeCubit>().voteForJoke(false);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

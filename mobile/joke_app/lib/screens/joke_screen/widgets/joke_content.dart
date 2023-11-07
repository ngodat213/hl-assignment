import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joke_app/screens/joke_screen/cubit/joke_cubit.dart';

class JokeContent extends StatelessWidget {
  const JokeContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JokeCubit, JokeState>(
      builder: (context, state) {
        if (state.status == JokeStatus.success) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 50),
            height: MediaQuery.of(context).size.height * 0.5,
            child: Text(
              state.jokes[state.jokeCounter].text,
              style: const TextStyle(
                color: Color(0xff6B6B6B),
              ),
            ),
          );
        } else {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
            height: MediaQuery.of(context).size.height * 0.5,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

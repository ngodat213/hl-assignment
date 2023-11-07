import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:joke_app/models/joke.dart';
import 'package:joke_app/service/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'joke_state.dart';

class JokeCubit extends Cubit<JokeState> {
  JokeCubit() : super(JokeState.initial());
  SharedPreferences? prefs;

  void jokeChanged(Joke value) {
    emit(
      state.copyWith(
        joke: value,
        status: JokeStatus.isLoading,
      ),
    );
  }

  void getJokes() async {
    emit(state.copyWith(status: JokeStatus.isLoading));
    try {
      List<Joke> jokes = await Api.fetJokes();
      emit(state.copyWith(jokes: jokes, status: JokeStatus.success));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: JokeStatus.error));
    }
  }

  void initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyyMMdd').format(now);
    String lastVoteDate = prefs!.getString('lastVoteDate') ?? "";
    emit(state.copyWith(hasVoted: lastVoteDate == formattedDate));
  }

  void voteForJoke(bool selection) async {
    if (!state.hasVoted) {
      prefs!.setBool('hasVoted', true);
      var data = {
        "jokeId": state.jokes[state.jokeCounter].id,
        "selection": selection.toString()
      };
      Api.addVote(data);
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyyMMdd').format(now);
      prefs!.setString('lastVoteDate', formattedDate);

      if (state.jokeCounter < state.jokes.length - 1) {
        emit(state.copyWith(jokeCounter: state.jokeCounter + 1));
      } else {
        DateTime tomorrow = DateTime.now().add(const Duration(days: 1));
        String tomorrowDate = DateFormat('yyyyMMdd').format(tomorrow);
        prefs!.setString('lastVoteDate', tomorrowDate);

        emit(state.copyWith(hasVoted: true, jokeCounter: 0));
      }
    }
  }
}

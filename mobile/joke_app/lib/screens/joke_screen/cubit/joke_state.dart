part of 'joke_cubit.dart';

enum JokeStatus { success, error, isLoading }

class JokeState extends Equatable {
  JokeState({
    required this.jokes,
    required this.joke,
    required this.jokeCounter,
    this.hasVoted = true,
    required this.status,
  });
  final List<Joke> jokes;
  final Joke joke;
  bool hasVoted;
  final int jokeCounter;
  final JokeStatus status;

  JokeState copyWith({
    List<Joke>? jokes,
    Joke? joke,
    int? jokeCounter,
    bool? hasVoted,
    JokeStatus? status,
  }) {
    return JokeState(
      jokes: jokes ?? this.jokes,
      joke: joke ?? this.joke,
      hasVoted: hasVoted ?? this.hasVoted,
      jokeCounter: jokeCounter ?? this.jokeCounter,
      status: status ?? this.status,
    );
  }

  factory JokeState.initial() {
    return JokeState(
      jokes: const [],
      joke: Joke.initialJoke(),
      hasVoted: true,
      jokeCounter: 0,
      status: JokeStatus.isLoading,
    );
  }

  @override
  List<Object> get props => [jokes, joke, hasVoted, jokeCounter, status];
}

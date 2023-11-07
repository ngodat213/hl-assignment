class Joke {
  String id;
  String text;

  Joke({required this.id, required this.text});

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(id: json['_id'], text: json['text']);
  }

  factory Joke.initialJoke() {
    return Joke(
      id: '',
      text: '',
    );
  }
}

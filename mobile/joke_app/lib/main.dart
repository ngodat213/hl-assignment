import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joke_app/bloc_observer.dart';
import 'package:joke_app/screens/joke_screen/cubit/joke_cubit.dart';
import 'package:joke_app/screens/joke_screen/joke_screen.dart';

Future<void> main() async {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      runApp(const MyApp());
    },
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JokeCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: JokeScreen(),
      ),
    );
  }
}

import 'package:bushidose/modules/codex/cubit/codex_cubit.dart';
import 'package:bushidose/modules/dojo/cubit/dojo_cubit.dart';
import 'package:bushidose/modules/haiku/cubit/haiku_cubit.dart';
import 'package:bushidose/modules/journal/cubit/journal_cubit.dart';
import 'package:bushidose/modules/main/cubit/main_cubit.dart';
import 'package:bushidose/modules/main/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MainCubit()),
        BlocProvider(create: (context) => DojoCubit()),
        BlocProvider(create: (context) => HaikuCubit()),
        BlocProvider(create: (context) => JournalCubit()),
        BlocProvider(create: (context) => CodexCubit()),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Inter',
        ),
        home: const MainPage(),
      ),
    );
  }
}

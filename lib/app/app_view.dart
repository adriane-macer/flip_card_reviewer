import 'package:flip_card_reviewer/features/home/presentations/home_screen.dart';
import 'package:flip_card_reviewer/features/reviewer/applications/reviewer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewerCubit(),
      child: MaterialApp(
        title: 'Flip Card Reviewer',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            primary: Colors.deepOrangeAccent,),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
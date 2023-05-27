import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_shorts_clone/bloc/shorts_state.dart';
import 'package:youtube_shorts_clone/routes.dart';
import 'package:youtube_shorts_clone/screens/getting_started.dart';
import 'package:youtube_shorts_clone/theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ShortState(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: appRoutes,
      title: 'Youtube Shorts',
      theme: appTheme,
      home: GettingStartedScreen(),
    );
  }
}

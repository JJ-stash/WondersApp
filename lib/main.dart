import 'package:flutter/material.dart';
import 'package:wonders/presentation/screens/home_screen.dart';
import 'package:wonders/presentation/screens/wonder_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Wonders App',
        home: const HomeScreen(),
        routes: {WonderScreen.routeName: (ctx) => const WonderScreen()});
  }
}

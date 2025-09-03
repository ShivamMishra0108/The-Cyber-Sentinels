import 'package:flutter/material.dart';
import 'package:the_cyber_sentinels/homepage.dart';
import 'package:the_cyber_sentinels/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:the_cyber_sentinels/theme/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

// This trailing comma makes auto-formatting nicer for build methods.

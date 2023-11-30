import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'profile_provider.dart';
import 'main_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:azan_watch_app/screens/home_screen.dart';

void main() {
  runApp(const AzanWatchApp());
}

class AzanWatchApp extends StatelessWidget {
  const AzanWatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Azan Watch',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:programming_quotes/app/features/programming_quotes/presentation/pages/programming_quotes_page.dart';
import './injection.dart' as injection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Programming Quotes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProgrammingQuotesPage(),
    );
  }
}

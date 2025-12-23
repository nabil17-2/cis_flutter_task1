import 'package:cis_flutter_task1/screens/property_info_screen.dart';
import 'package:flutter/material.dart';
import 'logical_judgment_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Assignment',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const LogicalJudgmentScreen(),
        '/property': (context) => const PropertyInfoScreen(),
      },
    );
  }
}

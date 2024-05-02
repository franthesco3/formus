import 'package:flutter/material.dart';
import 'package:formus/support/utils/mobile_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: MobileRoutes.initialRoutes,
      routes: MobileRoutes.routes,
    );
  }
}

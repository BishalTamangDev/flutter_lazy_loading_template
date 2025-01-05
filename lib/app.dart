import 'package:flutter/material.dart';
import 'package:lazy_loading_template/presentation/simple_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lazy Loading App",
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: SimplePage(),
    );
  }
}

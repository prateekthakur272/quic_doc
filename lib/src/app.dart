import 'package:flutter/material.dart';
import 'package:quic_doc/src/constants/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Placeholder(),
      theme: themeLight,
      darkTheme: themeDark,
    );
  }
}

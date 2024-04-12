import 'package:flutter/material.dart';
import 'package:quic_doc/src/constants/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quic_doc/src/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: themeLight,
      darkTheme: themeDark,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}

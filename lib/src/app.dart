import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quic_doc/src/blocs/home_bloc.dart';
import 'package:quic_doc/src/constants/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quic_doc/src/repositories/doctor_repository.dart';
import 'package:quic_doc/src/screens/home_screen/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const doctorRepository = DoctorRepository();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (BuildContext context) =>
                RepositoryProvider.value(value: doctorRepository))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => HomeBloc(doctorRepository: doctorRepository)
                ..add(LoadHomeEvent()))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
          theme: themeLight,
          darkTheme: themeDark,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
        ),
      ),
    );
  }
}

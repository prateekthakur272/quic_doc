import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quic_doc/src/blocs/home_bloc.dart';
import 'package:quic_doc/src/extensions/build_context_extension.dart';
import 'package:quic_doc/src/screens/home_screen/widgets/appointment_preview_card.dart';
import 'package:quic_doc/src/screens/home_screen/widgets/section_title.dart';

class MyAppointments extends StatelessWidget {
  const MyAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Column(
        children: [
          SectionTitle(
            title: context.localizations.mySchedule,
            action: context.localizations.seeAll,
            onActionPressed: () {},
          ),
          const AppointmentPreviewCard(),
        ],
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quic_doc/src/blocs/doctor_detail_bloc.dart';
import 'package:quic_doc/src/repositories/doctor_repository.dart';
import 'package:quic_doc/src/screens/doctor_detail_screen/widgets/bordered_icon_button.dart';
import 'package:quic_doc/src/screens/doctor_detail_screen/widgets/doctor_card.dart';
import 'package:quic_doc/src/screens/doctor_detail_screen/widgets/doctor_working_hours.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({
    super.key,
    required this.doctorId,
  });

  final String doctorId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorDetailsBloc(const DoctorRepository())
        ..add(
          LoadDoctorDetails(doctorId: doctorId),
        ),
      child: const DoctorDetailsView(),
    );
  }
}

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BorderIconButton(
          icon: Icons.arrow_back,
          onTap: () => Navigator.pop(context),
        ),
        title: Text(
          'Doctor Details',
          style: textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          BorderIconButton(
            icon: Icons.favorite_outline,
            onTap: () {},
          )
        ],
      ),
      body: BlocBuilder<DoctorDetailsBloc, DoctorDetailsState>(
        builder: (context, state) {
          if (state.status == DoctorDetailsStatus.initial ||
              state.status == DoctorDetailsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == DoctorDetailsStatus.loaded) {
            final doctor = state.doctor;

            if (doctor == null) {
              return const Center(child: Text('Doctor not found.'));
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DoctorCard(doctor: state.doctor!),
                  Divider(height: 32.0, color: colorScheme.surfaceVariant),
                  DoctorWorkingHoursCard(workingHours: doctor.workingHours),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Something went wrong'));
          }
        },
      ),
    );
  }
}

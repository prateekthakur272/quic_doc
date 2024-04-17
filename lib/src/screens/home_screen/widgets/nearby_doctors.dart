import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quic_doc/src/blocs/home_bloc.dart';
import 'package:quic_doc/src/screens/home_screen/widgets/doctor_list_tile.dart';
import 'package:quic_doc/src/screens/home_screen/widgets/section_title.dart';

class NearbyDoctors extends StatelessWidget {
  const NearbyDoctors({super.key});

  get itemCount => null;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Column(
        children: [
          SectionTitle(
            title: 'Nearby Doctors',
            action: 'See all',
            onActionPressed: () {},
          ),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  DoctorListTile(doctor: state.nearbyDoctors[index]),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.nearbyDoctors.length)
        ],
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:quic_doc/src/screens/home_screen/widgets/doctor_list_tile.dart';
import 'package:quic_doc/src/screens/home_screen/widgets/section_title.dart';

class NearbyDoctors extends StatelessWidget {
  const NearbyDoctors({super.key});

  get itemCount => null;

  @override
  Widget build(BuildContext context) {
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
                DoctorListTile(doctor: Doctor.sampleDoctors[index]),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: Doctor.sampleDoctors.length)
      ],
    );
  }
}

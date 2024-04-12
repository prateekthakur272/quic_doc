import 'package:doctor_repository/doctor_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quic_doc/src/screens/home_screen/widgets/circle_avatar_with_label.dart';
import 'package:quic_doc/src/screens/home_screen/widgets/section_title.dart';

class DoctorCategories extends StatelessWidget {
  const DoctorCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: 'Categories',
          action: 'See all',
          onActionPressed: () {},
        ),
        Row(
            children: DoctorCategory.values
                .take(4)
                .map((e) => Expanded(
                      child: CircleAvatarWithLabel(
                          avtar: (Icon(e.icon)), label: e.name),
                    ))
                .toList())
      ],
    );
  }
}

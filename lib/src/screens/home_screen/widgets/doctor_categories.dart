import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quic_doc/src/blocs/home_bloc.dart';
import 'package:quic_doc/src/extensions/build_context_extension.dart';
import 'package:quic_doc/src/screens/home_screen/widgets/circle_avatar_with_label.dart';
import 'package:quic_doc/src/screens/home_screen/widgets/section_title.dart';

class DoctorCategories extends StatelessWidget {
  const DoctorCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            SectionTitle(
              title: context.localizations.categories,
              action: context.localizations.seeAll,
              onActionPressed: () {},
            ),
            Row(
                children: state.doctorCategories
                    .take(4)
                    .map((e) => Expanded(
                          child: CircleAvatarWithLabel(
                              avtar: (Icon(e.icon)), label: e.name),
                        ))
                    .toList())
          ],
        );
      },
    );
  }
}

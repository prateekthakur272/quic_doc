import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:quic_doc/src/constants/widgets.dart';
import 'package:quic_doc/src/extensions/build_context_extension.dart';
import 'package:quic_doc/src/screens/doctor_detail_screen/doctor_detail_screen.dart';

class DoctorListTile extends StatefulWidget {
  final Doctor doctor;
  const DoctorListTile({super.key, required this.doctor});

  @override
  State<DoctorListTile> createState() => _DoctorListTileState();
}

class _DoctorListTileState extends State<DoctorListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DoctorDetailsScreen(
                      doctorId: widget.doctor.id,
                    )));
      },
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(widget.doctor.profileImageUrl),
        backgroundColor: context.colorScheme.background,
      ),
      title: Text(
        widget.doctor.name,
        style:
            context.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.doctor.category.name,
              style: context.textTheme.bodyMedium!
                  .copyWith(color: context.colorScheme.secondary)),
          space4,
          Row(
            children: [
              const Icon(Icons.star,
                  color: Color.fromRGBO(255, 204, 128, 1), size: 16),
              const SizedBox(width: 4.0),
              Text(
                widget.doctor.rating.toString(),
                style: context.textTheme.bodySmall!.copyWith(
                  color: context.colorScheme.onBackground.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 16),
              Icon(Icons.work, color: context.colorScheme.tertiary, size: 16),
              const SizedBox(width: 4),
              Text(
                '3 years',
                style: context.textTheme.bodySmall!.copyWith(
                  color: context.colorScheme.onBackground.withOpacity(.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
      trailing: FilledButton(
        onPressed: () {},
        child: const Text('Book Now'),
      ),
    );
  }
}

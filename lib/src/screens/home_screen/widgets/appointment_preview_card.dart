import 'package:flutter/material.dart';
import 'package:quic_doc/src/extensions/build_context_extension.dart';

class AppointmentPreviewCard extends StatelessWidget {
  const AppointmentPreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: context.screenSize.width,
          padding: const EdgeInsets.all(16),
          height: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    context.colorScheme.primary.withOpacity(.7),
                    context.colorScheme.secondary.withOpacity(.7)
                  ])),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.localizations.noAppointments,
                style: context.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            height: 8,
            decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(8)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      context.colorScheme.primary.withOpacity(.5),
                      context.colorScheme.secondary.withOpacity(.5)
                    ])),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            height: 8,
            decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(8)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      context.colorScheme.primary.withOpacity(.3),
                      context.colorScheme.secondary.withOpacity(.3)
                    ])),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quic_doc/src/extensions/build_context_extension.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? action;
  final VoidCallback? onActionPressed;
  const SectionTitle(
      {super.key, required this.title, this.action, this.onActionPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.textTheme.bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        if (action != null)
          TextButton(
              onPressed: onActionPressed,
              child: Text(
                action!,
                style: context.textTheme.bodyLarge!.copyWith(
                    color: context.colorScheme.secondary,
                    decoration: TextDecoration.underline,
                    decorationColor: context.colorScheme.secondary),
              ))
      ],
    );
  }
}

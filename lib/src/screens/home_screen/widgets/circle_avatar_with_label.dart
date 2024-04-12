import 'package:flutter/material.dart';
import 'package:quic_doc/src/extensions/build_context_extension.dart';

class CircleAvatarWithLabel extends StatelessWidget {
  final Widget avtar;
  final String label;
  final VoidCallback? onTap;
  const CircleAvatarWithLabel(
      {super.key, required this.avtar, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            child: avtar,
          ),
          Text(
            label,
            style: context.textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )
        ],
      ),
    );
  }
}

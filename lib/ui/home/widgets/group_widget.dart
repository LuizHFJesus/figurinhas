import 'package:flutter/material.dart';

class GroupWidget extends StatelessWidget {
  final String name;
  final List<Widget> sections;

  const GroupWidget({required this.name, required this.sections, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            name,
            style: TextTheme.of(context).bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ),

        ...sections,
      ],
    );
  }
}

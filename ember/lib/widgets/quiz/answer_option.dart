import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const AnswerCard({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFD4A853)
              : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFD4A853)
                : Theme.of(context).colorScheme.primary.withOpacity(0.1),
            width: 2,
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isSelected
                    ? const Color(0xFF1A1612)
                    : Theme.of(context).colorScheme.primary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
        ),
      ),
    );
  }
}

class AnswerOption {
  final String id;
  final String text;
  final List<String> mapsTo;
  final String? willpowerType;

  AnswerCard get widget {
    return AnswerCard(
      text: text,
      isSelected: false,
      onTap: () {},
    );
  }
}

import 'package:flutter/material.dart';

import '../app_theme.dart';

class LoopNoteLogo extends StatelessWidget {
  const LoopNoteLogo({
    super.key,
    this.size = 44,
    this.showWordmark = true,
    this.centered = false,
  });

  final double size;
  final bool showWordmark;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: centered
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/branding/loopnote-app-logo.png',
            width: size,
            height: size,
            fit: BoxFit.cover,
            semanticLabel: 'Loop Note logo',
          ),
        ),
        if (showWordmark) ...[
          SizedBox(width: size * 0.28),
          Text(
            'Loop Note',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.mainTextColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loop Note')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.mainTextColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Your notes, tasks, and reminders will live here.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.secondaryTextColor,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 360),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 78,
                          height: 78,
                          decoration: const BoxDecoration(
                            color: AppColors.mainBrandSoftColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.edit_note_rounded,
                            size: 42,
                            color: AppColors.mainBrandDarkColor,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          'Ready for your first loop',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.mainTextColor,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Start with one note, one task, or one reminder.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: AppColors.secondaryTextColor,
                                height: 1.5,
                              ),
                        ),
                        const SizedBox(height: 22),
                        SizedBox(
                          width: double.infinity,
                          height: 46,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.add_rounded),
                            label: const Text('Create First Note'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

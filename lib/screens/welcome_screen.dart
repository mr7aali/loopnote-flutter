import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../app_theme.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _particleController;

  @override
  void initState() {
    super.initState();
    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _particleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _particleController,
              builder: (context, child) {
                return CustomPaint(
                  painter: _ParticlePainter(_particleController.value),
                );
              },
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 28,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 430),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/branding/loopnote-splash-logo.png',
                        height: 220,
                        fit: BoxFit.contain,
                        semanticLabel: 'Loop Note',
                      ),
                      // const SizedBox(height: 28),
                      const _WelcomeImage(),
                      // const SizedBox(height: 30),
                      Text(
                        'Capture notes. Complete loops.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              color: AppColors.mainTextColor,
                              fontWeight: FontWeight.w700,
                              height: 1.15,
                            ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        'Turn ideas into tasks, reminders, and finished work from one calm workspace.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.secondaryTextColor,
                          height: 1.55,
                        ),
                      ),
                      const SizedBox(height: 30),
                      _WelcomeActions(
                        onGetStarted: () =>
                            _showNextStepMessage(context, 'Get started'),
                        onSignIn: () =>
                            _showNextStepMessage(context, 'Sign in'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showNextStepMessage(BuildContext context, String action) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$action screen will be added next.')),
    );
  }
}

class _WelcomeImage extends StatelessWidget {
  const _WelcomeImage();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),

      child: ClipRRect(
        child: Image.asset(
          'assets/images/welcome-loopnote.png',
          height: 280,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class _WelcomeActions extends StatelessWidget {
  const _WelcomeActions({required this.onGetStarted, required this.onSignIn});

  final VoidCallback onGetStarted;
  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 42,
            child: ElevatedButton(
              onPressed: onGetStarted,
              child: const FittedBox(child: Text('Get Started')),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: SizedBox(
            height: 42,
            child: OutlinedButton(
              onPressed: onSignIn,
              child: const FittedBox(child: Text('Sign In')),
            ),
          ),
        ),
      ],
    );
  }
}

class _ParticlePainter extends CustomPainter {
  const _ParticlePainter(this.progress);

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (var i = 0; i < 26; i++) {
      final seed = i * 0.73;
      final wave = math.sin((progress * math.pi * 2) + seed);
      final drift = math.cos((progress * math.pi * 2) + seed) * 18;
      final x = ((i * 47) % size.width) + drift;
      final y = ((i * 83) % size.height) + (wave * 14);
      final radius = 2.5 + (i % 4);
      final opacity = 0.12 + ((i % 5) * 0.025);

      paint.color =
          (i.isEven
                  ? AppColors.mainBrandLightColor
                  : AppColors.mainBrandSoftColor)
              .withValues(alpha: opacity);

      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

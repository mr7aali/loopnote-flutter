import 'package:flutter/material.dart';

import '../app_theme.dart';
import 'home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _rememberMe = true;
  var _hidePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onboardingBackgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final artworkSize = (constraints.maxHeight * 0.32)
                .clamp(190.0, 260.0)
                .toDouble();

            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 14, 24, 26),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 430),
                  child: AutofillGroup(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              IconButton.filledTonal(
                                tooltip: 'Back',
                                onPressed: () =>
                                    Navigator.of(context).maybePop(),
                                icon: const Icon(Icons.arrow_back_rounded),
                              ),
                              const Spacer(),
                              Image.asset(
                                'assets/branding/loopnote-splash-logo.png',
                                height: 58,
                                fit: BoxFit.contain,
                                semanticLabel: 'Loop Note',
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          _FadeSlide(
                            delay: const Duration(milliseconds: 80),
                            child: Center(
                              child: _SignInArtwork(size: artworkSize),
                            ),
                          ),
                          const SizedBox(height: 12),
                          _FadeSlide(
                            delay: const Duration(milliseconds: 150),
                            child: Column(
                              children: [
                                Text(
                                  'Welcome back',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        color: AppColors.mainTextColor,
                                        fontWeight: FontWeight.w700,
                                        height: 1.15,
                                      ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Sign in to continue your notes, tasks, and reminders.',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyLarge
                                      ?.copyWith(
                                        color: AppColors.secondaryTextColor,
                                        height: 1.45,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 26),
                          _FadeSlide(
                            delay: const Duration(milliseconds: 220),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextFormField(
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  autofillHints: const [AutofillHints.email],
                                  decoration: const InputDecoration(
                                    labelText: 'Email',
                                    hintText: 'you@example.com',
                                    prefixIcon: Icon(
                                      Icons.mail_outline_rounded,
                                    ),
                                  ),
                                  validator: _validateEmail,
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: _hidePassword,
                                  textInputAction: TextInputAction.done,
                                  autofillHints: const [AutofillHints.password],
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    hintText: 'Your password',
                                    prefixIcon: const Icon(
                                      Icons.lock_outline_rounded,
                                    ),
                                    suffixIcon: IconButton(
                                      tooltip: _hidePassword
                                          ? 'Show password'
                                          : 'Hide password',
                                      onPressed: () {
                                        setState(
                                          () => _hidePassword = !_hidePassword,
                                        );
                                      },
                                      icon: Icon(
                                        _hidePassword
                                            ? Icons.visibility_rounded
                                            : Icons.visibility_off_rounded,
                                      ),
                                    ),
                                  ),
                                  validator: _validatePassword,
                                  onFieldSubmitted: (_) => _submit(),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: _rememberMe,
                                      onChanged: (value) {
                                        setState(
                                          () => _rememberMe = value ?? false,
                                        );
                                      },
                                    ),
                                    const Expanded(child: Text('Remember me')),
                                    TextButton(
                                      onPressed: _showResetMessage,
                                      child: const Text('Forgot?'),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 18),
                                SizedBox(
                                  height: 48,
                                  child: ElevatedButton(
                                    onPressed: _submit,
                                    child: const Text('Sign In'),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                SizedBox(
                                  height: 46,
                                  child: OutlinedButton.icon(
                                    onPressed: _openHome,
                                    icon: const Icon(
                                      Icons.person_outline_rounded,
                                    ),
                                    label: const FittedBox(
                                      child: Text('Continue as Guest'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String? _validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if ((value ?? '').length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    _openHome();
  }

  void _openHome() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (route) => false,
    );
  }

  void _showResetMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password reset will be added soon.')),
    );
  }
}

class _SignInArtwork extends StatelessWidget {
  const _SignInArtwork({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/sign-in-secure-notes.png',
      width: size,
      height: size,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.high,
      semanticLabel: 'Secure notes',
      errorBuilder: (context, error, stackTrace) {
        return _SignInArtworkFallback(size: size);
      },
    );
  }
}

class _SignInArtworkFallback extends StatelessWidget {
  const _SignInArtworkFallback({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _SignInArtworkPainter()),
    );
  }
}

class _SignInArtworkPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.shortestSide / 260;
    canvas.save();
    canvas.scale(scale);

    final shadowPaint = Paint()
      ..color = AppColors.mainBrandDarkColor.withValues(alpha: 0.12)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 14);
    final notebookPaint = Paint()..color = AppColors.mainBrandLightColor;
    final notebookDarkPaint = Paint()..color = AppColors.mainBrandDarkColor;
    final paperPaint = Paint()..color = AppColors.cardBackgroundColor;
    final softPaint = Paint()..color = AppColors.mainBrandSoftColor;
    final yellowPaint = Paint()..color = AppColors.warningColor;
    final linePaint = Paint()
      ..color = AppColors.secondaryTextColor.withValues(alpha: 0.25)
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    final notebook = RRect.fromRectAndRadius(
      const Rect.fromLTWH(76, 56, 124, 150),
      const Radius.circular(18),
    );
    canvas.drawRRect(notebook.shift(const Offset(0, 8)), shadowPaint);
    canvas.drawRRect(notebook, notebookPaint);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(174, 62, 20, 138),
        const Radius.circular(12),
      ),
      softPaint,
    );

    for (var i = 0; i < 5; i++) {
      final y = 74.0 + (i * 22);
      canvas.drawCircle(Offset(78, y), 5, notebookDarkPaint);
      canvas.drawLine(Offset(58, y), Offset(78, y), linePaint);
    }

    final leftCard = RRect.fromRectAndRadius(
      const Rect.fromLTWH(26, 70, 68, 92),
      const Radius.circular(14),
    );
    canvas.drawRRect(leftCard.shift(const Offset(0, 6)), shadowPaint);
    canvas.drawRRect(leftCard, paperPaint);
    for (var i = 0; i < 3; i++) {
      final y = 92.0 + (i * 22);
      canvas.drawCircle(Offset(47, y), 9, notebookDarkPaint);
      canvas.drawLine(Offset(62, y), Offset(82, y), linePaint);
    }

    final rightCard = RRect.fromRectAndRadius(
      const Rect.fromLTWH(184, 86, 54, 72),
      const Radius.circular(14),
    );
    canvas.drawRRect(rightCard.shift(const Offset(0, 6)), shadowPaint);
    canvas.drawRRect(rightCard, paperPaint);
    canvas.drawCircle(const Offset(203, 110), 8, notebookPaint);
    canvas.drawLine(const Offset(216, 110), const Offset(230, 110), linePaint);
    canvas.drawCircle(const Offset(203, 134), 8, notebookPaint);
    canvas.drawLine(const Offset(216, 134), const Offset(230, 134), linePaint);

    final lockCirclePaint = Paint()..color = AppColors.cardBackgroundColor;
    canvas.drawCircle(const Offset(138, 130), 36, lockCirclePaint);
    canvas.drawCircle(const Offset(138, 130), 36, shadowPaint);
    final lockBody = RRect.fromRectAndRadius(
      const Rect.fromLTWH(120, 128, 36, 30),
      const Radius.circular(8),
    );
    canvas.drawRRect(lockBody, notebookDarkPaint);
    final shacklePaint = Paint()
      ..color = notebookDarkPaint.color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      const Rect.fromLTWH(124, 108, 28, 34),
      3.14,
      3.14,
      false,
      shacklePaint,
    );
    canvas.drawCircle(const Offset(138, 144), 4, paperPaint);

    final keyPaint = Paint()
      ..color = softPaint.color
      ..strokeWidth = 14
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(const Offset(40, 204), const Offset(92, 172), keyPaint);
    canvas.drawCircle(const Offset(38, 205), 18, softPaint);
    canvas.drawCircle(
      const Offset(38, 205),
      8,
      Paint()..color = AppColors.onboardingBackgroundColor,
    );
    canvas.drawLine(const Offset(76, 182), const Offset(90, 196), keyPaint);

    canvas.drawCircle(const Offset(218, 196), 26, softPaint);
    final checkPaint = Paint()
      ..color = AppColors.inverseTextColor
      ..strokeWidth = 7
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final checkPath = Path()
      ..moveTo(205, 196)
      ..lineTo(216, 207)
      ..lineTo(234, 186);
    canvas.drawPath(checkPath, checkPaint);

    canvas.drawCircle(const Offset(36, 52), 9, yellowPaint);
    canvas.drawCircle(const Offset(222, 56), 8, softPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _SignInArtworkPainter oldDelegate) => false;
}

class _FadeSlide extends StatelessWidget {
  const _FadeSlide({required this.child, required this.delay});

  final Widget child;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 420 + delay.inMilliseconds),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        final delayedValue =
            ((value * 420) - delay.inMilliseconds).clamp(0.0, 420.0) / 420.0;

        return Opacity(
          opacity: delayedValue,
          child: Transform.translate(
            offset: Offset(0, 14 * (1 - delayedValue)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

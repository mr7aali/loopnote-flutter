import 'package:flutter/material.dart';

import '../app_theme.dart';
import 'home_screen.dart';
import 'sign_in_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  var _selectedPage = 0;

  static const _pages = [
    _OnboardingPageData(
      imagePath: 'assets/images/onboarding-collect-ideas.png',
      title: 'Collect every idea',
      body: 'Quick notes stay clean, searchable, and ready for action.',
    ),
    _OnboardingPageData(
      imagePath: 'assets/images/onboarding-turn-tasks.png',
      title: 'Turn notes into tasks',
      body: 'Keep the next step beside the thought that started it.',
    ),
    _OnboardingPageData(
      imagePath: 'assets/images/onboarding-close-loop.png',
      title: 'Close the loop',
      body: 'Use reminders and daily focus to finish what matters.',
    ),
  ];

  bool get _isLastPage => _selectedPage == _pages.length - 1;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 18, 24, 24),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        'assets/branding/loopnote-splash-logo.png',
                        height: 86,
                        fit: BoxFit.contain,
                        semanticLabel: 'Loop Note',
                      ),
                    ),
                  ),
                  const Spacer(),
                  TextButton(onPressed: _openHome, child: const Text('Skip')),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _selectedPage = index);
                  },
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    final page = _pages[index];
                    return _OnboardingPage(
                      page: page,
                      isActive: index == _selectedPage,
                    );
                  },
                ),
              ),
              _PageDots(count: _pages.length, selectedIndex: _selectedPage),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 46,
                      child: OutlinedButton(
                        onPressed: _selectedPage == 0
                            ? _openSignIn
                            : _previousPage,
                        child: FittedBox(
                          child: Text(_selectedPage == 0 ? 'Sign In' : 'Back'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 46,
                      child: ElevatedButton(
                        onPressed: _isLastPage ? _openHome : _nextPage,
                        child: FittedBox(
                          child: Text(_isLastPage ? 'Start Now' : 'Next'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOut,
    );
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOut,
    );
  }

  void _openHome() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (route) => false,
    );
  }

  void _openSignIn() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const SignInScreen()),
    );
  }
}

class _OnboardingPageData {
  const _OnboardingPageData({
    required this.imagePath,
    required this.title,
    required this.body,
  });

  final String imagePath;
  final String title;
  final String body;
}

class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({required this.page, required this.isActive});

  final _OnboardingPageData page;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final imageSize = (constraints.maxHeight * 0.48)
            .clamp(190.0, 320.0)
            .toDouble();
        final contentGap = constraints.maxHeight < 520 ? 14.0 : 28.0;

        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 280),
              curve: Curves.easeOut,
              opacity: isActive ? 1 : 0.72,
              child: AnimatedScale(
                duration: const Duration(milliseconds: 320),
                curve: Curves.easeOutCubic,
                scale: isActive ? 1 : 0.96,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TweenAnimationBuilder<double>(
                      key: ValueKey(page.imagePath),
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: const Duration(milliseconds: 520),
                      curve: Curves.easeOutCubic,
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, 18 * (1 - value)),
                            child: child,
                          ),
                        );
                      },
                      child: _OnboardingArtwork(
                        imagePath: page.imagePath,
                        size: imageSize,
                      ),
                    ),
                    SizedBox(height: contentGap),
                    TweenAnimationBuilder<double>(
                      key: ValueKey(page.title),
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: const Duration(milliseconds: 420),
                      curve: Curves.easeOut,
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, 12 * (1 - value)),
                            child: child,
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Text(
                            page.title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.mainTextColor,
                                  height: 1.15,
                                ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            page.body,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  color: AppColors.secondaryTextColor,
                                  height: 1.55,
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
        );
      },
    );
  }
}

class _OnboardingArtwork extends StatelessWidget {
  const _OnboardingArtwork({required this.imagePath, required this.size});

  final String imagePath;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 420),
            curve: Curves.easeOut,
            width: size * 0.82,
            height: size * 0.82,
            decoration: BoxDecoration(
              color: AppColors.mainBrandSoftColor.withValues(alpha: 0.58),
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            top: size * 0.04,
            right: size * 0.1,
            child: _FloatingDot(size: size * 0.08),
          ),
          Positioned(
            left: size * 0.04,
            bottom: size * 0.16,
            child: _FloatingDot(size: size * 0.055),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              imagePath,
              width: size,
              height: size,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
            ),
          ),
        ],
      ),
    );
  }
}

class _FloatingDot extends StatelessWidget {
  const _FloatingDot({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 5 * (1 - value)),
          child: Opacity(opacity: 0.7 + (value * 0.3), child: child),
        );
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: AppColors.mainBrandLightColor.withValues(alpha: 0.22),
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.mainBrandLightColor.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
      ),
    );
  }
}

class _PageDots extends StatelessWidget {
  const _PageDots({required this.count, required this.selectedIndex});

  final int count;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isSelected = selectedIndex == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isSelected ? 22 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.mainBrandColor
                : AppColors.strongBorderColor,
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:coffee_card/utils/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final List<Map<String, String>> pages = [
    {
      'title': 'Master Your Exams',
      'desc':
          'Your complete study companion for WAEC, JAMB, NECO and more. Access thousands of past questions.',
      'button': 'Get Started',
    },
    {
      'title': 'AI-Powered Learning',
      'desc':
          'Get instant answers and explanations from our intelligent AI tutor. Study smarter, not harder.',
      'button': 'Next',
    },
    {
      'title': 'Track Your Progress',
      'desc':
          'Create personalized study roadmaps and monitor your improvement with detailed analytics.',
      'button': 'Let\'s Go',
    },
  ];

  void nextPage() {
    if (currentPage < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/signin');
    }
  }

  void skip() {
    Navigator.pushReplacementNamed(context, '/signin');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = pages[index];
                  final bool isLastPage = index == pages.length - 1;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // --- Page Title ---
                        Text(
                          page['title']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 16),

                        // --- Page Description ---
                        Text(
                          page['desc']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white70,
                          ),
                        ),

                        const SizedBox(height: 30),

                        // --- Page Indicators ---
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            pages.length,
                            (i) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              height: 8,
                              width: currentPage == i ? 24 : 8,
                              decoration: BoxDecoration(
                                color: currentPage == i
                                    ? AppColors.accentYellow
                                    : Colors.white38,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // --- Main Button ---
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.accentYellow,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            onPressed: nextPage,
                            child: Text(
                              page['button']!,
                              style: TextStyle(
                                color: AppColors.primaryBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        if (!isLastPage)
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.white),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                              onPressed: skip,
                              child: const Text(
                                'Skip',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

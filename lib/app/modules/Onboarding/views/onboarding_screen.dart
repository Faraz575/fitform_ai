import 'package:fitform_ai/App/modules/Onboarding/static_data/onboarding_data.dart';
import 'package:fitform_ai/App/modules/Onboarding/views/widgets/onboarding_page_content.dart';
import 'package:fitform_ai/App/modules/Onboarding/views/widgets/wavy_clipper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controller/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipPath(
                clipper: WavyClipper(),
                child: Container(
                  height: 200,
                  color: const Color(0xFF2E2E48).withOpacity(0.3),
                ),
              ),
            ),
            Column(
              children: [
                // Top Title
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    'SMART FITNESS',
                    style: TextStyle(
                      color: Color(0xFFE8DE00),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),

                Expanded(
                  child: PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: controller.onPageChanged,
                    itemCount: onboardingPages.length,
                    itemBuilder: (context, index) {
                      final page = onboardingPages[index];
                      return OnboardingPageContent(
                        icon: page['icon'],
                        title: page['title'],
                        subtitle: page['subtitle'],
                      );
                    },
                  ),
                ),

                SmoothPageIndicator(
                  controller: controller.pageController,
                  count: onboardingPages.length,
                  effect: const WormEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Color(0xFFE8DE00),
                    dotHeight: 8,
                    dotWidth: 8,
                    type: WormType.thin,
                  ),
                ),
                const SizedBox(height: 30),
                // Bottom Buttons
                _buildBottomButtons(),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButtons() {
    final backButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.grey.withOpacity(0.2),
      shape: const CircleBorder(),
      padding: const EdgeInsets.all(15),
    );

    final nextButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFE8DE00),
      foregroundColor: const Color(0xFF1A1A2E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
    );
    return Obx(
          () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Back Button
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: controller.currentPage.value > 0 ? 1.0 : 0.0,
              child: ElevatedButton(
                onPressed: controller.currentPage.value > 0
                    ? controller.previousPage
                    : null,
                style: backButtonStyle,
                child: const Text(
                  'BACK',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            ElevatedButton(
              onPressed:
              controller.currentPage.value == onboardingPages.length - 1
                  ? controller.getStarted
                  : controller.nextPage,
              style: nextButtonStyle,
              child: Text(
                controller.currentPage.value == onboardingPages.length - 1
                    ? 'GET STARTED'
                    : 'NEXT',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

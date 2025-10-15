import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controller/library_controller.dart';
import 'exercise_list_screen.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LibraryController controller = Get.put(LibraryController());
    const primaryColor = Color(0xFFE8DE00);
    const bgColor = Color(0xFF1A1A2E);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text('Exercise Library', style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(
            () => ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: controller.categoryList.length,
          itemBuilder: (context, index) {
            final category = controller.categoryList[index];

            return GestureDetector(
              onTap: () {
                Get.to(() => ExerciseListScreen(category: category), transition: Transition.rightToLeft);
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFF2E2E48).withOpacity(0.5),
                      bgColor.withOpacity(0.5),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: primaryColor.withOpacity(0.2)),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Lottie.asset(
                        category.lottiePath,
                        width: Get.width * 0.2,
                        height: Get.width * 0.2,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: Get.width * 0.2,
                            height: Get.width * 0.2,
                            color: Colors.black26,
                            child: const Icon(Icons.error, color: Colors.red),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Get.width * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '${category.exercises.length} exercises',
                            style: TextStyle(color: Colors.grey, fontSize: Get.width * 0.035),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: primaryColor, size: Get.width * 0.04),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
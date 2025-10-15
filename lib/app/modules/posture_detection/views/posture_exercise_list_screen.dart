// import 'package:fitform_ai/app/data/local/models/category_model.dart';
// import 'package:fitform_ai/app/modules/posture_detection/views/posture_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class PostureExerciseListScreen extends StatelessWidget {
//   final ExerciseCategory category;
//   const PostureExerciseListScreen({super.key, required this.category});
//
//   @override
//   Widget build(BuildContext context) {
//     const primaryColor = Color(0xFFE8DE00);
//     const bgColor = Color(0xFF1A1A2E);
//
//     return Scaffold(
//       backgroundColor: bgColor,
//       appBar: AppBar(
//         title: Text(category.name, style: const TextStyle(color: primaryColor, fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: primaryColor),
//           onPressed: () => Get.back(),
//         ),
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(15),
//         itemCount: category.exercises.length,
//         itemBuilder: (context, index) {
//           final exercise = category.exercises[index];
//
//           // LibraryScreen wala hi card design yahan reuse hu raha hai
//           return GestureDetector(
//             onTap: () {
//               Get.to(() => const PostureScreen(), arguments: exercise);
//             },
//             child: Container(
//               margin: const EdgeInsets.only(bottom: 15),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   colors: [
//                     const Color(0xFF2E2E48).withOpacity(0.5),
//                     bgColor.withOpacity(0.5),
//                   ],
//                 ),
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: primaryColor.withOpacity(0.2)),
//               ),
//               child: Row(
//                 children: [
//                   ClipRRect(
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       bottomLeft: Radius.circular(20),
//                     ),
//                     child: Image.asset(
//                       exercise.gifPath,
//                       width: Get.width * 0.3,
//                       height: Get.width * 0.3,
//                       fit: BoxFit.cover,
//                       errorBuilder: (context, error, stackTrace) {
//                         return Container(
//                           width: Get.width * 0.3,
//                           height: Get.width * 0.3,
//                           color: Colors.black26,
//                           child: const Icon(Icons.error, color: Colors.red),
//                         );
//                       },
//                     ),
//                   ),
//                   const SizedBox(width: 20),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           exercise.title,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: Get.width * 0.045,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Row(
//                           children: [
//                             const Icon(Icons.timer_outlined, color: Colors.grey, size: 16),
//                             const SizedBox(width: 5),
//                             Text(
//                               '${exercise.durationInSeconds} seconds',
//                               style: TextStyle(color: Colors.grey, fontSize: Get.width * 0.035),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 20.0),
//                     child: Icon(Icons.arrow_forward_ios, color: primaryColor, size: Get.width * 0.04),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
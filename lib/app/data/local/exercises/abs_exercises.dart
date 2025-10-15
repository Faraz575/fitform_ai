import 'package:fitform_ai/app/data/local/models/category_model.dart';
import 'package:fitform_ai/app/data/local/models/exercise_model.dart';

ExerciseCategory getAbsCategory() {
  return ExerciseCategory(
    id: 'cat_abs',
    name: 'Abs',
    lottiePath: 'assets/lottie/man-doing-crunches.json',
    exercises: [
      Exercise(
        id: 'ex_crunches',
        title: 'Crunches',
        gifPath: 'assets/gifs/crunches.gif',
        durationInSeconds: 45,
        instructions: [
          'Lie on your back with knees bent, feet flat on the floor.',
          'Place your hands behind your head or across your chest.',
          'Lift your upper back off the ground, contracting your abs.',
          'Lower back down with control.'
        ],
      ),
      Exercise(
        id: 'ex_plank',
        title: 'Plank',
        gifPath: 'assets/gifs/plank.gif',
        durationInSeconds: 60,
        instructions: [
          'Lie face down, then prop yourself up on your forearms and toes.',
          'Keep your body in a straight line from head to heels.',
          'Hold the position, engaging your core.',
          'Avoid letting your hips sag or pike up.'
        ],
      ),
      Exercise(
        id: 'ex_russian_twists',
        title: 'Russian Twists',
        gifPath: 'assets/gifs/russian_twists.gif',
        durationInSeconds: 45,
        instructions: [
          'Sit on the floor, knees bent, feet slightly off the ground.',
          'Lean back slightly and hold a weight with both hands.',
          'Twist your torso side to side, touching the weight to the floor.',
          'Keep your core engaged throughout.'
        ],
      ),
      Exercise(
        id: 'ex_leg_raises',
        title: 'Leg Raises',
        gifPath: 'assets/gifs/leg_raises.gif',
        durationInSeconds: 60,
        instructions: [
          'Lie on your back with legs straight and hands under your glutes.',
          'Lift your legs until they’re perpendicular to the floor.',
          'Slowly lower your legs back down without touching the ground.',
          'Keep your lower back pressed into the floor.'
        ],
      ),
      Exercise(
        id: 'ex_bicycle_crunches',
        title: 'Bicycle Crunches',
        gifPath: 'assets/gifs/bicycle_crunches.gif',
        durationInSeconds: 45,
        instructions: [
          'Lie on your back, hands behind your head, legs lifted.',
          'Bring one elbow to the opposite knee while extending the other leg.',
          'Alternate sides in a pedaling motion.',
          'Keep your core tight and avoid pulling your neck.'
        ],
      ),
      Exercise(
        id: 'ex_hanging_leg_raises',
        title: 'Hanging Leg Raises',
        gifPath: 'assets/gifs/hanging_leg_raises.gif',
        durationInSeconds: 60,
        instructions: [
          'Hang from a pull-up bar with your arms extended.',
          'Raise your legs until they’re parallel to the ground.',
          'Lower your legs back down with control.',
          'Avoid swinging or using momentum.'
        ],
      ),
      Exercise(
        id: 'ex_mountain_climbers',
        title: 'Mountain Climbers',
        gifPath: 'assets/gifs/mountain_climbers.gif',
        durationInSeconds: 45,
        instructions: [
          'Start in a plank position with hands under shoulders.',
          'Drive one knee toward your chest, then quickly switch legs.',
          'Continue alternating legs at a fast pace.',
          'Keep your core engaged and back straight.'
        ],
      ),
      Exercise(
        id: 'ex_ab_rollouts',
        title: 'Ab Rollouts',
        gifPath: 'assets/gifs/ab_rollouts.gif',
        durationInSeconds: 60,
        instructions: [
          'Kneel on the floor, holding an ab wheel or barbell.',
          'Roll the wheel forward, extending your body as far as possible.',
          'Contract your abs to pull the wheel back to the start.',
          'Keep your back straight to avoid strain.'
        ],
      ),
      Exercise(
        id: 'ex_side_plank',
        title: 'Side Plank',
        gifPath: 'assets/gifs/side_plank.gif',
        durationInSeconds: 60,
        instructions: [
          'Lie on your side, propped up on one forearm.',
          'Lift your hips so your body forms a straight line.',
          'Hold the position, engaging your obliques.',
          'Switch sides after completing the duration.'
        ],
      ),
      Exercise(
        id: 'ex_v_ups',
        title: 'V-Ups',
        gifPath: 'assets/gifs/v_ups.gif',
        durationInSeconds: 60,
        instructions: [
          'Lie on your back with arms extended overhead.',
          'Simultaneously lift your legs and torso to form a V shape.',
          'Reach your hands toward your feet at the top.',
          'Lower back down with control.'
        ],
      ),
    ],
  );
}
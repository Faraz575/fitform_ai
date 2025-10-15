import '../models/category_model.dart';
import '../models/exercise_model.dart';

ExerciseCategory getChestCategory() {
  return ExerciseCategory(
    id: 'cat_chest',
    name: 'Chest',
    lottiePath: 'assets/lottie/man-doing-inclined-press.json',
    exercises: [
      Exercise(
        id: 'ex_bench_press',
        title: 'Barbell Bench Press',
        gifPath: 'assets/gifs/bench_press.gif',
        durationInSeconds: 60,
        instructions: [
          'Lie flat on a bench, feet firmly on the floor.',
          'Grip the bar slightly wider than shoulder-width.',
          'Lower the bar to your mid-chest, keeping elbows at a 75-degree angle.',
          'Press the bar back up explosively until arms are fully extended.'
        ],
      ),
      Exercise(
        id: 'ex_pushups',
        title: 'Push-ups',
        gifPath: 'assets/gifs/pushups.gif',
        durationInSeconds: 45,
        instructions: [
          'Place hands slightly wider than your shoulders.',
          'Keep your body in a straight line from head to heels.',
          'Lower your body until your chest nearly touches the floor.',
          'Push back up to the starting position without locking your elbows.'
        ],
      ),
      Exercise(
        id: 'ex_incline_press',
        title: 'Incline Dumbbell Press',
        gifPath: 'assets/gifs/incline_dumbbell_press.gif',
        durationInSeconds: 60,
        instructions: [
          'Set a bench to a 30-45 degree incline.',
          'Lie back with a dumbbell in each hand at shoulder level.',
          'Press the dumbbells upwards until they meet above your chest.',
          'Lower the dumbbells slowly and with control.'
        ],
      ),
      Exercise(
        id: 'ex_decline_press',
        title: 'Decline Barbell Press',
        gifPath: 'assets/gifs/decline_barbell_press.gif',
        durationInSeconds: 60,
        instructions: [
          'Lie on a decline bench, securing your legs.',
          'Grip the bar with a medium-width grip.',
          'Lower the bar to your lower chest.',
          'Press the bar back up to the starting position.'
        ],
      ),
      Exercise(
        id: 'ex_dumbbell_flys',
        title: 'Dumbbell Flys',
        gifPath: 'assets/gifs/dumbbell_flys.gif',
        durationInSeconds: 60,
        instructions: [
          'Lie on a flat bench with a dumbbell in each hand.',
          'Extend your arms above you with a slight bend in the elbows.',
          'Lower the weights in an arc out to your sides.',
          'Bring the dumbbells back to the start position using your chest muscles.'
        ],
      ),
      Exercise(
        id: 'ex_cable_crossover',
        title: 'Cable Crossover',
        gifPath: 'assets/gifs/cable_crossover.gif',
        durationInSeconds: 60,
        instructions: [
          'Stand in the center of a cable machine with pulleys set high.',
          'Grasp the handles, step forward, and lean slightly.',
          'Bring your hands together in a wide arc in front of your body.',
          'Feel the squeeze in your chest before returning to the start.'
        ],
      ),
      Exercise(
        id: 'ex_dips_chest',
        title: 'Chest Dips',
        gifPath: 'assets/gifs/chest_dips.gif',
        durationInSeconds: 45,
        instructions: [
          'Use parallel bars with a wide grip.',
          'Lean your torso forward as you lower your body.',
          'Go down until you feel a stretch in your chest.',
          'Push back up to the starting position.'
        ],
      ),
      Exercise(
        id: 'ex_pec_deck',
        title: 'Pec Deck Fly',
        gifPath: 'assets/gifs/pec_deck_fly.gif',
        durationInSeconds: 60,
        instructions: [
          'Sit at a pec deck machine with your back against the pad.',
          'Place your forearms on the pads or grasp the handles.',
          'Bring the pads together in front of your chest.',
          'Slowly return to the starting position with control.'
        ],
      ),
      Exercise(
        id: 'ex_incline_pushups',
        title: 'Incline Push-ups',
        gifPath: 'assets/gifs/incline_pushups.gif',
        durationInSeconds: 45,
        instructions: [
          'Place your hands on an elevated surface like a bench.',
          'Keep your body in a straight line.',
          'Lower your chest toward the surface.',
          'Push back up to the starting position.'
        ],
      ),
      Exercise(
        id: 'ex_dumbbell_pullover',
        title: 'Dumbbell Pullover',
        gifPath: 'assets/gifs/dumbbell_pullover.gif',
        durationInSeconds: 60,
        instructions: [
          'Lie perpendicular on a bench with only your upper back supported.',
          'Hold a dumbbell with both hands above your chest.',
          'Lower the dumbbell over your head in an arc until you feel a stretch.',
          'Pull the dumbbell back to the starting position.'
        ],
      ),
    ],
  );
}
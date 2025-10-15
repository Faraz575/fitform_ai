import 'package:fitform_ai/app/data/local/models/category_model.dart';
import 'package:fitform_ai/app/data/local/models/exercise_model.dart';

ExerciseCategory getBackCategory() {
  return ExerciseCategory(
    id: 'cat_back',
    name: 'Back',
    lottiePath: 'assets/lottie/man-doing-seated-cable-row-workout.json',
    exercises: [
      Exercise(
        id: 'ex_pullups',
        title: 'Pull-ups',
        gifPath: 'assets/gifs/pullups.gif',
        durationInSeconds: 60,
        instructions: [
          'Grip the bar with palms facing away, hands wider than shoulder-width.',
          'Hang with your arms fully extended.',
          'Pull your body up until your chin is over the bar.',
          'Lower your body back down slowly and with control.'
        ],
      ),
      Exercise(
        id: 'ex_lat_pulldown',
        title: 'Lat Pulldown',
        gifPath: 'assets/gifs/lat_pulldown.gif',
        durationInSeconds: 60,
        instructions: [
          'Sit at the lat pulldown machine and secure your knees.',
          'Grip the bar with a wide grip.',
          'Pull the bar down to your upper chest, squeezing your back muscles.',
          'Slowly return the bar to the starting position.'
        ],
      ),
      Exercise(
        id: 'ex_bent_over_row',
        title: 'Barbell Bent Over Row',
        gifPath: 'assets/gifs/bent_over_row.gif',
        durationInSeconds: 60,
        instructions: [
          'Hold a barbell with an overhand grip, hands shoulder-width apart.',
          'Bend at your hips and knees, keeping your back straight (almost parallel to the floor).',
          'Pull the barbell towards your lower chest/upper abs.',
          'Lower the bar with control.'
        ],
      ),
      Exercise(
        id: 'ex_t_bar_row',
        title: 'T-Bar Row',
        gifPath: 'assets/gifs/t_bar_row.gif',
        durationInSeconds: 60,
        instructions: [
          'Stand over the bar, feet on either side.',
          'Bend at the hips and knees and grasp the handle.',
          'Keeping your back straight, pull the weight up until it touches your chest.',
          'Lower the weight back down slowly.'
        ],
      ),
      Exercise(
        id: 'ex_deadlift',
        title: 'Deadlift',
        gifPath: 'assets/gifs/deadlift.gif',
        durationInSeconds: 75,
        instructions: [
          'Stand with your mid-foot under the barbell.',
          'Bend and grip the bar with a shoulder-width grip.',
          'Keep your chest up and back straight.',
          'Lift the weight by driving through your heels and extending your hips and knees.'
        ],
      ),
      Exercise(
        id: 'ex_seated_cable_row',
        title: 'Seated Cable Row',
        gifPath: 'assets/gifs/seated_cable_row.gif',
        durationInSeconds: 60,
        instructions: [
          'Sit at a cable row machine with your feet on the platform.',
          'Grasp the handle with your arms extended.',
          'Pull the handle towards your abdomen, squeezing your back muscles.',
          'Slowly extend your arms back to the starting position.'
        ],
      ),
      Exercise(
        id: 'ex_single_arm_row',
        title: 'Single-Arm Dumbbell Row',
        gifPath: 'assets/gifs/single_arm_row.gif',
        durationInSeconds: 60,
        instructions: [
          'Place one knee and hand on a bench for support.',
          'Hold a dumbbell in the opposite hand with your arm extended.',
          'Pull the dumbbell up to your side, keeping your elbow close.',
          'Lower the dumbbell back down with control.'
        ],
      ),
      Exercise(
        id: 'ex_inverted_row',
        title: 'Inverted Row',
        gifPath: 'assets/gifs/inverted_row.gif',
        durationInSeconds: 45,
        instructions: [
          'Lie under a low bar or TRX straps, gripping with both hands.',
          'Keep your body in a straight line.',
          'Pull your chest towards the bar, squeezing your back muscles.',
          'Lower yourself back down slowly.'
        ],
      ),
      Exercise(
        id: 'ex_rack_pulls',
        title: 'Rack Pulls',
        gifPath: 'assets/gifs/rack_pulls.gif',
        durationInSeconds: 60,
        instructions: [
          'Set the barbell on a rack just below your knees.',
          'Grip the bar with an overhand grip.',
          'Pull the bar up by extending your hips and standing upright.',
          'Lower the bar back to the rack with control.'
        ],
      ),
      Exercise(
        id: 'ex_hyperextensions',
        title: 'Hyperextensions',
        gifPath: 'assets/gifs/hyperextensions.gif',
        durationInSeconds: 60,
        instructions: [
          'Position yourself on a hyperextension bench, feet secured.',
          'Lower your torso toward the ground, keeping your back straight.',
          'Raise your torso back to a straight line with your legs.',
          'Avoid overextending your back at the top.'
        ],
      ),
    ],
  );
}
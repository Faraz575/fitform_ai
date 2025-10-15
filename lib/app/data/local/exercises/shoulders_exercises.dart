import 'package:fitform_ai/app/data/local/models/category_model.dart';
import 'package:fitform_ai/app/data/local/models/exercise_model.dart';

ExerciseCategory getShouldersCategory() {
  return ExerciseCategory(
    id: 'cat_shoulders',
    name: 'Shoulders',
    lottiePath: 'assets/lottie/Shoulder Stretch.json',
    exercises: [
      Exercise(
        id: 'ex_overhead_press',
        title: 'Barbell Overhead Press',
        gifPath: 'assets/gifs/overhead_press.gif',
        durationInSeconds: 60,
        instructions: [
          'Stand with feet shoulder-width apart, holding a barbell at shoulder height.',
          'Grip the bar slightly wider than shoulder-width.',
          'Press the bar overhead until arms are fully extended.',
          'Lower the bar back to shoulder level with control.'
        ],
      ),
      Exercise(
        id: 'ex_dumbbell_shoulder_press',
        title: 'Dumbbell Shoulder Press',
        gifPath: 'assets/gifs/dumbbell_shoulder_press.gif',
        durationInSeconds: 60,
        instructions: [
          'Sit on a bench with back support, holding a dumbbell in each hand.',
          'Raise dumbbells to shoulder height, palms facing forward.',
          'Press the dumbbells overhead until arms are extended.',
          'Lower the dumbbells back to shoulder level.'
        ],
      ),
      Exercise(
        id: 'ex_lateral_raise',
        title: 'Dumbbell Lateral Raise',
        gifPath: 'assets/gifs/lateral_raise.gif',
        durationInSeconds: 60,
        instructions: [
          'Stand with feet hip-width apart, holding a dumbbell in each hand.',
          'Raise your arms out to the sides until they’re at shoulder height.',
          'Keep a slight bend in your elbows.',
          'Lower the dumbbells back down slowly.'
        ],
      ),
      Exercise(
        id: 'ex_front_raise',
        title: 'Dumbbell Front Raise',
        gifPath: 'assets/gifs/front_raise.gif',
        durationInSeconds: 60,
        instructions: [
          'Stand with feet hip-width apart, holding a dumbbell in each hand.',
          'Raise one or both dumbbells forward to shoulder height.',
          'Keep your arms straight with a slight bend in the elbows.',
          'Lower the dumbbells back down with control.'
        ],
      ),
      Exercise(
        id: 'ex_arnold_press',
        title: 'Arnold Press',
        gifPath: 'assets/gifs/arnold_press.gif',
        durationInSeconds: 60,
        instructions: [
          'Sit or stand, holding dumbbells at shoulder height, palms facing you.',
          'Rotate your wrists as you press the dumbbells overhead.',
          'At the top, palms should face forward.',
          'Reverse the motion to lower the dumbbells.'
        ],
      ),
      Exercise(
        id: 'ex_rear_delt_fly',
        title: 'Rear Delt Fly',
        gifPath: 'assets/gifs/rear_delt_fly.gif',
        durationInSeconds: 60,
        instructions: [
          'Bend forward at the hips, holding a dumbbell in each hand.',
          'Raise the dumbbells out to the sides, squeezing your rear delts.',
          'Keep a slight bend in your elbows.',
          'Lower the dumbbells back down slowly.'
        ],
      ),
      Exercise(
        id: 'ex_face_pulls',
        title: 'Face Pulls',
        gifPath: 'assets/gifs/face_pulls.gif',
        durationInSeconds: 60,
        instructions: [
          'Set a cable pulley to upper chest height with a rope attachment.',
          'Pull the rope towards your face, keeping elbows high.',
          'Squeeze your rear delts at the peak of the movement.',
          'Slowly return to the starting position.'
        ],
      ),
      Exercise(
        id: 'ex_shrugs',
        title: 'Dumbbell Shrugs',
        gifPath: 'assets/gifs/shrugs.gif',
        durationInSeconds: 45,
        instructions: [
          'Stand with feet shoulder-width apart, holding a dumbbell in each hand.',
          'Shrug your shoulders as high as possible toward your ears.',
          'Hold briefly at the top, then lower slowly.',
          'Avoid rolling your shoulders.'
        ],
      ),
      Exercise(
        id: 'ex_upright_row',
        title: 'Barbell Upright Row',
        gifPath: 'assets/gifs/upright_row.gif',
        durationInSeconds: 60,
        instructions: [
          'Stand holding a barbell with an overhand grip, hands close together.',
          'Pull the bar up towards your chin, keeping it close to your body.',
          'Elbows should flare out and remain higher than the bar.',
          'Lower the bar back down with control.'
        ],
      ),
      Exercise(
        id: 'ex_push_press',
        title: 'Push Press',
        gifPath: 'assets/gifs/push_press.gif',
        durationInSeconds: 60,
        instructions: [
          'Hold a barbell at shoulder height, feet shoulder-width apart.',
          'Slightly bend your knees, then explosively push up with your legs.',
          'Press the bar overhead as you extend your legs.',
          'Lower the bar back to shoulder height.'
        ],
      ),
    ],
  );
}
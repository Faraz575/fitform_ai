import 'package:fitform_ai/app/data/local/models/category_model.dart';
import 'package:fitform_ai/app/data/local/models/exercise_model.dart';

ExerciseCategory getLegsCategory() {
  return ExerciseCategory(
    id: 'cat_legs',
    name: 'Legs',
    lottiePath: 'assets/lottie/man-doing-barbell-lunges.json',
    exercises: [
      Exercise(
        id: 'ex_squats',
        title: 'Barbell Squats',
        gifPath: 'assets/gifs/squats.gif',
        durationInSeconds: 60,
        instructions: [
          'Stand with feet shoulder-width apart, bar resting on your upper back.',
          'Keep your chest up and back straight.',
          'Lower your hips as if sitting in a chair, until your thighs are parallel to the floor.',
          'Drive through your heels to return to the starting position.'
        ],
      ),
      Exercise(
        id: 'ex_lunges',
        title: 'Dumbbell Lunges',
        gifPath: 'assets/gifs/lunges.gif',
        durationInSeconds: 60,
        instructions: [
          'Hold a dumbbell in each hand.',
          'Step forward with one leg and lower your hips.',
          'Ensure your front knee is directly above your ankle.',
          'Push off the front foot to return to the start and switch legs.'
        ],
      ),
      Exercise(
        id: 'ex_leg_press',
        title: 'Leg Press',
        gifPath: 'assets/gifs/leg_press.gif',
        durationInSeconds: 60,
        instructions: [
          'Sit on the leg press machine with your feet on the platform.',
          'Press the platform away until your legs are nearly fully extended.',
          'Slowly lower the weight back to the starting position.',
          'Do not lock your knees at the top.'
        ],
      ),
      Exercise(
        id: 'ex_calf_raises',
        title: 'Calf Raises',
        gifPath: 'assets/gifs/calf_raises.gif',
        durationInSeconds: 45,
        instructions: [
          'Stand on a raised surface with your heels hanging off.',
          'Raise your heels as high as possible, pausing at the top.',
          'Slowly lower your heels below the level of the platform.',
          'Hold a weight for extra resistance.'
        ],
      ),
      Exercise(
        id: 'ex_leg_curls',
        title: 'Lying Leg Curls',
        gifPath: 'assets/gifs/leg_curls.gif',
        durationInSeconds: 60,
        instructions: [
          'Lie face down on a leg curl machine, legs under the pad.',
          'Curl your legs up towards your glutes.',
          'Slowly lower the weight back to the starting position.',
          'Keep your hips pressed against the bench.'
        ],
      ),
      Exercise(
        id: 'ex_leg_extensions',
        title: 'Leg Extensions',
        gifPath: 'assets/gifs/leg_extensions.gif',
        durationInSeconds: 60,
        instructions: [
          'Sit on a leg extension machine with your legs under the pad.',
          'Extend your legs until they are straight.',
          'Slowly lower the weight back to the starting position.',
          'Avoid locking your knees at the top.'
        ],
      ),
      Exercise(
        id: 'ex_step_ups',
        title: 'Step-Ups',
        gifPath: 'assets/gifs/step_ups.gif',
        durationInSeconds: 60,
        instructions: [
          'Hold a dumbbell in each hand, facing a sturdy bench.',
          'Step onto the bench with one foot, driving through your heel.',
          'Bring the other foot up, then step back down.',
          'Alternate legs or complete all reps on one side.'
        ],
      ),
      Exercise(
        id: 'ex_bulgarian_split_squats',
        title: 'Bulgarian Split Squats',
        gifPath: 'assets/gifs/bulgarian_split_squats.gif',
        durationInSeconds: 60,
        instructions: [
          'Stand facing away from a bench, one foot resting on it.',
          'Hold dumbbells in each hand for added resistance.',
          'Lower your body until your front thigh is parallel to the ground.',
          'Push back up through your front heel.'
        ],
      ),
      Exercise(
        id: 'ex_box_jumps',
        title: 'Box Jumps',
        gifPath: 'assets/gifs/box_jumps.gif',
        durationInSeconds: 45,
        instructions: [
          'Stand in front of a sturdy box or platform.',
          'Squat slightly, then jump explosively onto the box.',
          'Land softly with both feet fully on the box.',
          'Step down carefully and repeat.'
        ],
      ),
      Exercise(
        id: 'ex_hack_squats',
        title: 'Hack Squats',
        gifPath: 'assets/gifs/hack_squats.gif',
        durationInSeconds: 60,
        instructions: [
          'Position yourself in a hack squat machine, shoulders under pads.',
          'Lower your body until your thighs are parallel to the platform.',
          'Push through your heels to return to the starting position.',
          'Keep your back against the pad throughout.'
        ],
      ),
    ],
  );
}
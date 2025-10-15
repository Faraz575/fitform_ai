import 'package:fitform_ai/app/data/local/models/category_model.dart';
import 'package:fitform_ai/app/data/local/models/exercise_model.dart';

ExerciseCategory getBicepsCategory() {
  return ExerciseCategory(
    id: 'cat_biceps',
    name: 'Biceps',
    lottiePath: 'assets/lottie/man-doing-barbell-curl.json',
    exercises: [
      Exercise(
        id: 'ex_barbell_curl',
        title: 'Barbell Curl',
        gifPath: 'assets/gifs/barbell_curl.gif',
        durationInSeconds: 60,
        instructions: [
          'Stand with feet shoulder-width apart, holding a barbell.',
          'Curl the bar up towards your chest, keeping elbows close to your body.',
          'Squeeze your biceps at the top.',
          'Lower the bar back down slowly.'
        ],
      ),
      Exercise(
        id: 'ex_dumbbell_curl',
        title: 'Dumbbell Curl',
        gifPath: 'assets/gifs/dumbbell_curl.gif',
        durationInSeconds: 60,
        instructions: [
          'Stand holding a dumbbell in each hand, palms facing forward.',
          'Curl the dumbbells up towards your shoulders.',
          'Keep your elbows stationary and close to your torso.',
          'Lower the dumbbells back down with control.'
        ],
      ),
      Exercise(
        id: 'ex_hammer_curl',
        title: 'Hammer Curl',
        gifPath: 'assets/gifs/hammer_curl.gif',
        durationInSeconds: 60,
        instructions: [
          'Hold a dumbbell in each hand with palms facing your body.',
          'Curl the dumbbells up, keeping your thumbs pointing upward.',
          'Squeeze your biceps at the top.',
          'Lower the dumbbells back down slowly.'
        ],
      ),
      Exercise(
        id: 'ex_preacher_curl',
        title: 'Preacher Curl',
        gifPath: 'assets/gifs/preacher_curl.gif',
        durationInSeconds: 60,
        instructions: [
          'Sit at a preacher bench, holding a barbell or dumbbell.',
          'Rest your arms on the pad, curl the weight up.',
          'Squeeze your biceps at the top.',
          'Lower the weight back down with control.'
        ],
      ),
      Exercise(
        id: 'ex_concentration_curl',
        title: 'Concentration Curl',
        gifPath: 'assets/gifs/concentration_curl.gif',
        durationInSeconds: 60,
        instructions: [
          'Sit on a bench, holding a dumbbell with one hand.',
          'Rest your elbow on the inside of your thigh.',
          'Curl the dumbbell up towards your shoulder.',
          'Lower it back down slowly and repeat.'
        ],
      ),
      Exercise(
        id: 'ex_cable_curl',
        title: 'Cable Curl',
        gifPath: 'assets/gifs/cable_curl.gif',
        durationInSeconds: 60,
        instructions: [
          'Stand facing a cable machine with a low pulley and bar attachment.',
          'Curl the bar up towards your chest.',
          'Keep your elbows stationary and close to your body.',
          'Lower the bar back down slowly.'
        ],
      ),
      Exercise(
        id: 'ex_ez_bar_curl',
        title: 'EZ Bar Curl',
        gifPath: 'assets/gifs/ez_bar_curl.gif',
        durationInSeconds: 60,
        instructions: [
          'Hold an EZ bar with an underhand grip, hands shoulder-width apart.',
          'Curl the bar up towards your chest.',
          'Squeeze your biceps at the top.',
          'Lower the bar back down with control.'
        ],
      ),
      Exercise(
        id: 'ex_incline_curl',
        title: 'Incline Dumbbell Curl',
        gifPath: 'assets/gifs/incline_curl.gif',
        durationInSeconds: 60,
        instructions: [
          'Lie back on an incline bench, holding a dumbbell in each hand.',
          'Let your arms hang straight down, palms facing up.',
          'Curl the dumbbells up towards your shoulders.',
          'Lower them back down slowly.'
        ],
      ),
      Exercise(
        id: 'ex_zottman_curl',
        title: 'Zottman Curl',
        gifPath: 'assets/gifs/zottman_curl.gif',
        durationInSeconds: 60,
        instructions: [
          'Hold a dumbbell in each hand, palms facing up.',
          'Curl the dumbbells up as in a regular curl.',
          'At the top, rotate your wrists so palms face down.',
          'Lower the dumbbells slowly in this position.'
        ],
      ),
      Exercise(
        id: 'ex_spider_curl',
        title: 'Spider Curl',
        gifPath: 'assets/gifs/spider_curl.gif',
        durationInSeconds: 60,
        instructions: [
          'Lie face down on an incline bench, holding a dumbbell in each hand.',
          'Let your arms hang straight down, palms facing up.',
          'Curl the dumbbells up towards your shoulders.',
          'Lower them back down with control.'
        ],
      ),
    ],
  );
}
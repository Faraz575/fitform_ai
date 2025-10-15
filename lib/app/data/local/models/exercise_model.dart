class Exercise {
  final String id;
  final String title;
  final String gifPath;
  final int durationInSeconds; // Duration add kiya
  final List<String> instructions;

  Exercise({
    required this.id,
    required this.title,
    required this.gifPath,
    required this.durationInSeconds,
    required this.instructions,
  });
}
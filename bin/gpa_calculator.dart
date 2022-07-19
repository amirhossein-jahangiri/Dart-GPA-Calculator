import 'dart:io';

void main() {
  calculateAverage();
}

void calculateAverage() {
  ScoreModel? scoreModel;

  clearConsole();

  while (true) {
    stdout
        .writeln('<======= Use the word "end" to end the calculation =======>');

    stdout.write('please enter title: ');
    String? title = stdin.readLineSync();

    if (title == 'end') break;

    stdout.write('please enter score(Just Number and Between 0 - 20): ');
    double? score = double.parse(stdin.readLineSync()!);

    stdout.write('please enter unit(Just Number): ');
    int? unit = int.parse(stdin.readLineSync()!);

    scoreModel = ScoreModel(
      title: title,
      score: score,
      unit: unit,
    );

    scoreList.add(scoreModel);

    clearConsole();
  }

  clearConsole();

  stdout.writeln('\x1B[32mCalculating...\x1B[0m\n');

  int unit = 0;
  double lesson = 0.0;
  double average = 0.0;

  for (var thisone in scoreList) {
    unit += thisone.unit!;
    lesson += (thisone.score! * thisone.unit!);
  }

  average = lesson / unit;

  stdout.writeln(
      '\x1B[33mmAverage is ======> ${average.toStringAsFixed(2)}\x1B[0m\n');

  for (var thisone in scoreList) {
    stdout.writeln(
        '\x1B[36mTitle:"${thisone.title}"  Score:"${thisone.score}" Unit:"${thisone.unit}"\x1B[0m\n');
  }
}

void clearConsole() {
  stdout.write("\x1B[2J\x1B[0;0H");
}

List<ScoreModel> scoreList = [];

class ScoreModel {
  final String? title;
  final double? score;
  final int? unit;

  const ScoreModel({
    required this.title,
    required this.score,
    required this.unit,
  });
}

import 'dart:ffi';
import 'dart:io';

void main() {
  calculateAverage();
}

void calculateAverage() {
  ScoreModel? scoreModel;

  while (true) {
    print('======= Use the word end to end the calculation. =======\n');

    print('please enter title:');
    String? title = stdin.readLineSync();

    if (title == 'end') break;

    print('please enter score:');
    double? score = double.parse(stdin.readLineSync()!);

    print('please enter unit:');
    int? unit = int.parse(stdin.readLineSync()!);

    scoreModel = ScoreModel(
      title: title,
      score: score,
      unit: unit,
    );

    scoreList.add(scoreModel);
  }

  print('Calculating...');

  int unit = 0;
  double lesson = 0.0;
  double average = 0.0;

  for (var thisone in scoreList) {
    unit += thisone.unit!;
    lesson += (thisone.score! * thisone.unit!);
  }

  average = lesson / unit;

  print('average is ======> ${average.toStringAsFixed(2)}');

  for (var thisone in scoreList) {
    print(
        'Title:"${thisone.title}"  Score:"${thisone.score}" Unit:"${thisone.unit}"');
  }
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

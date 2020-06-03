import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:goalmine_mobile/models/objective/score.dart';

class ScoreChart extends StatelessWidget {
  final bool animate;
  final List<Score> scores;

  ScoreChart({this.animate, this.scores});

  @override
  Widget build(BuildContext context) {
    _removeNullScores();

    return charts.TimeSeriesChart(
      _createChartData(),
      animate: animate,
      domainAxis: charts.EndPointsTimeAxisSpec(),
    );
  }

  List<charts.Series<Score, DateTime>> _createChartData() {
    return [
      charts.Series<Score, DateTime>(
        id: 'Scores',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (Score score, _) => score.dateRecorded,
        measureFn: (Score score, _) => score.score,
        data: scores,
      )
    ];
  }

  void _removeNullScores() {
    scores.removeWhere((score) => score.score == null);
  }
}

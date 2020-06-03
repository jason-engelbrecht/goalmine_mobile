import 'package:flutter/material.dart';
import 'package:goalmine_mobile/models/objective/score.dart';
import 'package:intl/intl.dart';

class ScoreCards extends StatelessWidget {
  final List<Score> scores;
  ScoreCards({this.scores});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 85,
        child: ListView.builder(
            padding: EdgeInsets.only(left: 2.5, right: 2.5),
            scrollDirection: Axis.horizontal,
            itemCount: scores.length,
            itemBuilder: (context, int i) {
              return _buildScoreCard(scores[i]);
            }));
  }

  Widget _buildScoreCard(Score score) {
    String formattedDate = DateFormat('MM/dd').format(score.dateRecorded);

    return Container(
        margin: EdgeInsets.only(bottom: 7.5, top: 10),
        child: Card(
            color: Colors.red[300],
            elevation: 2.5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 7),
              child: Column(
                children: <Widget>[
                  Text(formattedDate,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    child: Text(score.score.toString(),
                      style: TextStyle(
                          fontSize: 15.5,
                          fontWeight: FontWeight.w400,
                          color: Colors.white))
                  )]))
        ));
  }
}
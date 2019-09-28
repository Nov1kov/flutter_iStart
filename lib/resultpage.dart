import 'package:flutter/material.dart';

import 'Repository.dart';
import 'util.dart';

class ResultPage extends StatefulWidget {
  String selectedJob;

  ResultPage({Key key, @required String this.selectedJob}) : super(key: key);

  _ResultPageState createState() => _ResultPageState(selectedJob);
}

class _ResultPageState extends State<ResultPage> {
  String selectedJob;
  List<ItJob> predictedJobs = new List<ItJob>();

  _ResultPageState(@required String this.selectedJob);

  String getHelloText() {
    return "Привет, " + "Константин";
  }

  @override
  void initState() {
    var r = Repository();
    var rJob = r.routineJobs
        .firstWhere((j) => j.name == selectedJob, orElse: () => null);
    for (var itJob in Repository().itJobs){
      if (rJob.predictions.any((p) => p.name == itJob.name)){
        predictedJobs.add(itJob);
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                CustomColors.GradientTop,
                CustomColors.GradientMiddle,
                CustomColors.GradientBottom
              ])),
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        getHelloText(),
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.TextHeader),
                      ),
                      Text(
                        'выбери свою текущую должность',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: CustomColors.TextHeader,
                            fontFamily: 'opensans'),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: new Center(),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

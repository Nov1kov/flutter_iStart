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

  @override
  void initState() {
    var r = Repository();
    var rJob = r.routineJobs
        .firstWhere((j) => j.name == selectedJob, orElse: () => null);
    for (var itJob in Repository().itJobs) {
      var prediction = rJob.predictions
          .firstWhere((p) => p.name == itJob.name, orElse: () => null);
      if (prediction != null) {
        itJob.predictRate = prediction.rate;
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
                SizedBox(height: 80),
                Container(
                  height: MediaQuery.of(context).size.height / 8,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Вот, что тебе подходит",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.TextHeader),
                      ),
                      Text(
                        'Освой новую профессию',
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
                Container(
                  margin: EdgeInsets.fromLTRB(48, 0, 0, 0),
                  height: 120.0,
                  child: PredictionsList(predictedJobs),
                ),
                SizedBox(
                  height: 27,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 48),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(15.0)),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(22),
                              child: Text(
                                "Sata bla bla bla",
                                style: TextStyle(
                                  fontSize: 23,
                                  color: CustomColors.TextSubHeader,
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(22, 0, 22, 0),
                                child: Text("long long text",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: CustomColors.TextHeader))),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PredictionsList extends StatelessWidget {
  // Builder methods rely on a set of data, such as a list.
  final List<ItJob> predictionItJobs;

  PredictionsList(this.predictionItJobs);

  // First, make your build method like normal.
  // Instead of returning Widgets, return a method that returns widgets.
  // Don't forget to pass in the context!
  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Container(
      width: 130,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
      ),
      child: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            Image.asset('assets/' + predictionItJobs[index].image),
            Container(
              height: 60,
              alignment: Alignment(1.0, 1.0),
              child: Container(
                width: 35,
                height: 35,
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 2.0, 5.0),
                alignment: Alignment(1.0, 1.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      new BorderRadius.only(topLeft: Radius.circular(35.0)),
                ),
                child: Text(
                    predictionItJobs[index].predictRate.toString() + "%",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                        color: CustomColors.TextHeader)),
              ),
            ),
          ]),
          SizedBox(height: 12),
          Text(predictionItJobs[index].name,
              style: TextStyle(fontSize: 14, color: CustomColors.TextHeader))
        ],
      ),
    );
  }

  ListView _buildList(context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      // Must have an item count equal to the number of items!
      itemCount: predictionItJobs.length,
      // A callback that will return a widget.
      itemBuilder: _buildProductItem,
    );
  }
}

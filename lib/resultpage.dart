import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

import 'Repository.dart';
import 'util.dart';

class ResultPage extends StatefulWidget {
  String selectedJob;

  ResultPage({Key key, @required String this.selectedJob}) : super(key: key);

  _ResultPageState createState() => _ResultPageState(selectedJob);
}

class _ResultPageState extends State<ResultPage> {
  String selectedRJob;
  List<ItJob> predictedJobs = new List<ItJob>();
  ItJob selectedItJob;

  _ResultPageState(@required String this.selectedRJob);

  @override
  void initState() {
    var r = Repository();
    var rJob = r.routineJobs
        .firstWhere((j) => j.name == selectedRJob, orElse: () => null);
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
          child: SingleChildScrollView(
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
                  height: 120.0,
                  child: PredictionsList(predictedJobs, onTappedItem),
                ),
                SizedBox(
                  height: 27,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.fromLTRB(48, 0, 48, 48),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(15.0)),
                          boxShadow: [ui.getShadow()],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(22),
                              child: Text(
                                selectedItJob != null ? selectedItJob.name : "",
                                style: TextStyle(
                                  fontSize: 23,
                                  color: CustomColors.TextSubHeader,
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(22, 0, 22, 10),
                                child: Text(
                                    selectedItJob != null
                                        ? selectedItJob.description
                                        : "",
                                    style: TextStyle(
                                        fontSize: 14,
                                        height: 1.6,
                                        color: CustomColors.TextHeader))),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.fromLTRB(22, 0, 22, 0),
                                child: Text(
                                    selectedItJob != null
                                        ? "Зарплата: " + selectedItJob.salary
                                        : "",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: CustomColors.BorderColor))),
                            InkWell(
                              onTap: () => {
                                FlutterWebBrowser.openWebPage(
                                    url: selectedItJob != null
                                        ? selectedItJob.links[0]
                                        : "",
                                    androidToolbarColor:
                                        CustomColors.AccentColor)
                              },
                              child: Container(
                                  margin: EdgeInsets.all(22),
                                  width: MediaQuery.of(context).size.width,
                                  alignment: Alignment(0.0, 0.0),
                                  height: 58,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: new Border.all(
                                        color: CustomColors.BorderColor,
                                        width: 2,
                                        style: BorderStyle.solid),
                                    borderRadius: new BorderRadius.all(
                                        new Radius.circular(15.0)),
                                  ),
                                  child: Text(
                                      selectedItJob != null
                                          ? selectedItJob.link_text
                                          : "",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: CustomColors.BorderColor))),
                            ),
                          ],
                        ),
                      ),
                      Text("Не твое?",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: CustomColors.TextHeader)),
                      _buildNotMyButton(),
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

  Widget _buildNotMyButton() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      margin: EdgeInsets.fromLTRB(0, 18, 0, 50),
      height: 58,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            CustomColors.AccentColor,
            CustomColors.AccentColor,
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
        boxShadow: [
          BoxShadow(
            color: CustomColors.AccentShadow,
            blurRadius: 15.0,
            spreadRadius: 7.0,
            offset: Offset(0.0, 0.0),
          ),
        ],
      ),
      child: Center(
        child: const Text(
          'РАССКАЗАТЬ О СЕБЕ БОЛЬШЕ',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  onTappedItem(int index) {
    setState(() {
      selectedItJob = predictedJobs[index];
    });
  }
}

class PredictionsList extends StatelessWidget {
  // Builder methods rely on a set of data, such as a list.
  final List<ItJob> predictionItJobs;
  final Function(int) onItemTap;
  int selectedIndex = -1;

  PredictionsList(this.predictionItJobs, this.onItemTap);

  // First, make your build method like normal.
  // Instead of returning Widgets, return a method that returns widgets.
  // Don't forget to pass in the context!
  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  void itemOnTapped(int index) {
    selectedIndex = index - 1;
    onItemTap(index - 1);
  }

  Widget _buildProductItem(BuildContext context, int index) {
    if (index == 0){
      return SizedBox(width: 48);
    }
    var itJob = predictionItJobs[index - 1];
    return Container(
      width: 130,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
      ),
      child: InkWell(
        onTap: () => {itemOnTapped(index)},
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              Image.asset('assets/' + itJob.image),
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
                      itJob.predictRate.toString() + "%",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: CustomColors.TextHeader)),
                ),
              ),
            ]),
            SizedBox(height: 12),
            Text(itJob.name,
                style: TextStyle(
                    fontWeight: selectedIndex == index
                        ? FontWeight.bold
                        : FontWeight.w400,
                    fontSize: 14,
                    color: CustomColors.TextHeader))
          ],
        ),
      ),
    );
  }

  ListView _buildList(context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      // Must have an item count equal to the number of items!
      itemCount: predictionItJobs.length + 1,
      // A callback that will return a widget.
      itemBuilder: _buildProductItem,
    );
  }
}

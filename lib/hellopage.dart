import 'package:flutter/material.dart';
import 'package:istart/resultpage.dart';
import 'Repository.dart';
import 'auth.dart';
import 'util.dart';

class HelloPage extends StatefulWidget {
  HelloPage({Key key}) : super(key: key);

  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  String getHelloText() {
    return "Привет, " + Auth().user.displayName;
  }

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedJob;

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    var jobs = Repository().routineJobs;
    for (var i = 0; i < jobs.length; i++) {
      var job = jobs[i];
      items.add(new DropdownMenuItem(
          value: job.name,
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 16, 0),
                child: Image.asset('assets/' + job.image),
              ),
              Container(
                alignment: Alignment(0.0, 0.0),
                child: Text(
                  job.name,
                  style: TextStyle(
                      fontSize: 16,
                      color: CustomColors.TextHeader,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          )));
    }
    return items;
  }

  void changedDropDownItem(String selectedJob) {
    setState(() {
      _selectedJob = selectedJob;
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResultPage(selectedJob: _selectedJob)),
      );
    });
  }

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
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
                  child: new Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.84,
                      height: 70,
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: new Border.all(
                            color: CustomColors.BorderColor,
                            width: 1.5,
                            style: BorderStyle.solid),
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(15.0)),
                        boxShadow: [ui.getShadow()],
                      ),
                      child: Container(
                        child: DropdownButton(
                          hint: Text(
                            "Выбрать",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: CustomColors.DropdownHintText,
                            ),
                          ),
                          value: _selectedJob,
                          items: _dropDownMenuItems,
                          onChanged: changedDropDownItem,
                          icon: Image.asset('assets/down_arrow.png'),
                        ),
                      ),
                    ),
                  ),
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

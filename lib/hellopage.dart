import 'package:flutter/material.dart';

import 'util.dart';

class HelloPage extends StatefulWidget {
  HelloPage({Key key}) : super(key: key);

  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  String getHelloText() {
    return "Привет, " + "Константин";
  }

  List _jobs = ["Бухгалтер", "Рекрутер", "Специалист по закупкам"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedJob;

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _jobs) {
      items.add(new DropdownMenuItem(value: city, child: new Text(city)));
    }
    return items;
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      _selectedJob = selectedCity;
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
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: new Border.all(
                            color: CustomColors.BorderColor,
                            width: 1.5,
                            style: BorderStyle.solid),
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(15.0)),
                      ),
                      child: new DropdownButton(
                          value: _selectedJob,
                          items: _dropDownMenuItems,
                          onChanged: changedDropDownItem,
                          icon: Image.asset('assets/down_arrow.png'),
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

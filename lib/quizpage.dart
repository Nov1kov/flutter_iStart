import 'package:flutter/material.dart';
import 'package:istart/resultpage.dart';
import 'Repository.dart';
import 'auth.dart';
import 'util.dart';

class QuizPage extends StatefulWidget {
  QuizPage({Key key}) : super(key: key);

  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  void initState() {
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
                SizedBox(height: 75),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Расскажи о себе больше",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.TextHeader),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 66),
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  child: Column(children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 53 - 53,
                      child: Text(
                        'Нввыки',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: CustomColors.TextHeader,
                            fontFamily: 'opensans'),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(48, 13, 44, 13),
                      alignment: Alignment(0.0, 0.0),
                      padding: EdgeInsets.fromLTRB(28, 30, 28, 10),
                      height: 58,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(15.0)),
                          boxShadow: [ui.getShadow()]),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                                fontSize: 14, color: CustomColors.HintText),
                            border: InputBorder.none,
                            hintText: 'Начните вводить здесь'),
                      ),
                    ),
                    SizedBox(height: 36),
                  ]),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 53 - 53,
                      child: Text(
                        'Хобби',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: CustomColors.TextHeader,
                            fontFamily: 'opensans'),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(48, 13, 44, 13),
                      alignment: Alignment(0.0, 0.0),
                      padding: EdgeInsets.fromLTRB(28, 30, 28, 10),
                      height: 58,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(15.0)),
                          boxShadow: [ui.getShadow()]),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                                fontSize: 14, color: CustomColors.HintText),
                            border: InputBorder.none,
                            hintText: 'Начните вводить здесь'),
                      ),
                    ),
                    SizedBox(height: 36),
                  ]),
                ),
                _buildMoreProfessionals(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMoreProfessionals() {
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
            blurRadius: 25.0,
            spreadRadius: 5.0,
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
}

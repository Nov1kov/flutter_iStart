import 'package:flutter/material.dart';

import 'hellopage.dart';
import 'util.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key key}) : super(key: key);

  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
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
                        'Узнай кто ты',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.TextHeader),
                      ),
                      Text(
                        'в новом цифровом мире',
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
                  flex: 4,
                  child: Hero(
                    tag: 'Clipboard',
                    child: Image.asset('assets/auth_page_image.png'),
                  ),
                ),
                SizedBox(height: 40),
                Expanded(
                  flex: 0,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HelloPage()),
                      );
                    },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
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
                          'ВОЙТИ ЧЕРЕЗ GOOGLE',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
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

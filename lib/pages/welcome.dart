import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 84, bottom: 46),
            child: Column(
              children: <Widget>[
                Text(
                  '移动电子签名',
                  style: TextStyle(
                      fontSize: 30,
                      color: Color.fromRGBO(
                        102,
                        102,
                        102,
                        1,
                      ),
                      letterSpacing: 4,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none),
                ),
                Container(
                  height: 7,
                ),
                Text('随时 随地 随签',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(
                          102,
                          102,
                          102,
                          1,
                        ),
                        fontWeight: FontWeight.normal,
                        letterSpacing: 4,
                        decoration: TextDecoration.none))
              ],
            ),
          ),
          Expanded(
            child: Image.asset(
              'images/welcome.png',
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}

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
                buildText('移动电子签名', 30, FontWeight.w500),
                Container(
                  height: 7,
                ),
                buildText('随时 随地 随签', 18, FontWeight.normal)
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

  Text buildText(String text, double fontSize, FontWeight weight) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          color: Color.fromRGBO(
            102,
            102,
            102,
            1,
          ),
          letterSpacing: 4,
          fontWeight: weight,
          decoration: TextDecoration.none),
    );
  }
}

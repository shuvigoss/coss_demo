import 'package:coss_demo/pages/config_index.dart';
import 'package:coss_demo/pages/widgets/countdown_btn.dart';
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
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 18),
                  child: CountDownBtn(
                    title: '跳过',
                    callBack: () {
                      gotoConfigIndex(context);
                    },
                  ),
                ),
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

  void gotoConfigIndex(BuildContext context) {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => ConfigIndexPage()));
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              ConfigIndexPage(),
          transitionsBuilder: (context, Animation<double> animation,
                  secondaryAnimation, Widget child) =>
              FadeTransition(opacity: animation, child: child)),
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

import 'package:flutter/material.dart';

class ImageBtn extends StatelessWidget {
  String image;
  String title;
  Function callback;

  ImageBtn(this.image, this.title, this.callback);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => callback(),
      child: Container(
        width: 72,
        height: 88,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 14),
              child: Image.asset(image),
            ),
            Text(
              title,
              style:
                  TextStyle(fontSize: 18, color: Color.fromRGBO(51, 51, 51, 1)),
            )
          ],
        ),
      ),
    );
  }
}

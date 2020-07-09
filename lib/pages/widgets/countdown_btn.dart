import 'dart:async';

import 'package:flutter/material.dart';

class CountDownBtn extends StatefulWidget {
  String title;
  int countdown;
  Function() callBack;

  CountDownBtn({this.title, this.countdown = 3, this.callBack});

  @override
  _CountDownBtnState createState() {
    return _CountDownBtnState();
  }
}

class _CountDownBtnState extends State<CountDownBtn> {
  Timer _timer;
  int _countdown;

  @override
  void initState() {
    _countdown = widget.countdown;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdown <= 0) {
        timer.cancel();
        widget?.callBack();
        return;
      }
      setState(() {
        _countdown--;
      });
    });
    super.initState();
  }

  @override
  // ignore: must_call_super
  void dispose() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('${widget.title} ($_countdown)'),
      onPressed: widget?.callBack,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.grey)),
    );
  }
}

//@override
//Widget build(BuildContext context) {
//  this.context = context;
//  return FlatButton(
//    textColor: widget.color,
//    child: Text(widget.title + ' ($_countDown)'),
//    shape: RoundedRectangleBorder(
//        borderRadius: BorderRadius.circular(15.0),
//        side: BorderSide(color: widget.color)),
//    onPressed: () {
//      widget.onClick(context);
//    },
//  );
//}

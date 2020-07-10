import 'package:coss_demo/pages/widgets/image_btn.dart';
import 'package:flutter/material.dart';

class ConfigIndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('服务列表'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[buildTop()],
          ),
        ));
  }

  Container buildTop() {
    return Container(
      color: Colors.white,
      height: 135,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: ImageBtn('images/shoudongluru.png', '手动录入', () {
              print('shoudongluru');
            }),
          ),
          Container(
            width: 0.5,
            color: Colors.grey,
          ),
          Container(
            child: ImageBtn('images/saomatianjia.png', '扫码添加', () {
              print('shoudongluru');
            }),
          )
        ],
      ),
    );
  }
}

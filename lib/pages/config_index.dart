import 'package:coss_demo/pages/widgets/image_btn.dart';
import 'package:flutter/material.dart';

import 'models/config_item.dart';

final List<ConfigItem> list = [
  ConfigItem('测试1', 'http://127.0.0.1'),
  ConfigItem('测试2', 'http://127.0.0.2')
];

class ConfigIndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('服务列表'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[buildTop(context), buildConfigList()],
          ),
        ));
  }

  Expanded buildConfigList() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        color: Colors.white,
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.asset('images/fuwuliebiao.png'),
                title: Text(list[index].name),
                subtitle: Text(list[index].url),
              );
            },
            separatorBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: 18, right: 18),
                height: 1,
                color: Colors.grey,
              );
            },
            itemCount: list.length),
      ),
    );
  }

  Container buildTop(context) {
    return Container(
      color: Colors.white,
      height: 135,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: ImageBtn('images/shoudongluru.png', '手动录入', () {
              Navigator.pushNamed(context, '/config');
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

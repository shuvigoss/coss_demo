import 'package:coss_demo/bloc/config_bloc.dart';
import 'package:coss_demo/bloc/config_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/config_item.dart';

class ConfigPage extends StatelessWidget {
  final GlobalKey _key = GlobalKey<FormState>();

  final TextEditingController _btext = TextEditingController();
  final TextEditingController _stext = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('服务配置'),
      ),
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                buildTitle(),
                buildForm(),
              ],
            ),
            buildSubmitBtn(context)
          ],
        ),
      ),
    );
  }

  Positioned buildSubmitBtn(context) {
    return Positioned(
      width: 200,
      height: 36,
      bottom: 40,
      child: Container(
        child: FlatButton(
          color: Color.fromRGBO(112, 199, 180, 1),
          colorBrightness: Brightness.dark,
          splashColor: Colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Text(
            '完成',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => _submit(context),
        ),
      ),
    );
  }

  _submit(context) {
    if ((_key.currentState as FormState).validate()) {
      BlocProvider.of<ConfigBloc>(context)
          .add(Add(ConfigItem(_btext.text, _stext.text)));
      Navigator.pop(context);
    }
  }

  Container buildTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
      child: Text(
        '请设置服务地址',
        style: TextStyle(fontSize: 18, color: Color.fromRGBO(153, 153, 153, 1)),
      ),
    );
  }

  buildForm() {
    return Container(
      color: Colors.white,
      child: Form(
        key: _key,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                  controller: _btext,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "业务名称",
                    hintText: "请输入业务名称",
                  ),
                  validator: (v) {
                    return v.trim().length > 0 ? null : "请输入业务名称";
                  }),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                  controller: _stext,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "服务地址",
                    hintText: "请输入服务地址",
                  ),
                  validator: (v) {
                    return v.trim().length > 0 ? null : "请输入服务地址";
                  }),
            )
          ],
        ),
      ),
    );
  }
}

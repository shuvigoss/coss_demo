import 'package:coss_demo/bloc/bloc.dart';
import 'package:coss_demo/pages/widgets/image_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        child: BlocBuilder<ConfigBloc, ConfigState>(builder: (context, state) {
          if (state is Failure) {
            return Center(child: Text('加载异常了...'));
          }

          if (state is Loaded) {
            if (state.items.length == 0) {
              return Center(child: Text('暂无数据'));
            }

            return Container(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.asset('images/fuwuliebiao.png'),
                        title: Text(state.items[index].name),
                        subtitle: Text(state.items[index].url),
                        trailing: IconButton(
                          onPressed: () =>
                              delete(context, state.items[index].name),
                          icon: Icon(Icons.delete),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 1,
                      );
                    },
                    itemCount: state.items.length));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
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

  delete(BuildContext context, String name) {
    BlocProvider.of<ConfigBloc>(context).add(Delete(name));
  }
}

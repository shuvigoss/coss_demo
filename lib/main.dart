import 'package:coss_demo/pages/config.dart';
import 'package:coss_demo/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/config_bloc.dart';
import 'bloc/config_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ConfigBloc>(
            create: (context) => ConfigBloc()..add(Fetch()),
          )
        ],
        child: MaterialApp(
          title: '协同签名',
          home: WelcomePage(),
          theme: ThemeData(
              primaryColor: Colors.white,
              scaffoldBackgroundColor: Color.fromRGBO(248, 248, 248, 1)),
          routes: {'/config': (context) => ConfigPage()},
        ));
  }
}

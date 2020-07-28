import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coss_demo/pages/utils/store_helper.dart';

import './bloc.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  @override
  ConfigState get initialState => InitialConfigState();

  @override
  Stream<ConfigState> mapEventToState(
    ConfigEvent event,
  ) async* {
    if (event is Fetch) {
      try {
        final all = await StoreHelper.getAll();
        yield Loaded(items: all);
      } catch (e) {
        print(e);
        yield Failure();
      }
    }

    if (event is Add) {
      try {
        await StoreHelper.add(event.item);
        yield Loaded(items: await StoreHelper.getAll());
      } catch (e) {
        print(e);
        yield Failure();
      }
    }

    if (event is Delete) {
      try {
        await StoreHelper.del(event.name);
        yield Loaded(items: await StoreHelper.getAll());
      } catch (e) {
        print(e);
        yield Failure();
      }
    }
  }
}

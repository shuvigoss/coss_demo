import 'dart:convert';

import 'package:coss_demo/pages/models/config_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String key = 'CONFIG';

class StoreHelper {
  static add(ConfigItem item) async {
    List<ConfigItem> all = await getAll();
    all.forEach((element) {
      element.isDefault = false;
    });
    item.isDefault = true;
    all.add(item);
    var list = all.map((e) => e.toJsonMap()).toList();

    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(key, json.encode(list));
  }

  static getAll() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String values = preferences.getString(key);
    List<Map> tempList =
        values == null ? [] : (json.decode(values) as List).cast();
    return tempList.map((e) => ConfigItem.fromJson(e)).toList();
  }

  static del(String name) async {
    List<ConfigItem> all = await getAll();
    bool needSetDefault = false;
    for (int i = 0; i < all.length; i++) {
      ConfigItem item = all[i];
      if (item.name == name) {
        if (item.isDefault) {
          needSetDefault = true;
        }
        all.removeAt(i);
        break;
      }
    }

    if (needSetDefault && all.length > 0) {
      all[0].isDefault = true;
    }

    var list = all.map((e) => e.toJsonMap()).toList();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(key, json.encode(list));
  }
}

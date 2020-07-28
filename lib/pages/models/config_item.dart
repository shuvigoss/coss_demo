class ConfigItem {
  String name;
  String url;
  bool isDefault;

  ConfigItem(this.name, this.url);

  toJsonMap() {
    Map res = Map();
    res['name'] = name;
    res['url'] = url;
    res['isDefault'] = isDefault;
    return res;
  }

  ConfigItem.fromJson(Map e) {
    name = e['name'];
    url = e['url'];
    isDefault = e['isDefault'];
  }
}

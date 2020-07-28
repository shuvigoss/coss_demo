import 'package:coss_demo/pages/models/config_item.dart';
import 'package:coss_demo/pages/utils/store_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() {
  SharedPreferences.setMockInitialValues({});

  test('新增数据', () async {
    await StoreHelper.add(ConfigItem('测试1', 'http://127.0.0.1'));
    await StoreHelper.add(ConfigItem('测试2', 'http://127.0.0.1'));
    List<ConfigItem> item = await StoreHelper.getAll();

    expect(item[0].name, '测试1');
    expect(item[0].url, 'http://127.0.0.1');
    expect(item[0].isDefault, false);

    expect(item[1].name, '测试2');
    expect(item[1].url, 'http://127.0.0.1');
    expect(item[1].isDefault, true);

    await StoreHelper.del('测试2');
    item = await StoreHelper.getAll();
    expect(item[0].isDefault, true);
  });
}

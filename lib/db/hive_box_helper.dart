import 'package:hive/hive.dart';
import 'package:machine_test_luminar/db/hive_key.dart';
import 'package:machine_test_luminar/db/model/user_details/user.dart';

class HiveHelper {
  static Box<UserDetailsHive> getUserDetailsHiveBox() =>
      Hive.box<UserDetailsHive>(DbKeys.userDetails);
}

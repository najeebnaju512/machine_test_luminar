
import 'package:machine_test_luminar/db/hive_box_helper.dart';
import 'package:machine_test_luminar/db/hive_key.dart';
import 'package:machine_test_luminar/db/model/user_details/user.dart';

class GetHiveHelper {
  static UserDetailsHive? getUserDetails() {
     return HiveHelper.getUserDetailsHiveBox().get(DbKeys.userKey);
  }
}

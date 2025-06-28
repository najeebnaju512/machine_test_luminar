import 'package:machine_test_luminar/app_config/app_config.dart';
import 'package:machine_test_luminar/core/dev_tools/print.dart';
import 'package:machine_test_luminar/core/snack_bar/helper.dart';
import 'package:machine_test_luminar/shared/helper/api_helper.dart';

class LoginRepo {
  Future<ApiResponse?> onLogin({
    required String email,
    required String password,
  }) async {
    try {
      var response = await ApiHelper.postData(
        endPoint: EndPoints.login,
        body: {"email": email, "password": password},
        header: ApiHelper.getApiHeader(),
      );
      if (response.status != 200) {
        showGlobalSnackBar(message: 'Message : ${response.msg}');
      }
      return response;
    } catch (e) {
      devPrintError('Catch : $e');
    }
    return null;
  }
}
